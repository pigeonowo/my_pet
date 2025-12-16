#version 450 core
out vec4 FragColor;

in vec2 TexCoord;

// texture samplers
uniform sampler2D tex;
uniform int flip;

void main()
{
    if (flip == 1) {
        FragColor = texture(tex, TexCoord);
    } else {
        // invert texcoord.x
        FragColor = texture(tex, vec2(1 - TexCoord.x, TexCoord.y));
    }
}
