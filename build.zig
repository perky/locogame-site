const std = @import("std");
const zine = @import("zine");

pub fn build(b: *std.Build) !void {
    zine.website(b, .{
        .title = "Luke Perkin - Technical Designer",
        .host_url = "https://lukeperkin.com",
        .layouts_dir_path = "layouts",
        .content_dir_path = "content",
        .assets_dir_path = "assets",
        .static_assets = &.{
            // This asset is referenced in some inlined HTML in markdown
            // which Zine is not yet able to analyze so as a temporary
            // hack we mark it as a static asset.
            "sentrailer.mp4",
            "shrapnelloop.mp4",
            "turbotanksloop.mp4",

            // Fonts referenced in CSS files // TODO: filter.
            "fonts/BebasNeue-Regular.ttf",
            "fonts/Merriweather-Black.ttf",
            "fonts/Merriweather-BlackItalic.ttf",
            "fonts/Merriweather-Bold.ttf",
            "fonts/Merriweather-BoldItalic.ttf",
            "fonts/Merriweather-Italic.ttf",
            "fonts/Merriweather-Light.ttf",
            "fonts/Merriweather-LightItalic.ttf",
            "fonts/Merriweather-Regular.ttf",
            "fonts/FiraCode-Bold.woff",
            "fonts/FiraCode-Bold.woff2",
            "fonts/FiraCode-Light.woff",
            "fonts/FiraCode-Light.woff2",
            "fonts/FiraCode-Medium.woff",
            "fonts/FiraCode-Medium.woff2",
            "fonts/FiraCode-Regular.woff",
            "fonts/FiraCode-Regular.woff2",
            "fonts/FiraCode-SemiBold.woff",
            "fonts/FiraCode-SemiBold.woff2",
            "fonts/FiraCode-VF.woff",
            "fonts/FiraCode-VF.woff2",
            "fonts/Poppins-Black.ttf",
            "fonts/Poppins-Bold.ttf",
            "fonts/Poppins-ExtraBold.ttf",
            "fonts/Poppins-ExtraLight.ttf",
            "fonts/Poppins-Light.ttf",
            "fonts/Poppins-Medium.ttf",
            "fonts/Poppins-Regular.ttf",
            "fonts/Poppins-SemiBold.ttf",
            "fonts/Poppins-Thin.ttf",
            "fonts/MajorMonoDisplay-Regular.ttf",

            "fonts/jbm/JetBrainsMono-Bold.woff2",
            "fonts/jbm/JetBrainsMono-BoldItalic.woff2",
            "fonts/jbm/JetBrainsMono-ExtraBold.woff2",
            "fonts/jbm/JetBrainsMono-ExtraBoldItalic.woff2",
            "fonts/jbm/JetBrainsMono-ExtraLight.woff2",
            "fonts/jbm/JetBrainsMono-ExtraLightItalic.woff2",
            "fonts/jbm/JetBrainsMono-Italic.woff2",
            "fonts/jbm/JetBrainsMono-Light.woff2",
            "fonts/jbm/JetBrainsMono-LightItalic.woff2",
            "fonts/jbm/JetBrainsMono-Medium.woff2",
            "fonts/jbm/JetBrainsMono-MediumItalic.woff2",
            "fonts/jbm/JetBrainsMono-Regular.woff2",
            "fonts/jbm/JetBrainsMono-SemiBold.woff2",
            "fonts/jbm/JetBrainsMono-SemiBoldItalic.woff2",
            "fonts/jbm/JetBrainsMono-Thin.woff2",
            "fonts/jbm/JetBrainsMono-ThinItalic.woff2",
        },
        .build_assets = &.{
            .{
                .name = "zon",
                .lp = b.path("build.zig.zon"),
            },
            .{
                .name = "frontmatter",
                .lp = b.dependency("zine", .{}).path(
                    "frontmatter.ziggy-schema",
                ),
            },
        },
        .debug = true,
    });
}
