function SEEG_brainplot_stim_lang(pt,pt_task,side)

figsave = 'y';

addpath('/Users/M215487/Documents/WORK/SEEG/toolbox_seeg/seegview');

%% load up brains and data
    pthresh = 0.05;

    load(['/Users/M215487/Documents/WORK/SEEG/brains/' pt '_brain'])
    load(['data' filesep pt filesep pt '_stim_lang_elecs'])
    load(['data' filesep pt filesep pt '_dp_stuff_mot'], 'dp_locs', 'dp_lbls')
    [sig_elecs_stimmed, stim_wts] = cort_stim_process(elecs, pt);
    
    pthresh = 0.05;

    if pt_task == 'language_noun'
        load(['analyzed' filesep pt filesep pt '_' pt_task '_rvals_noBon'])
        wts_noun = (rvals.r_voice_HFB.*(rvals.p_voice_HFB<pthresh))'; 
        wts_verb = [];

    elseif  pt_task == 'language_verb'
        load(['analyzed' filesep pt filesep pt '_' pt_task '_rvals_noBon'])
        wts_verb = (rvals.r_voice_HFB.*(rvals.p_voice_HFB<pthresh))'; 
        wts_noun = [];
    end


%% set parameters for slice plots and rendering angles 

    slicethickness = 15; % thickness of each plotted slice, in mm
    mr_clims=[0 1.1];
    threshFrac = 0.01; % abs(values) below threshFrac*wm deemed not significant
    view_th=-90; view_phi=20;
    pthresh= 0.05;
    
        
%% plot 3D brain rendering with electrodes in acpc space, with activity weights (wts)

%     cortex_label_fig=figure; h2 = ieeg_RenderGifti(cortex); h2.FaceAlpha = 0.2;
%     plotCortexWeights(dp_locs(sig_elecs_stimmed,:), wts, threshFrac);
%     loc_view(20, 90);
%     set(gcf,'color','w')
% 
%     kjm_printfig(['figs/' pt '/' pt '_rendering_elecsStimmed_' num2str(slicethickness) 'mm'],10*[3 2]) 

