class EtmanVehicle_Traffic extends EtmanVehicle;


/// Attributes /// 
var EtmanVehicle_Driver myDriver;
var EtmanPathnode_Traffic startingNode;

// Method(S) // 
simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    myDriver = Spawn(class'EtmanVehicle_Driver' ,,, Location + vect(0,100,0));

   if (self.DriverEnter(myDriver)){
    Self.Mesh.WakeRigidBody();
   }
    myDriver.startingNode = startingNode;
}


function bool DriverEnter(Pawn P)
{
    local Controller C;
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