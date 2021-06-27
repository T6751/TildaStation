//returns 1 if this mob has sufficient access to use this object
/obj/proc/allowed(mob/M)
	//check if it doesn't require any access at all
	if(check_access(null))
		return TRUE
	if(issilicon(M))
		var/mob/living/silicon/S = M
		if(check_access(S))
			return TRUE
	if(IsAdminGhost(M))
		//Access can't stop the abuse
		return TRUE
	else if(ishuman(M))
		var/mob/living/carbon/human/H = M
		//if they are holding or wearing a card that has access, that works
		if(check_access(H.get_active_hand()) || check_access(H.wear_id))
			return TRUE
	else if(isIAN(M))
		var/mob/living/carbon/ian/IAN = M
		if(check_access(IAN.mouth) || check_access(IAN.neck))
			return TRUE
	else if(ismonkey(M) || isxenoadult(M))
		var/mob/living/carbon/george = M
		//they can only hold things :(
		if(check_access(george.get_active_hand()))
			return TRUE
	return FALSE

/atom/movable/proc/GetAccess()
	return list()

/mob/living/silicon/GetAccess()
	return get_all_station_access()

/mob/living/silicon/robot/syndicate/GetAccess()
	return list(ACCESS_MAINT_TUNNELS, ACCESS_SYNDICATE, ACCESS_EXTERNAL_AIRLOCKS) //syndicate basic access

/obj/proc/GetID()
	return null

/obj/proc/check_access(atom/movable/AM)
	if(istype(src, /obj/machinery))
		var/obj/machinery/Machine = src
		if(Machine.emagged)
			return TRUE

	if(!req_access.len && !req_one_access.len) //no requirements
		return TRUE
	if(!AM)
		return FALSE
	for(var/req in req_access)
		if(!(req in AM.GetAccess())) //doesn't have this access
			return FALSE
	if(req_one_access.len)
		for(var/req in src.req_one_access)
			if(req in AM.GetAccess()) //has an access from the single access list
				return TRUE
		return FALSE
	return TRUE

/obj/proc/check_access_list(list/L)
	if(!req_access.len && !req_one_access.len)
		return TRUE
	if(!islist(L))
		return FALSE
	for(var/req in req_access)
		if(!(req in L)) //doesn't have this access
			return FALSE
	if(req_one_access.len)
		for(var/req in req_one_access)
			if(req in L) //has an access from the single access list
				return TRUE
		return FALSE
	return TRUE

/proc/get_centcom_access(job)
	switch(job)
		if("VIP Guest")
			return list(ACCESS_CENT_GENERAL)
		if("Custodian")
			return list(ACCESS_CENT_GENERAL, ACCESS_CENT_LIVING, ACCESS_CENT_STORAGE)
		if("Thunderdome Overseer")
			return list(ACCESS_CENT_GENERAL, ACCESS_CENT_THUNDER)
		if("Intel Officer")
			return list(ACCESS_CENT_GENERAL, ACCESS_CENT_LIVING)
		if("Medical Officer")
			return list(ACCESS_CENT_GENERAL, ACCESS_CENT_LIVING, ACCESS_CENT_MEDICAL)
		if("Death Commando")
			return list(ACCESS_CENT_GENERAL, ACCESS_CENT_SPECOPS, ACCESS_CENT_LIVING, ACCESS_CENT_STORAGE)
		if("Research Officer")
			return list(ACCESS_CENT_GENERAL, ACCESS_CENT_SPECOPS, ACCESS_CENT_MEDICAL, ACCESS_CENT_TELEPORTER, ACCESS_CENT_STORAGE)
		if("BlackOps Commander")
			return list(ACCESS_CENT_GENERAL, ACCESS_CENT_THUNDER, ACCESS_CENT_SPECOPS, ACCESS_CENT_LIVING, ACCESS_CENT_STORAGE, ACCESS_CENT_CREED)
		if("Supreme Commander")
			return get_all_centcom_access()

/proc/get_all_access_datums()
	var/static/list/datum/access/priv_all_access_datums
	if(!priv_all_access_datums)
		priv_all_access_datums = init_subtypes(/datum/access)
	return priv_all_access_datums

