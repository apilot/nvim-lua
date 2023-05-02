--
-- init.lua
--
require("core.options")
require("core.mappings") -- lazy require mapleader already set
require("core.plugins")
-- plugin configs read automatically from: after/plugin/*.lua
require('lazy').setup('plugins', opts)
