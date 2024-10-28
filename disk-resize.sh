#!/bin/bash
lsblk
AA=$(lsblk -d -o NAME /dev/nvme[01]n1|tail -1)
echo "S{AA}"
sudo growpart /dev/${AA} 4
sudo lvextend -l +50%FREE /dev/RootVG/rootVol
sudo lvextend -l +50%FREE /dev/RootVG/varVol
sudo xfs_growfs /
sudo xfs_growfs /var
