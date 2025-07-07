---
layout: post
title: "My Experience in Brain-Computer Interface (BCI) Projects"
date: 2025-07-07
project files: https://github.com/jhith/eng_portfolio/tree/BCI-project
categories: [BCI, EEG, MachineLearning]
tags: [BCI, EEG, Brainstorm, PCA, ICA, Python, Biomedical]
author: J E
---

##  My Experience in Brain-Computer Interface (BCI) Projects

Brain-Computer Interfacing (BCI) is an advanced yet increasingly impactful method for extracting biomedical signals from the brain and translating them into control commands for external devices. As a rapidly growing field at the intersection of medicine, neuroscience, and engineering, BCI is making strides in applications such as **autonomous navigation**, **real-time robotic or prosthetic control**, **vehicle dashboard interaction**, and **smart home systems** [1].

###  My Hands-on Journey with EEG and BCI

My first hands-on experience with BCI involved **recording and analyzing my own EEG signals** during a single-frequency time-series experiment using optical stimulation. I used **seven standard gold cup electrodes** applied with conductive gel to record **8 Hz visual evoked potentials**, serving as my introduction to EEG-based brainwave acquisition.

For data visualization and preprocessing, I used **Brainstorm**, a MATLAB-based software that offers a wide suite of tools for EEG/MEG analysis. Even at this initial stage, I learned how crucial it is to manage EEG artifacts—such as **eye blinks**, **muscle movements**, and **power line interference**—before any meaningful decoding could occur.

###  Challenges in EEG Signal Processing

Recording EEG signals from multiple sensors leads to **high-dimensional, noisy data**. EEG signals have a **very low signal-to-noise ratio (SNR)** [2], and they exhibit significant **inter-subject variability** and **non-stationary behavior** [3]. These properties make decoding challenging and demand advanced preprocessing and decoding techniques.

To address this, I used **dimensionality reduction methods** such as:
- **Principal Component Analysis (PCA)**
- **Independent Component Analysis (ICA)**

These techniques not only helped in identifying relevant signal components but also **reduced computational complexity**, enabling more efficient downstream processing.

###  Machine Learning in EEG Decoding

As part of a machine learning research project, I attempted to **reproduce an EEG decoding pipeline** based on a peer-reviewed journal article. I implemented the decoding process using **Python**, applying classification algorithms to the preprocessed EEG data.

Key lessons from this project:
- **Hyperparameter tuning** significantly impacted decoding accuracy.
- **Weight optimization** played a vital role in model convergence.
- Knowledge of **neuroscience dynamics** informed the selection of time windows, frequency bands, and decoding targets.

### My Key Learnings

Here are three important takeaways from my BCI work:

1. **Controlled Data Collection Is Essential**  
   For visual EEG tasks, the setup must eliminate distractions. I used a dark frame to isolate the visual field and placed the blinking LED stimulus directly in the subject’s line of sight.

2. **Preprocessing Saves Time and Resources**  
   Large EEG datasets demand rigorous preprocessing and dimensionality reduction to filter noise and minimize computational load during training.

3. **Decoding Needs Lightweight but Accurate Models**  
   High-performing decoding systems must balance complexity with speed, especially for real-time applications. Model design should be guided by neuroscientific insights into the brain’s signal patterns [3].

### Conclusion

Working with BCI systems has shown me that **signal preprocessing and thoughtful experimental design** are as crucial as the machine learning model itself. By reducing the burden on the model through cleaner, better-prepared data, you enable more accurate, faster, and reliable decoding of EEG signals. This is key for BCI systems to be viable in real-world applications.

####  References

[1] M. Soufineyestani, D. Dowling, and A. Khan, “Electroencephalography (EEG) Technology Applications and Available Devices,” *Applied Sciences*, vol. 10, no. 21, p. 7453, 2020. https://doi.org/10.3390/app10217453  
[2] D. T. Falkner et al., "Improving the signal to noise ratio of event-related EEG signals in high-risk newborns," *25th Biennial Symposium on Communications*, 2010. https://doi.org/10.1109/BSC.2010.5473008  
[3] Pan, Y. T., Chou, J. L., & Wei, C. S. (2022). "MAtt: a manifold attention network for EEG decoding." *Advances in Neural Information Processing Systems*, 35, 31116–31129.
