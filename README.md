# 2491_eda
LSHTM 2491 Data Challenge Module - Exploratory Data Analysis

```
      _/_/    _/  _/      _/_/      _/                          _/            
   _/    _/  _/  _/    _/    _/  _/_/            _/_/      _/_/_/    _/_/_/   
      _/    _/_/_/_/    _/_/_/    _/          _/_/_/_/  _/    _/  _/    _/    
   _/          _/          _/    _/          _/        _/    _/  _/    _/     
_/_/_/_/      _/    _/_/_/      _/            _/_/_/    _/_/_/    _/_/_/      
                                 _/_/_/_/_/                              
```

Data on FEV1 contained in this repository is sourced from the [ALA](https://rdrr.io/rforge/ALA/) package. A simple data dictionary is as follows:

| Variable | Type    | Description                                                  | Units  | Type   |
| :------- | :------ | :----------------------------------------------------------- | :----- | :----- |
| `id`     | Factor  | ID label for each participant                                | None   | factor |
| `age`    | Numeric | Age of participant at time of measurement                    | years  | double |
| `height` | Numeric | Height of participant at time of measurement                 | metres | double |
| `FEV1`   | Numeric | Spirometry measurement of lung function, forced exhaled volume in first second | litres | double |

Data are originally from [Dockery et al. (1983)](https://doi.org/10.1164/arrd.1983.128.3.405); this is a random sample of 300 girls living in Topeka, Kansas.

This data, and script file(s), are provided for students in the MSc in Health Data Science module **2491 - Data Challenge** for the purposes of learning exploratory data analysis.
