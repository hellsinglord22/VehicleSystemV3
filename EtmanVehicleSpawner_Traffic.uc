class EtmanVehicleSpawner_Traffic extends EtmanVehicleSpawner
Placeable;

var EtmanVehicle_Traffic SpawnedVehicle;

simulated function PostBeginPlay()
{
    `Log("########################################");   
    `Log("#####__ Vehicle Spawner is Here  __#####");   
    
     SpawnedVehicle = Spawn(class'EtmanVehicle_Traffic',,,Location);  
     `Log("#####__ Spawned Vehicle ->"@ SpawnedVehicle @"  __#####");     
}

 /*simulated function PostBeginPlay()
{
    //setLocation(Location + vect(0,0,2.00));      
}*/

function SpwanVehicle() 
{
 
}

defaultproperties
{
    Begin Object  class=SpriteComponent   name=Sprite    
        Sprite=Texture2D'EditorMaterials.TargetIcon'
        HiddenGame=true
    end object
    
    Components.Add(Sprite)    
}

