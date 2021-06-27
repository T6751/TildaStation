//Cargo
/datum/job/qm
	title = "Quartermaster"
	flag = QUARTERMASTER
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#d7b088"
	idtype = /obj/item/weapon/card/id/cargoGold
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_QM, ACCESS_MINT, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_RECYCLER)
	salary = 160
	minimal_player_ingame_minutes = 960
	outfit = /datum/outfit/job/qm
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND ALSO LOCATING THE "job_loop:" THINGY AND CHANGING
		THE VERSION THERE. CURRENTLY THE VERSION THERE IS 26.
		~Luduk
	*/
	restricted_species = list(UNATHI, TAJARAN, VOX, DIONA)


/datum/job/cargo_tech
	title = "Cargo Technician"
	flag = CARGOTECH
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the quartermaster and the head of personnel"
	selection_color = "#d7b088"
	idtype = /obj/item/weapon/card/id/cargo
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_MAILSORTING)
	salary = 50
	minimal_player_ingame_minutes = 480
	outfit = /datum/outfit/job/cargo_tech


/datum/job/mining
	title = "Shaft Miner"
	flag = MINER
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	supervisors = "the quartermaster and the head of personnel"
	selection_color = "#d7b088"
	idtype = /obj/item/weapon/card/id/cargo
	access = list(ACCESS_MINING, ACCESS_MINT, ACCESS_MINING_STATION, ACCESS_MAILSORTING)
	salary = 80
	minimal_player_ingame_minutes = 480
	outfit = /datum/outfit/job/mining


/datum/job/recycler
	title = "Recycler"
	flag = RECYCLER
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the quartermaster and the head of personnel"
	selection_color = "#d7b088"
	idtype = /obj/item/weapon/card/id/cargo
	access = list(ACCESS_MINING, ACCESS_MINT, ACCESS_MAILSORTING, ACCESS_RECYCLER)
	salary = 60
	minimal_player_ingame_minutes = 480
	outfit = /datum/outfit/job/recycler
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND ALSO LOCATING THE "job_loop:" THINGY AND CHANGING
		THE VERSION THERE. CURRENTLY THE VERSION THERE IS 26.
		~Luduk
	*/
	restricted_species = list(DIONA)


//Food
/datum/job/bartender
	title = "Bartender"
	flag = BARTENDER
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#bbe291"
	idtype = /obj/item/weapon/card/id/civ
	access = list(ACCESS_BAR)
	salary = 40
	minimal_player_ingame_minutes = 240
	outfit = /datum/outfit/job/bartender
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND ALSO LOCATING THE "job_loop:" THINGY AND CHANGING
		THE VERSION THERE. CURRENTLY THE VERSION THERE IS 26.
		~Luduk
	*/
	restricted_species = list(TAJARAN)


/datum/job/chef
	title = "Chef"
	flag = CHEF
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "the head of personnel"
	selection_color = "#bbe291"
	idtype = /obj/item/weapon/card/id/civ
	access = list(ACCESS_KITCHEN)
	salary = 40
	alt_titles = list("Cook")
	minimal_player_ingame_minutes = 240
	outfit = /datum/outfit/job/chef
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND ALSO LOCATING THE "job_loop:" THINGY AND CHANGING
		THE VERSION THERE. CURRENTLY THE VERSION THERE IS 26.
		~Luduk
	*/
	restricted_species = list(TAJARAN)


/datum/job/hydro
	title = "Botanist"
	flag = BOTANIST
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 3
	spawn_positions = 2
	supervisors = "the head of personnel"
	selection_color = "#bbe291"
	idtype = /obj/item/weapon/card/id/civ
	access = list(ACCESS_HYDROPONICS) // Removed tox and chem access because STOP PISSING OFF THE CHEMIST GUYS // //Removed medical access because WHAT THE FUCK YOU AREN'T A DOCTOR YOU GROW WHEAT //Given Morgue access because they have a viable means of cloning.
	salary = 60
	alt_titles = list("Hydroponicist")
	minimal_player_ingame_minutes = 120
	outfit = /datum/outfit/job/hydro


/datum/job/janitor
	title = "Janitor"
	flag = JANITOR
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#bbe291"
	idtype = /obj/item/weapon/card/id/civ
	access = list(ACCESS_JANITOR, ACCESS_MAINT_TUNNELS, ACCESS_SEC_DOORS, ACCESS_RESEARCH, ACCESS_MAILSORTING, ACCESS_MEDICAL, ACCESS_ENGINEERING_LOBBY)
	salary = 50
	minimal_player_ingame_minutes = 120
	outfit = /datum/outfit/job/janitor


//More or less assistants
/datum/job/barber
	title = "Barber"
	flag = BARBER
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#bbe291"
	idtype = /obj/item/weapon/card/id/civ
	access = list(ACCESS_BARBER)
	salary = 40
	alt_titles = list("Stylist" = /datum/outfit/job/stylist)
	minimal_player_ingame_minutes = 120
	outfit = /datum/outfit/job/barber


/datum/job/librarian
	title = "Librarian"
	flag = LIBRARIAN
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"
	idtype = /obj/item/weapon/card/id/civ
	access = list(ACCESS_LIBRARY)
	salary = 40
	alt_titles = list("Journalist")
	minimal_player_ingame_minutes = 120
	outfit = /datum/outfit/job/librarian


//var/global/lawyer = 0//Checks for another lawyer //This changed clothes on 2nd lawyer, both IA get the same dreds.
/datum/job/lawyer
	title = "Internal Affairs Agent"
	flag = LAWYER
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "The Central Command"
	selection_color = "#dddddd"
	idtype = /obj/item/weapon/card/id/int
	access = list(ACCESS_LAWYER, ACCESS_SEC_DOORS, ACCESS_MEDICAL, ACCESS_RESEARCH, ACCESS_MAILSORTING, ACCESS_ENGINE, ACCESS_ENGINEERING_LOBBY)
	salary = 200
	minimal_player_ingame_minutes = 1560
	outfit = /datum/outfit/job/lawyer
	/*
		HEY YOU!
		ANY TIME YOU TOUCH THIS, PLEASE CONSIDER GOING TO preferences_savefile.dm
		AND BUMPING UP THE SAVEFILE_VERSION_MAX, AND ALSO LOCATING THE "job_loop:" THINGY AND CHANGING
		THE VERSION THERE. CURRENTLY THE VERSION THERE IS 26.
		~Luduk
	*/
	restricted_species = list(SKRELL, UNATHI, TAJARAN, DIONA, VOX)


/datum/job/clown
	title = "Clown"
	flag = CLOWN
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"
	idtype = /obj/item/weapon/card/id/clown
	access = list(ACCESS_CLOWN, ACCESS_THEATRE)
	salary = 20
	minimal_player_ingame_minutes = 120
	outfit = /datum/outfit/job/clown

/datum/job/clown/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!visualsOnly)
		H.mutations.Add(CLUMSY)

/datum/job/mime
	title = "Mime"
	flag = MIME
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of personnel"
	selection_color = "#dddddd"
	idtype = /obj/item/weapon/card/id/mime
	access = list(ACCESS_MIME, ACCESS_THEATRE)
	salary = 20
	outfit = /datum/outfit/job/mime

/datum/job/mime/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	if(!visualsOnly)
		H.verbs += /client/proc/mimespeak
		H.verbs += /client/proc/mimewall
		H.mind.special_verbs += /client/proc/mimespeak
		H.mind.special_verbs += /client/proc/mimewall
		H.miming = 1
