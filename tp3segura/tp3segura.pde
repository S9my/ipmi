// link video : comentarios del tp 

PImage refImg;

// grilla
int cant = 12;     
int tam;           
float corte = 0;   
float angulo = 0;  

// colores incial
color colorRosa = color(235, 185, 200);
color colorVioleta = color(170, 90, 180);

void setup() {
  pixelDensity(1);
  size(800, 400);
  surface.setResizable(false);
  
  tam = 400 / cant;
  refImg = loadImage("20.jpg");
}

void draw() {
  background(255);

  image(refImg, 0, 0, 400, 400);

  // dibujo desde la derecha
  pushMatrix();
  translate(635, 200);
  rotate(angulo);
  translate(-200, -200);

  // cuadraditos
  for (int col = 0; col < cant + 2; col++) {
    for (int fila = 0; fila < cant + 2; fila++) {
      float x = col * tam - tam;
      float y = fila * tam - tam;
      
      color c = elegirColor(col, fila);
      dibujarCuadrado(x, y, tam, corte, c);
    }
  }

  
  for (int col = 0; col <= cant + 2; col++) {
    for (int fila = 0; fila <= cant + 2; fila++) {
      float x = col * tam - tam;
      float y = fila * tam - tam;
      
      float tam_cor = calcTamCorazon(mouseX - 400, mouseY, x, y);
      color colCor;
      
      if ((col + fila) % 2 == 0) {
        colCor = color(180, 20, 40); 
      } else {
        colCor = color(255, 255, 255); 
      }
      
      dibujarCorazon(x, y, tam_cor, colCor);
    }
  }

  popMatrix();

  // linea del medio
  stroke(150);
  strokeWeight(2);
  line(400, 0, 400, 400);
  noStroke();
}

//
 color elegirColor(int col, int fila) {
  if ((col + fila) % 2 == 0) {
    return colorVioleta;
  } else {
    return colorRosa;
  }
}

//.
float calcTamCorazon(float mx, float my, float cx, float cy) {
  float d = dist(mx, my, cx, cy);
  float t = map(d, 0, 300, 18, 4);
  return t;
}

// cuadrado base
void dibujarCuadrado(float x, float y, float s, float c, color col) {
  float cp = s * c;
  
  fill(col);
  noStroke();
  beginShape();
  vertex(x + cp,     y);
  vertex(x + s - cp, y);
  vertex(x + s,      y + cp);
  vertex(x + s,      y + s - cp);
  vertex(x + s - cp, y + s);
  vertex(x + cp,     y + s);
  vertex(x,          y + s - cp);
  vertex(x,          y + cp);
  endShape(CLOSE);
}

//crafteo corazon
void dibujarCorazon(float cx, float cy, float s, color col) {
  fill(col);
  noStroke();
  pushMatrix();
  translate(cx, cy);
  float r = s * 0.4;
  
  ellipse(-r * 0.55, -r * 0.3, r * 1.1, r * 1.1);
  ellipse( r * 0.55, -r * 0.3, r * 1.1, r * 1.1);
  triangle(-r * 1.1, 0,  r * 1.1, 0,  0, r * 1.3);
  
  popMatrix();
}

// controles int
void keyPressed() {

  // reinicio
  if (key == 'r' || key == 'R') {
    cant         = 12;
    corte        = 0;
    angulo       = 0;
    tam          = 400 / cant;
    colorRosa    = color(235, 185, 200);
    colorVioleta = color(170, 90, 180);
  }

  // rotar
  if (key == 'a' || key == 'A') {
    angulo = angulo - 0.1;
  }
  if (key == 'd' || key == 'D') {
    angulo = angulo + 0.1;
  }

  // colores random
  if (key == 'c' || key == 'C') {
    colorRosa    = color(random(255), random(255), random(255));
    colorVioleta = color(random(255), random(255), random(255));
  }
}
