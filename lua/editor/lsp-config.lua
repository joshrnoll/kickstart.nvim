return {
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
		},
	},
	{
		-- Main LSP Configuration
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"mason-org/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "j-hui/fidget.nvim", opts = {} },
			"saghen/blink.cmp",
		},
		config = function()
			-- Config for diagnostics (warning, errors, hints etc.)
			-- See :help vim.diagnostic.Opts
			vim.diagnostic.config({
				severity_sort = true,
				float = { border = "rounded", source = "if_many" },
				underline = { severity = vim.diagnostic.severity.ERROR },
				signs = vim.g.have_nerd_font and {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				} or {},
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
			})

			require("mason-tool-installer").setup({
				ensure_installed = {
					"tree-sitter-cli",
					"copilot",
					"stylua",
					"lua_ls",
					"gopls",
					"pyright",
					"ts_ls",
					"terraform-ls",
					"tflint",
					"jsonls",
					"eslint_d",
					"yamllint",
					"yamlls",
					"yamlfmt",
					"helm_ls",
					"marksman",
					"markdown-toc",
					"markdownlint-cli2",
					"markdownlint",
					"dockerls",
					"docker_compose_language_service",
					"prettierd",
					"shfmt",
				},
			})

			require("mason-lspconfig").setup({
				automatic_enable = true,
			})

			-- yamlls schema configuration helper
			-- Reason: Sends workspace/didChangeConfiguration to yamlls for the current buffer
			-- Pass a schema URL/identifier to apply it, or nil to clear all schemas
			_G.SetYamlSchema = function(schema_url)
				local clients = vim.lsp.get_clients({ bufnr = 0, name = "yamlls" })
				if #clients == 0 then
					vim.notify("yamlls not attached to buffer", vim.log.levels.WARN)
					return
				end
				for _, client in ipairs(clients) do
					client:notify("workspace/didChangeConfiguration", {
						settings = {
							yaml = {
								schemas = schema_url and { [schema_url] = vim.uri_from_bufnr(0) } or {},
							},
						},
					})
				end
				vim.notify("YAML schema: " .. (schema_url or "none"), vim.log.levels.INFO)
			end

			require("blink.cmp").get_lsp_capabilities()
		end,
	},
}
