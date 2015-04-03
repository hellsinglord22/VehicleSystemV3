class EtmanPathnode_TrafficLight extends EtmanPathnode_Traffic 
placeable ; 


/// Variables and enums 
enum EtmanTrafficLights
{
	red,
	green,
};

var EtmanTrafficLights currentLight; 
var float remaingTime; 

function PostBeginPlay(){
	`log("Scorpion: Traffic light is created");
	`log("###################################");
	SetTimer(10,true,,);
}

event Timer()
{
	/// check if timer is called 
	`log("Timer is called");
	WorldInfo.Game.Broadcast(self, "Timer change the color");
	/// Change the color and call the set timer again 
	if(currentLight == red)
	{
		currentLight = green; 
	}else if(currentLight == green){
		currentLight = red ; 
	}

	WorldInfo.Game.Broadcast(self, "CurrentColor" @ currentLight);
}


DefaultProperties
{
	currentLight= green; 

	Begin Object name=Sprite
        Sprite=Texture2D'UDKHUD.flag_box_blue'
        HiddenGame=true
    end object
    
    bStatic=false;      
    Components.Add(Sprite);


}