return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = {
                "c", "lua", "vim", "vimdoc", "query", "elixir","heex",
                "html", "javascript", "typescript", "tsx", "css", "comment",
                "dockerfile", "git_config", "git_rebase", "gitattributes",
                "gitcommit", "gitignore", "json", "markdown", "markdown_inline",
                "xml", "yaml", "python", "vue", "php", "bash", "cmake", "cpp",
                "csv", "cuda", "erlang", "diff"
          },
          sync_install = false,
          auto_install = true,
          highlight = { enable = true },
          indent = { enable = true },  
        })
    end
}
