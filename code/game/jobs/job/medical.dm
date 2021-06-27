/datum/job/cmo
	title = "Chief Medical Officer"
	flag = CMO
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the captain"
	selection_color = "#ffddf0"
	idtype = /obj/item/weapon/card/id/medGold
	req_admin_notify = 1
	access = list(
		ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_PARAMEDIC, ACCESS_GENETICS, ACCESS_HEADS,
		ACCESS_CHEMISTRY, ACCESS_VIROLOGY, ACCESS_CMO, ACCESS_SURGERY, ACCESS_RC_ANNOUNCE,
		ACCESS_KEYCARD_AUTH, ACCESS_SEC_DOORS, ACCESS_PSYCHIATRIST, ACCESS_MAINT_TUNNELS,
		ACCESS_MEDBAY_STORAGE
	)
	salary = 250
	minimal_player_age = 10
	minimal_player_ingame_minutes = 2400
	outfit = /datum/outfit/job/cmo
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND ALSO LOCATING THE "job_loop:" THINGY AND CHANGING
		THE VERSION THERE. CURRENTLY THE VERSION THERE IS 26.
		~Luduk
	*/
	restricted_species = list(UNATHI, TAJARAN, VOX, DIONA)


/datum/job/doctor
	title = "Medical Doctor"
	flag = DOCTOR
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 4
	spawn_positions = 3
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/med
	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_SURGERY, ACCESS_MAINT_TUNNELS, ACCESS_MEDBAY_STORAGE)
	salary = 160
	alt_titles = list(
		"Surgeon" = /datum/outfit/job/surgeon,
		"Nurse" = /datum/outfit/job/nurse
		)
	minimal_player_ingame_minutes = 960
	outfit = /datum/outfit/job/doctor
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND ALSO LOCATING THE "job_loop:" THINGY AND CHANGING
		THE VERSION THERE. CURRENTLY THE VERSION THERE IS 26.
		~Luduk
	*/
	restricted_species = list(UNATHI, TAJARAN, DIONA)


/datum/job/paramedic
	title = "Paramedic"
	flag = PARAMEDIC
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/med
	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_PARAMEDIC, ACCESS_MAINT_TUNNELS, ACCESS_EXTERNAL_AIRLOCKS, ACCESS_SEC_DOORS, ACCESS_RESEARCH, ACCESS_MAILSORTING, ACCESS_MEDBAY_STORAGE, ACCESS_ENGINEERING_LOBBY)
	salary = 120
	minimal_player_ingame_minutes = 1500 //they have too much access, so you have to play more to unlock it
	outfit = /datum/outfit/job/paramedic
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND ALSO LOCATING THE "job_loop:" THINGY AND CHANGING
		THE VERSION THERE. CURRENTLY THE VERSION THERE IS 26.
		~Luduk
	*/
	restricted_species = list(IPC)

// Slow species shouldn't be paramedics.
/datum/job/paramedic/special_species_check(datum/species/S)
	return S.speed_mod <= 1


//Chemist is a medical job damnit	//YEAH FUCK YOU SCIENCE	-Pete	//Guys, behave -Erro
/datum/job/chemist
	title = "Chemist"
	flag = CHEMIST
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/med
	access = list(ACCESS_MEDICAL, ACCESS_CHEMISTRY, ACCESS_MEDBAY_STORAGE)
	salary = 150
	alt_titles = list("Pharmacist")
	minimal_player_ingame_minutes = 960
	outfit = /datum/outfit/job/chemist


/datum/job/geneticist
	title = "Geneticist"
	flag = GENETICIST
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the chief medical officer and research director"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/med
	access = list(ACCESS_MEDICAL, ACCESS_MORGUE, ACCESS_GENETICS, ACCESS_RESEARCH, ACCESS_MEDBAY_STORAGE)
	salary = 180
	minimal_player_ingame_minutes = 960
	outfit = /datum/outfit/job/geneticist


/datum/job/virologist
	title = "Virologist"
	flag = VIROLOGIST
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/med
	access = list(ACCESS_MEDICAL, ACCESS_VIROLOGY, ACCESS_MEDBAY_STORAGE)
	alt_titles = list("Pathologist","Microbiologist")
	minimal_player_ingame_minutes = 960
	salary = 180
	outfit = /datum/outfit/job/virologist
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND ALSO LOCATING THE "job_loop:" THINGY AND CHANGING
		THE VERSION THERE. CURRENTLY THE VERSION THERE IS 26.
		~Luduk
	*/
	restricted_species = list(UNATHI, TAJARAN, DIONA)


/datum/job/psychiatrist
	title = "Psychiatrist"
	flag = PSYCHIATRIST
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/med
	access = list(ACCESS_MEDICAL, ACCESS_PSYCHIATRIST, ACCESS_MEDBAY_STORAGE)
	alt_titles = list("Psychologist" = /datum/outfit/job/psychologist)
	salary = 140
	minimal_player_ingame_minutes = 960
	outfit = /datum/outfit/job/psychiatrist


/datum/job/intern
	title = "Medical Intern"
	flag = INTERN
	department_flag = MEDSCI
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the chief medical officer"
	selection_color = "#ffeef0"
	idtype = /obj/item/weapon/card/id/med
	access = list(ACCESS_MEDICAL)
	salary = 50
	outfit = /datum/outfit/job/intern

