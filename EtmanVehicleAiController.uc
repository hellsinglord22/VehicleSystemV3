class EtmanVehicleAiController extends AIController;


/// Attrbutes // 
var EtmanPathnode_Traffic nextDistination;
var EtmanPathnode_Traffic startingNodeAI;
var bool isCollide;


simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    setTimer(4 , True , 'logTest');
    setTimer(0.5 , true , 'checkCollision');
}

event Possess(Pawn aPawn , bool bVehicleTransition)
{
    Super.Possess(aPawn , bVehicleTransition);
}
event bool NotifyBump(Actor  Other, Vector HitNormal){
      if(Other != none){
        WorldInfo.Game.Broadcast(self, "Collide with " @Other);
        return true;  
      }
}

function checkCollision(){
    /// Check collision /// 
    isCollide = EtmanVehicle_Traffic(Pawn).hitSomething;
    if(isCollide == true){
        StopLatentExecution();
        Pawn.Acceleration.X = 0;
        Pawn.Acceleration.Y = 0;
        Pawn.Acceleration.Z = 0;
        WorldInfo.Game.Broadcast(self, "stop the car");
    }
}
function logTest(){
  `Log('startingNodeVehicle'@startingNodeAI);
  WorldInfo.Game.Broadcast(self, "nextDistination is " @nextDistination);
  `log('AI Next distination' @ nextDistination);
}


/*
Getting read state
sleep for 4 second(s)
getting the information needed (startingNode) and
assign this information to a next distination variable 
**/
 auto state GettingReady
{
    Begin : 
    Sleep(10);
    if(EtmanVehicle_Traffic(Pawn) != none){
      startingNodeAI= EtmanVehicle_Traffic(Pawn).startingNodeVehicle; 
    }         
    nextDistination = startingNodeAI;
    WorldInfo.Game.Broadcast(self, "startingNode " @startingNodeAI);
    GotoState('Wandering');
}

/**
Wandering 
start by sleeping for 0.4 second 
and move to the next location 
after this it check collision and traffic light 
and decied it's next destination and go into an infinit 
loop the car keep moving in the loop for ever 
*/
state Wandering
{
  
   Begin:
   sleep(0.4);
   
   /// Car stop for Collision and Traffic light /// 
    MoveTo(nextDistination.Location ,nextDistination); 
    if(EtmanPathnode_TrafficLight(nextDistination) != none)
    {
      WorldInfo.Game.Broadcast(self, "we have an EtmanTrafficLight here!");
      CheckTrafficLight:
      Sleep(0.4);
      if(EtmanPathnode_TrafficLight(nextDistination).currentLight == red ){
        GoTo('CheckTrafficLight');
      }
    }


    WorldInfo.Game.Broadcast(self, "Finding new path");
    nextDistination = nextDistination.next;
    GoTo('Begin');
}



defaultProperties
{
    isCollide= false
}