function SEEG_brainplot_stim_mot(pt,pt_task, stim_task)


%% load up brains and data
    pthresh = 0.05;

    load(['data' filesep pt filesep pt '_brain'])
    load(['data' filesep pt filesep pt '_dp_stuff_' pt_task])
    load(['data' filesep pt filesep pt '_stim_' stim_task '_elecs'])
    [~, stim_wts] = cort_stim_process(elecs, pt);
    
    load(['analyzed' filesep pt filesep pt '_' pt_task '_rvals_noBon'])

    if strcmp(stim_task,'mot_foot')
        wts_mot = rvals.r_foot_HFB.*(rvals.p_foot_HFB<pthresh);
    elseif strcmp(stim_task, 'mot_hand')
        wts_mot = rvals.r_hand_HFB.*(rvals.p_hand_HFB<pthresh);
    elseif strcmp(stim_task, 'mot_tongue')
        wts_mot = rvals.r_tongue_HFB.*(rvals.p_tongue_HFB<pthresh);
    end

%% plot setttings
    
    slicethickness = 15;
    mr_clims = [0 1];
    threshFrac = 0.1;

%%
    [x_slice, y_slice, z_slice] = seegview_sliceplot(dp_locs, bvol, x, y, z, slicethickness,mr_clims);
    sv_weight_add_stim(dp_locs, wts_mot, x_slice, threshFrac, stim_wts); set(gcf,'Name',[pt ' ' pt_task ', sagittal, slice thickness ' num2str(slicethickness) 'mm']);
    sv_weight_add_stim(dp_locs, wts_mot, y_slice, threshFrac, stim_wts); set(gcf,'Name',[pt ' ' pt_task ', coronal, slice thickness ' num2str(slicethickness) 'mm']);
    sv_weight_add_stim(dp_locs, wts_mot, z_slice, threshFrac, stim_wts); set(gcf,'Name',[pt ' ' pt_task ', axial, slice thickness ' num2str(slicethickness) 'mm']);

      axes(y_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_stim_mapping_' pt_task '_cor_' num2str(slicethickness) 'mm'],10*[3 2]) 
     axes(z_slice.ha(1)); kjm_printfig(['figs/' pt '/' pt '_stim_mapping_' pt_task '_ax_' num2str(slicethickness) 'mm'],10*[3 2]) 

end
     


