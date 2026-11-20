-- luacheck config: run "luacheck ." from this folder (Lua 5.1, like the WoW client).
-- The real API list is wowbench's (wowbench check .); this one only lists what Spiritbound uses.
std = "lua51"
max_line_length = false
ignore = { "212", "432" }
exclude_files = { "Libs/", "tests/", "tools/" }
read_globals = { "C_Item", "CreateFrame", "IsPlayerSpell", "LibStub" }
