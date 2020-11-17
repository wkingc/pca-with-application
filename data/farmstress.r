library("Hmisc")

pest <- read.delim(file = "/Users/wade/Documents/FHCRC/Job/interpreting_PCA_BSR/5_18_2020/PCA Presentation Notes/datasetup/pesticides3.txt", header = TRUE, sep = "\t", quote="\"", dec=".", fill = TRUE, na.strings=c("", NA, "."), stringsAsFactors = TRUE)



# Season 1 
pestS1 <- pest[, c("OCCUPATION_11", "S_BILLS_NUM_11", "S_LACKWORK_NUM_11", "S_INJUSTICE_NUM_11", "S_INJURY_NUM_11", "S_HARDWORK_NUM_11", "D_SICKFAM_NUM_11", "D_MEDBILLS_NUM_11", "D_PROBLEMS_NUM_11", "S_CHILDCARE_NUM_11", "S_DISTANCE_NUM_11", "S_CHILDPROB_NUM_11", "S_COMMUNICATION_NUM_11", "S_DRINKING_NUM_11", "S_DRUGUSE_NUM_11", "S_VIOLENCE_NUM_11", "S_CRIME_NUM_11", "S_GANG_NUM_11", "S_DISCRIM_NUM_11", "S_ENGLISH_NUM_11", "S_COMMUNYOUTH_NUM_11", "S_DISCRIMSCHOOL_NUM_11", "S_ENERGY_NUM_11", "S_SLEEP_NUM_11", "S_DEPRESSED_NUM_11")]

colnames(pestS1) <- c("OCCUPATION", "S_BILLS_NUM", "S_LACKWORK_NUM", "S_INJUSTICE_NUM", "S_INJURY_NUM", "S_HARDWORK_NUM", "D_SICKFAM_NUM", "D_MEDBILLS_NUM", "D_PROBLEMS_NUM", "S_CHILDCARE_NUM", "S_DISTANCE_NUM", "S_CHILDPROB_NUM", "S_COMMUNICATION_NUM", "S_DRINKING_NUM", "S_DRUGUSE_NUM", "S_VIOLENCE_NUM", "S_CRIME_NUM", "S_GANG_NUM", "S_DISCRIM_NUM", "S_ENGLISH_NUM", "S_COMMUNYOUTH_NUM", "S_DISCRIMSCHOOL_NUM", "S_ENERGY_NUM", "S_SLEEP_NUM", "S_DEPRESSED_NUM")

pestS1$SEASON <- 1

# Season 2
pestS2 <- pest[,c("OCCUPATION_21", "S_BILLS_NUM_21", "S_LACKWORK_NUM_21", "S_INJUSTICE_NUM_21", "S_INJURY_NUM_21", "S_HARDWORK_NUM_21", "D_SICKFAM_NUM_21", "D_MEDBILLS_NUM_21", "D_PROBLEMS_NUM_21", "S_CHILDCARE_NUM_21", "S_DISTANCE_NUM_21", "S_CHILDPROB_NUM_21", "S_COMMUNICATION_NUM_21", "S_DRINKING_NUM_21", "S_DRUGUSE_NUM_21", "S_VIOLENCE_NUM_21", "S_CRIME_NUM_21", "S_GANG_NUM_21", "S_DISCRIM_NUM_21", "S_ENGLISH_NUM_21", "S_COMMUNYOUTH_NUM_21", "S_DISCRIMSCHOOL_NUM_21", "S_ENERGY_NUM_21", "S_SLEEP_NUM_21", "S_DEPRESSED_NUM_21")]

colnames(pestS2) <- c("OCCUPATION", "S_BILLS_NUM", "S_LACKWORK_NUM", "S_INJUSTICE_NUM", "S_INJURY_NUM", "S_HARDWORK_NUM", "D_SICKFAM_NUM", "D_MEDBILLS_NUM", "D_PROBLEMS_NUM", "S_CHILDCARE_NUM", "S_DISTANCE_NUM", "S_CHILDPROB_NUM", "S_COMMUNICATION_NUM", "S_DRINKING_NUM", "S_DRUGUSE_NUM", "S_VIOLENCE_NUM", "S_CRIME_NUM", "S_GANG_NUM", "S_DISCRIM_NUM", "S_ENGLISH_NUM", "S_COMMUNYOUTH_NUM", "S_DISCRIMSCHOOL_NUM", "S_ENERGY_NUM", "S_SLEEP_NUM", "S_DEPRESSED_NUM")

pestS2$SEASON <- 2

# Season 3
pestS3 <- pest[,c("OCCUPATION_31", "S_BILLS_NUM_31", "S_LACKWORK_NUM_31", "S_INJUSTICE_NUM_31", "S_INJURY_NUM_31", "S_HARDWORK_NUM_31", "D_SICKFAM_NUM_31", "D_MEDBILLS_NUM_31", "D_PROBLEMS_NUM_31", "S_CHILDCARE_NUM_31", "S_DISTANCE_NUM_31", "S_CHILDPROB_NUM_31", "S_COMMUNICATION_NUM_31", "S_DRINKING_NUM_31", "S_DRUGUSE_NUM_31", "S_VIOLENCE_NUM_31", "S_CRIME_NUM_31", "S_GANG_NUM_31", "S_DISCRIM_NUM_31", "S_ENGLISH_NUM_31", "S_COMMUNYOUTH_NUM_31", "S_DISCRIMSCHOOL_NUM_31", "S_ENERGY_NUM_31", "S_SLEEP_NUM_31", "S_DEPRESSED_NUM_31")]

