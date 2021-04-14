SHORT_Q=''
SHORT_Q_MEM=''
SHORT_Q_OPTS='-V -jc pcc-normal.168h'

LONG_Q=''
LONG_Q_MEM=''
LONG_Q_OPTS='-V -jc pcc-large'
#LONG_Q_OPTS='-V -jc pcc-skl'

GPU_Q=''
GPU_Q_MEM=''
GPU_Q_OPTS='-V -jc pcc-normal.168h'

export EXECUTOR='sge'
export SHORT_Q
export SHORT_Q_MEM
export SHORT_Q_OPTS
export LONG_Q
export LONG_Q_MEM
export LONG_Q_OPTS
