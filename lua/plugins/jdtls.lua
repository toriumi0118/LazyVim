-- jdtls (eclipse.jdt.ls) は Java 21 以上でしか起動できないため、
-- プロジェクトの Java (mise 管理) とは別に temurin-21 を明示的に渡す。
-- プロジェクト側のコンパイルは jdtls が .classpath / build 設定から解決するので影響なし。
return {
  {
    "mfussenegger/nvim-jdtls",
    opts = function(_, opts)
      local java21 = vim.fn.expand("~/.local/share/mise/installs/java/temurin-21/bin/java")
      if vim.fn.executable(java21) == 1 then
        opts.cmd = opts.cmd or { vim.fn.exepath("jdtls") }
        table.insert(opts.cmd, "--java-executable=" .. java21)
      end
    end,
  },
}
