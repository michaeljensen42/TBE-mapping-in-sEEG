function sv_weight_add_stim(locs, plot_wts, slice, threshFrac, stim_wts)
    
    if nargin < 4, threshFrac = 0.01; end % abs(values) below threshFrac*wm deemed not significant

    plot_wts(isnan(plot_wts)) = 0;
    
    %% scale to maximum across slices
    wm=max(abs(plot_wts));

    %% plotting add - cycle through slices
    for k=1:length(slice.values)    
        axes(slice.ha(k))
        tmp_inds = slice.locs==k;
        sv_weight_ax(locs(tmp_inds,slice.perm), plot_wts(tmp_inds), wm, threshFrac, stim_wts(tmp_inds))
    end
end
    
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%    
function sv_weight_ax(els, wts, wm, threshFrac, stim_wts)

msize = 6;

%%
% wm=max(abs(wts));
els(isnan(els))=0;
pthresh = threshFrac*wm;

%% plot weights
   hold on
    for q=1:size(els,1)% add activity colorscale
%         if abs(els(q,3)-k)<3 % plot only those near current slice
            if abs(wts(q))<=pthresh % not significant
                % circle w border

                if stim_wts(q) == 0
                plot(els(q,1),els(q,2),'o',...
                'MarkerSize',msize-1,...
                'LineWidth',.01,...
                'MarkerEdgeColor',.98*[1 1 1],...
                'MarkerFaceColor',.98*[1 1 1])  

                    hold on;
                    plot(els(q,1),els(q,2),'o',...
                    'MarkerSize',msize+(wm*(msize)),...
                    'LineWidth',1,...
                    'MarkerEdgeColor',[0.8 0.8 0.8])

                elseif stim_wts(q) == 1
                plot(els(q,1),els(q,2),'o',...
                'MarkerSize',msize-1,...
                'LineWidth',0.01,...
                'MarkerEdgeColor',.98*[1 1 1],...
                'MarkerFaceColor',.98*[1 1 1])  

                    hold on;
                    plot(els(q,1),els(q,2),'o',...
                    'MarkerSize',msize+(wm*(msize)),...
                    'LineWidth',2,...
                    'MarkerEdgeColor',[0 1 0])

                elseif stim_wts(q) == 2
                plot(els(q,1),els(q,2),'o',...
                'MarkerSize',msize-1,...
                'LineWidth',0.01,...
                'MarkerEdgeColor',.98*[1 1 1],...
                'MarkerFaceColor',.98*[1 1 1]) 

                    hold on; 
                    plot(els(q,1),els(q,2),'o',...
                    'MarkerSize',msize+(wm*(msize)),...
                    'LineWidth',2,...
                    'MarkerEdgeColor',[0 0 1])

                end

            elseif wts(q)>=pthresh
                % white circle
                if stim_wts(q) == 0
                    
                    
                    hold on;
                    plot(els(q,1),els(q,2),'o',...
                    'MarkerSize',msize+(abs(wts(q))*(msize)),...
                    'LineWidth',.01,...
                    'MarkerEdgeColor',.99*[1 1-wts(q)/wm 1-wts(q)/wm],...
                    'MarkerFaceColor',.99*[1 1-wts(q)/wm 1-wts(q)/wm])
                    
                        hold on;
                        plot(els(q,1),els(q,2),'o',...
                        'MarkerSize',msize+(wm*(msize)),...
                        'LineWidth',1,...
                        'MarkerEdgeColor',[0.8 0.8 0.8])

                elseif stim_wts(q) == 1
    
                    hold on;
                    plot(els(q,1),els(q,2),'o',...
                    'MarkerSize',msize+(abs(wts(q))*(msize)),...
                    'LineWidth',.01,...
                    'MarkerEdgeColor',.99*[1 1-wts(q)/wm 1-wts(q)/wm],...
                    'MarkerFaceColor',.99*[1 1-wts(q)/wm 1-wts(q)/wm])

                        hold on;
                        plot(els(q,1),els(q,2),'o',...
                        'MarkerSize',msize+(wm*(msize)),...
                        'LineWidth',2,...
                        'MarkerEdgeColor',[0 0 1])

                elseif stim_wts(q) == 2

                    hold on;
                    plot(els(q,1),els(q,2),'o',...
                    'MarkerSize',msize+(abs(wts(q))*(msize)),...
                    'LineWidth',.01,...
                    'MarkerEdgeColor',.99*[1 1-wts(q)/wm 1-wts(q)/wm],...
                    'MarkerFaceColor',.99*[1 1-wts(q)/wm 1-wts(q)/wm])

                        hold on; 
                        plot(els(q,1),els(q,2),'o',...
                        'MarkerSize',msize+(wm*(msize)),...
                        'LineWidth',2,...
                        'MarkerEdgeColor',[0 1 0])
    

                end

            elseif wts(q)<=(-pthresh)
                % white circle

                if stim_wts(q) == 0

                    hold on;
                    plot(els(q,1),els(q,2),'o',...
                    'MarkerSize',msize+(abs(wts(q))*(msize)),...
                    'LineWidth',.01,...
                    'MarkerEdgeColor',.99*[1+wts(q)/wm 1+wts(q)/wm 1],...
                    'MarkerFaceColor',.99*[1+wts(q)/wm 1+wts(q)/wm 1])

                        hold on;
                        plot(els(q,1),els(q,2),'o',...
                        'MarkerSize',msize+(wm*(msize)),...
                        'LineWidth',1,...
                        'MarkerEdgeColor',[0.8 0.8 0.8])

                elseif stim_wts(q) == 1

                    hold on;
                    plot(els(q,1),els(q,2),'o',...
                    'MarkerSize',msize+(abs(wts(q))*(msize)),...
                    'LineWidth',.01,...
                    'MarkerEdgeColor',.99*[1+wts(q)/wm 1+wts(q)/wm 1],...
                     'MarkerFaceColor',.99*[1+wts(q)/wm 1+wts(q)/wm 1])

                        hold on; 
                        plot(els(q,1),els(q,2),'o',...
                        'MarkerSize',msize+(wm*(msize)),...
                        'LineWidth',2,...
                        'MarkerEdgeColor',[0 0 1])

                elseif stim_wts(q) == 2

                    hold on;
                    plot(els(q,1),els(q,2),'o',...
                    'MarkerSize',msize+(abs(wts(q))*(msize)),...
                    'LineWidth',.01,...
                    'MarkerEdgeColor',.99*[1+wts(q)/wm 1+wts(q)/wm 1],...
                    'MarkerFaceColor',.99* [1+wts(q)/wm 1+wts(q)/wm 1])

                        hold on;
                        plot(els(q,1),els(q,2),'o',...
                        'MarkerSize',msize+(wm*(msize)),...
                        'LineWidth',2,...
                        'MarkerEdgeColor',[0 1 0])

                end

            end
    end

end
        %'MarkerSize',msize*abs(min(wts(q)))/wm+msize,...