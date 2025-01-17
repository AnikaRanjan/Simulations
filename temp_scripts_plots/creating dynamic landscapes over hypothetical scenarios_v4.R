rm(list=ls())
gc()
#install.packages("raster")
#install.packages('landscapetools')
#install.packages('NLMR')
library(raster)
library(landscapetools)
library(NLMR)

setwd(getwd())

##Experiment 1: Island dynamics with area and heterogeneity dynamics
#Spatial dimensions:
Ncol<-31
Nrow<-31
#Temporal extent:
Ntimesteps<-140
#Creating an array:
My_Dynamic_Landscape<-array(NA,dim=c(Nrow,Ncol,Ntimesteps))
My_Dynamic_Landscape_dataframe<-matrix(NA,nrow=Nrow*Ncol, ncol=length(c(Ncol,Nrow))+Ntimesteps)
My_Dynamic_Landscape2<-array(NA,dim=c(Nrow,Ncol,Ntimesteps))
My_Dynamic_Landscape_dataframe2<-matrix(NA,nrow=Nrow*Ncol, ncol=length(c(Ncol,Nrow))+Ntimesteps)
stringtimestepsnames<-vector(mode="character",length=Ntimesteps)
#My_Dynamic_Landscape[,1:2,] <- 20   #Error in file_path_sans_ext(basename(config_file)) : could not find function "file_path_sans_ext"
#My_Dynamic_Landscape2[,1:2,] <- 500

#Looping over the time steps and creating a landmass dynamics, 
#while saving temperature values on it:
for (timestep in 1:Ntimesteps){
  counting<-1
  stringtimestepsnames[timestep]<-paste("X",timestep,"", sep="")
  for (y in 1:Nrow){
    for (x in 1:Ncol){
      if((timestep<=10)||(timestep>120 && timestep<=140)){
        if((y>=15 && y<=16)&&(x>=15 && x<=16)) {
          My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,20,0.5) 
          My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,500,50) 
        }
      }
      if((timestep>10 && timestep<=20)||(timestep>100 && timestep<=120)){
        if((y>=15 && y<=17)&&(x>=15 && x<=17)) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,20,0.5) 
        if(y==16 && x==16) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,19,0.5) 
        
        if((y==15)&&(x>=15 && x<=17)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,500,50) 
        if((y==16)&&(x>=15 && x<=17)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,600,50) 
        if((y==17)&&(x>=15 && x<=17)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,700,50)   
      }
      if((timestep>20 && timestep<=30)||(timestep>80 && timestep<=100)){
        if((y>=14 && y<=18)&&(x>=14 && x<=18)) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,20,0.5) 
        if((y>=15 && y<=17)&&(x>=15 && x<=17)) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,19,0.5) 
        if(y==16 && x==16) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,18,0.5) 
        
        if((y==14)&&(x>=14 && x<=18)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,500,50) 
        if((y==15)&&(x>=14 && x<=18)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,600,50) 
        if((y==16)&&(x>=14 && x<=18)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,700,50) 
        if((y==17)&&(x>=14 && x<=18)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,800,50) 
        if((y==18)&&(x>=14 && x<=18)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,900,50)         
      }
      if((timestep>30 && timestep<=40)||(timestep>60 && timestep<=80)){
        if((y>=13 && y<=19)&&(x>=13 && x<=19)) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,20,0.5) 
        if((y>=14 && y<=18)&&(x>=14 && x<=18)) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,19,0.5) 
        if((y>=15 && y<=17)&&(x>=15 && x<=17)) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,18,0.5) 
        if(y==16 && x==16) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,17,0.5) 
        
        if((y==13)&&(x>=13 && x<=19)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,500,50) 
        if((y==14)&&(x>=13 && x<=19)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,600,50) 
        if((y==15)&&(x>=13 && x<=19)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,700,50) 
        if((y==16)&&(x>=13 && x<=19)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,800,50) 
        if((y==17)&&(x>=13 && x<=19)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,900,50) 
        if((y==18)&&(x>=13 && x<=19)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,1000,50)  
        if((y==19)&&(x>=13 && x<=19)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,1100,50)           
      }
      if(timestep>40 && timestep<=60){
        if((y>=12 && y<=20)&&(x>=12 && x<=20)) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,20,0.5) 
        if((y>=13 && y<=19)&&(x>=13 && x<=19)) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,19,0.5) 
        if((y>=14 && y<=18)&&(x>=14 && x<=18)) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,18,0.5) 
        if((y>=15 && y<=17)&&(x>=15 && x<=17)) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,17,0.5) 
        if(y==16 && x==16) My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,16,0.5) 
        
        if((y==12)&&(x>=12 && x<=20)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,500,50) 
        if((y==13)&&(x>=12 && x<=20)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,600,50) 
        if((y==14)&&(x>=12 && x<=20)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,700,50) 
        if((y==15)&&(x>=12 && x<=20)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,800,50) 
        if((y==16)&&(x>=12 && x<=20)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,900,50) 
        if((y==17)&&(x>=12 && x<=20)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,1000,50)  
        if((y==18)&&(x>=12 && x<=20)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,1100,50)  
        if((y==19)&&(x>=12 && x<=20)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,1200,50)  
        if((y==20)&&(x>=12 && x<=20)) My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,1300,50)  
      }

      if(timestep==1){
        My_Dynamic_Landscape_dataframe[counting,1]<-x
        My_Dynamic_Landscape_dataframe[counting,2]<-y
        My_Dynamic_Landscape_dataframe2[counting,1]<-x
        My_Dynamic_Landscape_dataframe2[counting,2]<-y
      }
      My_Dynamic_Landscape_dataframe[counting,2+timestep]<-My_Dynamic_Landscape[x,y,timestep]
      My_Dynamic_Landscape_dataframe2[counting,2+timestep]<-My_Dynamic_Landscape2[x,y,timestep]
      counting<-counting+1
    }
  }
  My_Dynamic_Landscape_dataframe_suitable<-My_Dynamic_Landscape_dataframe[which(My_Dynamic_Landscape_dataframe[,2+timestep]>0),]
  if(is.null(dim(My_Dynamic_Landscape_dataframe_suitable))) dist_matrx<-as.matrix(dist(My_Dynamic_Landscape_dataframe_suitable[1:2], method = "euclidean"))
  else dist_matrx<-as.matrix(dist(My_Dynamic_Landscape_dataframe_suitable[,1:2], method = "euclidean"))
  ##saving the dist_matrix into .rds format to be used as input
  saveRDS(dist_matrx, paste(getwd(),"/input/my_experiment/distance_matrices/geo_dist_m_ti_t_",(Ntimesteps - timestep),".rds", sep=""))
  
  #Sys.sleep(0.4)
  #image(My_Dynamic_Landscape[,,timestep])
}

