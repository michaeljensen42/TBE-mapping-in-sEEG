%%% maj_mapping_MASTER_SHARE

% set path to shareable patient data and subfolders

%% SENSORIMOTOR PLOTS (Main file and supplement)

pt = 'JBG'; 
%input patient code here, the options are: 'PAS', 'DIS', 'MNY', 'NMB', 'VLB', 'POC', 'JBG', 
% 'WTG', 'MMU', 'TYL', 'MAT', 'TOS', 'MOM', 'BRB', 'WFR', 'LTG', 'AML'

pt_task = 'mot';

%% load bipolar re-referenced data and the EMG based segmentation

load(['data' filesep pt filesep pt '_dp_stuff_' pt_task])
load(['data' filesep pt filesep pt '_' pt_task '_emg_seg'])

%% calculate power spectra density based on data and segments

 [psds_dp.ps, psds_dp.mps, psds_dp.nps,psds_dp.f,psds_dp.tr_sc]=seeg_trialspectra(dp_data, beh, srate);  

%% calculate r-squared values based on power spectra in move vs rest

 [rvals] =seegmot_stats_submission_mot(psds_dp.nps,psds_dp.f,psds_dp.tr_sc); 
 if exist(['analyzed' filesep pt],'dir')~=7, mkdir(['analyzed' filesep pt]), end
 %save(['analyzed' filesep pt filesep pt '_' pt_task '_rvals_noBon']) % saves the r-squared values for each subject as they are used below

%% plot hand, tongue, and foot activity

 SEEG_brainplot_submission_mot(pt,pt_task, dp_locs, rvals)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% NOUN PRODUCTION PLOTS (Main file and supplement)

pt = 'JBG';
pt_task = 'language_noun';

%% load bipolar re-referenced data and the audio based segmentation

load(['data' filesep pt filesep pt '_dp_stuff_' pt_task])
load(['data' filesep pt filesep pt '_' pt_task '_seg'])

%% calculate power spectra density based on data and segments

[psds_dp.ps, psds_dp.mps, psds_dp.nps,psds_dp.f,psds_dp.tr_sc]=seeg_trialspectra_lang(dp_data, voice, srate);  

%% calculate r-squared values based on power spectra in speech vs rest

[rvals] =seegmot_stats_submission_lang(psds_dp.nps,psds_dp.f,psds_dp.tr_sc); 

%% plot noun and verb activity

SEEG_brainplot_submission_lang(pt,pt_task, dp_locs, rvals)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% VERB GENERATION PLOTS (Main file and supplement)

pt = 'POC';
pt_task = 'language_verb';

%% load bipolar re-referenced data and the audio based segmentation

load(['data' filesep pt filesep pt '_dp_stuff_' pt_task])
load(['data' filesep pt filesep pt '_' pt_task '_seg'])

%% calculate power spectra density based on data and segments

[psds_dp.ps, psds_dp.mps, psds_dp.nps,psds_dp.f,psds_dp.tr_sc]=seeg_trialspectra_lang(dp_data, voice, srate);  

%% calculate r-squared values based on power spectra in speech vs rest

[rvals] =seegmot_stats_submission_lang(psds_dp.nps,psds_dp.f,psds_dp.tr_sc); 

%% plot noun and verb activity

 SEEG_brainplot_submission_lang(pt,pt_task, dp_locs, rvals)

%% PLOT STIMULATION WITH TBM (FIGS 6 - 8)

%% FIGURE 6, SUBJECT 11

pt = 'MAT';
SEEG_brainplot_stim_mot(pt,pt_task,stim_task)


%% FIGURE 7, SUBJECT 3

pt = 'MNY';
SEEG_brainplot_stim_mot(pt,pt_task, stim_task)


%% FIGURE 8, SUBJECT 7

pt = 'POC';
SEEG_brainplot_stim_lang(pt,pt_task, stim_task)





