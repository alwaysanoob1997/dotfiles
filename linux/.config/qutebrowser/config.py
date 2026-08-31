config.load_autoconfig()
c.editor.command = [
    "ghostty",
    "-e",
    "nvim",
    "{file}",
    "-c",
    "normal {line}G{column0}l",
]

config.bind(",b", "spawn --userscript qute-bitwarden-search-rbw -n")
config.bind(",p", "spawn --userscript qute-bitwarden-search-rbw -wn")
config.bind(",u", "spawn --userscript qute-bitwarden-search-rbw -en")
config.bind(",t", "spawn --userscript qute-bitwarden")

config.bind("co", "set content.proxy socks://127.0.0.1:9050")
config.bind("cO", "set content.proxy system")
