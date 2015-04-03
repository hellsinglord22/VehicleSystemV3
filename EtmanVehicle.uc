class EtmanVehicle extends UTVehicle_Scorpion_Content
placeable;

simulated event RigidBodyCollision( PrimitiveComponent HitComponent, PrimitiveComponent OtherComponent,
				const out CollisionImpactData RigidCollisionData, int ContactIndex )
{
	WorldInfo.Game.Broadcast(self, "i got hit");
}


defaultproperties
{
    bCollideActors = true;
    bBlockActors = true ; 
}
