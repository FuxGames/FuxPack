name := `grep ^name pack.toml | cut -d\  -f3 | tr -d \"`
version := `grep ^version pack.toml | cut -d\  -f3 | tr -d \"`
minecraft := `grep ^minecraft pack.toml | cut -d\  -f3 | tr -d \"`
fabric := `grep ^fabric pack.toml | cut -d\  -f3 | tr -d \"`

dir := `mktemp -d`

default: splash modrinth autoupdate

splash:
        "-i" config/isxander-main-menu-credits.json sed -E "s/{{name}} [0-9.]+/{{name}} {{version}}/"
        packwiz refresh

alias mr := modrinth
alias au := autoupdate

modrinth: splash
        packwiz modrinth export

autoupdate: splash
        mkdir -p {{dir}}/{{name}}AU/.minecraft
        sed "s/%name/{{name}}/" instance.au.cfg > {{dir}}/{{name}}AU/instance.cfg
        sed "s/%minecraft/{{minecraft}}/" mmc-pack.json | sed "s/%fabric/{{fabric}}/" > {{dir}}/{{name}}AU/mmc-pack.json
        curl -Lo {{dir}}/{{name}}AU/.minecraft/packwiz-installer-bootstrap.jar https://github.com/packwiz/packwiz-installer-bootstrap/releases/download/v0.0.3/packwiz-installer-bootstrap.jar
        home=`pwd` && cd {{dir}} && rm -f $home/{{name}}AU.zip && zip -X9r $home/{{name}}AU.zip {{name}}AU

clean:
        rm -f *.zip *.mrpack