which(!is.na(My_Dynamic_Landscape_dataframe[,timestep]))

My_Dynamic_Landscape_dataframe<-as.data.frame(My_Dynamic_Landscape_dataframe)
colnames(My_Dynamic_Landscape_dataframe)<- c("x","y",stringtimestepsnames)
My_Dynamic_Landscape_dataframe2<-as.data.frame(My_Dynamic_Landscape_dataframe2)
colnames(My_Dynamic_Landscape_dataframe2)<- c("x","y",stringtimestepsnames)
is.data.frame(My_Dynamic_Landscape_dataframe)
is.list(My_Dynamic_Landscape_dataframe)
all_geo_hab <- list("temp" = My_Dynamic_Landscape_dataframe,"prec"=My_Dynamic_Landscape_dataframe2) #This is important, otherwise the objects in the list won't have a name
##saving the list of data frames into .rds format to be used as input
saveRDS(all_geo_hab, paste(getwd(),"/input/my_experiment/all_geo_hab.rds", sep=""))



##Experiment 2: Island dynamics with only area dynamics
#Spatial dimensions:
Ncol<-31
Nrow<-31
#Temporal extent:
Ntimesteps<-140
#Creating an array:
My_Dynamic_Landscape<-array(NA,dim=c(Nrow,Ncol,Ntimesteps))
My_Dynamic_Landscape_dataframe<-matrix(NA,nrow=Nrow*Ncol, ncol=length(c(Ncol,Nrow))+Ntimesteps)
My_Dynamic_Landscape2<-array(NA,dim=c(Nrow,Ncol,Ntimesteps))
My_Dynamic_Landscape_dataframe2<-matrix(NA,nrow=Nrow*Ncol, ncol=length(c(Ncol,Nrow))+Ntimesteps)
stringtimestepsnames<-vector(mode="character",length=Ntimesteps)
#My_Dynamic_Landscape[,1:2,] <- 20   #Error in file_path_sans_ext(basename(config_file)) : could not find function "file_path_sans_ext"
#My_Dynamic_Landscape2[,1:2,] <- 500

