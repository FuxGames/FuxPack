name := `grep ^name pack.toml | cut -d\  -f3 | tr -d \"`
version := `grep ^version pack.toml | cut -d\  -f3 | tr -d \"`
minecraft := `grep ^minecraft pack.toml | cut -d\  -f3 | tr -d \"`
fabric := `grep ^fabric pack.toml | cut -d\  -f3 | tr -d \"`

dir := `mktemp -d`

alias mr := modrinth
alias mm := multimc

modrinth:
        packwiz modrinth export

multimc: modrinth
        mkdir {{dir}}/{{name}}-{{version}}
        sed "s/%version/{{version}}/" instance.cfg | sed "s/%name/{{name}}/" > {{dir}}/{{name}}-{{version}}/instance.cfg
        sed "s/%minecraft/{{minecraft}}/" mmc-pack.json | sed "s/%fabric/{{fabric}}/" > {{dir}}/{{name}}-{{version}}/mmc-pack.json
        unzip {{name}}-{{version}}.mrpack -d {{dir}}
        mv {{dir}}/overrides {{dir}}/{{name}}-{{version}}/.minecraft
        home=`pwd` && cd {{dir}} && zip -9r $home/{{name}}-{{version}}.zip {{name}}-{{version}}
