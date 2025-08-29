local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
	s("redux-slice", {
		t({
			"import { createSlice, PayloadAction } from '@reduxjs/toolkit'",
			"",
			"interface SliceState {",
			"\t//",
			"}",
			"",
			"const initialState: SliceState = {",
			"\tvalue: 0,",
			"}",
			"",
			"export const slice = createSlice({",
			"\tname: 'slice',",
			"\tinitialState,",
			"\treducers: {",
			"\t\t//",
			"\t},",
			"})",
			"",
			"export const {} = slice.actions",
			"export default slice.reducer",
		}),
	}),
}
