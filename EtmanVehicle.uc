class EtmanVehicle extends UTVehicle_Scorpion_Content
placeable;



event Bump(Actor Other, PrimitiveComponent OtherComp, Vector HitNormal)
{
    
    if ( EtmanVehicle(Other) != none)
    {
           WorldInfo.game.broadcast(self,"You HIT A CAR");
            ~log("You HIT A CAR");
    }
   
    if(Other != none) 
    {
        WorldInfo.game.broadcast(self,"You are in my face");
        `log("You hit me in the face as well");
    }
}

defaultproperties
{
    bCollideActors = true;
    bBlockActors = true ; 
}
