
int pantalla = 0;
// 0 inicio
// 1 aviso
// 2 reyna
// 3 clove
// 4 jett
// 5 omen

int tiempoInicio = 0;
int duracionPantalla = 4000; // 4 seg por pantalla

boolean presentacioniniciada = false;

//v animar texto
float textoAlpha = 0;
float offsetY = 0;
boolean moviendoArriba = true;
float tamNombre = 28;
boolean agrandando = true;

//v animar imagenes
float escalaLogo = 1.0;
boolean creceLogo = true;

float zoomPj = 0.85;

float efectoHab = 20;


boolean mostrarConsejo = false;


PImage imgPjActual;
PImage habIconoActual;

PImage imgLogopota, imgLogo, imgCampo;
PImage imgReyna, imgClove, imgOmen, imgJett;
PImage fondoReyna, fondoClove, fondoOmen, fondojett;
PImage habreyna, habclove, habjett, habomen;

PFont tipografia;

void setup() {
  size(640, 480);

  // imagenes
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

  // fuente
  tipografia = loadFont("Tahoma-32.vlw");
  textFont(tipografia);

  textoAlpha  = 0;
  tiempoInicio = millis();
}

void draw() {
  //pantallas manejo
  if (pantalla == 0) {
    pantallainicio();
  } else if (pantalla == 1) {
    pantallaaviso();
    cambiarpantalla();
  } else if (pantalla == 2) {
    pantallaReyna();
    cambiarpantalla();
  } else if (pantalla == 3) {
    pantallaClove();
    cambiarpantalla();
  } else if (pantalla == 4) {
    pantallaJett();
    cambiarpantalla();
  } else if (pantalla == 5) {
    pantallaOmen();
    pantallabotonreiniciar();
  }
}


// inicio

void pantallainicio() {
  background(10, 10, 20);

  //logo
  if (creceLogo) {
    escalaLogo = escalaLogo + 0.001;
    if (escalaLogo > 1.05) {
      creceLogo = false;
    }
  } else {
    escalaLogo = escalaLogo - 0.001;
    if (escalaLogo < 1.0) {
      creceLogo = true;
    }
  }

  imageMode(CENTER);
  image(imgLogo, 320, 180, 300 * escalaLogo, 150 * escalaLogo);

  // texto flotando
  if (moviendoArriba == true) {
    offsetY = offsetY - 0.2;
    if (offsetY < -8) {
      moviendoArriba = false;
    }
  } else {
    offsetY = offsetY + 0.2;
    if (offsetY > 8) {
      moviendoArriba = true;
    }
  }

  textAlign(CENTER);
  fill(255, 70, 70);
  textSize(20);
  text("Variables y Condicionales- TP2", 320, 300 + offsetY);

  fill(200, 200, 200);
  textSize(14);
  text("Comision 2 - Macarena Segura", 320, 330 + offsetY);

  //boton iniciar
  boolean mouseEncimaIn = mouseX >= 220 && mouseX <= 420 && mouseY >= 380 && mouseY <= 425;

  if (mouseEncimaIn && presentacioniniciada == false) {
    fill(255, 70, 70);
    stroke(255, 120, 120);
  } else {
    fill(60, 20, 20);
    stroke(255, 70, 70);
  }
  strokeWeight(2);
  rect(220, 380, 200, 45, 5);

  if (mouseEncimaIn && presentacioniniciada == false) {
    fill(255);
  } else {
    fill(255, 70, 70);
  }
  textAlign(CENTER);
  textSize(15);
  text("INICIAR SESION", 320, 408);
}


//2 aviso suspension

