to reinstall a node 

```
salt 'admin*' state.sls  tftpd.generate_bootfile pillar='{"reinstallnode": "compute1"}' 

```
