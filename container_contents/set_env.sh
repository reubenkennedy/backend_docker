# but these are the ones needed to build
export MD_LIB=/tools
export MD_DATA=/data/dqs
export MD_LICENSE="TAtxZ-i8Q5MgYueWsI-hfY**Ysj4RVhol7-QVhpNzJ40bJ**" # expires 2024-05-07
export LD_LIBRARY_PATH=$MD_LIB:$LD_LIBRARY_PATH

export NCOA_LOG=error

export NCOA_LICENSEE_NAME="TECHSAFARI, LLC"
export NCOA_DIR=/data/ncoa/current
#export NCOA_DDEL_DIR="/data/ncoa/ncoaDaily/"
#export NCOA_RPT_DIR="."

export NCOA_CUST_ID="LBGG54151299TSF005"
export NCOA_PLATFORM_ID="LBGG"

export NCOA_PROC_CAT="NORMAL"
#export NCOA_PROC_CAT="STAGE I"
export NCOA_ADD_NOTES=" "
export NCOA_PREPROC_PERF="P"
export NCOA_CONCPROC_PERF="N"
export NCOA_POSTPROC_PERF="N"
export NCOA_STANDOUT_RET="Y"
export NCOA_MATCHLOG_APP="S" # I B, C
export NCOA_DATA_RET="C"
export NCOA_NUM_MONTHS="18"
export NCOA_CLASS_MAIL="F"
export NCOA_SOFT_NAME="MAIL FORWARDING LIBRARY"
export NCOA_SOFT_VER="1.0"
export NCOA_OPERATOR_ID=`whoami`
export NCOA_BUYER_NAME=""
export NCOA_LIST_RECV_DT=`date "+%C%y%m%d"`
export NCOA_LIST_RETN_DT=`date "+%C%y%m%d"`
export NCOA_MAILING_ZIP="30076"
export CASS_SOFTWARE_NAME="ADDRESSOBJECT"

# high match rate
# A - ANKLink Processed file
# S - Stage file
# R - Return Mail file
export NCOA_HIGH_MATCH_RATE="R" # A S

export DPV_SOFT_NAME=${CASS_SOFTWARE_NAME}
export DPV_SOFT_VER=${CASS_SOFTWARE_VER}
export DPV_REL_DT=${CASS_DATA_YYYYMMDD}

# set a bunch of cass version vars for ncoa reporting
if [ -f /tools/dqs_env -a -f /data/address/data/mdAddr.dat ]
then
    eval `/tools/dqs_env`
fi