void pantallaaviso() {
  imageMode(CORNER);
  image(imgCampo, 0, 0, 640, 480);

  //para q se vea
  fill(0, 0, 0, 160);
  noStroke();
  rect(0, 0, 640, 480);

  fill(20, 20, 30, 230);
  stroke(255, 70, 70);
  strokeWeight(2);
  rect(100, 100, 440, 280, 8);

  imageMode(CENTER);
  image(imgLogopota, 320, 145, 120, 60);


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


//pantallas pjs

//reyna
void pantallaReyna() {
  imageMode(CORNER);
  image(fondoReyna, 0, 0, 640, 480);
  noStroke();
  fill(0, 0, 0, 160);
  rect(0, 0, 640, 480);

  // imagen  pj entrando
  imgPjActual = imgReyna;
  dibujarImagenPj();

  fill(25, 25, 40, 220);
  stroke(255, 70, 70);
  strokeWeight(1);
  rect(300, 40, 320, 380, 6);

  int transcurrido = millis() - tiempoInicio;

  animarTamanoNombre();

  noStroke();
  fill(255, 70, 70);
  textAlign(CENTER);
  textSize(tamNombre);
  text("REYNA", 460, 85);

  fill(200, 200, 200);
  textSize(14);
  text("Agente: Duelista", 460, 110);

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
  text("Reyna es una duelista mexicana que se alimenta de las almas de sus enemigos. Cada eliminacion la hace mas fuerte, curandose y acelerandose. Es un agente completamente autodependiente, disenada para jugadores agresivos que dominan el duelo uno a uno. Su estilo de combate se basa en la confianza y la precision, aprovechando cada enfrentamiento para obtener ventaja sobre sus rivales. Ademas, sus habilidades le permiten entrar rapidamente, desorientar y mantenerse activa durante mas tiempo en la partida. Reyna es uno de los agentes mas populares dentro de Valorant. Y mi favorita <33333 ", 315, 155, 285, 180);

  // icono de habilidades
  if (transcurrido > 800) {
    habIconoActual = habreyna;
    dibujarIconoHabilidad();
  }

  dibujarConsejoSiCorresponde();
}


//clove
void pantallaClove() {
  imageMode(CORNER);
  image(fondoClove, 0, 0, 640, 480);
  noStroke();
  fill(0, 0, 0, 160);
  rect(0, 0, 640, 480);

  imgPjActual = imgClove;
  dibujarImagenPj();

  fill(25, 25, 40, 220);
  stroke(255, 70, 70);
  strokeWeight(1);
  rect(300, 40, 320, 380, 6);

  int transcurrido = millis() - tiempoInicio;
  animarTamanoNombre();

  noStroke();
  fill(255, 70, 70);
  textAlign(CENTER);
  textSize(tamNombre);
  text("CLOVE", 460, 85);

  fill(200, 200, 200);
  textSize(14);
  text("Agente: Controlador", 460, 110);

  stroke(255, 70, 70, 100);
  strokeWeight(1);
  line(315, 125, 610, 125);

  textoAlpha = textoAlpha + 3;
  if (textoAlpha > 255) {
    textoAlpha = 255;
  }
  noStroke();
  fill(215, 215, 215, textoAlpha);
  textSize(12);
  textAlign(LEFT);
  text("Clove es un agente escoces inmortal que desafia la muerte. Incluso tras ser eliminado puede seguir participando brevemente en la ronda. Controla el campo de batalla con humos y ralentizaciones, siendo el unico agente que puede actuar despues de morir. Su estilo de juego combina apoyo y agresividad, permitiendole ayudar al equipo incluso en situaciones donde otros agentes ya no pueden intervenir. Gracias a sus habilidades, puede bloquear la vision de los enemigos, dificultar sus movimientos y generar oportunidades para sus companeros. Clove se destaca por su personalidad rebelde y misteriosa.", 315, 155, 285, 180);

  if (transcurrido > 800) {
    habIconoActual = habclove;
    dibujarIconoHabilidad();
  }

  dibujarConsejoSiCorresponde();
}

//jett
void pantallaJett() {
  imageMode(CORNER);
  image(fondojett, 0, 0, 640, 480);
  noStroke();
  fill(0, 0, 0, 160);
  rect(0, 0, 640, 480);

  imgPjActual = imgJett;
  dibujarImagenPj();

  fill(25, 25, 40, 220);
  stroke(255, 70, 70);
  strokeWeight(1);
  rect(300, 40, 320, 380, 6);

  int transcurrido = millis() - tiempoInicio;
  animarTamanoNombre();

  noStroke();
  fill(255, 70, 70);
  textAlign(CENTER);
  textSize(tamNombre);
  text("JETT", 460, 85);

  fill(200, 200, 200);
  textSize(14);
  text("Agente: Duelista", 460, 110);

  stroke(255, 70, 70, 100);
  strokeWeight(1);
  line(315, 125, 610, 125);

  textoAlpha = textoAlpha + 3;
  if (textoAlpha > 255) {
    textoAlpha = 255;
  }
  noStroke();
  fill(215, 215, 215, textoAlpha);
  textSize(12);
  textAlign(LEFT);
  text("Jett es una duelista coreana conocida por su velocidad y agilidad extrema. Puede saltar, flotar y lanzarse en cualquier direccion, lo que la hace imposible de predecir. Es la agente mas movil del juego y una de las mas populares a nivel competitivo. Su velocidad le permite desplazarse rapidamente por el mapa y sorprender a los enemigos desde distintos angulos, entrando y saliendo de los enfrentamientos en segundos. Gracias a sus habilidades de movimiento, puede evitar disparos, reposicionarse con facilidad y tomar ventaja en situaciones de riesgo.", 315, 155, 285, 180);

  if (transcurrido > 800) {
    habIconoActual = habjett;
    dibujarIconoHabilidad();
  }

  dibujarConsejoSiCorresponde();
}

//omenn
void pantallaOmen() {
  imageMode(CORNER);
  image(fondoOmen, 0, 0, 640, 480);
  noStroke();
  fill(0, 0, 0, 160);
  rect(0, 0, 640, 480);

  imgPjActual = imgOmen;
  dibujarImagenPj();

  fill(25, 25, 40, 220);
  stroke(255, 70, 70);
  strokeWeight(1);
  rect(300, 40, 320, 380, 6);

  int transcurrido = millis() - tiempoInicio;
  animarTamanoNombre();

  noStroke();
  fill(255, 70, 70);
  textAlign(CENTER);
  textSize(tamNombre);
  text("OMEN", 460, 85);

  fill(200, 200, 200);
  textSize(14);
  text("Agente: Controlador", 460, 110);

  stroke(255, 70, 70, 100);
  strokeWeight(1);
  line(315, 125, 610, 125);

  textoAlpha = textoAlpha + 3;
  if (textoAlpha > 255) {
    textoAlpha = 255;
  }
  noStroke();
  fill(215, 215, 215, textoAlpha);
  textSize(12);
  textAlign(LEFT);
  text("Omen es una entidad misteriosa que nadie conoce del todo, ni el mismo. Controla las sombras para cegar enemigos, teletransportarse y aparecer en cualquier punto del mapa. Su presencia genera confusion y miedo, siendo una pesadilla para el equipo contrario. Gracias a su control de las sombras, puede moverse silenciosamente por el mapa y atacar desde posiciones inesperadas, dificultando que los enemigos anticipen sus movimientos. Sus habilidades le permiten bloquear la vision rival, crear oportunidades para su equipo y teletransportarse a distintos lugares para sorprender.", 315, 155, 285, 180);

  if (transcurrido > 800) {
    habIconoActual = habomen;
    dibujarIconoHabilidad();
  }

  dibujarConsejoSiCorresponde();
}


// funciones propias

// nom del agente
void animarTamanoNombre() {
  if (agrandando == true) {
    tamNombre = tamNombre + 0.1;
    if (tamNombre > 30) {
      agrandando = false;
    }
  } else {
    tamNombre = tamNombre - 0.1;
    if (tamNombre < 28) {
      agrandando = true;
    }
  }
}

// imagen del pj agrandandose
void dibujarImagenPj() {
  if (zoomPj < 1.0) {
    zoomPj = zoomPj + 0.01;
    if (zoomPj > 1.0) {
      zoomPj = 1.0;
    }
  }

  float ancho = 260 * zoomPj;
  float alto  = 380 * zoomPj;

  float x = 20 + (260 - ancho) / 2;
  float y = 40 + (380 - alto);

  imageMode(CORNER);
  image(imgPjActual, x, y, ancho, alto);
}


// icono de habilidades
void dibujarIconoHabilidad() {
  if (efectoHab > 0) {
    efectoHab = efectoHab - 1;
    if (efectoHab < 0) {
      efectoHab = 0;
    }
  }
  imageMode(CORNER);
  image(habIconoActual, 315, 355 + efectoHab, 285, 35);
}

// cartelito de consejo
void dibujarConsejoSiCorresponde() {
  if (mostrarConsejo) {
    noStroke();
    fill(0, 0, 0, 210);
    stroke(255, 70, 70);
    strokeWeight(1);
    rect(20, 430, 260, 40, 6);
    noStroke();
    fill(255);
    textSize(10);
    textAlign(CENTER);
    text("no juegues a esto, arruina vidas (exp propia)", 150, 452);
  }
}

// boton de reiniciar
void pantallabotonreiniciar() {
  boolean mouseEncimaRe = mouseX >= 420 && mouseX <= 620 && mouseY >= 440 && mouseY <= 475;

  if (mouseEncimaRe) {
    fill(255, 70, 70);
    stroke(255, 120, 120);
  } else {
    fill(60, 20, 20);
    stroke(255, 70, 70);
  }
  strokeWeight(2);
  rect(420, 440, 200, 35, 5);

  if (mouseEncimaRe) {
    fill(255);
  } else {
    fill(255, 70, 70);
  }
  textAlign(CENTER);
  textSize(15);
  text("REINICIAR", 520, 463);
}

//avance de pantalla
void cambiarpantalla() {
  int transcurrido = millis() - tiempoInicio;
  if (transcurrido >= duracionPantalla && pantalla < 5) {
    pantalla = pantalla + 1;
    tiempoInicio = millis();
    textoAlpha = 0;
    zoomPj = 0.85;
    efectoHab = 20;
    mostrarConsejo = false;
  }
}


//eventos
void mousePressed() {
  // boton inicio
  if (pantalla == 0) {
    if (mouseX >= 220 && mouseX <= 420 && mouseY >= 380 && mouseY <= 425) {
      presentacioniniciada = true;
      pantalla = 1;
      tiempoInicio = millis();
      textoAlpha = 0;
    }
  }

  // boton reiniciar
  if (pantalla == 5) {
    if (mouseX >= 420 && mouseX <= 620 && mouseY >= 440 && mouseY <= 475) {
      pantalla = 0;
      presentacioniniciada = false;
      tiempoInicio = millis();
      textoAlpha = 0;
      zoomPj = 0.85;
      efectoHab = 20;
      mostrarConsejo = false;
    }
  }
}

//consejito cuando clickeas la imagen del pj
void mouseClicked() {
  boolean sobreImagenPj = mouseX >= 20 && mouseX <= 280 && mouseY >= 40 && mouseY <= 420;

  if ((pantalla == 2 || pantalla == 3 || pantalla == 4 || pantalla == 5) && sobreImagenPj) {
    mostrarConsejo = !mostrarConsejo;
  }
}

void keyPressed() {
  if ((key == ' ' || key == ENTER) && pantalla == 0) {
    presentacioniniciada = true;
    pantalla = 1;
    tiempoInicio = millis();
    textoAlpha = 0;
  }
}
// piedad :c
