class EtmanVehicleAiController extends AIController;


/// Attrbutes // 
var EtmanPathnode_TrafficLight nextDistination;
var EtmanPathnode_TrafficLight startingNodeAI;
var bool isCollide;


simulated function PostBeginPlay()
{
    super.PostBeginPlay();
}

event Possess(Pawn aPawn , bool bVehicleTransition)
{
    Super.Possess(aPawn , bVehicleTransition);
}

 auto state GettingReady
{
    Begin : 
    Sleep(1);
    /// todo: set the starting node
    nextDistination = startingNodeAI;
    GotoState('Wandering');
}

state Wandering
{
   Begin:
   sleep(0.4);
   
    `Log("########__  Moving to -> "@ nextDistination @" , Location"@ node.Location@" __########");   
    MoveTo(nextDistination.Location ,nextDistination); 

    if(EtmanPathnode_TrafficLight(nextDistination) != none)
    {
      WorldInfo.Game.Broadcast(self, "we have an EtmanTrafficLight here!");
      CheckTrafficLight:
      Sleep(0.4);
      if(EtmanPathnode_TrafficLight(node).currentLight == red ){
        WorldInfo.Game.Broadcast(self, "CheckingAgain");
        GoTo('CheckTrafficLight');
      }
    }

    CheckCollide:
    /// Check collision /// 
    /// TODO: Root Collision as well /// 
    if(isCollide == true){
      Sleep(0.4);
      GoTo('CheckCollide');
    }
    
    WorldInfo.Game.Broadcast(self, "Finding new path");
    
    /// set next distination 
    nextDistination = nextDistination.next;
    GoTo('Begin');
}


defaultProperties
{
    isCollide = false;   
}