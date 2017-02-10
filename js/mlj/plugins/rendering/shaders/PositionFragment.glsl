precision highp float;

uniform float pointSize;

varying vec4 vPosition;

void main() {
if (pointSize != 0.0) {
  float u = 2.0*gl_PointCoord.x-1.0;
  float v = 2.0*gl_PointCoord.y-1.0;
  float w = u*u+v*v;
  if (w > 1.0) discard;
}
  // vec4 n = (vPosition * 0.5 + 0.5) * 255.0; 
  gl_FragColor = vPosition;

}