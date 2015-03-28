class EtmanPathnode_Traffic extends EtmanPathNode
placeable;

var bool Hidden;

function Hide(int forHowLong)
{
    Hidden = true;   
    SetTimer(forHowLong , false , 'ShowAgain');
}
function ShowAgain()
{
    Hidden = false;   
}



defaultproperties
{
    Begin Object name=Sprite
        Sprite=Texture2D'EditorResources.S_Pawn'
        HiddenGame=true
    end object
    
    bStatic=false;    
    
    Components.Add(Sprite)  
}
  
