vim.opt.rtp:prepend(vim.fn.stdpath("config") .. "/../nvcore")

require("shared.config")
require("dev.config")
require("config.lazy")

