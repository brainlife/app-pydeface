
FROM brainlife/dipy:1.1.1

RUN pip3 install pydeface
RUN apt install -y libopenblas-base

ADD fsl /fsl

ENV FSLDIR=/fsl
ENV FSLOUTPUTTYPE=NIFTI_GZ
ENV PATH=$PATH:/fsl

#RUN ldd /fsl/flirt
CMD ["/usr/local/bin/pydeface"]
