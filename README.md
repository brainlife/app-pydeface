[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.388-blue.svg)](https://doi.org/10.25663/brainlife.app.388)

# app-pydeface
Brainlife wrapper for poldracklab/pydeface - Magnetic Resonance Imaging (MRI) defacing App. In particular, this App removes facial structure from a T1 anatomical image using the FLIRT algorithm and a mask template (the operation is generally used for data anonimization). You can specify the cost function to be used from the FLIRT algorithm.

### Authors
- [Soichi Hayashi](hayashis@iu.edu)

### Funding Acknowledgement
brainlife.io is publicly funded and for the sustainability of the project it is helpful to Acknowledge the use of the platform. We kindly ask that you acknowledge the funding below in your publications and code reusing this code.

[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### Reference 
[pydeface](https://github.com/poldracklab/pydeface)

### Citations
We kindly ask that you cite the following articles when publishing papers and code using this code:

1. Omer Faruk Gulban, Dylan Nielson, Russ Poldrack, john lee, Chris Gorgolewski, Vanessasaurus, & Satrajit Ghosh. (2019, October 31). poldracklab/pydeface: v2.0.0 (Version v2.0.0). Zenodo. http://doi.org/10.5281/zenodo.3524401

2. M. Jenkinson and S.M. Smith. A global optimisation method for robust affine registration of brain images. Medical Image Analysis, 5(2):143-156, 2001. https://doi.org/10.1016/S1361-8415(01)00036-6

3. Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019). [https://doi.org/10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Running the App 

### On Brainlife.io

You can submit this App online at [https://doi.org/10.25663/bl.app.388](https://doi.org/10.25663/bl.app.388) via the "Execute" tab.

### Running Locally (on your machine)

1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files.

```json
{
        "t1": "./input/anat/t1.nii.gz",
	      "cost": "mutualinfo"
}
```

3. Launch the App by executing `main`

```bash
./main
```

### Output
The main output of this App is a file called `t1.nii.gz`, which is the defaced T1.

### Dependencies

This App only requires [singularity](https://www.sylabs.io/singularity/) to run. If you don't have singularity, you will need to install following dependencies.  

  - FSL: https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/FSL
  - Python 3: https://www.python.org/downloads/
  - NumPy: https://numpy.org/
  - NiBabel: https://nipy.org/nibabel/
  - Nipype: https://nipype.readthedocs.io/en/latest/

#### MIT Copyright (c) 2020 brainlife.io The University of Texas at Austin and Indiana University
