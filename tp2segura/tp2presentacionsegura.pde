
int pantalla = 0;
// 0 pantalla de inicio 
// 1 aviso de suspension
// 2 reyna
// 3 clove
// 4  jett
// 5 omen

int tiempoInicio = 0;
// 1000 igual 1 s
int duracionPantalla = 4000;

boolean presentacioniniciada = false;

// animaciones de texto
//float textoY;        
float textoAlpha;   
//float textoEscala;   
float tiempo;        

PImage imgLogopota;
PImage imgLogo;
PImage imgCampo;
PImage imgReyna;
PImage imgClove;
PImage imgOmen;
PImage imgJett;
PImage fondoReyna;
PImage fondoClove;
PImage fondoOmen;
PImage fondojett;
PImage habreyna;
PImage habclove;
PImage habjett;
PImage habomen;

PFont tipografia;

void setup() {
  size(640, 480);
  //imagenes
  imgLogo     = loadImage("logo.png");
  imgLogopota = loadImage("logopota.png");
  imgCampo    = loadImage("campo.png");
  imgReyna    = loadImage("reyna.png");
  imgClove    = loadImage("clove.png");
  imgOmen     = loadImage("omen.png");
  imgJett     = loadImage("jett.png");
  fondoReyna  = loadImage("fondoreyna.jpg");
  fondoClove  = loadImage("fondoclove.jpg");
  fondoOmen   = loadImage("fondoomen.jpg");
  fondojett   = loadImage("fondojett.jpg");
  habreyna    = loadImage("habilidadesreyna.png");
  habclove    = loadImage("habilidadesclove.png");
  habjett     = loadImage("habilidadesjett.png");
  habomen     = loadImage("habilidadesomen.png");

  //fuente
  tipografia = loadFont("Tahoma-32.vlw");
  textFont(tipografia);
  
  //textoY      = 500;
  textoAlpha  = 0;
  //textoEscala = 0.5;
  tiempo      = 0;
  tiempoInicio = millis();
}

void draw() {
  tiempo = tiempo + 0.05;

  if (pantalla == 0) {
    pantallainicio();

  } else if (pantalla == 1) {
    pantallaaviso();
    cambiarpantalla();

  } else if (pantalla == 2) {
    pantallapj(fondoReyna, imgReyna, "REYNA", "Agente: Duelista",
      "Reyna es una duelista mexicana que se alimenta de las almas de sus enemigos. Cada eliminacion la hace mas fuerte, curandose y acelerandose. Es un agente completamente autodependiente, disenada para jugadores agresivos que dominan el duelo uno a uno.Su estilo de combate se basa en la confianza y la precision, aprovechando cada enfrentamiento para obtener ventaja sobre sus rivales. Ademas, sus habilidades le permiten entrar rapidamente, desorientar y mantenerse activa durante mas tiempo en la partida. Reyna es uno de los agentes mas populares dentro de Valorant.Y mi favorita <33333 ", habreyna);
    cambiarpantalla();

  } else if (pantalla == 3) {
    pantallapj(fondoClove, imgClove, "CLOVE", "Agente: Controlador",
      "Clove es un agente escoces inmortal que desafia la muerte. Incluso tras ser eliminado puede seguir participando brevemente en la ronda. Controla el campo de batalla con humos y ralentizaciones, siendo el unico agente que puede actuar despues de morir.Su estilo de juego combina apoyo y agresividad, permitiendole ayudar al equipo incluso en situaciones donde otros agentes ya no pueden intervenir. Gracias a sus habilidades, puede bloquear la vision de los enemigos, dificultar sus movimientos y generar oportunidades para sus companeros. Clove se destaca por su personalidad rebelde y misteriosa.", habclove);
    cambiarpantalla();

  } else if (pantalla == 4) {
    pantallapj(fondojett, imgJett, "JETT", "Agente: Duelista",
      "Jett es una duelista coreana conocida por su velocidad y agilidad extrema. Puede saltar, flotar y lanzarse en cualquier direccion, lo que la hace imposible de predecir. Es la agente mas movil del juego y una de las mas populares a nivel competitivo.Su velocidad le permite desplazarse rapidamente por el mapa y sorprender a los enemigos desde distintos angulos, entrando y saliendo de los enfrentamientos en segundos. Gracias a sus habilidades de movimiento, puede evitar disparos, reposicionarse con facilidad y tomar ventaja en situaciones de riesgo.", habjett);
    cambiarpantalla();

  } else if (pantalla == 5) {
    pantallapj(fondoOmen, imgOmen, "OMEN", "Agente: Controlador",
      "Omen es una entidad misteriosa que nadie conoce del todo, ni el mismo. Controla las sombras para cegar enemigos, teletransportarse y aparecer en cualquier punto del mapa. Su presencia genera confusion y miedo, siendo una pesadilla para el equipo contrario.Gracias a su control de las sombras, puede moverse silenciosamente por el mapa y atacar desde posiciones inesperadas, dificultando que los enemigos anticipen sus movimientos. Sus habilidades le permiten bloquear la vision rival, crear oportunidades para su equipo y teletransportarse a distintos lugares para sorprender.", habomen);
    pantallabotonreiniciar();
  }
}

