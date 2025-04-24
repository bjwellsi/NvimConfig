local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("sql", {
	s("ssf", {
		t("SELECT "),
		i(1, "*"),
		t(" FROM "),
		i(2, "table"),
		t(";"),
	}),
	s("sc", {
		t("SELECT COUNT(*) FROM "),
		i(1, "table"),
		t(";"),
	}),
	s("ins", {
		t("INSERT INTO "),
		i(1, "table"),
		t(" ("),
		i(2, "columns"),
		t(") VALUES ("),
		i(3, "values"),
		t(");"),
	}),
})
