local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
	s("curlreq", {
		t({
			"# host",
			"http://localhost:5000/api",
			"",
			"# curl options",
			" --silent",
			"# include response headers",
			"# --include",
			"# to ignore SSL when working with localhost",
			"# --insecure",
			"# to read a header(s) from a file.  File format should be like:",
			"",
			"# authorization",
			"# Header-Name: Header-Value",
			"# e.g. Authorization: YOUR_AUTH_TOKEN_HERE",
			"# -H @/path/to/file.txt",
			"",
			"# headers",
			"Accept: application/json;",
			"Connection: keep-alive",
			"Content-Type: application/json; charset=utf-8",
			"User-Agent: VRC",
			"",
			"# query",
			"GET  ",
			"",
			"# body",
			"# {",
			"#     \"name\": \"block name\",",
			"#     \"description\": \"Hello world\",",
			"#     \"block_type\": \"normal_block\"",
			"# }",
		})
	})
}
