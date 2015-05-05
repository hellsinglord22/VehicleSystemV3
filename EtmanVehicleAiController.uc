class EtmanVehicleAiController extends AIController;



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
          
          CheckAgain:
          Sleep(0.4);
          if(EtmanPathnode_TrafficLight(node).currentLight == red ){
            WorldInfo.Game.Broadcast(self, "CheckingAgain");
            GoTo('CheckAgain');
          }
        }
        
        node.Hide(HIDE_TIME);
        WorldInfo.Game.Broadcast(self, "Finding new path");
    }

   GoTo('Begin');
}


defaultProperties
{
    
    
}