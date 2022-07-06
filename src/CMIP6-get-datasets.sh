#!/bin/bash

# HISTORICAL

module use /g/data/hh5/public/modules
module load conda/analysis3-21.10
module load cdo

<< COMENT
declare -a paths=(
    '/g/data/oi10/replicas/CMIP6/CMIP/AWI/AWI-CM-1-1-MR/historical/r1i1p1f1/Amon/psl/gn/v20181218/'
    '/g/data/oi10/replicas/CMIP6/CMIP/BCC/BCC-CSM2-MR/historical/r1i1p1f1/Amon/psl/gn/v20181126/'
    '/g/data/oi10/replicas/CMIP6/CMIP/CCCma/CanESM5/historical/r1i1p1f1/Amon/psl/gn/v20190429/'
    '/g/data/oi10/replicas/CMIP6/CMIP/EC-Earth-Consortium/EC-Earth3/historical/r1i1p1f1/Amon/psl/gr/v20200310/'
    '/g/data/oi10/replicas/CMIP6/CMIP/EC-Earth-Consortium/EC-Earth3-CC/historical/r1i1p1f1/Amon/psl/gr/v20210113/'
    '/g/data/oi10/replicas/CMIP6/CMIP/EC-Earth-Consortium/EC-Earth3-Veg/historical/r1i1p1f1/Amon/psl/gr/v20200225/'
    '/g/data/oi10/replicas/CMIP6/CMIP/EC-Earth-Consortium/EC-Earth3-Veg-LR/historical/r1i1p1f1/Amon/psl/gr/v20200217/'
    '/g/data/oi10/replicas/CMIP6/CMIP/CAS/FGOALS-f3-L/historical/r1i1p1f1/Amon/psl/gr/v20190927/'
    '/g/data/oi10/replicas/CMIP6/CMIP/NOAA-GFDL/GFDL-CM4/historical/r1i1p1f1/Amon/psl/gr1/v20180701/'
    '/g/data/oi10/replicas/CMIP6/CMIP/NOAA-GFDL/GFDL-ESM4/historical/r1i1p1f1/Amon/psl/gr1/v20190726/'
    '/g/data/oi10/replicas/CMIP6/CMIP/CCCR-IITM/IITM-ESM/historical/r1i1p1f1/Amon/psl/gn/v20191226/'
    '/g/data/oi10/replicas/CMIP6/CMIP/INM/INM-CM4-8/historical/r1i1p1f1/Amon/psl/gr1/v20190530/'
    '/g/data/oi10/replicas/CMIP6/CMIP/INM/INM-CM5-0/historical/r1i1p1f1/Amon/psl/gr1/v20190610/'
    '/g/data/oi10/replicas/CMIP6/CMIP/IPSL/IPSL-CM6A-LR/historical/r1i1p1f1/Amon/psl/gr/v20180803/'
    '/g/data/oi10/replicas/CMIP6/CMIP/NIMS-KMA/KACE-1-0-G/historical/r1i1p1f1/Amon/psl/gr/v20190910/'
    '/g/data/oi10/replicas/CMIP6/CMIP/MIROC/MIROC6/historical/r1i1p1f1/Amon/psl/gn/v20181212/'
    '/g/data/oi10/replicas/CMIP6/CMIP/MPI-M/MPI-ESM1-2-LR/historical/r1i1p1f1/Amon/psl/gn/v20190710/'
    '/g/data/oi10/replicas/CMIP6/CMIP/MRI/MRI-ESM2-0/historical/r1i1p1f1/Amon/psl/gn/v20190222/'
    '/g/data/oi10/replicas/CMIP6/CMIP/NUIST/NESM3/historical/r1i1p1f1/Amon/psl/gn/v20190630/'
)
#MPI-ESM1-2-HR is missing
declare -a model_list=('AWI-CM-1-1-MR' 'BCC-CSM2-MR' 'CanESM5' 'EC-Earth3' 
                       'EC-Earth3-Veg' 'EC-Earth3-CC' 'EC-Earth3-Veg-LR' 
                       'FGOALS-f3-L' 'GFDL-CM4' 'GFDL-ESM4' 'IITM-ESM' 
                       'INM-CM4-8' 'INM-CM5-0' 'IPSL-CM6A-LR' 'KACE-1-0-G' 
                       'MIROC6' 'MPI-ESM1-2-LR' 'MRI-ESM2-0' 'NESM3')

