class EtmanVehicle_Traffic extends EtmanVehicle;

var pawn myDriver;

simulated function PostBeginPlay()
{
    `log("#########__ Etman Vehicle Traffic PostBeginPlay _ ##########");
    super.PostBeginPlay();
    
    `Log("#####__ Vehicle Pawn is Here -> "@ self @" __#####");   

    myDriver = Spawn(class'EtmanVehicle_Driver' ,,, Location + vect(0,100,0));
   `Log("#####__ Driver is ready -> "@ myDriver @" __#####");  
    
   if (self.DriverEnter(myDriver))
    `Log("#######__  LOLOLOLOLOOOOOOOWWYYYYYYYYY  __########"); 
    
    Self.Mesh.WakeRigidBody();
    
}


function bool DriverEnter(Pawn P)
{
    local Controller C;

    `Log("#####__ Driver Enter Pawn P -> "@ P @" __#####");
    `Log("#####__ Pawn Controller -> "@ P.Controller @" __#####");    
    
    // Set pawns current controller to control the vehicle pawn instead
    C = P.Controller;
    Driver = P;
    Driver.StartDriving( self );
    if ( Driver.Health <= 0 )
    {
        Driver = None;
        return false;
    }
    SetDriving(true);

    // Disconnect PlayerController from Driver and connect to Vehicle.
    C.Unpossess();
    Driver.SetOwner( Self ); // This keeps the driver relevant.
    C.Possess( Self, true );

    if( PlayerController(C) != None && !C.IsChildState(C.GetStateName(), LandMovementState) )
    {
        PlayerController(C).GotoState( LandMovementState );
    }

    WorldInfo.Game.DriverEnteredVehicle(self, P);
    return true;
}


defaultProperties
{   

}