class EtmanVehicleAiController extends AIController;


/// Attrbutes // 
var EtmanPathnode_Traffic nextDistination;
var EtmanPathnode_Traffic startingNodeAI;

/*
  The post begin play have to functionality 
  first one : set time for logTest 
  second one: set checkCollision timer
*/
simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    setTimer(1 , True , 'logTest');
    setTimer(0.1 , true , 'checkCollision');
}

event Possess(Pawn aPawn , bool bVehicleTransition)
{
    Super.Possess(aPawn , bVehicleTransition);
}

/*
Check Collision in appromix. 35 Unreal Unit in the car direction
and stop the car from moving any farther if it collid with anything
*/
function checkCollision(){
  local vector currentLocation; 
  local Rotator currentRotation; 
  local vector traceEnd; 
  local Actor gotHit; 
  local vector hitLocation; 
  local vector hitNormal;
  //local bool didTrace;
  pawn.GetActorEyesViewPoint(currentLocation, currentRotation);

  traceEnd = currentLocation;
  traceEnd += Normal(nextDistination.Location - currentLocation) * 350; 
  currentLocation.z -= 30;
  traceEnd.z = currentLocation.z;

 

  gotHit = Trace(hitLocation,  hitNormal,  traceEnd,  currentLocation,
              true,vect(20,20,0),,);
  DrawDebugLine(currentLocation, traceEnd, 1, 1, 1,);

  if(gotHit == none){
    WorldInfo.Game.Broadcast(self, "car see nothing");
  }else
  {
    WorldInfo.Game.Broadcast(self, "i see you");
  }


}

// this fucntion just work as a log
function logTest(){
  `Log('startingNodeVehicle'@startingNodeAI);
  WorldInfo.Game.Broadcast(self, "nextDistination is " @nextDistination);
  `log('AI Next distination' @ nextDistination);
  WorldInfo.Game.Broadcast(self, "nextDistination is " @nextDistination);
}


/*
Getting ready state
sleep for 10 second(s)
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
    
}