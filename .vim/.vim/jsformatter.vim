function! airline#extensions#tabline#formatters#jsformatter#format(bufnr, buffers)
  let buf = bufname(a:bufnr)
  let filename = fnamemodify(buf, ':t')

  if filename == 'index.js' || filename == 'index.jsx'
    return fnamemodify(buf, ':p:h:t') . '/i'
  else
    return filename
  endif
endfunction
