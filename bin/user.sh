#!/bin/bash
# ldapadd -x -D cn=Manager,dc=cm,dc=cluster -W -f foo.ldif
USER_NAME=$1
THE_EMAIL=$2
LDIFFILE="${USER_NAME}.ldif"
TOPUID=$(getent passwd | awk -F: '{ print $3 }' | egrep '11[0-9]{6}' | sort -n | tail -1)
PUID=$(hesinfo $USER_NAME passwd | awk -F: '{print $3}')  2> /dev/null

if [ -z "$PUID" ] ; then
      if [ -z "$TOPUID" ]; then
             PUID=11000000
     else
             PUID=$(($TOPUID + 1))
     fi
fi


echo "dn: cn=${USER_NAME},ou=People,dc=cm,dc=cluster" >> ${LDIFFILE}
echo "uid: ${USER_NAME}" >> ${LDIFFILE}
echo "objectClass: inetOrgPerson" >> ${LDIFFILE}
echo "objectClass: posixAccount" >> ${LDIFFILE}
echo "objectClass: shadowAccount" >> ${LDIFFILE}
echo "objectClass: person" >> ${LDIFFILE}
echo "loginShell: /bin/bash" >> ${LDIFFILE}
echo "uidNumber: ${PUID}" >> ${LDIFFILE}
echo "gidNumber: ${PUID}" >> ${LDIFFILE}
#echo "cn: ${USER_NAME}" >> ${LDIFFILE}
echo "homeDirectory: /net/admin/data/home/${USER_NAME}" >> ${LDIFFILE}
echo "sn: ${USER_NAME}" >> ${LDIFFILE}
echo "mail: ${THE_EMAIL}" >> ${LDIFFILE}
echo "" >> ${LDIFFILE}
echo dn: cn=${USER_NAME},ou=Group,dc=cm,dc=cluster >> ${LDIFFILE}
echo objectClass: top >> ${LDIFFILE}
echo objectClass: posixGroup >> ${LDIFFILE}
echo cn: ${USER_NAME} >> ${LDIFFILE}
echo gidNumber: ${PUID} >> ${LDIFFILE}
echo memberUid: ${USER_NAME} >> ${LDIFFILE}
echo "" >> ${LDIFFILE}
