
#create the gun_model

gun_model<-lm(Victims~Handgun+Shotgun+Rifle, data=Final)
null<-lm(Victims~1, data=Final)
full<-lm(Victims~Automatic+Semi+Handgun+Shotgun+Rifle, data=Final)
backward.gun<-step(full,scope=list(lower=null, upper=full),direction="backward")
summary(backward.gun)
plot(backward.gun)
#predicts total victims for an average state given the amount of guns that are involved in all of that states shooting
predict.lm(backward.gun, list(Handgun=0, Shotgun=12))
predict.lm(backward.gun, list(Handgun=12, Shotgun=0))
# model to predict things based on Place, Age and History 
shoot<-lm(Victims~Place+History+Age, data=Shooting)
shoot<-lm(Victims~Age, data=Shooting)
summary(shoot)
# backwards model
#remove missing values
Shooting[!complete.cases(Shooting),]
Shooting<-na.omit(Shooting)
null<-lm(Victims~1, data=Shooting)
full<-lm(Victims~Age+Place+History, data=Shooting)
backward.shoot<-step(full,scope=list(lower=null, upper=full),direction="backward")
