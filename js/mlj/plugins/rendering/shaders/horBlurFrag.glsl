precision highp float;

//seguo l'implementazione suggerita qui:
// http://rastergrid.com/blog/2010/09/efficient-gaussian-blur-with-linear-sampling/
// molto interessante la cosa di fare due filtri lineari separati, e il sampling
// che sfrutta la gpu per ottenere un sample già filtrato.

uniform sampler2D depthMap;

#define stepCount 9 //35x35 kernel
uniform float gWeights[stepCount];
uniform float gOffsets[stepCount];

varying vec2 vUv;

vec3 GaussianBlur(sampler2D tex0, vec2 centreUV, vec2 pixelOffset) {
     vec3 colOut = vec3( 0, 0, 0 );

     for( int i = 0; i < stepCount; i++ ) {
         vec2 texCoordOffset = gOffsets[i] * pixelOffset;
         vec3 col = texture2D(tex0, centreUV + texCoordOffset).xyz +
                            texture2D(tex0, centreUV - texCoordOffset).xyz;
         colOut += gWeights[i] * col;
     }
     return colOut;
 }

void main() {
  gl_FragColor = vec4(GaussianBlur(depthMap, vUv, vec2(1.0 / 512.0, 0.0)), 0.5);
  // pixelOffset = 1.0 / 512.0 ossia 1 = max u,v coord diviso 512 = grandezza texture..
  // TODO: usare una uniform per la grandezza texture

}