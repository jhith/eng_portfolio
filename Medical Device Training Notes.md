# Medical Device Internship: Training Notes and Documentation

## Overview

This document is a detailed compilation of technical observations, training logs, and maintenance notes from hands-on biomedical equipment training sessions and field servicing across multiple hospital settings in Sri Lanka. Key devices include the VISULAS YAG III laser, Humphrey Field Analyzer, OPMI Pico microscope, Siemens fluoroscopy units, cath lab equipment, Varian linear accelerators, gamma cameras, and CT imaging systems.

---

## Training Summary

**Location**: Kalubowila Hospital, NHSL, Apeksha Hospital, Lanka Hospital, Army Hospital
**Dates**: June–July 2024
**Devices Covered**:

* VISULAS YAG III (Carl Zeiss)
* HFA3 840 Visual Field Analyzer
* OPMI Pico Microscope
* Siemens Luminos Agile Max Fluoroscopy Unit
* Siemens Cath Lab (Artist zee)
* Varian LINAC (TrueBeam STx)
* Siemens Gamma Camera (E.CAM)
* CT Imaging Systems

---

## VISULAS YAG III – Carl Zeiss

**Type**: Class 4 Nd\:YAG Laser System
**Function**: Non-contact ocular incisions via optical breakdown (photodisruption).

### Key Treatments:

* YAG (1064 nm): Posterior Iridotomy (PI), Posterior Capsulotomy (PC)
* Green (532 nm): Retinal photocoagulation for diabetic retinopathy, vein occlusion

### Core Components:

* **Energy Source**: Flash-tube/diode laser
* **Active Medium**: Nd\:YAG crystal (Yttrium Aluminum Garnet doped with Neodymium)
* **Resonator Cavity**: Optical mirrors (fully/partially reflective)

---

## HFA3 840 – Humphrey Field Analyzer

**Purpose**: Visual field mapping for Glaucoma and retinal disorders.

* Manual testing via dome-based stimulus recognition
* Visual field data generated from patient responses to stimuli
* Light intensity measured in decibels (dB)
* 860 model: Adaptive liquid lens for refractive errors

### Maintenance:

* Lens sets checked
* Alignment and calibration

---

## OPMI Pico Microscope

**Use**: ENT surgical diagnostics and procedures.

### Maintenance Procedures:

* Adjust eyepiece magnification and interpupillary distance
* Clean optical components using Zeiss dry buds and lens solution
* Replace 12V, 100W Philips bulb (50-hour lifespan)

---

## Siemens Luminos Agile Max (Fluoroscopy Unit)

**Technology**: Real-time X-ray imaging with continuous beam for multiple body systems.

### Models:

* Agile Max: X-ray tube under patient bed
* dRF Max: X-ray tube overhead

### Maintenance at NHKDU (June 25, 2024):

* **Issue**: Copper filters not positioning
* **Solution**:

  * Auditory feedback test
  * Collimator housing removed
  * Motor mechanisms lubricated
  * Contacts cleaned with sandpaper + contact cleaner
  * Filters realigned and verified through test imaging

---

## Cath Lab – NHSL Cardiology Unit

**Function**: Imaging for heart diagnostics (angiograms, pacemaker insertion)

### Components:

* Imaging Unit (similar to C-arm/fluoroscopy)
* **Sensis**: Siemens signal sensing unit
* Dual high-voltage output (anode/cathode)
* Cooling systems: Water for X-ray tube; solution for detectors

---

## Gamma Camera – Siemens E.CAM

**Use**: Nuclear imaging using radiotracers

### Components:

* **Scintillator**: NaI or CsI crystal
* **PMTs**: Photomultiplier tubes (×59)
* **Preamps**: Signal amplification for imaging

### Radiotracers:

* Iodine-131: Thyroid diagnostics
* Technetium-99m: Cancer detection

[Reference: UoM Nuclear Medicine Slides](https://uomus.edu.iq/img/lectures21/MUCLecture_2022_81748969.pdf)

---

## Varian Linear Accelerator – TrueBeam STx

**Technology**: Electron acceleration for high-energy X-ray beam for radiotherapy

### Key Features:

* Electron beam targeted at tungsten
* **Klystron** RF amplifier (preferred over magnetron)
* **Waveguide**: RF acceleration
* **Thyratrons**: High-voltage pulse switch
* Detectors aligned with MRI images

### Servicing Notes:

* **July 4**: Carasol/foil errors, calibration using service laptop
* **July 18**: STPS error resolved by voltage checks and sensor realignment
* **July 19**: Backup Motion Control used for detector manual calibration

---

## CT Machines

**Function**: 3D internal imaging using X-ray slices

### New Technologies:

* CdTe (Cadmium Telluride) semiconductor detectors for photon counting
* Superior to scintillator+photodiode systems
* Useful in low-dose imaging, contrast-enhanced scanning

---

## Appendix

### Learnings:

* Importance of ESD safety in high-voltage diagnostics
* Sensor and lens maintenance
* Interdisciplinary coordination in service and diagnostics

---

## License

This repository is for academic and professional reference only. All images and technical documents are copyright of respective manufacturers (Carl Zeiss, Siemens, Varian).
