lang en_US
text
keyboard us
timezone America/New_York --isUtc
# Reboot after installation
reboot
#Root password
rootpw "password"
url --url=http://mirrors.mit.edu/centos/7/os/x86_64/
repo --name=epel --baseurl=http://download.fedoraproject.org/pub/epel/7/x86_64/
bootloader --location=mbr --append="rhgb quiet crashkernel=auto"
services --disabled=NetworkManager --enabled=network 
network --bootproto=dhcp --onboot=on --noipv6 

autopart --type=lvm
zerombr
# Partition clearing information
clearpart --drives=sda --all
selinux --disabled
firewall --disabled
firstboot --disable

%packages
@base
#epel-release
%end

%post  --log=/var/log/my-post-log
echo "################################"
echo "# Running Post Configuration   #"
echo "################################"
hostnamectl set-hostname $(dig -x $(ifconfig | grep inet | grep 172 | awk '{print $2}') +short)
yum -y install epel-release
curl http://172.16.0.1:8081/set_default/$(hostname -s)
mkdir -p /root/.ssh/
cat <<EOF >> /root/.ssh/authorized_keys
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVDWjBfXJjJ4zOlnJoiRW39xK5VtmippAkpitq6NYlkDSprIuwjQAIvbETvlyV2cU+6CkQHoWSx2qSSXBHWSdkt4vEFu1/DRpegG6OyrNiTKNc1Q9G/aP2plC4/pf+wKaexfiXkL8gjKxRvsLqtNxwiBWX7iJQstBGJ1uqfGbskgS9KpmiJ63PSFlp6vYXzRQVbsdPT0VxkWF6xi1b5dFUHTqOmBhVO11IPtHSys8EZDJ05tiQWrbH8Z0ejvpkGzB+SSbgpikmys71gz6NyHNEd8uyGyWq1UUez/qj+gXbyOFfB1lAhaUjuHn+RpFQXUvS8G5sQymnvtcGdn9fP6BJ root@admin.home
EOF

cat <<EOF >> /etc/profile.d/squid.sh
export http_proxy=http://admin.internal.cluster:3128
EOF

sed -i 's/enabled=1/enabled=0/g' /etc/yum.repos.d/epel*
/usr/bin/yum -y install --enablerepo=epel -y tmux salt-minion
chkconfig salt-minion on
salt-call state.highstate 
%end
