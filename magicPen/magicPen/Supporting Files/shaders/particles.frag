#ifdef GL_ES//for discriminate GLES & GL
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
#else
#define highp
#define mediump
#define lowp
#endif
///////////////////////////////////////////////////////////
// Uniforms
uniform sampler2D u_texture;
uniform vec4 u_color;
///////////////////////////////////////////////////////////
//varying
varying lowp float v_particleOpacity;

void main()
{
    gl_FragColor = texture2D(u_texture, gl_PointCoord) * u_color;
    gl_FragColor.a *= v_particleOpacity;
}
 
