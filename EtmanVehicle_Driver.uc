class EtmanVehicle_Driver extends UTPawn;

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    `log ("##########_ Driver is created -> " @ self @" _###########");       
}


defaultProperties
{       
    ControllerClass=class'EtmanVehicleAiController'       
}