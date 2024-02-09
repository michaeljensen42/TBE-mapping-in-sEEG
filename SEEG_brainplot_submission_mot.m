function SEEG_brainplot_submission_mot(pt,pt_task, dp_locs, rvals)
%% load brains, segmentation, and data

    load(['data/' pt filesep pt '_brain'])

%% set parameters for slice plots and rendering angles 

    slicethickness = 10; % thickness of each plotted slice, in mm
    mr_clims=[0 1.1]; % adjusts brightness of plots
    pthresh= 0.01; % defines which rvals are significant
    threshFrac = 0.01; % abs(values) below threshFrac*wmaximum weight are not plotted with color

%% Plot slice of brain image with weighted, unlabelled electrodes
    figsave = 'n';

    wts = rvals.r_foot_HFB.*(rvals.p_foot_HFB<pthresh); % set weights F
    [x_slice, y_slice, z_slice] = seegview_sliceplot(dp_locs, bvol, x, y, z, slicethickness,mr_clims);
    sv_weight_add(dp_locs, wts, x_slice, threshFrac); set(gcf,'Name',[pt ' foot ' pt_task ', sagittal, slice thickness ' num2str(slicethickness) 'mm']);
    sv_weight_add(dp_locs, wts, y_slice, threshFrac); set(gcf,'Name',[pt ' foot ' pt_task ', coronal, slice thickness ' num2str(slicethickness) 'mm']);
    sv_weight_add(dp_locs, wts, z_slice, threshFrac); set(gcf,'Name',[pt ' foot ' pt_task ', axial, slice thickness ' num2str(slicethickness) 'mm']);

    wts = rvals.r_hand_HFB.*(rvals.p_hand_HFB<pthresh); %set weights H
    [x_slice, y_slice, z_slice] = seegview_sliceplot(dp_locs, bvol, x, y, z, slicethickness,mr_clims);
    sv_weight_add(dp_locs, wts, x_slice, threshFrac); set(gcf,'Name',[pt ' hand ' pt_task ', sagittal, slice thickness ' num2str(slicethickness) 'mm']);
    sv_weight_add(dp_locs, wts, y_slice, threshFrac); set(gcf,'Name',[pt ' hand ' pt_task ', coronal, slice thickness ' num2str(slicethickness) 'mm']);
    sv_weight_add(dp_locs, wts, z_slice, threshFrac); set(gcf,'Name',[pt ' hand ' pt_task ', axial, slice thickness ' num2str(slicethickness) 'mm']);



    wts = rvals.r_tongue_HFB.*(rvals.p_tongue_HFB<pthresh); %set weights T
    [x_slice, y_slice, z_slice] = seegview_sliceplot(dp_locs, bvol, x, y, z, slicethickness,mr_clims);
    sv_weight_add(dp_locs, wts, x_slice, threshFrac); set(gcf,'Name',[pt ' tongue ' pt_task ', sagittal, slice thickness ' num2str(slicethickness) 'mm']);
    sv_weight_add(dp_locs, wts, y_slice, threshFrac); set(gcf,'Name',[pt ' tongue ' pt_task ', coronal, slice thickness ' num2str(slicethickness) 'mm']);
    sv_weight_add(dp_locs, wts, z_slice, threshFrac); set(gcf,'Name',[pt ' tongue ' pt_task ', axial, slice thickness ' num2str(slicethickness) 'mm']);

end


