local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local function get_component_name()
	local filename = vim.fn.expand("%:t:r")
	local dirname = vim.fn.expand("%:p:h:t")

	if filename == "index" then
		return dirname:gsub("^%l", string.upper)
	else
		return filename:gsub("^%l", string.upper)
	end
end

return {
	s("rcstore", {
		t('import "./index.scss";'),
		t({ "", 'import React, { useState } from "react";' }),
		t({ "", 'import { StoreState } from "@/store/store";' }),
		t({ "", 'import { useDispatch, useSelector } from "react-redux";' }),
		t({ "", 'import { useMutation, useQuery, useQueryClient } from "@tanstack/react-query";' }),
		t({ "", "" }),
		t({ "", "" }),
		t("export const "),
		f(function() return get_component_name() end),
		t(" = () => {"),
		t({ "", "" }),

		t({ "", "    // global state (store)" }),
		t({ "", "    // local state" }),
		t({ "", "    // fetching data" }),
		t({ "", "    const queryClient = useQueryClient();" }),
		t({ "", "" }),
		t({ "", "    // mutations" }),
		t({ "", "    // event handlers" }),
		t({ "", "    // loaders" }),

		t({ "", "    return (" }),
		t({ "", "        <div>" }),
		t({ "", "            <div>" }),
		t({ "", "                " }), i(0),
		t({ "", "            </div>" }),
		t({ "", "        </div>" }),
		t({ "", "    );" }),
		t({ "", "};" }),
	})
}
