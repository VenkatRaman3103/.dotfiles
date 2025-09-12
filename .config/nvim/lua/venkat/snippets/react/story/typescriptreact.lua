local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

return {
	s("story", {
		t({
			'import { ComponentProps } from "react";',
			'import { Component } from ".";',
			'import { Meta, StoryObj } from "@storybook/react";',
			"",
			"type StoryPropsType = ComponentProps<typeof Component>;",
			"",
			"const meta: Meta<StoryPropsType> = {",
			"    component: Component,",
			"};",
			"",
			"export default meta;",
			"",
			"type StoryType = StoryObj<StoryPropsType>;",
			"",
			"export const ComponentStory: StoryType = {",
			"    args: {",
			"        //",
			"    },",
			"    render: (args) => <Component {...args} />,",
			"};",
		}),
	}),
}
