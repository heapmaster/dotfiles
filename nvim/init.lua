require("bootstrap")
require("dep") {
    modules = {
        prefix = "deps.",
        "java_config",
        "telescope",
        "treesitter"
    },
}
require("base")