/proc/get_all_access_datums_by_id()
	var/static/list/datum/access/priv_all_access_datums_id
	if(!priv_all_access_datums_id)
		priv_all_access_datums_id = list()
		for(var/datum/access/A in get_all_access_datums())
			priv_all_access_datums_id["[A.id]"] = A
	return priv_all_access_datums_id

/proc/get_all_access_datums_by_region()
	var/static/list/datum/access/priv_all_access_datums_region
	if(!priv_all_access_datums_region)
		priv_all_access_datums_region = list()
		for(var/datum/access/A in get_all_access_datums())
			if(!priv_all_access_datums_region[A.region])
				priv_all_access_datums_region[A.region] = list()
			priv_all_access_datums_region[A.region] += A
	return priv_all_access_datums_region

/proc/get_access_ids(access_types = ACCESS_TYPE_ALL)
	var/list/L = list()
	for(var/datum/access/A in get_all_access_datums())
		if(A.access_type & access_types)
			L += A.id
	return L

/proc/get_all_accesses()
	var/static/list/priv_all_access
	if(!priv_all_access)
		priv_all_access = get_access_ids()
	return priv_all_access

/proc/get_all_station_access()
	var/static/list/priv_station_access
	if(!priv_station_access)
		priv_station_access = get_access_ids(ACCESS_TYPE_STATION)
	return priv_station_access

/proc/get_all_centcom_access()
	var/static/list/priv_centcom_access
	if(!priv_centcom_access)
		priv_centcom_access = get_access_ids(ACCESS_TYPE_CENTCOM)

	return priv_centcom_access

/proc/get_all_syndicate_access()
	var/static/list/priv_syndicate_access
	if(!priv_syndicate_access)
		priv_syndicate_access = get_access_ids(ACCESS_TYPE_SYNDICATE)

	return priv_syndicate_access

/proc/get_region_accesses(code)
	var/static/list/priv_region_access
	if(code == ACCESS_REGION_ALL)
		return get_all_station_access()

	if(!priv_region_access)
		priv_region_access = list()
		for(var/datum/access/A in get_all_access_datums())
			if(!priv_region_access["[A.region]"])
				priv_region_access["[A.region]"] = list()
			for(var/r in A.region)
				priv_region_access["[A.region]"] += A.id

	return priv_region_access["[code]"]

/proc/get_region_accesses_name(code)
	switch(code)
		if(ACCESS_REGION_ALL)
			return "All"
		if(ACCESS_REGION_SECURITY)
			return "Security"
		if(ACCESS_REGION_MEDBAY)
			return "Medbay"
		if(ACCESS_REGION_RESEARCH)
			return "Research"
		if(ACCESS_REGION_ENGINEERING)
			return "Engineering"
		if(ACCESS_REGION_COMMAND)
			return "Command"
		if(ACCESS_REGION_GENERAL)
			return "Station General"
		if(ACCESS_REGION_SUPPLY)
			return "Supply"


/proc/get_access_desc(id)
	var/list/AS = get_all_access_datums_by_id()
	var/datum/access/A = AS["[id]"]
	return A ? A.desc : ""

/proc/get_all_jobs()
	var/list/all_jobs = list()
	var/list/all_datums = typesof(/datum/job)
	all_datums.Remove(list(/datum/job,/datum/job/ai,/datum/job/cyborg))
	var/datum/job/jobdatum
	for(var/jobtype in all_datums)
		jobdatum = new jobtype
		all_jobs.Add(jobdatum.title)
	return all_jobs

/proc/get_all_centcom_jobs()
	return list("VIP Guest",
		"Custodian",
		"Thunderdome Overseer",
		"Intel Officer",
		"Medical Officer",
		"Death Commando",
		"Research Officer",
		"BlackOps Commander",
		"Supreme Commander",
		"Emergency Response Team",
		"Emergency Response Team Leader",
		"NanoTrasen Representative")

/proc/get_all_velocity_jobs()
	return list("Velocity Chief",
	            "Velocity Officer",
	            "Velocity Medical Doctor")

