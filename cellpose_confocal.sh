#!/bin/bash

#conda init bash

#conda deactivate

#cd /lab/jain_lab/Pushkal/Trial
. /nfs/apps/test/conda_test/start_test_conda  
conda activate cellpose
cellpose --help


python -m cellpose --dir /lab/jain_imaging/Pushkal/20230513_IR_sensor_Degron_trial1/24h_DFMO/focus/mCherry --pretrained_model cyto --chan 1 --diameter 250 --flow_threshold 0.8 --cellprob_threshold -3 --save_tif --fast_mode --no_npy
