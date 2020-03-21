///////////////////////////////////////////////////////////
//attribute
attribute vec4 a_position;
attribute vec4 a_velocity;
attribute vec3 a_force;
attribute float a_size;
attribute float a_duration;   // 持续时间
attribute float a_emission;   // 发射时间
attribute float a_deathTimes; // 消失时间

///////////////////////////////////////////////////////////
//uniform
uniform mat4 u_modelMatrix;
uniform mat4 u_viewMatrix;
uniform mat4 u_projectionMatrix;
uniform highp vec3 u_gravity;
uniform highp float u_elapsedTime; // 经过的时间


///////////////////////////////////////////////////////////
//varying
varying lowp float v_particleOpacity;

#define MATH_FLOAT_SMALL 1.0e-7f

void main(void) {
    highp float elapsedTime = u_elapsedTime - a_emission;
    highp vec3 velocity = a_velocity + (a_force + u_gravity) * elapsedTime;
    // s = s0 + 0.5 * (v0 + v) * t 画个vt图，求面积就是总距离
    highp vec3 untransformedPosition = a_position + 0.5 * (a_velocity + velocity) * elapsedTime;
    gl_Position = u_projectionMatrix * u_viewMatrix * u_modelMatrix * vec4(untransformedPosition, 1.0);
    v_particleOpacity = max(0.0, min(1.0, (a_deathTimes - u_elapsedTime) / max(a_duration, MATH_FLOAT_SMALL)))
    gl_PointSize = a_size / gl_Position.w;
}

