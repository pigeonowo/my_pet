pub const packages = struct {
    pub const @"my_graphics-0.0.0-1G2kEBhRAACEFGRJ8RqMTfZ8l50mBY-Fa1OVmQut_CCo" = struct {
        pub const build_root = "/home/jonas/.cache/zig/p/my_graphics-0.0.0-1G2kEBhRAACEFGRJ8RqMTfZ8l50mBY-Fa1OVmQut_CCo";
        pub const build_zig = @import("my_graphics-0.0.0-1G2kEBhRAACEFGRJ8RqMTfZ8l50mBY-Fa1OVmQut_CCo");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
            .{ "zigglgen", "zigglgen-0.4.0-bmyqLV6PLwAt0VCiGVgz6kZ448zaiTix2Z8MXEEuN4Vi" },
            .{ "zglfw", "zglfw-0.1.0-BghZXabUAACfsXVTPWvmy44XLsc-wux2G9w8Mbp523pJ" },
            .{ "zstbi", "zstbi-0.11.0-dev-L0Ea_yaWBwAHwFoCuyjkFyaiSsbjt4UOrkntR0c_nmzz" },
        };
    };
    pub const @"zglfw-0.1.0-BghZXabUAACfsXVTPWvmy44XLsc-wux2G9w8Mbp523pJ" = struct {
        pub const build_root = "/home/jonas/.cache/zig/p/zglfw-0.1.0-BghZXabUAACfsXVTPWvmy44XLsc-wux2G9w8Mbp523pJ";
        pub const build_zig = @import("zglfw-0.1.0-BghZXabUAACfsXVTPWvmy44XLsc-wux2G9w8Mbp523pJ");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
    pub const @"zigglgen-0.4.0-bmyqLV6PLwAt0VCiGVgz6kZ448zaiTix2Z8MXEEuN4Vi" = struct {
        pub const build_root = "/home/jonas/.cache/zig/p/zigglgen-0.4.0-bmyqLV6PLwAt0VCiGVgz6kZ448zaiTix2Z8MXEEuN4Vi";
        pub const build_zig = @import("zigglgen-0.4.0-bmyqLV6PLwAt0VCiGVgz6kZ448zaiTix2Z8MXEEuN4Vi");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
    pub const @"zstbi-0.11.0-dev-L0Ea_yaWBwAHwFoCuyjkFyaiSsbjt4UOrkntR0c_nmzz" = struct {
        pub const build_root = "/home/jonas/.cache/zig/p/zstbi-0.11.0-dev-L0Ea_yaWBwAHwFoCuyjkFyaiSsbjt4UOrkntR0c_nmzz";
        pub const build_zig = @import("zstbi-0.11.0-dev-L0Ea_yaWBwAHwFoCuyjkFyaiSsbjt4UOrkntR0c_nmzz");
        pub const deps: []const struct { []const u8, []const u8 } = &.{
        };
    };
};

pub const root_deps: []const struct { []const u8, []const u8 } = &.{
    .{ "my_graphics", "my_graphics-0.0.0-1G2kEBhRAACEFGRJ8RqMTfZ8l50mBY-Fa1OVmQut_CCo" },
};
