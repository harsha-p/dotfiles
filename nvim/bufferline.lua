require('bufferline').setup {
	options = {
		numbers = "buffer_id" ,
		number_style = "superscript",
		mappings = true ,
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator_icon = '▎',
		buffer_close_icon = '',
		modified_icon = '●',
		close_icon = '',
		left_trunc_marker = '',
		right_trunc_marker = '',
		max_name_length = 18,
		max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "("..count..")"
		end,
		offsets = {{filetype = "NvimTree", text = "NvimTree", text_align = "left" },{ filetype="gundo", text="Gundo", text_align="left" } },
		show_buffer_icons = true ,
		show_buffer_close_icons = false,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "thin",
		enforce_regular_tabs = true,
		always_show_bufferline =  false,
		sort_by = 'relative_directory',

		custom_areas = {
			right = function()
				local result = {}
				local error = vim.lsp.diagnostic.get_count(0, [[Error]])
				local warning = vim.lsp.diagnostic.get_count(0, [[Warning]])
				local info = vim.lsp.diagnostic.get_count(0, [[Information]])
				local hint = vim.lsp.diagnostic.get_count(0, [[Hint]])

				if error ~= 0 then
					result[1] = {text = "  " .. error, guifg = "#EC5241"}
				end

				if warning ~= 0 then
					result[2] = {text = "  " .. warning, guifg = "#EFB839"}
				end

				if hint ~= 0 then
					result[3] = {text = "  " .. hint, guifg = "#A3BA5E"}
				end

				if info ~= 0 then
					result[4] = {text = "  " .. info, guifg = "#7EA9A7"}
				end
				return result
			end
		}

	}
}

