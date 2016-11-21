from bottle import route, run, template
import subprocess

@route('/set_default/<name>')
def index(name):
#    return template('<b>Hello {{name}}</b>!', name=name)
    rm_cmd="/usr/bin/salt 'admin*' state.sls    tftpd.set_default_boot pillar='{\"default\": \"" +name +"\"}'"
    return '<pre>%s</pre>'%subprocess.Popen(rm_cmd,stdout=subprocess.PIPE,shell=True).communicate()[0]
#    rm_cmd='rm /var/lib/tftpboot/pxelinux.cfg/01-*'
#    rm=subprocess.Popen(rm_cmd,stdout=subprocess.PIPE,shell=True)
run(host='0.0.0.0', port=8081)

