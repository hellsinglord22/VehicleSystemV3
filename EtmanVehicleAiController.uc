class EtmanVehicleAiController extends AIController;


/// Attrbutes // 
var EtmanPathnode_Traffic nextDistination;
var EtmanPathnode_Traffic startingNodeAI;
var bool isCollide;


simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    setTimer(4 , True , 'logTest');
}

event Possess(Pawn aPawn , bool bVehicleTransition)
{
    Super.Possess(aPawn , bVehicleTransition);
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
   
    MoveTo(nextDistination.Location ,nextDistination); 
    if(EtmanPathnode_TrafficLight(nextDistination) != none)
    {
      WorldInfo.Game.Broadcast(self, "we have an EtmanTrafficLight here!");
      CheckTrafficLight:
      Sleep(0.4);
      if(EtmanPathnode_TrafficLight(nextDistination).currentLight == red ){
        GoTo('CheckTrafficLight');2
      }
    }

    WorldInfo.Game.Broadcast(self, "Finding new path");
    nextDistination = nextDistination.next;
    GoTo('Begin');
}


defaultProperties
{
    isCollide = false;   
}