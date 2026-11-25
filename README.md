<h1 align="center">pydeface</h1>

<p align="center">
  A defaced T1-weighted image, with facial structure removed by pydeface using FSL FLIRT and a face mask template.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.388"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.388-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Removes facial features from a T1-weighted image with pydeface (FSL flirt to a face template) and outputs the defaced T1w.**

Runs pydeface 2.0 on the T1w image, registering a face mask template with FSL flirt using the chosen cost function and zeroing voxels in the face region. Use it to de-identify anatomical data before sharing. Check the result: if registration fails, the face may not be fully removed or brain may be cut; try another cost function.

| | |
|---|---|
| **Inputs** | `neuro/anat/t1w` |
| **Outputs** | `neuro/anat/t1w` |
| **Container** | `brainlife/pydeface:2.0` |
| **Resources** | 8 CPUs · 32 GB memory · 14 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.388](https://doi.org/10.25663/brainlife.app.388) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `t1` | `neuro/anat/t1w` (!defaced) | yes | T1 anatomical image to deface |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/anat/t1w` | T1 anatomical image defaced |

<details>
<summary><b>Parameters</b> (1)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `cost` | enum | `mutualinfo` | flirt cost function to use Options: `mutualinfo`, `corratio`, `normcorr`, `normmi`, `leastsq`, `labeldiff`, `bbr`. |

</details>

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.388](https://doi.org/10.25663/brainlife.app.388), choose a T1-weighted dataset that is not yet tagged `defaced`, pick the FLIRT cost function and press **Execute**. The result is a `neuro/anat/t1w` dataset tagged `defaced`, archived to your project. Defacing is generally used to de-identify anatomical data before sharing it.

[pydeface](https://github.com/poldracklab/pydeface) registers a face mask template to the T1-weighted image with FSL FLIRT, using the cost function you choose (`cost`, default `mutualinfo`; also `corratio`, `normcorr`, `normmi`, `leastsq`, `labeldiff` or `bbr`), and zeroes the voxels inside the face region.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) and [`jq`](https://jqlang.github.io/jq/). pydeface 2.0 and FSL FLIRT run inside the `brainlife/pydeface:2.0` container (built from the `Dockerfile` in this repository).

1. Clone this repository and check out the branch brainlife.io runs: `git checkout 2.0-1`.
2. Create `config.json` with the path to your T1-weighted image and the cost function:

   ```json
   {
       "t1": "/input/anat/t1.nii.gz",
       "cost": "mutualinfo"
   }
   ```

3. Run the App:

   ```bash
   ./main
   ```

## Outputs

```text
output/
└── t1.nii.gz   defaced T1-weighted image
```

## Troubleshooting

- **Face not fully removed, or brain tissue cut away**: the template registration failed. Always inspect the result, and rerun with another `cost` function.

## Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- Gulban OF, Nielson D, Poldrack R, Lee J, Gorgolewski C, Vanessasaurus, Ghosh S. poldracklab/pydeface: v2.0.0. Zenodo (2019). [doi:10.5281/zenodo.3524401](https://doi.org/10.5281/zenodo.3524401)
- Jenkinson M, Smith SM. A global optimisation method for robust affine registration of brain images. *Medical Image Analysis* 5(2):143–156 (2001). [doi:10.1016/S1361-8415(01)00036-6](https://doi.org/10.1016/S1361-8415(01)00036-6)
- pydeface. brainlife.io App. [doi:10.25663/brainlife.app.388](https://doi.org/10.25663/brainlife.app.388)
- Jenkinson et al. FSL. *NeuroImage* 62:782-790 (2012). [doi:10.1016/j.neuroimage.2011.09.015](https://doi.org/10.1016/j.neuroimage.2011.09.015)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Soichi Hayashi

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## License

[MIT](LICENSE). pydeface and FSL are distributed under their own licenses ([pydeface](https://github.com/poldracklab/pydeface), [FSL](https://fsl.fmrib.ox.ac.uk/fsl/fslwiki/Licence)).
