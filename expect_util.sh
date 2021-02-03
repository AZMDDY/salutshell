# --------------------------------------------------------------------------- #
# ssh自动登录(需要安装expect)
# Parameter1: 用户名
# Parameter2: IP地址
# Parameter3: 密码
# output: None
# return: None
# --------------------------------------------------------------------------- #
function autossh() {
    local user=$1
    local ip=$2
    local passwd=$3
    /usr/bin/expect <<-EOF
    set timeout 10
    spawn ssh $user@$ip
    expect {
        "yes/no" { send "yes\n"; exp_continue }
        "password" { send "$passwd\n" }
    }
    expect eof
EOF
}