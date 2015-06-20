/// Ever node have the next node destination so the AI can follow it 
class EtmanPathnode_Traffic extends EtmanPathNode
placeable;

/// attributes //  
var (AI_Attributes)EtmanPathnode_Traffic next;


defaultproperties
{
    Begin Object name=Sprite
        Sprite=Texture2D'EditorResources.S_Pawn'
        HiddenGame=true
    end object
    
    bStatic=false;    
    
    Components.Add(Sprite)  
}
  