%% Plot slices of brain image with labelled electrodes
%     
%     [x_slice, y_slice, z_slice] = seegview_sliceplot(dp_locs, bvol, x, y, z, slicethickness, mr_clims, side); 
%     sv_label_add(dp_locs, dp_lbls, x_slice);
%     sv_label_add(dp_locs, dp_lbls, y_slice);
%     sv_label_add(dp_locs, dp_lbls, z_slice);
%     
%     %save canonical view labels
%     figsave = 'y';
%     if figsave=='y'
%         axes(x_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_labels_sag_' num2str(slicethickness) 'mm'],10*[3 2]) 
%         axes(y_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_labels_cor_' num2str(slicethickness) 'mm'],10*[3 2]) 
%         axes(z_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_labels_ax_' num2str(slicethickness) 'mm'],10*[3 2]) 
%     end

%% plot and save slices without electrodes 
    
%      names = elecs(:,1);
%      sig_elecs_stimmed = ismember(dp_lbls,names);

%     [x_slice, y_slice, z_slice] = seegview_sliceplot(dp_locs(sig_elecs_stimmed,:), bvol, x, y, z, slicethickness, mr_clims, side); 
%     sv_label_add(dp_locs(sig_elecs_stimmed,:), dp_lbls(sig_elecs_stimmed,:), x_slice);
%     sv_label_add(dp_locs(sig_elecs_stimmed,:), dp_lbls(sig_elecs_stimmed,:), y_slice);
%     sv_label_add(dp_locs(sig_elecs_stimmed,:), dp_lbls(sig_elecs_stimmed,:), z_slice);

%     figsave = 'y';
%     if figsave=='y'
%         axes(x_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_elecsStimmed_sag' num2str(slicethickness) 'mm'],10*[3 2]) 
%         axes(y_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_elecsStimmed_cor' num2str(slicethickness) 'mm'],10*[3 2]) 
%         axes(z_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_elecsStimmed_ax' num2str(slicethickness) 'mm'],10*[3 2]) 
%     end

%% Plot slice of brain image with weighted, unlabelled electrodes
%     figsave = 'n'; 
% 
%     pthresh = 0.01;
%     
%     [x_slice, y_slice, z_slice] = seegview_sliceplot(dp_locs(sig_elecs_stimmed,:), bvol, x, y, z, slicethickness,mr_clims, side);
%     sv_weight_add_stim(dp_locs(sig_elecs_stimmed,:), wts_verb(sig_elecs_stimmed), x_slice, threshFrac, wts(sig_elecs_stimmed)); set(gcf,'Name',[pt ' ' pt_task ', sagittal, slice thickness ' num2str(slicethickness) 'mm']);
%     sv_weight_add_stim(dp_locs(sig_elecs_stimmed,:), wts_verb(sig_elecs_stimmed), y_slice, threshFrac, wts(sig_elecs_stimmed)); set(gcf,'Name',[pt ' ' pt_task ', coronal, slice thickness ' num2str(slicethickness) 'mm']);
%     sv_weight_add_stim(dp_locs(sig_elecs_stimmed,:), wts_verb(sig_elecs_stimmed), z_slice, threshFrac, wts(sig_elecs_stimmed)); set(gcf,'Name',[pt ' ' pt_task ', axial, slice thickness ' num2str(slicethickness) 'mm']);
% 
%     % save figs
%     if figsave=='y'
%      axes(x_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_stim_mapping_' pt_task '_sag_' num2str(slicethickness) 'mm'],10*[3 2]) 
%      axes(y_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_stim_mapping_' pt_task '_cor_' num2str(slicethickness) 'mm'],10*[3 2]) 
%      axes(z_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_stim_mapping_' pt_task '_ax_' num2str(slicethickness) 'mm'],10*[3 2]) 
%     end


%%
%% Plot slice of brain image with weighted, unlabelled electrodes

    pthresh = 0.01;
    
    if contains(pt_task, 'verb')
        [x_slice, y_slice, z_slice] = seegview_sliceplot(dp_locs, bvol, x, y, z, slicethickness,mr_clims, side);
        sv_weight_add_stim(dp_locs, wts_verb, z_slice, threshFrac, stim_wts); set(gcf,'Name',[pt ' ' pt_task ', axial, slice thickness ' num2str(slicethickness) 'mm']);
        sv_weight_add_stim(dp_locs, wts_verb, x_slice, threshFrac, stim_wts); set(gcf,'Name',[pt ' ' pt_task ', sagittal, slice thickness ' num2str(slicethickness) 'mm']);
        sv_weight_add_stim(dp_locs, wts_verb, y_slice, threshFrac, stim_wts); set(gcf,'Name',[pt ' ' pt_task ', coronal, slice thickness ' num2str(slicethickness) 'mm']);
    elseif contains(pt_task, 'noun')
        [x_slice, y_slice, z_slice] = seegview_sliceplot(dp_locs, bvol, x, y, z, slicethickness,mr_clims, side);
        sv_weight_add_stim(dp_locs, wts_noun, z_slice, threshFrac, stim_wts); set(gcf,'Name',[pt ' ' pt_task ', axial, slice thickness ' num2str(slicethickness) 'mm']);
        sv_weight_add_stim(dp_locs, wts_noun, x_slice, threshFrac, stim_wts); set(gcf,'Name',[pt ' ' pt_task ', sagittal, slice thickness ' num2str(slicethickness) 'mm']);
        sv_weight_add_stim(dp_locs, wts_noun, y_slice, threshFrac, stim_wts); set(gcf,'Name',[pt ' ' pt_task ', coronal, slice thickness ' num2str(slicethickness) 'mm']);
    end

    % save figs
    if figsave=='y'
         axes(x_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_stim_mapping_' pt_task '_sag_' num2str(slicethickness) 'mm'],10*[3 2]) 
         axes(y_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_stim_mapping_' pt_task '_cor_' num2str(slicethickness) 'mm'],10*[3 2]) 
         axes(z_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_stim_mapping_' pt_task '_ax_' num2str(slicethickness) 'mm'],10*[3 2]) 
    end


end
     


