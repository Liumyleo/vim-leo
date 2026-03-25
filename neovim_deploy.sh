# 网络问题先用代理

# 安装neovim
wget -O nvim-linux-x86_64.deb https://release-assets.githubusercontent.com/github-production-release-asset/688959145/528ef6d8-e860-4d19-a0e3-76caa1df761c\?sp\=r\&sv\=2018-11-09\&sr\=b\&spr\=https\&se\=2026-02-02T05%3A57%3A08Z\&rscd\=attachment%3B+filename%3Dnvim-linux-x86_64.deb\&rsct\=application%2Foctet-stream\&skoid\=96c2d410-5711-43a1-aedd-ab1947aa7ab0\&sktid\=398a6654-997b-47e9-b12b-9515b896b4de\&skt\=2026-02-02T04%3A56%3A36Z\&ske\=2026-02-02T05%3A57%3A08Z\&sks\=b\&skv\=2018-11-09\&sig\=EIf%2Bv4Z9bDwX7SXXLT0yISvxWrNpcizQME5ux%2BJFedY%3D\&jwt\=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc3MDAwOTE1MiwibmJmIjoxNzcwMDA4ODUyLCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.AtizSIlTFUj1_obbkVYki5dROID2tX3bauCVbHh_O6o\&response-content-disposition\=attachment%3B%20filename%3Dnvim-linux-x86_64.deb\&response-content-type\=application%2Foctet-stream
sudo apt install -y ./nvim-linux-x86_64.deb

# 安装LazyVim
git clone https://github.com/LazyVim/starter ~/.config/nvim

# tree-sitter 兼容GLIBC低版本
wget -O tree-sitter-linux-x64.gz https://release-assets.githubusercontent.com/github-production-release-asset/14164618/9e7f1c30-5b61-45ca-8df1-3e5f03846b8a\?sp\=r\&sv\=2018-11-09\&sr\=b\&spr\=https\&se\=2026-02-02T08%3A21%3A45Z\&rscd\=attachment%3B+filename%3Dtree-sitter-linux-x64.gz\&rsct\=application%2Foctet-stream\&skoid\=96c2d410-5711-43a1-aedd-ab1947aa7ab0\&sktid\=398a6654-997b-47e9-b12b-9515b896b4de\&skt\=2026-02-02T07%3A21%3A45Z\&ske\=2026-02-02T08%3A21%3A45Z\&sks\=b\&skv\=2018-11-09\&sig\=B76oOvhkT%2BWAy3JYXYZkD%2FXDswxrydTcwTkTu6chzyk%3D\&jwt\=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmVsZWFzZS1hc3NldHMuZ2l0aHVidXNlcmNvbnRlbnQuY29tIiwia2V5Ijoia2V5MSIsImV4cCI6MTc3MDAxNzcyOCwibmJmIjoxNzcwMDE3NDI4LCJwYXRoIjoicmVsZWFzZWFzc2V0cHJvZHVjdGlvbi5ibG9iLmNvcmUud2luZG93cy5uZXQifQ.zBSGMwZZWjUAK5Yy7lIkDZIg7wLfMBffEJ7NEWuOfSY\&response-content-disposition\=attachment%3B%20filename%3Dtree-sitter-linux-x64.gz\&response-content-type\=application%2Foctet-stream
gzip -d tree-sitter-linux-x64.gz
chmod +x ./tree-sitter-linux-x64
cp ./tree-sitter-linux-x64 ~/.local/bin/tree-sitter

# 复制到系统粘贴板
sudo apt update && sudo apt install -y xclip
echo 'vim.opt.clipboard = "unnamedplus"' >> ~/.config/nvim/lua/config/options.lua

# 关闭默认的format_on_save
echo 'vim.g.autoformat = false' >> ~/.config/nvim/lua/config/options.lua

# 启用视觉换行
echo 'vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true' >> ~/.config/nvim/lua/config/options.lua

# grep
sudo apt install -y ripgrep
sudo apt install -y fd-find

# LSP跳转
:LazyExtras 选择python后按x启动

sudo apt update && sudo apt install -y nodejs npm
sudo npm install -g pyright

echo 'vim.g.lazyvim_python_lsp = "pyright"' >> ~/.config/nvim/lua/config/options.lua


# 禁用自动诊断
cat <<'EOF' >> ~/.config/nvim/lua/config/options.lua

-- Disable diagnostics for Python files (Neovim 0.12+)
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function(args)
    vim.diagnostic.enable(false, { bufnr = args.buf })
  end,
})

EOF


# codeium AI补全插件
echo 'return {
  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },
}' >> ~/.config/nvim/lua/plugins/ai-completion.lua

# codeium鉴权时由于noice插件，网址显示不全，可以先禁用，后打开
echo 'return {
  "folke/noice.nvim",
  enabled = true, -- set to false to disable noice
}' >> ~/.config/nvim/lua/plugins/noice.lua
