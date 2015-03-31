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

defaultproperties
{
    bCollideActors = true;
    bBlockActors = true ; 
}
