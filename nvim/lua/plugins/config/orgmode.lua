local orgmode = require('orgmode')
-- Load custom treesitter grammar for org filetype
orgmode.setup_ts_grammar()
orgmode.setup({
  org_agenda_files = {'~/Org/*'},
  org_default_notes_file = '~/Org/notes.org',
})
