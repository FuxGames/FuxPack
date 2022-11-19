name := `grep ^name pack.toml | cut -d\  -f3 | tr -d \"`
version := `grep ^version pack.toml | cut -d\  -f3 | tr -d \"`
minecraft := `grep ^minecraft pack.toml | cut -d\  -f3 | tr -d \"`
fabric := `grep ^fabric pack.toml | cut -d\  -f3 | tr -d \"`

instance := `mktemp`
mmcpack := `mktemp`
dir := `mktemp -d`

alias mr := modrinth
alias mm := multimc

modrinth:
        packwiz modrinth export

multimc: modrinth
        sed "s/%version/{{version}}/" instance.cfg | sed "s/%name/{{name}}/" > {{instance}}
        sed "s/%minecraft/{{minecraft}}/" mmc-pack.json | sed "s/%fabric/{{fabric}}/" > {{mmcpack}}
        unzip {{name}}-{{version}}.mrpack -d {{dir}}
        mkdir {{dir}}/{{name}}-{{version}}
        mv {{dir}}/overrides {{dir}}/{{name}}-{{version}}/.minecraft
        mv {{instance}} {{dir}}/{{name}}-{{version}}/instance.cfg
        mv {{mmcpack}} {{dir}}/{{name}}-{{version}}/mmc-pack.json
        home=`pwd` && cd {{dir}} && zip -9r $home/{{name}}-{{version}}.zip {{name}}-{{version}}