colnames(pestS3) <- c("OCCUPATION", "S_BILLS_NUM", "S_LACKWORK_NUM", "S_INJUSTICE_NUM", "S_INJURY_NUM", "S_HARDWORK_NUM", "D_SICKFAM_NUM", "D_MEDBILLS_NUM", "D_PROBLEMS_NUM", "S_CHILDCARE_NUM", "S_DISTANCE_NUM", "S_CHILDPROB_NUM", "S_COMMUNICATION_NUM", "S_DRINKING_NUM", "S_DRUGUSE_NUM", "S_VIOLENCE_NUM", "S_CRIME_NUM", "S_GANG_NUM", "S_DISCRIM_NUM", "S_ENGLISH_NUM", "S_COMMUNYOUTH_NUM", "S_DISCRIMSCHOOL_NUM", "S_ENERGY_NUM", "S_SLEEP_NUM", "S_DEPRESSED_NUM")

pestS3$SEASON <- 3

# Combined
farmstress <- rbind(pestS1, pestS2, pestS3)

farmstress <- farmstress[, c("OCCUPATION", "SEASON", "S_BILLS_NUM", "S_LACKWORK_NUM", "S_INJUSTICE_NUM", "S_INJURY_NUM", "S_HARDWORK_NUM", "D_SICKFAM_NUM", "D_MEDBILLS_NUM", "D_PROBLEMS_NUM", "S_CHILDCARE_NUM", "S_DISTANCE_NUM", "S_CHILDPROB_NUM", "S_COMMUNICATION_NUM", "S_DRINKING_NUM", "S_DRUGUSE_NUM", "S_VIOLENCE_NUM", "S_CRIME_NUM", "S_GANG_NUM", "S_DISCRIM_NUM", "S_ENGLISH_NUM", "S_COMMUNYOUTH_NUM", "S_DISCRIMSCHOOL_NUM", "S_ENERGY_NUM", "S_SLEEP_NUM", "S_DEPRESSED_NUM")]

farmstress$SEASON <- factor(farmstress$SEASON, levels = c(1, 2, 3), labels = c("Pre-thinning", "Thinning", "No-spray"))

colnames(farmstress) <- gsub("_NUM", "", colnames(farmstress))
colnames(farmstress) <- gsub("S_", "", colnames(farmstress))
colnames(farmstress) <- gsub("D_", "", colnames(farmstress))
colnames(farmstress) <- tolower(colnames(farmstress))

label(farmstress$occupation) <- "Occupation"
label(farmstress$season) <- "During the pre-thinning season (March-May), there are few jobs, and many farmworkers will not have worked since the harvest season (September-October).  During the thinning season (June through August) and harvest season (June-October), jobs are plentiful, and farmworkers typically work long hours in the fields.  During the non-spray season (November-February), crops are dormant, and employment diminishes."

label(farmstress$bills) <- "In the past month have you felt stressed because you didn't have enough money to pay the bills?"
label(farmstress$lackwork) <- "In the past month have you felt stressed because of lack of enough work?"
label(farmstress$injustice) <- "In the past month have you felt stressed because of injustice at work?"
label(farmstress$injury) <- "In the past month have you felt stressed because of painful injuries at work?"
label(farmstress$hardwork) <- "In the past month have you felt stressed because you have to work too hard?"
label(farmstress$sickfam) <- "In the past month have you had feelings of desperation because of sickness in your family?"
label(farmstress$medbills) <- "In the past month have you had feelings of desperation due to lack of money to pay medical bills?"
label(farmstress$problems) <- "In the past month have you had feelings of desperation because members of your family have problems that you cannot solve?"
label(farmstress$childcare) <- "In the past month have you been stressed about where to leave your children while working?"
label(farmstress$distance) <- "In the past month have you had feelings of desperation because members of your family are far away?"
label(farmstress$childprob) <- "In the past month have you felt stress because of problems with your children?"
label(farmstress$communication) <- "In the past month have you felt stress because there is a lack of communication in your home?"
label(farmstress$drinking) <- "In the past month have you felt stress because of a drinking problem in your home?"
label(farmstress$druguse) <- "In the past month have you felt stress because of drug use in your home?"
label(farmstress$violence) <- "In the past month have you felt stress because of domestic violence in your home?"
label(farmstress$crime) <- "In the past month have you felt stress because of crime in your community?"
label(farmstress$gang) <- "In the past month have you felt stress because of gang-related violence in your community?"
label(farmstress$discrim) <- "In the past month have you felt stress because of discrimination in your community?"
label(farmstress$english) <- "In the past month have you felt stress because you do not speak English?"
label(farmstress$communyouth) <- "In the past month have you felt stress because there is a lack of communication with the youth in your community?"
label(farmstress$discrimschool) <- "In the past month have you felt stress because there is discrimination in schools?"
label(farmstress$energy) <- "In the past month have you found it hard to work up the energy to do things?"
label(farmstress$sleep) <- "In the past month have you lost sleep because of stress?"
label(farmstress$depressed) <- "In the past month have you been depressed due to stress?"

save(farmstress, file = "/Users/wade/Documents/FHCRC/Job/interpreting_PCA_BSR/5_18_2020/PCA Presentation Notes/datasetup/farmstress.RData")