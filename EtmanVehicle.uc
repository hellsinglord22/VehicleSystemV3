class EtmanVehicle extends UTVehicle_Scorpion_Content;

event Bump(Actor Other, PrimitiveComponent OtherComp, Vector HitNormal)
{
    Pawn localPawn = Pawn(Other) ; 
    if(localPawn != none) 
    {
        /// send a message to the AIController to stop the vehicle 
    }
}

defaultproperties
{
    bCollideActors = true;
    bBlockActors = true ; 
}
