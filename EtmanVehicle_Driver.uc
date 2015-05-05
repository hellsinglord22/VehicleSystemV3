class EtmanVehicle_Driver extends UTPawn;

/// variables // 
var EtmanPathnode_Traffic startingNode;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    `log ("##########_ Driver is created -> " @ self @" _###########");       
}


defaultProperties
{       
    ControllerClass=class'EtmanVehicleAiController'       
}