function! airline#extensions#tabline#formatters#jsformatter#format(bufnr, buffers)
  let buf = bufname(a:bufnr)
  let filename = fnamemodify(buf, ':t')

  if filename == 'index.js' || filename == 'index.jsx' || filename == 'index.ts'
    return fnamemodify(buf, ':p:h:t') . '/i'
  elseif filename == 'styles.css'
    return fnamemodify(buf, ':p:h:t') . '/s'
  else
    return filename
  endif
endfunction
