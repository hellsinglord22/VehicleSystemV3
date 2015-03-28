class EtmanVehicleAiController extends AIController;

const NODES_DISTANCE=1700; // approximate distance between every node and the nearst ones to it
const HIDE_TIME= 90; // in seconds

var array<EtmanPathNode_Traffic> trafficNodes;

var EtmanPathNode_Traffic node;
var EtmanPathNode_Traffic lastVisitedNode;

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
        //`log("#####__ Map Info: "@ MapInfo@" ^^ __#####");   
    Sleep(5);
    
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
    if (TrafficNodes.Length != 0)
    {
        node = TrafficNodes[Rand(trafficNodes.Length)];
        
        `Log("########__  Moving to -> "@ node @" , Location"@ node.Location@" __########");   
        MoveTo(node.Location , node); 
        
        node.Hide(HIDE_TIME);
        `Log('Hey');
    }

   GoTo('Begin');
}


defaultProperties
{
    
    
}