// pantalla 0 
void pantallainicio() {
  background(10, 10, 20);

  imageMode(CENTER);
  image(imgLogo, 320, 180, 300, 150);


  float offsetY = sin(tiempo) * 8;

  textAlign(CENTER);
  fill(255, 70, 70);
  textSize(20);
  text("Variables y Condicionales- TP2", 320, 300 + offsetY);

  fill(200, 200, 200);
  textSize(14);
  text("Comision 2 · Macarena Segura", 320, 330 + offsetY);

  botonin(220, 380, 200, 45, "INICIAR SESION", presentacioniniciada == false);
}

// pantalla 1
void pantallaaviso() {
  imageMode(CORNER);
  image(imgCampo, 0, 0, 640, 480);

  fill(0, 0, 0, 160);
  noStroke();
  rect(0, 0, 640, 480);

  fill(20, 20, 30, 230);
  stroke(255, 70, 70);
  strokeWeight(2);
  rect(100, 100, 440, 280, 8); 

  imageMode(CENTER);
  image(imgLogopota, 320, 145, 120, 60);

  // animacion 
  textoAlpha = textoAlpha + 4;
if (textoAlpha > 255) {
  textoAlpha = 255;
    }

  noStroke();
  fill(255, 70, 70, textoAlpha);
  textSize(50);
  textAlign(CENTER);
  text("VALORANT", 320, 220);

  fill(220, 220, 220, textoAlpha);
  textSize(13);
  textAlign(CENTER);
  String texto = "Valorant es un videojuego de disparos tactico en primera persona creado por Riot Games. Consiste en partidas de 5 contra 5 donde los jugadores usan armas y habilidades especiales de distintos personajes llamados agentes para atacar o defender objetivos. Combina estrategia, trabajo en equipo y precision.";
  text(texto, 120, 240, 400, 200);  

  fill(247, 65, 77);
  textSize(11);
  text("Selecciona un agente y domina el mapa.", 320, 330);
}

// pantallas 2 3 4 y 5 - pjs
void pantallapj(PImage fondo, PImage img, String nombre, String rol,
                String descripcion, PImage iconos) {
  // fondito
  imageMode(CORNER);
  image(fondo, 0, 0, 640, 480);

  noStroke();
  fill(0, 0, 0, 160);
  rect(0, 0, 640, 480);                               
 
  // imagen del pj  izquierda
  imageMode(CORNER);
  image(img, 20, 40, 260, 380);

  // info a la derecha
  fill(25, 25, 40, 220);
  stroke(255, 70, 70);
  strokeWeight(1);
  rect(300, 40, 320, 380, 6);

  int transcurrido = millis() - tiempoInicio;


  float tamNombre = 28 + sin(tiempo * 1.8) * 2;
  noStroke();
  fill(255, 70, 70);
  textAlign(CENTER);
  textSize(tamNombre);
  text(nombre, 460, 85);

  // rol
  fill(200, 200, 200);
  textSize(14);
  text(rol, 460, 110);

  // separador
  stroke(255, 70, 70, 100);
  strokeWeight(1);
  line(315, 125, 610, 125);

  // descripcion 
  
    textoAlpha = textoAlpha + 3;
  if (textoAlpha > 255) {
  textoAlpha = 255;
     }
  noStroke();
  fill(215, 215, 215, textoAlpha);
  textSize(12);
  textAlign(LEFT);
  text(descripcion, 315, 155, 285, 180);

  // iconos de habilidades abajo del texto

  if (transcurrido > 800) {
    imageMode(CORNER);
    image(iconos, 315, 355, 285, 35);
  }
}

void pantallabotonreiniciar() {
  botonin(220, 440, 200, 35, "REINICIAR", true);
}

void cambiarpantalla() {
  int transcurrido = millis() - tiempoInicio;
  // losdosverda
  if (transcurrido >= duracionPantalla && pantalla < 5) {
    pantalla = pantalla + 1;
    tiempoInicio = millis();
    tiempo = 0;
    textoAlpha = 0; 
  }
}

// boton
void botonin(int x, int y, int ancho, int alto, String etiqueta, boolean activo) {
  boolean mouseEncima = mouseX >= x && mouseX <= x + ancho &&
                        mouseY >= y && mouseY <= y + alto;

  if (mouseEncima && activo) {
    fill(255, 70, 70);      
    stroke(255, 120, 120);
  } else {
    fill(60, 20, 20);
    stroke(255, 70, 70);
  }

  strokeWeight(2);
  rect(x, y, ancho, alto, 5);

  if (mouseEncima && activo) {
    fill(255);
  } else {
    fill(255, 70, 70);
  }
  textAlign(CENTER);
  textSize(15);
  text(etiqueta, x + ancho / 2, y + alto / 2 + 5);
}

void mousePressed() {
  // boton de inicio en pantalla 0
  if (pantalla == 0) {
    if (mouseX >= 220 && mouseX <= 420 && mouseY >= 380 && mouseY <= 425) {
      presentacioniniciada = true;
      pantalla = 1;
      tiempoInicio = millis();
      tiempo = 0;
      textoAlpha = 0;
    }
  }

  // boton de reiniciar en pantalla 5
  if (pantalla == 5) {
    if (mouseX >= 220 && mouseX <= 420 && mouseY >= 440 && mouseY <= 475) {
      pantalla = 0;
      presentacioniniciada = false;
      tiempoInicio = millis();
      tiempo = 0;
      textoAlpha = 0;
      //textoY = 500;
      //textoEscala = 0.5;
    }
  }
}



void keyPressed() {

 if ((key == ' ' || key == ENTER) && pantalla == 0) {
    presentacioniniciada = true;
    pantalla = 1;
    tiempoInicio = millis();
    tiempo = 0;
    textoAlpha = 0;
  }
}
