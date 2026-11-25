# app-pydeface

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

**Removes facial features from a T1-weighted image with pydeface (FSL flirt to a face template) and outputs the defaced T1w.**

Runs pydeface 2.0 on the T1w image, registering a face mask template with FSL flirt using the chosen cost function and zeroing voxels in the face region. Use it to de-identify anatomical data before sharing. Check the result: if registration fails, the face may not be fully removed or brain may be cut; try another cost function.

Run it on brainlife.io: [https://doi.org/10.25663/brainlife.app.388](https://doi.org/10.25663/brainlife.app.388)

| Input | Datatype | Required | Description |
|---|---|---|---|
| `t1` | `neuro/anat/t1w` (!defaced) | yes | T1 anatomical image to deface |

| Output | Datatype | Description |
|---|---|---|
| `output` | `neuro/anat/t1w` | T1 anatomical image defaced |

| Parameter | Type | Default | Description |
|---|---|---|---|
| `cost` | enum | `mutualinfo` | flirt cost function to use Options: `mutualinfo`, `corratio`, `normcorr`, `normmi`, `leastsq`, `labeldiff`, `bbr`. |

Runtime: container `brainlife/pydeface:2.0`; 8 CPUs; 32 GB memory; 14 h walltime.

<!-- brainlife-app:end -->

Brainlife wrapper for poldracklab/pydeface - MRI defacing App based on flirt and face template mask
