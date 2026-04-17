PImage miImagen;
void setup(){
  size(800,400);
  miImagen = loadImage("XD.jpg");
}
void draw(){
  background (140,162,192);
  image(miImagen, 0, 0, 400, 400);
   fill(250,246,230,255);
  //partedearriba
  stroke(203, 192, 166, 255);
  strokeWeight(1);
   fill(240,223,201,255);
  triangle(594, 73, 446, 148, 744,148);
  //triangulos interiores 
  fill(222,202,177,255);
  triangle(594, 85, 458, 147, 742,152);
     fill(240,223,201,255);
  triangle(594, 89, 475, 147, 715,148);
  //tapeciodetecho
  quad(446, 148, 743, 148, 736, 158, 457, 158);
  //rectangulodeabajo
  fill(222,202,177,255);
  rect(455, 158, 279, 20); 
   fill(240,223,201,255);
  rect(454 , 178, 281,5);
  rect(452 , 182, 285,5);
  //trapeciodeprofundidad
  noStroke();
  fill(155,138,122,255);
  quad(449, 188, 740, 188, 724, 197, 466, 197);
 
  //rectangulodebase
  fill(255,241,222,255);
  rect(462, 198,263,147);
  
   //lineas de la base
   stroke(152,127,94,127);
  line(460,210,725,210);
  line(460,225,725,225);
  line(460,240,725,240);
  line(460,255,725,255);
  line(460,270,725,270);
  line(460,285,725,285);
  line(460,300,725,300);
  line(460,315,725,315);
   line(460,330,725,330);
   
   //PUERTAS marcos
  fill(108,95,79,255);
  rect(499,285,36,70);
  rect(575,285,36,70);
  rect(651,285,36,70);
  
  //puertas
   fill(129,106,77,255);
  rect(506,290,20,60);
   rect(582,290,20,60);
   rect(658,290,20,60);
  
  //cuadritos?
  fill(250,234,212,255);
stroke(139, 114, 80, 255);
  strokeWeight(2);
  ellipse(479,296,20,35);
  ellipse(553,296,20,35);
  ellipse(634,295,20,35);
  ellipse(705,295,20,35);
  
  
  
  //escaleras
   noStroke();
  fill(242,232,223,255);
  quad(463, 346, 724, 346, 758, 375,427, 372 );
  
  //escaleras
  stroke(152,127,94,127);
  strokeWeight(1);
  line(455,349,733,349);
   line(449,355,737,355);
  line(440,360,742,360);
  line(433,364,745,364);
 line(430,369,753,370);
  
  
  
  
  //columnas. restar 17 del eje x y dejar lo otro todo igual, y modificar el alto
  stroke(232, 218, 199, 255);
  strokeWeight(1);
   fill(240,224,203,255);

  rect(717, 187, 5, 162);
  rect (700,187, 5,162);
  rect (683, 187, 5,162);
  rect (666,187,5,162);
  rect (649,187,5,162);
  rect (632,187,5,162);
  rect (615,187,5,162);
  rect (598,187,5,162);
  rect (581,187,5,162);
  rect (564,187,5,162);
  rect (547,187,5,162);
  rect (530,187,5,162);
  rect (513,187,5,162);
  rect (496,187,5,162);
  rect (479,187,5,162);
  rect (465,187,5,162);
 
  //partes de abajo 
  fill(206,187,162);
  noStroke();
  rect(461,187,13,3);
  rect(476,187,13,3);
  rect(492,187,13,3);
  rect(509,187,13,3);
  rect(527,187,13,3);
  rect(544,187,13,3);
  rect(561,187,13,3);
  rect(578,187,13,3);
  rect(595,187,13,3);
  rect(612,187,13,3);
  rect(629,187,13,3);
  rect(646,187,13,3);
  rect(663,187,13,3);
  rect(680,187,13,3);
  rect(697,187,13,3);
  rect(714,187,13,3);
  
  //y de arriba de la columna 
  noStroke();
  rect(462,345,11,4);
  rect(476,345,11,4);
  rect(493,345,11,4);
  rect(509,345,11,4);
  rect(528,345,11,4);
  rect(545,345,11,4);
  rect(560,345,11,4);
  rect(578,345,11,4);
  rect(596,345,11,4);
  rect(613,345,11,4);
  rect(629,345,11,4);
  rect(645,345,11,4);
  rect(663,345,11,4);
  rect(680,345,11,4);
  rect(698,345,11,4);
  rect(716,345,11,4);
  
  
 
