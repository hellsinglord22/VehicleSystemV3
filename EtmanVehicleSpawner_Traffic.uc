class EtmanVehicleSpawner_Traffic extends EtmanVehicleSpawner
Placeable;

/// Attriubtes // 
var EtmanVehicle_Traffic SpawnedVehicle;
var (AI_Attributes)EtmanPathnode_Traffic startingNode;


simulated function PostBeginPlay()
{
     SpawnedVehicle = Spawn(class'EtmanVehicle_Traffic',,,Location); 
     SpawnedVehicle.startingNode = startingNode;
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

