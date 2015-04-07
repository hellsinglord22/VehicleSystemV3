class EtmanVehicle extends UTVehicle_Scorpion_Content
placeable;

var bool hitSomething;


simulated event RigidBodyCollision( PrimitiveComponent HitComponent, PrimitiveComponent OtherComponent,
				const out CollisionImpactData RigidCollisionData, int ContactIndex )
{
	hitSomething = true;
	SetTimer(1); 
	WorldInfo.Game.Broadcast(self, "I hit something");
	WorldInfo.Game.Broadcast(self, "RigidBodyCollision method" @hitSomething);
}
event Bump(Actor Other, PrimitiveComponent OtherComp, Vector HitNormal)
{
	if(Other != none ){
		hitSOmething = true; 
		SetTimer(1);
		WorldInfo.Game.Broadcast(self, "I Bump to something");
		WorldInfo.Game.Broadcast(self, "Bump method" @hitSomething);
	}
}
function Timer(){
	hitSomething= false;
}



defaultproperties
{
	hitSomething = false ; 
    bCollideActors = true;
    bBlockActors = true ; 
}