length=${#model_list[@]}
for ((i=0;i<$length;i++)); do

    cdo mergetime ${paths[$i]}/*.nc cmip6/psl_historical_${model_list[$i]}_full.nc 

    cdo sellonlatbox,-180,180,-90,-35 cmip6/psl_historical_${model_list[$i]}_full.nc \
    cmip6/psl_historical_${model_list[$i]}.nc 

    rm cmip6/psl_historical_${model_list[$i]}_full.nc

done
COMENT

# PROJECTION SSP45

#<<COMENT
declare -a paths=(
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/AWI/AWI-CM-1-1-MR/ssp245/r1i1p1f1/Amon/uas/gn/v20190529/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/BCC/BCC-CSM2-MR/ssp245/r1i1p1f1/Amon/uas/gn/v20190314/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CCCma/CanESM5/ssp245/r1i1p1f1/Amon/uas/gn/v20190429/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3/ssp245/r1i1p1f1/Amon/uas/gr/v20200310/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-CC/ssp245/r1i1p1f1/Amon/uas/gr/v20210113/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-Veg/ssp245/r1i1p1f1/Amon/uas/gr/v20200225/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-Veg-LR/ssp245/r1i1p1f1/Amon/uas/gr/v20201123/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CAS/FGOALS-f3-L/ssp245/r1i1p1f1/Amon/uas/gr/v20191013/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NOAA-GFDL/GFDL-CM4/ssp245/r1i1p1f1/Amon/uas/gr1/v20180701/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NOAA-GFDL/GFDL-ESM4/ssp245/r1i1p1f1/Amon/uas/gr1/v20180701/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CCCR-IITM/IITM-ESM/ssp245/r1i1p1f1/Amon/uas/gn/v20200915/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/INM/INM-CM4-8/ssp245/r1i1p1f1/Amon/uas/gr1/v20190603/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/INM/INM-CM5-0/ssp245/r1i1p1f1/Amon/uas/gr1/v20190619/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/IPSL/IPSL-CM6A-LR/ssp245/r1i1p1f1/Amon/uas/gr/v20190119/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NIMS-KMA/KACE-1-0-G/ssp245/r1i1p1f1/Amon/uas/gr/v20191125/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MIROC/MIROC6/ssp245/r1i1p1f1/Amon/uas/gn/v20190627/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MPI-M/MPI-ESM1-2-LR/ssp245/r1i1p1f1/Amon/uas/gn/v20190710/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MRI/MRI-ESM2-0/ssp245/r1i1p1f1/Amon/uas/gn/v20190222/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NUIST/NESM3/ssp245/r1i1p1f1/Amon/uas/gn/v20190731/'
)

declare -a model_list=('AWI-CM-1-1-MR' 'BCC-CSM2-MR' 'CanESM5' 'EC-Earth3' 
                       'EC-Earth3-Veg' 'EC-Earth3-CC' 'EC-Earth3-Veg-LR' 
                       'FGOALS-f3-L' 'GFDL-CM4' 'GFDL-ESM4' 'IITM-ESM' 
                       'INM-CM4-8' 'INM-CM5-0' 'IPSL-CM6A-LR' 'KACE-1-0-G' 
                       'MIROC6' 'MPI-ESM1-2-LR' 'MRI-ESM2-0' 'NESM3')

length=${#model_list[@]}
for ((i=0;i<$length;i++)); do

    cdo mergetime ${paths[$i]}/*.nc cmip6/uas_ssp4.5_${model_list[$i]}_full.nc 

    cdo sellonlatbox,-180,180,-90,-35 cmip6/uas_ssp4.5_${model_list[$i]}_full.nc \
    cmip6/uas_ssp4.5_${model_list[$i]}.nc 

    rm cmip6/uas_ssp4.5_${model_list[$i]}_full.nc

    python3 regridding.py cmip6/uas_ssp4.5_${model_list[$i]}.nc uas 

done
#COMENT

#<<COMENT
declare -a paths=(
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/AWI/AWI-CM-1-1-MR/ssp245/r1i1p1f1/Amon/vas/gn/v20190529/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/BCC/BCC-CSM2-MR/ssp245/r1i1p1f1/Amon/vas/gn/v20190314/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CCCma/CanESM5/ssp245/r1i1p1f1/Amon/vas/gn/v20190429/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3/ssp245/r1i1p1f1/Amon/vas/gr/v20200310/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-CC/ssp245/r1i1p1f1/Amon/vas/gr/v20210113/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-Veg/ssp245/r1i1p1f1/Amon/vas/gr/v20200225/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-Veg-LR/ssp245/r1i1p1f1/Amon/vas/gr/v20201123/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CAS/FGOALS-f3-L/ssp245/r1i1p1f1/Amon/vas/gr/v20191013/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NOAA-GFDL/GFDL-CM4/ssp245/r1i1p1f1/Amon/vas/gr1/v20180701/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NOAA-GFDL/GFDL-ESM4/ssp245/r1i1p1f1/Amon/vas/gr1/v20180701/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CCCR-IITM/IITM-ESM/ssp245/r1i1p1f1/Amon/vas/gn/v20200915/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/INM/INM-CM4-8/ssp245/r1i1p1f1/Amon/vas/gr1/v20190603/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/INM/INM-CM5-0/ssp245/r1i1p1f1/Amon/vas/gr1/v20190619/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/IPSL/IPSL-CM6A-LR/ssp245/r1i1p1f1/Amon/vas/gr/v20190119/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NIMS-KMA/KACE-1-0-G/ssp245/r1i1p1f1/Amon/vas/gr/v20191125/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MIROC/MIROC6/ssp245/r1i1p1f1/Amon/vas/gn/v20190627/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MPI-M/MPI-ESM1-2-LR/ssp245/r1i1p1f1/Amon/vas/gn/v20190710/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MRI/MRI-ESM2-0/ssp245/r1i1p1f1/Amon/vas/gn/v20190222/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NUIST/NESM3/ssp245/r1i1p1f1/Amon/vas/gn/v20190731/'
)

declare -a model_list=('AWI-CM-1-1-MR' 'BCC-CSM2-MR' 'CanESM5' 'EC-Earth3' 
                       'EC-Earth3-Veg' 'EC-Earth3-CC' 'EC-Earth3-Veg-LR' 
                       'FGOALS-f3-L' 'GFDL-CM4' 'GFDL-ESM4' 'IITM-ESM' 
                       'INM-CM4-8' 'INM-CM5-0' 'IPSL-CM6A-LR' 'KACE-1-0-G' 
                       'MIROC6' 'MPI-ESM1-2-LR' 'MRI-ESM2-0' 'NESM3')

length=${#model_list[@]}
for ((i=0;i<$length;i++)); do

    cdo mergetime ${paths[$i]}/*.nc cmip6/vas_ssp4.5_${model_list[$i]}_full.nc 

    cdo sellonlatbox,-180,180,-90,-35 cmip6/vas_ssp4.5_${model_list[$i]}_full.nc \
    cmip6/vas_ssp4.5_${model_list[$i]}.nc 

    rm cmip6/vas_ssp4.5_${model_list[$i]}_full.nc

    python3 regridding.py cmip6/vas_ssp4.5_${model_list[$i]}.nc vas 

done
#COMENT

#<<COMENT
declare -a paths=(
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/AWI/AWI-CM-1-1-MR/ssp245/r1i1p1f1/Amon/psl/gn/v20190529/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/BCC/BCC-CSM2-MR/ssp245/r1i1p1f1/Amon/psl/gn/v20190314/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CCCma/CanESM5/ssp245/r1i1p1f1/Amon/psl/gn/v20190429/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3/ssp245/r1i1p1f1/Amon/psl/gr/v20200310/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-CC/ssp245/r1i1p1f1/Amon/psl/gr/v20210113/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-Veg/ssp245/r1i1p1f1/Amon/psl/gr/v20200225/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-Veg-LR/ssp245/r1i1p1f1/Amon/psl/gr/v20201123/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CAS/FGOALS-f3-L/ssp245/r1i1p1f1/Amon/psl/gr/v20191013/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NOAA-GFDL/GFDL-CM4/ssp245/r1i1p1f1/Amon/psl/gr1/v20180701/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NOAA-GFDL/GFDL-ESM4/ssp245/r1i1p1f1/Amon/psl/gr1/v20180701/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CCCR-IITM/IITM-ESM/ssp245/r1i1p1f1/Amon/psl/gn/v20200915/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/INM/INM-CM4-8/ssp245/r1i1p1f1/Amon/psl/gr1/v20190603/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/INM/INM-CM5-0/ssp245/r1i1p1f1/Amon/psl/gr1/v20190619/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/IPSL/IPSL-CM6A-LR/ssp245/r1i1p1f1/Amon/psl/gr/v20190119/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NIMS-KMA/KACE-1-0-G/ssp245/r1i1p1f1/Amon/psl/gr/v20191125/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MIROC/MIROC6/ssp245/r1i1p1f1/Amon/psl/gn/v20190627/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MPI-M/MPI-ESM1-2-LR/ssp245/r1i1p1f1/Amon/psl/gn/v20190710/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MRI/MRI-ESM2-0/ssp245/r1i1p1f1/Amon/psl/gn/v20190222/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NUIST/NESM3/ssp245/r1i1p1f1/Amon/psl/gn/v20190731/'
)

declare -a model_list=('AWI-CM-1-1-MR' 'BCC-CSM2-MR' 'CanESM5' 'EC-Earth3' 
                       'EC-Earth3-Veg' 'EC-Earth3-CC' 'EC-Earth3-Veg-LR' 
                       'FGOALS-f3-L' 'GFDL-CM4' 'GFDL-ESM4' 'IITM-ESM' 
                       'INM-CM4-8' 'INM-CM5-0' 'IPSL-CM6A-LR' 'KACE-1-0-G' 
                       'MIROC6' 'MPI-ESM1-2-LR' 'MRI-ESM2-0' 'NESM3')

length=${#model_list[@]}
for ((i=0;i<$length;i++)); do

    cdo mergetime ${paths[$i]}/*.nc cmip6/psl_ssp4.5_${model_list[$i]}_full.nc 

    cdo sellonlatbox,-180,180,-90,-35 cmip6/psl_ssp4.5_${model_list[$i]}_full.nc \
    cmip6/psl_ssp4.5_${model_list[$i]}.nc 

    rm cmip6/psl_ssp4.5_${model_list[$i]}_full.nc

    python3 regridding.py cmip6/psl_ssp4.5_${model_list[$i]}.nc psl 

done
#COMENT

# PROJECTION SSP85

<< COMENT
declare -a paths=(
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/AWI/AWI-CM-1-1-MR/ssp585/r1i1p1f1/Amon/psl/gn/v20190529'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/BCC/BCC-CSM2-MR/ssp585/r1i1p1f1/Amon/psl/gn/v20190314'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CCCma/CanESM5/ssp585/r1i1p1f1/Amon/psl/gn/v20190429'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3/ssp585/r1i1p1f1/Amon/psl/gr/v20200310'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-CC/ssp585/r1i1p1f1/Amon/psl/gr/v20210113'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-Veg/ssp585/r1i1p1f1/Amon/psl/gr/v20200225'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/EC-Earth-Consortium/EC-Earth3-Veg-LR/ssp585/r1i1p1f1/Amon/psl/gr/v20201201'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CAS/FGOALS-f3-L/ssp585/r1i1p1f1/Amon/psl/gr/v20191013'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NOAA-GFDL/GFDL-CM4/ssp585/r1i1p1f1/Amon/psl/gr1/v20180701/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NOAA-GFDL/GFDL-ESM4/ssp585/r1i1p1f1/Amon/psl/gr1/v20180701/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/CCCR-IITM/IITM-ESM/ssp585/r1i1p1f1/Amon/psl/gn/v20200915/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/INM/INM-CM4-8/ssp585/r1i1p1f1/Amon/psl/gr1/v20190603/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/INM/INM-CM5-0/ssp585/r1i1p1f1/Amon/psl/gr1/v20190724/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/IPSL/IPSL-CM6A-LR/ssp585/r1i1p1f1/Amon/psl/gr/v20190903/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NIMS-KMA/KACE-1-0-G/ssp585/r1i1p1f1/Amon/psl/gr/v20190920/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MIROC/MIROC6/ssp585/r1i1p1f1/Amon/psl/gn/v20190627/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MPI-M/MPI-ESM1-2-LR/ssp585/r1i1p1f1/Amon/psl/gn/v20190710/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/MRI/MRI-ESM2-0/ssp585/r1i1p1f1/Amon/psl/gn/v20191108/'
    '/g/data/oi10/replicas/CMIP6/ScenarioMIP/NUIST/NESM3/ssp585/r1i1p1f1/Amon/psl/gn/v20190728/'
)
#MPI-ESM1-2-HR is missing
declare -a model_list=('AWI-CM-1-1-MR' 'BCC-CSM2-MR' 'CanESM5' 'EC-Earth3' 
                       'EC-Earth3-Veg' 'EC-Earth3-CC' 'EC-Earth3-Veg-LR' 
                       'FGOALS-f3-L' 'GFDL-CM4' 'GFDL-ESM4' 'IITM-ESM' 
                       'INM-CM4-8' 'INM-CM5-0' 'IPSL-CM6A-LR' 'KACE-1-0-G' 
                       'MIROC6' 'MPI-ESM1-2-LR' 'MRI-ESM2-0' 'NESM3')

length=${#model_list[@]}
for ((i=0;i<$length;i++)); do

    cdo mergetime ${paths[$i]}/*.nc cmip6/psl_ssp8.5_${model_list[$i]}_full.nc 

    cdo sellonlatbox,-180,180,-90,-35 cmip6/psl_ssp8.5_${model_list[$i]}_full.nc \
    cmip6/psl_ssp8.5_${model_list[$i]}.nc 

    rm cmip6/psl_ssp8.5_${model_list[$i]}_full.nc

done
COMENT