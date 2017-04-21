package {
 import flash.events.Event;
 import flash.events.MouseEvent;
 import org.papervision3d.cameras.CameraType;
 import org.papervision3d.objects.primitives.Sphere;
 import org.papervision3d.view.BasicView;
 import org.papervision3d.materials.BitmapFileMaterial;

[SWF (width="460", height="300", backgroundColor="0xffffff", frameRate="30")]

 public class SphereVision extends BasicView
 {
       private var sphere:Sphere;
       private var w:Number=460;
       private var h:Number=300;
       private var angleX:Number;
       private var angleY:Number;
       private var over:Boolean=false;
       
       public function SphereVision()
     {
          super(460,300,true, false,CameraType.FREE);
          init();
      }
       private function init():void
      {
          initObj();
        addEventListener(Event.ENTER_FRAME,onEnterFrame);

        stage.addEventListener(MouseEvent.MOUSE_OVER,onOver);

        stage.addEventListener(MouseEvent.MOUSE_OUT,onOut);
      }

        private function initObj():void
        {
        var material:BitmapFileMaterial=new BitmapFileMaterial("E:/temp/result.jpg");
       
        material.doubleSided = true;
        material.smooth = true;
     
        sphere=new Sphere(material,98.68,20,20);
        scene.addChild(sphere);

        camera.z=0;

        camera.zoom=.8;

        camera.focus=300;
 }
 
    private function onEnterFrame(e:Event):void
    {
 
     if(over)
     {
        var xm:Number=stage.mouseX;
        var ym:Number=stage.mouseY;
        angleX=(w/2-xm)*-.004;
        angleY=(h/2-ym)*-.002;
     }
     else
     {
        angleX=0;
        angleY=0;
      }
        camera.yaw(angleX);
        camera.pitch(angleY);
        singleRender();
 }

 private function onOver(event:MouseEvent):void
 {
  over=true;
 }
 private function onOut(event:MouseEvent):void
 {
  over=false;
 }

}

}