
/*This class have all the collision 
Logic 
*/
class EtmanVehicle extends UTVehicle_Scorpion_Content
placeable;

var bool hitSomething;

simulated function PostBeginPlay()
{
	super.PostBeginPlay();
	setTimer(3 , true , 'defaultHitSomething');	
}

/// This happen when two cars hit each others /// 
simulated event RigidBodyCollision( PrimitiveComponent HitComponent, PrimitiveComponent OtherComponent,
				const out CollisionImpactData RigidCollisionData, int ContactIndex )
{
	hitSomething = true;
	WorldInfo.Game.Broadcast(self, "I hit something");
	WorldInfo.Game.Broadcast(self, "RigidBodyCollision method" @hitSomething);
}

/// This happen when an actor hit the player 
event Bump(Actor Other, PrimitiveComponent OtherComp, Vector HitNormal)
{
	if(Other != none ){
		hitSOmething = true; 
		WorldInfo.Game.Broadcast(self, "I Bump to something");
		WorldInfo.Game.Broadcast(self, "Bump method" @hitSomething);
	}
}
function defaultHitSomething(){
	hitSomething = false;
}



defaultproperties
{
	hitSomething= false
    bCollideActors= true
    bBlockActors= true
    bAvoidReversing = true
    MaxSpeed= 450
    bDuckObstacles= true 

    Health=300
  	COMOffset=(X=-40.f,Y=0.f,Z=-36.f)
  	UprightLiftStrength=280.f
  	UprightTime=1.25f
	UprightTorqueStrength=500.f
	bCanFlip=true
	bHasHandbrake=true
	GroundSpeed=950
	AirSpeed=1100
	HeavySuspensionShiftPercent=0.75f
	MomentumMult=0.5f
	NonPreferredVehiclePathMultiplier=1.5f
	DrawScale=1.2f
	bAlwaysRelevant=true
	SquealThreshold=0.1f
	SquealLatThreshold=0.f2f
	LatAngleVolumeMult=30.f
	EngineStartOffsetSecs=2.f
	EngineStopOffsetSecs=1.f
	bAttachDriver=false
	BaseEyeheight=30
	Eyeheight=30

	Begin Object Name=CollisionCylinder
		CollisionHeight=+70.0
		CollisionRadius=+240.0
		Translation=(X=-40.0,Y=0.0,Z=40.0)
	End Object



    

}
