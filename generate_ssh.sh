#!/bin/bash
echo "SSH Keyen..."
ssh-keygen -o -t rsa -b 4096 -C "ops@contractshark.io"
cat ~/.ssh/id_rsa.pub