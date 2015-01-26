import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim minim;
AudioPlayer music;
void setup (){
 minim = new Minim (this);
 music = minim.loadFile ("new slaves.mp3");
 music.loop();

}
void draw () {
}
