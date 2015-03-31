class EtmanVehicle extends UTVehicle_Scorpion_Content
placeable;



event Bump(Actor Other, PrimitiveComponent OtherComp, Vector HitNormal)
{
    
    `log(Other);
    WorldInfo.game.broadcast(self,Other);
    if ( EtmanVehicle(Other) != none)
    {
           WorldInfo.game.broadcast(self,"You HIT A CAR");
          `log("YOU HIT A CAR");
    }
   
    if(Other != none) 
    {
        WorldInfo.game.broadcast(self,"You are in my face");
        `log("You hit an actor");
    }
}
event Touch(Actor Other, PrimitiveComponent OtherComp, vector HitLocation, vector HitNormal)
{
    `log(Other);
    WorldInfo.Game.Broadcast(self, Other);
}

defaultproperties
{
    bCollideActors = true;
    bBlockActors = false ; 
}
