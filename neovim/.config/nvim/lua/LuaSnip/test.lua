local ls = require'luasnip'
-- some shorthands...
local s = ls.s
local sn = ls.sn
local t = ls.t
local i = ls.i
local f = ls.f
local c = ls.c
local d = ls.d

-- args is a table, where 1 is the text in Placeholder 1, 2 the text in
-- placeholder 2,...
local function copy(args) return args[1] end

ls.snippets = {
	all = {
		-- trigger is fn.
		s({trig="fn"}, {
			-- Simple static text.
			t({"//Parameters: "}),
			-- function, first parameter is the function, second the Placeholders
			-- whose text it gets as input.
			f(copy, {2}),
			t({"", "function "}),
			-- Placeholder/Insert.
			i(1),
			t({"("}),
			-- Placeholder with initial text.
			i(2, {"int foo"}),
			-- Linebreak
			t({") {", "\t"}),
			-- Last Placeholder, exit Point of the snippet. EVERY 'outer' SNIPPET NEEDS Placeholder 0.
			i(0),
			t({"", "}"})
		}),
		s({trig="class"}, {
			-- Choice: Switch between two different Nodes, first parameter is its position, second a list of nodes.
			c(1, {
				t({"public "}),
				t({"private "})
			}),
			t({"class "}),
			i(2),
			t({" "}),
			c(3, {
				t({"{"}),
				-- sn: Nested Snippet. Instead of a trigger, it has a position, just like insert-nodes. !!! These don't expect a 0-node!!!!
				-- Inside Choices, Nodes don't need a position as the choice node is the one being jumped to.
				sn(nil, {
					t({"extends "}),
					i(1),
					t({" {"})
				}),
				sn(nil, {
					t({"implements "}),
					i(1),
					t({" {"})
				})
			}),
			t({"","\t"}),
			i(0),
			t({"", "}"})
		}),
		-- Parsing snippets: First parameter: Snippet-Trigger, Second: Snippet body.
		-- Placeholders are parsed into choices with 1. the placeholder text(as a snippet) and 2. an empty string.
		-- This means they are not SELECTed like in other editors/Snippet engines.
		ls.parser.parse_snippet(
            {trig="lspsyn"},
            "Wow! This ${1:Stuff} really ${2:works. ${3:Well, a bit.}}"
        )
	}
}