//gets the actual job rank (ignoring alt titles)
//this is used solely for sechuds
/obj/proc/GetJobRealName()
	if (!istype(src, /obj/item/device/pda) && !istype(src,/obj/item/weapon/card/id))
		return

	var/rank
	var/assignment
	if(istype(src, /obj/item/device/pda))
		if(src:id)
			rank = src:id:rank
			assignment = src:id:assignment
	else if(istype(src, /obj/item/weapon/card/id))
		rank = src:rank
		assignment = src:assignment

	if( rank in joblist )
		return rank

	if( assignment in joblist )
		return assignment

	return "Unknown"

//gets the alt title, failing that the actual job rank
//this is unused
/obj/proc/sdsdsd()	//GetJobDisplayName
	if (!istype(src, /obj/item/device/pda) && !istype(src,/obj/item/weapon/card/id))
		return

	var/assignment
	if(istype(src, /obj/item/device/pda))
		if(src:id)
			assignment = src:id:assignment
	else if(istype(src, /obj/item/weapon/card/id))
		assignment = src:assignment

	if(assignment)
		return assignment

	return "Unknown"

/proc/FindNameFromID(mob/living/carbon/human/H)
	ASSERT(istype(H))
	var/obj/item/weapon/card/id/C = H.get_active_hand()
	if( istype(C) || istype(C, /obj/item/device/pda) )
		var/obj/item/weapon/card/id/ID = C

		if( istype(C, /obj/item/device/pda) )
			var/obj/item/device/pda/pda = C
			ID = pda.id
		if(!istype(ID))
			ID = null

		if(ID)
			return ID.registered_name

	C = H.wear_id

	if( istype(C) || istype(C, /obj/item/device/pda) )
		var/obj/item/weapon/card/id/ID = C

		if( istype(C, /obj/item/device/pda) )
			var/obj/item/device/pda/pda = C
			ID = pda.id
		if(!istype(ID))
			ID = null

		if(ID)
			return ID.registered_name

/proc/get_all_job_icons() //For all existing HUD icons
	return joblist + list("Prisoner")

/obj/proc/GetJobName() //Used in secHUD icon generation
	if (!istype(src, /obj/item/device/pda) && !istype(src,/obj/item/weapon/card/id))
		return

	var/jobName
	var/alt
	if(istype(src, /obj/item/device/pda))
		var/obj/item/device/pda/P = src
		if(P.id)
			jobName = P.id.rank
			alt = P.id.assignment
	if(istype(src, /obj/item/weapon/card/id))
		var/obj/item/weapon/card/id/I = src
		jobName = I.rank
		alt = I.assignment
	if(istype(src, /obj/item/weapon/card/id/syndicate))
		var/obj/item/weapon/card/id/syndicate/S = src
		jobName = S.assignment
		alt = S.assignment
	if(alt in get_alternate_titles(jobName))
		return alt
	if(jobName in get_all_job_icons()) //Check if the job has a hud icon
		return jobName
	if(jobName in get_all_centcom_jobs()) //Return with the NT logo if it is a Centcom job
		return "Centcom"
	if(jobName in get_all_velocity_jobs())
		return jobName
	return "Unknown" //Return unknown if none of the above apply

/proc/get_accesslist_static_data(num_min_region = REGION_GENERAL, num_max_region = REGION_COMMAND)
	var/list/retval
	for(var/i in num_min_region to num_max_region)
		var/list/accesses = list()
		var/list/available_accesses
		if(i == REGION_CENTCOMM) // Override necessary, because get_region_accesses(REGION_CENTCOM) returns BOTH CC and crew accesses.
			available_accesses = get_all_centcom_access()
		else
			available_accesses = get_region_accesses(i)
		for(var/access in available_accesses)
			var/access_desc = get_access_desc(access)
			if (access_desc)
				accesses += list(list(
					"desc" = replacetext(access_desc, "&nbsp", " "),
					"ref" = access,
				))
		retval += list(list(
			"name" = get_region_accesses_name(i),
			"regid" = i,
			"accesses" = accesses
		))
	return retval
