const std = @import("std");
const mg = @import("my_graphics");
const gl = mg.gl;
const Pet = @import("Pet.zig");

const WIDTH = 500;
const HEIGHT = 80;

const ally = std.heap.page_allocator;

fn init() !mg.Window {
    // init window
    mg.Window.make_invisible_floating();
    var window = try mg.Window.init("My Pet", WIDTH, HEIGHT, .{});
    window.make_context_current();
    try window.dock_corner(.BottomRight);

    // enable blending
    mg.gl.Enable(mg.gl.BLEND);
    mg.gl.BlendFunc(mg.gl.SRC_ALPHA, mg.gl.ONE_MINUS_SRC_ALPHA);
    return window;
}

pub fn main() !void {
    try mg.init_glfw();
    defer mg.deinit_glfw();
    mg.init_zstbi(ally);
    defer mg.deinit_zstbi();

    var window = try init();

    //  --------init pet---------
    // shader
    const shader = try mg.Shader.init(@embedFile("shaders/pet.vert.glsl"), @embedFile("shaders/pet.frag.glsl"));
    defer shader.deinit();

    // graphics
    const texture0 = try mg.Texture.load("./sprites/snail_0.png", .{ .flip = true, .transparent = true, .texture_num = .T0, .texture_num_value = 0 });
    const texture1 = try mg.Texture.load("./sprites/snail_1.png", .{ .flip = true, .transparent = true, .texture_num = .T0, .texture_num_value = 0 });
    const texture2 = try mg.Texture.load("./sprites/snail_2.png", .{ .flip = true, .transparent = true, .texture_num = .T0, .texture_num_value = 0 });
    const texture3 = try mg.Texture.load("./sprites/snail_3.png", .{ .flip = true, .transparent = true, .texture_num = .T0, .texture_num_value = 0 });
    const texture4 = try mg.Texture.load("./sprites/snail_4.png", .{ .flip = true, .transparent = true, .texture_num = .T0, .texture_num_value = 0 });

    const pet_speed = 0.001;
    var pet = Pet.init("Leif", pet_speed, shader, texture0); // pre set first texture
    defer pet.deinit();
    //  --------init pet---------

    //  --------init message-----
    const message_shader = try mg.Shader.init(@embedFile("shaders/message.vert.glsl"), @embedFile("shaders/message.frag.glsl"));
    const message_texture = try mg.Texture.load("./sprites/message_box.png", .{ .flip = true, .transparent = true, .texture_num = .T0, .texture_num_value = 0 });
    var message = mg.Rectangle.init(pet.x, 0.3, 0.16, 0.5, message_shader, message_texture);
    defer message_shader.deinit();
    defer message.deinit();
    //  --------init message-----

    var texture_counter: u128 = 0;
    const gap_between_textures = 15;
    while (!window.should_close()) {
        defer texture_counter += 1;
        defer window.swap_buffers();
        defer mg.Window.poll_events();

        // -- handle input --
        window.on_press(.Escape, .{}, exit);

        // move pet
        pet.move();

        // update message position
        message.update_pos(pet.x, message.pos_y);

        // -- drawing --
        gl.ClearColor(0, 0, 0, 0);
        gl.Clear(gl.COLOR_BUFFER_BIT);

        // -- pet drawing --
        // animation
        if (texture_counter > gap_between_textures * 8) {
            texture_counter = 0;
        } else if (texture_counter > gap_between_textures * 7) {
            pet.set_texture(texture1);
        } else if (texture_counter > gap_between_textures * 6) {
            pet.set_texture(texture2);
        } else if (texture_counter > gap_between_textures * 5) {
            pet.set_texture(texture3);
        } else if (texture_counter > gap_between_textures * 4) {
            pet.set_texture(texture4);
        } else if (texture_counter > gap_between_textures * 3) {
            pet.set_texture(texture3);
        } else if (texture_counter > gap_between_textures * 2) {
            pet.set_texture(texture2);
        } else if (texture_counter > gap_between_textures) {
            pet.set_texture(texture1);
        } else if (texture_counter > 0) {
            pet.set_texture(texture0);
        }
        pet.draw();
        // -- pet drawing --
        // -- message drawing --
        // When uncommenting below line... the texture flipping doesnt work anymore with the pet... need to adjust some stuff in my graphics library and need to learn more about textures in opengl
        // message.draw();
        // -- message drawing --
        // -- drawing --
    }
}

fn exit(window: *mg.Window, _: @TypeOf(.{})) void {
    window.set_should_close(true);
}
