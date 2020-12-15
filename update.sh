#!/bin/bash

sed '/^#/ d'  < /home/integreedy/workspace/buildroot/.config > /home/integreedy/workspace/buildroot/evolation_configs/buildroot_deingena_latest.config

sed '/^#/ d'  < /home/integreedy/workspace/buildroot/output/build/linux-custom/.config > /home/integreedy/workspace/buildroot/evolation_configs/NGjex_deingena_latest.config

git add /home/integreedy/workspace/buildroot/evolation_configs/buildroot_deingena_latest.config

git add /home/integreedy/workspace/buildroot/evolation_configs/NGjex_deingena_latest.config

git commit -m "$1"

git push
