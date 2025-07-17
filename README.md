# eng_portfolio

Welcome! This branch contains selected my EEG project for machine learning during graduate studies. 

## Other Projects

- Wrist pulse for diabetes diagnosis (MATLAB)
- BCI project - Machine Learning (Python)
- [CMOS Inverter Design](link)
- FPGA with VHDL(Link)
- [Biomedical DAQ Interface (LabVIEW)](link)
- C programming


## Blog Posts

Blog drafts and writeups are in `/BlogDrafts`. Final posts will be published on my portfolio site.

## Instructions on running the code Project_mAtt.py


1. Dataset : BCI-IV-2a : https://www.bbci.de/competition/iv/ 
Contains .mat files with 18 mat files, 2 for each subject.
Following is the google drive link for the tested data set if needed.
https://drive.google.com/drive/folders/1uTDfZ8oafyPoXsAuxONYJueaMYtLAvjk?usp=sharing

2. Mount drive with dataset in .mat format

3. Change the data path(line 102) and best_model_path (where model is saved)(line 104) in line no pick the subject number between 1-9 (line 103)

4. Change learning rate, number of iterations, weigh decay if needed. (line 566 and 670)
Other parameters are set by following the instructions in the paper.
All parameters set to the values set in the testing of the code.
(400 iterations took 1 hour and 23 minutes)

5. Run the code in the order.

