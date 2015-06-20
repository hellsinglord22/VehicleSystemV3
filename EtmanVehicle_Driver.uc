class EtmanVehicle_Driver extends UTPawn;

/// variables // 
var EtmanPathnode_Traffic startingNodeDriver;
var bool hitSomething;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    `log ("##########_ Driver is created -> " @ self @" _###########");  
    setTimer(3 , false, 'LogTest');     
}
function LogTest()
{
	`log("startingNodeDriver" @startingNodeDriver);
}


defaultProperties
{       
    ControllerClass=class'EtmanVehicleAiController'       
    hitSomething= false 
}