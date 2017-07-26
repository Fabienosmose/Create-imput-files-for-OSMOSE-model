# Script to build osmose input csv file's
# Author : Fabien moullec
# Date : 05/04/2017

rm(list=ls())

setwd(dir="C:/Users/Fabien/Documents/OSMOSE-MED/Divers/Inputs R")
tab<- read.csv(file = "input27_03_17.csv",sep=",")

names(tab)
str(tab)

library(osmose2R)

species.name=list()
species.lInf=list()
species.K=list()
species.t0=list()
species.egg.size=list()
species.egg.weight=list()
species.length2weight.allometric.power=list()
species.length2weight.condition.factor=list()
species.lengthmax=list()
species.maturity.size=list()
species.relativefecundity=list()
species.sexratio=list()
species.vonbertalanffy.threshold.age=list()
species.lifespan=list()
mortality.natural.rate=list()
mortality.natural.larva.rate=list()
mortality.starvation.rate.max=list()
population.seeding.biomass=list()
mortality.fishing.rate=list()
mortality.fishing.recruitment.age=list()
mortality.fishing.recruitment.size=list()
movement.map.agemin=list()
movement.map.agemax=list()
movement.distribution.method=list()
movement.map.species=list()
movement.randomwalk=list()
simulation.nschool=list()


id <- seq(0,(length(tab$Species)-1),1)
for (i in 1:length(id)){
  species.name[[i]]=tab[i,"Species"]
  species.lInf[[i]]=tab[i,"Linf"]
  species.K[[i]]=tab[i,"K"]
  species.t0[[i]]=tab[i,"t0"]
  species.egg.size[[i]]=tab[i,"egg_size"]
  species.egg.weight[[i]]=tab[i,"egg_weight"]
  species.length2weight.allometric.power[[i]]=tab[i,"b"]
  species.length2weight.condition.factor[[i]]=tab[i,"c"]
  species.lengthmax[[i]]=tab[i,"Lmax"]
  species.maturity.size[[i]]=tab[i,"Lmat"]
  species.relativefecundity[[i]]=tab[i,"fec.rel"]
  species.sexratio[[i]]=tab[i,"sex_ratio"]
  species.vonbertalanffy.threshold.age[[i]]=tab[i,"vbf_treshold_age"]
  species.lifespan[[i]]=tab[i,"Amax"]
  mortality.natural.rate[[i]]=tab[i,"Mnat"]
  mortality.natural.larva.rate[[i]]=tab[i,"Mnat_larva"]
  mortality.starvation.rate.max[[i]]=tab[i,"mortatlity_starvation_rate"]
  population.seeding.biomass[[i]]=tab[i,"seeding"]
  mortality.fishing.rate[[i]]=tab[i,"fishing_mortality"]
  mortality.fishing.recruitment.age[[i]]=tab[i,"recruitment_age"]
  mortality.fishing.recruitment.size[[i]]=tab[i,"recruitment_size"]
  movement.map.agemin[[i]]=tab[i,"map_age_min"]
  movement.map.agemax[[i]]=tab[i,"map_age_max"]
  movement.distribution.method[[i]]=tab[i,"method_map"]
  movement.map.species[[i]]=tab[i,"Species"]
  movement.randomwalk[[i]]=tab[i,"randomwalk_range"]
  simulation.nschool[[i]]=tab[i,"ns_school"]
}


names(species.name) <- paste0("species.name.sp",id)
names(species.lInf)<- paste0("species.lInf.sp",id)
names(species.t0) <- paste0("species.t0.sp",id)
names(species.K) <- paste0("species.K.sp",id) 
names(species.egg.size) <- paste0("species.egg.size.sp",id) 
names(species.egg.weight) <- paste0("species.egg.weight.sp",id) 
names(species.length2weight.allometric.power) <- paste0("species.length2weight.allometric.power.sp",id) 
names(species.length2weight.condition.factor) <- paste0("species.length2weight.condition.factor.sp",id)
names(species.lengthmax) <- paste0("species.lengthmax.sp",id)
names(species.maturity.size) <- paste0("species.maturity.size.sp",id)
names(species.relativefecundity) <- paste0("species.relativefecundity.sp",id)
names(species.sexratio) <- paste0("species.sexratio.sp",id)
names(species.vonbertalanffy.threshold.age) <- paste0("species.vonbertalanffy.threshold.age.sp",id)
names(species.lifespan) <- paste0("species.lifespan.sp",id)
names(mortality.natural.rate) <- paste0("mortality.natural.rate.sp",id)
names(mortality.natural.larva.rate) <- paste0("mortality.natural.larva.rate.sp", id)
names(mortality.starvation.rate.max) <- paste0("mortality.starvation.rate.max",id)
names(population.seeding.biomass) <-paste0("population.seeding.biomass.sp",id) 
names(mortality.fishing.rate)<- paste0("mortality.fishing.rate.sp",id)
names(mortality.fishing.recruitment.age)<- paste0("mortality.fishing.recruitment.age.sp",id)
names(mortality.fishing.recruitment.size)<- paste0("mortality.fishing.recruitment.size.sp",id)
names(movement.map.agemin)<- paste0("movement.map",tab[id+1,"num_map"],".age.min")
names(movement.map.agemax)<- paste0("movement.map",tab[id+1,"num_map"],".age.max")
names(movement.distribution.method)<-paste0("movement.distribution.method.sp",id)
names(movement.map.species)<- paste0("movement.map",tab[id+1,"num_map"],".species")
names(movement.randomwalk)<-paste0("movement.randomwalk.range.sp",id)
names(simulation.nschool)<-paste0("simulation.nschool.sp",id)


param_species<- c(species.name,species.t0,species.lInf,species.K,species.egg.size,species.egg.weight,species.length2weight.allometric.power,species.length2weight.condition.factor,species.lengthmax,species.maturity.size,species.relativefecundity,species.sexratio,species.vonbertalanffy.threshold.age,species.lifespan)
param_mortality <- c(mortality.natural.rate, mortality.natural.larva.rate)
param_starvation <- c(mortality.starvation.rate.max)
param_seeding <- c(population.seeding.biomass)
param_fishing <- c(mortality.fishing.rate,mortality.fishing.recruitment.age,mortality.fishing.recruitment.size)
param_movement <- c(movement.map.agemin, movement.map.agemax, movement.map.species,movement.distribution.method,movement.randomwalk)
param_parameter <- c(simulation.nschool)

# fichier "osm_param_species"
writeOsmoseParameters(param_species,"osm_param-species_med.csv")

# fichier "osm_param-natural-mortality"
writeOsmoseParameters(param_mortality,"osm_param-natural-mortality_med.csv")

# fichier "osm_param-starvation"
writeOsmoseParameters(param_starvation,"osm_param-starvation_med.csv")

# fichier "osm_param-seeding"
writeOsmoseParameters(param_seeding,"osm_param-seeding_med.csv")

# fichier "osm_param-fishing"
writeOsmoseParameters(param_fishing,"osm_param-fishing_med.csv")

# fichier 'osm_param-movement"
writeOsmoseParameters(param_movement,"osm_param-movement_med.csv")

# fichier "osm_all-parameter"
writeOsmoseParameters(param_parameter, "osm_all-parameters_med.csv")


# To change names of files in a folder
folder = "C:/Users/Fabien/Documents/essai renames files"
files <- list.files(folder, pattern = "*.csv", full.names=T)
  sapply(files, FUN=function(eachpath){
    file.rename(from = eachpath,to=gsub(pattern="_",replacement = "", x=eachpath))
  })








