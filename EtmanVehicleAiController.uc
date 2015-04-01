class EtmanVehicleAiController extends AIController;

const NODES_DISTANCE=1700; // approximate distance between every node and the nearst ones to it
const HIDE_TIME= 90; // in seconds

var array<EtmanPathNode_Traffic> trafficNodes;

var EtmanPathNode_Traffic node;
var EtmanPathNode_Traffic lastVisitedNode;
var EtmanPathNode_TrafficLight trafficNode; 

simulated function PostBeginPlay()
{
    super.PostBeginPlay();
    `Log("########__  Controller for vehicle is Here  __########");   
}

event Possess(Pawn aPawn , bool bVehicleTransition)
{
    Super.Possess(aPawn , bVehicleTransition);
 
    //Pawn.SetMovementPhysics();   
    `Log("########__  Pawn in Vehicle AI controller -> "@ Pawn @" __########");   
}

 auto state GettingReady
{
    Begin :
          
    Sleep(1);
    
            //`log("#####__ Map Info: "@ MapInfo@" ^^ __#####");   
    `log("#####__ Now I'm ready to rock and roll ^^ __#####");   
    GotoState('Wandering');
}

state Wandering
{
   Begin:
   sleep(0.4);
   
   trafficNodes.Length = 0;
   foreach VisibleActors(class'EtmanPathNode_Traffic' , node , NODES_DISTANCE  , Pawn.Location )
   {     
       if(!node.Hidden )
       {
           `Log("########__ Taken Node -> "@ node @" __########");  
            trafficNodes.AddItem(node);    
       }    
   }
   foreach VisibleActors(class'EtmanPathNode_TrafficLight' , trafficNode , NODES_DISTANCE  , Pawn.Location )
   {     
       if(!node.Hidden )
       {
           `Log("########__ Taken Node -> "@ trafficNode @" __########");  
           WorldInfo.Game.Broadcast(self, "You just added a trafficNode");
            trafficNodes.AddItem(trafficNode);    
       }    
   }

    if (TrafficNodes.Length != 0)
    {
        node = TrafficNodes[Rand(trafficNodes.Length)];
        
        `Log("########__  Moving to -> "@ node @" , Location"@ node.Location@" __########");   
        MoveTo(node.Location , node); 

        if(EtmanPathnode_TrafficLight(node) != none)
        {
          WorldInfo.Game.Broadcast(self, "we have an EtmanTrafficLight here!");
        }
        
        node.Hide(HIDE_TIME);
        `Log('Hey');
    }

   GoTo('Begin');
}


defaultProperties
{
    
    
}