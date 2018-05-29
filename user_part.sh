#!/bin/bash

### We set up the user used to access to the vogsphere

mkdir -p ~/.ssh &&
cat >> ~/.ssh/config << EOF
Host vgs vgs.le-101.fr vgse vgse.le-101.fr vogsphere vogsphere.le-101.fr vogsphere-exam vogsphere-exam.le-101.fr
	User vogsphere
EOF

echo "user part finished, welcome in the freedom !"