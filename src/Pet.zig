const std = @import("std");
const mg = @import("my_graphics");
const Shader = mg.Shader;
const Texture = mg.Texture;
const Rectangle = mg.Rectangle;

const Self = @This();
const START_POS_X = 0;
const START_POS_Y = -0.5;
pub const SIZE_X = 0.08;
pub const SIZE_Y = 0.5;

x: f32,
y: f32,
speed: f32,
name: []const u8,
_flip: i32 = 1, // 1 = tex cords stay same , -1 tex cords invert (horizontally)
_dir: f32,
_rect: Rectangle,
_shader: Shader,

/// shader must be a shader that must have a 'sprite' uniform.
pub fn init(
    name: []const u8,
    speed: f32,
    shader: Shader,
    texture: Texture,
) Self {
    return .{
        .x = START_POS_X,
        .y = START_POS_Y,
        .name = name,
        .speed = speed,
        ._dir = 1,
        ._rect = mg.Rectangle.init(START_POS_X, START_POS_Y, SIZE_X, SIZE_Y, shader, texture),
        ._shader = shader,
    };
}

pub fn deinit(self: *Self) void {
    self._rect.deinit();
}

pub fn change_direction(self: *Self) void {
    self._dir *= -1;
}

pub fn move(self: *Self) void {
    if (self.x - SIZE_X < -1.0 or self.x + SIZE_X > 1.0) {
        self._flip *= -1;
        self.change_direction();
    }
    const x = self.x + (self.speed * self._dir);
    self.set_pos(x, self.y);
}

pub fn set_pos(self: *Self, x: f32, y: f32) void {
    self.x = x;
    self.y = y;
    self._rect.update_pos(x, y);
}

pub fn draw(self: *Self) void {
    self._shader.set_int("flip", self._flip);
    self._shader.set_texture("tex", self._rect._texture.?);
    self._rect.draw();
}

pub fn set_texture(self: *Self, t: Texture) void {
    self._rect.set_texture(t);
}
