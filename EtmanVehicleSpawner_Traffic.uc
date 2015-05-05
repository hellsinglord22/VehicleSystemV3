class EtmanVehicleSpawner_Traffic extends EtmanVehicleSpawner
Placeable;

var EtmanVehicle_Traffic SpawnedVehicle;


simulated function PostBeginPlay()
{
     SpawnedVehicle = Spawn(class'EtmanVehicle_Traffic',,,Location);  
}

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

