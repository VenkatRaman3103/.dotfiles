local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
	s("redux-store", {
		t('import { configureStore } from "@reduxjs/toolkit";'),
		t({ "", "" }),
		t({ "", "" }),
		t("export const store = configureStore({"),
		t({ "", "  reducer: {" }),
		t({ "", "" }),
		t({ "    //" }),
		t({ "", "  }," }),
		t({ "", "});", "" }),
		t({ "", "export type RootState = ReturnType<typeof store.getState>" }),
		t({ "", "export type AppDispatch = typeof store.dispatch" }),
	}),
}
