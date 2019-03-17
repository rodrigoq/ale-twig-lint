" Author: rodrigoq <https://github.com/rodrigoq>
" Description: This file adds support for checking twig templates with twig-lint.

call ale#Set('twig_twiglint_executable', 'vendor/bin/twig-lint')

function! ale_linters#twig#twiglint#Handle(buffer, lines) abort
    " Matches patterns like the following:
    "
    " KO in macros.html.twig (line 889)
    "    887    {% endmacro %}
    "    888
    " >> 889    {% macro xxxx(var1 var2) %}
    " >> Arguments must be separated by a comma. Unexpected token "name" of value "var2" ("punctuation" expected with value ",").
    "    890    ...........
    "    891    	..............
    let l:pattern = '\v^KO in (.+) \(line (\d+)\)'
    let l:patternMsg = '\v\>\> ([a-zA-Z].+)'

    let l:output = []
    for l:match in ale#util#GetMatches(a:lines, l:pattern)

        let l:text = ''
        for l:matchMsg in ale#util#GetMatches(a:lines, l:patternMsg)
            let l:text .= l:matchMsg[1] . ' '
        endfor
        let l:obj = {
        \   'lnum': l:match[2] + 0,
        \   'col': 0,
        \   'text': l:text,
        \}

        call add(l:output, l:obj)
    endfor

    return l:output
endfunction

call ale#linter#Define('twig', {
\   'name': 'twiglint',
\   'executable': {b -> ale#Var(b, 'twig_twiglint_executable')},
\   'command': '%e lint %s',
\   'callback': 'ale_linters#twig#twiglint#Handle',
\})
