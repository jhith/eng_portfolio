---
layout: post
title: "What I Learned from Designing a Wrist Pulse-Based Diagnostic System"
date: 2025-07-09 12:00:00 -0400
files: https://github.com/jhith/eng_portfolio/tree/Wrist-pulse-for-diabetes-diagnosis
categories: biomedical signal-processing wearable-tech
---

Wrist pulse–based diagnostic systems aim to detect diseases **non-invasively** by recording and analyzing the mechanical patterns of wrist pulse signals. This project was inspired by diagnostic principles from **Ayurvedic** and **Traditional Chinese Medicine**, where **pulse palpation** is a key tool in assessing internal health.

## System Overview

The system uses **doctor-wearable piezoelectric sensors** that gently rest on the wrist. These analog pulse signals are passed through **basic amplifier and filter circuits** to reduce noise, then digitized using **LabVIEW VIs** and a **DAQ (Data Acquisition) card**.

## Signal Properties and Collection Method

Wrist pulse signals typically lie in the **1–2 Hz** range [1]. Our design included:

- **Low-pass filtering** to eliminate high-frequency artifacts (e.g., power-line noise)  
- **Analog amplification** to boost low-amplitude biological signals  

Inspired by traditional diagnostic methodology, **three sensors** were placed simultaneously across the wrist to record signals from different arterial points—offering a richer dataset for pattern recognition.

### Key Characteristics of Wrist Pulse Signals:

- Low in amplitude  
- Periodic but variable in shape and timing  
- Highly sensitive to motion and sensor placement  

> ![Sensor Placement](../assets/images/sensors-diagram.png)  
> *Wearable piezoelectric sensors on the wrist (left) and the real-time monitoring interface (right) [2]*

## Signal Processing with MATLAB

Once collected, the raw data was analyzed using MATLAB. The key steps included:

- **Baseline wander removal** (to compensate for breathing-induced drift)  
- **Pulse cycle segmentation**  
- **Time- and frequency-domain feature extraction**  
  - Pulse duration, peak amplitude, power spectral density, etc.  
- **Pattern-based classification** for disease mapping  

> ![Segmented Pulse](../assets/images/segmented-pulses.png)  
> *Segmented and averaged wrist pulse signals from three pressure points—traditionally referred to as Vata, Pitta, and Kapha in Ayurveda [2]*


## ⚙Challenges Faced

Building the system presented real-world technical challenges:

- **Motion artifacts** from hand movement or breathing required careful detrending and signal conditioning.
- **Sensor-hand interaction** was unpredictable. A **dampening layer** helped reduce unintended pressure spikes.
- **Electrical noise** was mitigated using **shielded coaxial cables**, lowering parasitic capacitance and improving signal quality.

> ![Processing Pipeline](../assets/images/processing-flowchart.png)  
> *Flowchart of the signal processing pipeline for wrist pulse–based disease diagnosis*



##  What I Learned

This project taught me several lessons in biomedical signal design and embedded system integration:

### 🔹 Good signal acquisition is the foundation
You can’t “fix” a poorly captured signal with filters. Clean capture at the source always outperforms aggressive post-processing.

### 🔹 Feature extraction enables meaningful diagnostics
The quality of interpretation depends entirely on the **features**—like waveform shape, pulse rate variability, or spectral response.

### 🔹 Traditional knowledge can guide modern design
Mapping sensors to Ayurvedic pulse zones added cultural relevance *and* provided valuable diversity in signal morphology.


## Closing Thoughts

Working on this system deepened my understanding of **sensor-hardware interaction**, **real-time noise mitigation**, and the **complexity of biological signals**. More importantly, it showed me how ancient diagnostic wisdom can inspire modern engineering innovations in wearable and non-invasive medical systems.



##  References

1. Umasha, H. E. J., Pulle, H. D. F. R., Nisansala, K. K. R., Ranaweera, R. D. B., & Wijayakulasooriya, J. V. (2019). Ayurvedic Naadi Measurement and Diagnostic System. *2019 14th Conference on Industrial and Information Systems (ICIIS)*, Kandy, Sri Lanka, 52–57. [https://doi.org/10.1109/ICIIS47346.2019.9063271](https://doi.org/10.1109/ICIIS47346.2019.9063271)

2. Umasha, J., Wijayakulasooriya, J., & Ranaweera, R. (2023). High-Dimensional Feature Space for Diabetes Diagnosis and Identification of Diabetic-Sensitive Features in Ayurvedic Nadi Signals. *Current Research in Traditional Medicine, 1*(1), 1–9. [https://doi.org/10.25082/CRTM.2023.01.001](https://doi.org/10.25082/CRTM.2023.01.001)

---
