applyPostProcess(shader)
{
    self.postprocess = newClientHudElem( self );
    self.postprocess.x = 0;
    self.postprocess.y = 0;
    self.postprocess setshader (shader, 640, 480); 
    self.postprocess.alignX = "left";
    self.postprocess.alignY = "top";
    self.postprocess.horzAlign = "fullscreen";
    self.postprocess.vertAlign = "fullscreen";
}

removePostProcess()
{
    if(isDefined(self.postprocess))
        self.postprocess destroy();
}