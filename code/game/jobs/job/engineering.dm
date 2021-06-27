/datum/job/chief_engineer
	title = "Chief Engineer"
	flag = CHIEF
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ffeeaa"
	idtype = /obj/item/weapon/card/id/engGold
	req_admin_notify = 1
	access = list(
		ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS,
		ACCESS_TELEPORTER, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_ATMOSPHERICS, ACCESS_EMERGENCY_STORAGE, ACCESS_EVA,
		ACCESS_HEADS, ACCESS_CONSTRUCTION, ACCESS_SEC_DOORS, ACCESS_MINISAT,
		ACCESS_CE, ACCESS_RC_ANNOUNCE, ACCESS_KEYCARD_AUTH, ACCESS_TCOMSAT, ACCESS_AI_UPLOAD, ACCESS_ENGINEERING_LOBBY
	)
	salary = 250
	minimal_player_age = 7
	minimal_player_ingame_minutes = 2400
	outfit = /datum/outfit/job/chief_engineer
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND ALSO LOCATING THE "job_loop:" THINGY AND CHANGING
		THE VERSION THERE. CURRENTLY THE VERSION THERE IS 26.
		~Luduk
	*/
	restricted_species = list(UNATHI, TAJARAN, VOX, DIONA)


/datum/job/engineer
	title = "Station Engineer"
	flag = ENGINEER
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	supervisors = "the chief engineer"
	selection_color = "#fff5cc"
	idtype = /obj/item/weapon/card/id/eng
	access = list(ACCESS_ENGINE, ACCESS_ENGINE_EQUIP, ACCESS_TECH_STORAGE, ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_CONSTRUCTION, ACCESS_ENGINEERING_LOBBY)
	alt_titles = list("Maintenance Technician","Engine Technician","Electrician")
	outfit = /datum/outfit/job/engineer
	salary = 160
	minimal_player_age = 3
	minimal_player_ingame_minutes = 540


/datum/job/atmos
	title = "Atmospheric Technician"
	flag = ATMOSTECH
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 3
	spawn_positions = 2
	supervisors = "the chief engineer"
	selection_color = "#fff5cc"
	idtype = /obj/item/weapon/card/id/eng
	access = list(ACCESS_ATMOSPHERICS, ACCESS_MAINT_TUNNELS, ACCESS_EMERGENCY_STORAGE, ACCESS_CONSTRUCTION, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_ENGINEERING_LOBBY)
	salary = 160
	minimal_player_age = 3
	minimal_player_ingame_minutes = 600
	outfit = /datum/outfit/job/atmos


/datum/job/technical_assistant
	title = "Technical Assistant"
	flag = TECHNICASSISTANT
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the chief engineer"
	selection_color = "#fff5cc"
	idtype = /obj/item/weapon/card/id/eng
	access = list(ACCESS_ENGINEERING_LOBBY, ACCESS_CONSTRUCTION, ACCESS_MAINT_TUNNELS)
	salary = 50
	outfit = /datum/outfit/job/technical_assistant


/proc/get_airlock_wires_identification()
	var/list/wire_list = same_wires[/obj/machinery/door/airlock]
	var/list/wire_functions_list = list(
		"[AIRLOCK_WIRE_IDSCAN]"      = "ID scan",
		"[AIRLOCK_WIRE_MAIN_POWER1]" = "main power",
		"[AIRLOCK_WIRE_MAIN_POWER2]" = "backup power",
		"[AIRLOCK_WIRE_DOOR_BOLTS]"  = "door Bolts",
		"[AIRLOCK_WIRE_OPEN_DOOR]"   = "open door",
		"[AIRLOCK_WIRE_AI_CONTROL]"  = "ai control",
		"[AIRLOCK_WIRE_ELECTRIFY]"   = "electrify",
		"[AIRLOCK_WIRE_SAFETY]"      = "door safety",
		"[AIRLOCK_WIRE_SPEED]"       = "timing mechanism",
		"[AIRLOCK_WIRE_LIGHT]"       = "bolt light"
	)

	var/info = ""

	for(var/wire in wire_list)
		var/current_wire_index = wire_list[wire]
		var/current_wire_function = wire_functions_list["[current_wire_index]"]

		if(current_wire_function)
			info += "[capitalize(wire)] wire is [current_wire_function].<br>"

	return info