#Looping over the time steps and creating a landmass dynamics, 
#while saving temperature values on it:
for (timestep in 1:Ntimesteps){
  counting<-1
  stringtimestepsnames[timestep]<-paste("X",timestep,"", sep="")
  for (y in 1:Nrow){
    for (x in 1:Ncol){
      if((timestep<=10)||(timestep>120 && timestep<=140)){
        if((y>=15 && y<=16)&&(x>=15 && x<=16)) {
          My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,20,0.5) 
          My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,500,50) 
        }
      }
      if((timestep>10 && timestep<=20)||(timestep>100 && timestep<=120)){
        if((y>=15 && y<=17)&&(x>=15 && x<=17)) {
          My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,20,0.5) 
          My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,500,50)
        }
      }
      if((timestep>20 && timestep<=30)||(timestep>80 && timestep<=100)){
        if((y>=14 && y<=18)&&(x>=14 && x<=18)) {
          My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,20,0.5) 
          My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,500,50) 
        }
      }
      if((timestep>30 && timestep<=40)||(timestep>60 && timestep<=80)){
        if((y>=13 && y<=19)&&(x>=13 && x<=19)) {
          My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,20,0.5)
          My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,500,50)
        }
      }
      if(timestep>40 && timestep<=60){
        if((y>=12 && y<=20)&&(x>=12 && x<=20)) {
          My_Dynamic_Landscape[x,y,timestep] <- rnorm(1,20,0.5)
          My_Dynamic_Landscape2[x,y,timestep] <- rnorm(1,500,50)  
        }
      }
      if(timestep==1){
        My_Dynamic_Landscape_dataframe[counting,1]<-x
        My_Dynamic_Landscape_dataframe[counting,2]<-y
        My_Dynamic_Landscape_dataframe2[counting,1]<-x
        My_Dynamic_Landscape_dataframe2[counting,2]<-y
      }
      My_Dynamic_Landscape_dataframe[counting,2+timestep]<-My_Dynamic_Landscape[x,y,timestep]
      My_Dynamic_Landscape_dataframe2[counting,2+timestep]<-My_Dynamic_Landscape2[x,y,timestep]
      counting<-counting+1
    }
  }
  My_Dynamic_Landscape_dataframe_suitable<-My_Dynamic_Landscape_dataframe[which(My_Dynamic_Landscape_dataframe[,2+timestep]>0),]
  if(is.null(dim(My_Dynamic_Landscape_dataframe_suitable))) dist_matrx<-as.matrix(dist(My_Dynamic_Landscape_dataframe_suitable[1:2], method = "euclidean"))
  else dist_matrx<-as.matrix(dist(My_Dynamic_Landscape_dataframe_suitable[,1:2], method = "euclidean"))
  ##saving the dist_matrix into .rds format to be used as input
  saveRDS(dist_matrx, paste(getwd(),"/input/my_experiment_2/distance_matrices/geo_dist_m_ti_t_",(Ntimesteps - timestep),".rds", sep=""))
  
  #Sys.sleep(0.4)
  #image(My_Dynamic_Landscape[,,timestep])
}

which(!is.na(My_Dynamic_Landscape_dataframe[,timestep]))

My_Dynamic_Landscape_dataframe<-as.data.frame(My_Dynamic_Landscape_dataframe)
colnames(My_Dynamic_Landscape_dataframe)<- c("x","y",stringtimestepsnames)
My_Dynamic_Landscape_dataframe2<-as.data.frame(My_Dynamic_Landscape_dataframe2)
colnames(My_Dynamic_Landscape_dataframe2)<- c("x","y",stringtimestepsnames)
is.data.frame(My_Dynamic_Landscape_dataframe)
is.list(My_Dynamic_Landscape_dataframe)
all_geo_hab <- list("temp" = My_Dynamic_Landscape_dataframe,"prec"=My_Dynamic_Landscape_dataframe2) #This is important, otherwise the objects in the list won't have a name
##saving the list of data frames into .rds format to be used as input
saveRDS(all_geo_hab, paste(getwd(),"/input/my_experiment_2/all_geo_hab.rds", sep=""))


