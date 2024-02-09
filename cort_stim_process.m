function [sig_elecs_stimmed, wts] = cort_stim_process(elecs, pt)

    load(['data/' pt filesep pt '_dp_stuff_mot'])
   
    wts = zeros(size(dp_lbls,1),1);
    names = elecs(:,1);
    sig_elecs_stimmed = ismember(dp_lbls,names);
    
        for k = 1:length(dp_lbls)
            for j = 1:length(names)
                if strcmp(names(j), dp_lbls(k)) == 1
                    if str2double(elecs{j,2}) > 0 
                        wts(k) = 2;
                    elseif str2double(elecs{j,2}) == 0 
                        wts(k) = 1;
                    end

                end
            end
        end

end
