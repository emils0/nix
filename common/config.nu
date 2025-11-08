$env.CARAPACE_BRIDGES = "fish,bash"
$env.GPG_TTY = (tty)

let carapace_completer = {|spans: list<string>|
    carapace $spans.0 nushell ...$spans
    | from json
    | if ($in | default [] | where value =~ '^-.*ERR$' | is-empty) { $in } else { null }
}


let zoxide_completer = {|spans: list<string>|
    $spans
    | skip 1
    | zoxide query -l ...$in
    | lines
    | where {|x| $x != $env.PWD}
}

let multi_completer = {|spans: list<string>|
    match $spans.0 {
        s | si => $zoxide_completer
        _ => $carapace_completer
    } | do $in $spans
}

$env.config = {
    show_banner: false,
    # use_kitty_protocol: true
    bracketed_paste: true

    completions: {
        case_sensitive: false
        quick: true
        partial: true

        # Can be "prefix" or "fuzzy".
        algorithm: "prefix"
        external: {
            enable: true 
            max_results: 1000
            completer: $multi_completer
        }
    }

    table: {
        mode: "rounded"
    }

    display_errors: {
        exit_code: true
    }

    shell_integration: {
        osc133: false
    }

    history: {
        file_format: 'sqlite'
        max_size: 5_000_000
        isolation: true
        sync_on_enter: true
    }
}

