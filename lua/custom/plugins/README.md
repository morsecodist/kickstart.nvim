# Custom Neovim Plugins

## Stratus LSP

The stratus language server provides IDE features for `.stratus` configuration files.

### Configuration

In `init.lua`, two pieces configure the LSP:

1. **Filetype registration** - Associates `.stratus` extension with the `stratus` filetype:
   ```lua
   vim.filetype.add {
     extension = {
       stratus = 'stratus',
     },
   }
   ```

2. **LSP autocommand** - Starts the language server when a stratus file is opened:
   ```lua
   vim.api.nvim_create_autocmd('FileType', {
     pattern = 'stratus',
     callback = function()
       vim.lsp.start {
         name = 'stratus',
         cmd = { 'node', '/home/todd/curavit/stratus/config-lib/dist/server.js' },
         root_dir = vim.fs.dirname(vim.fs.find({ '.git', 'package.json' }, { upward = true })[1]),
       }
     end,
   })
   ```

### How it works

- `vim.filetype.add` registers the file extension so Neovim recognizes `.stratus` files
- The `FileType` autocommand triggers when a buffer's filetype is set to `stratus`
- `vim.lsp.start` launches the LSP client, connecting to the node server
- `root_dir` determines the workspace root by searching upward for `.git` or `package.json`

### Verification

1. Open a `.stratus` file
2. Run `:LspInfo` to confirm the server is attached
3. Run `:lua print(vim.bo.filetype)` to verify the filetype is `stratus`

### Troubleshooting

- **Server not starting**: Ensure the server script exists at the configured path
- **Wrong filetype**: Check that the file has the `.stratus` extension
- **No LSP features**: Verify the server implements the LSP protocol correctly
