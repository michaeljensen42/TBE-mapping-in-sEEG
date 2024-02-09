function [rvals] = seegmot_stats_submission_lang(nps,f,tr_sc)


%%
    HFB_range=[65:115];
    LFB_range=[8:32];

%%
    num_chans=size(nps,1);
    HFB_trials=squeeze(mean(nps(:,HFB_range,:),2));
    LFB_trials=squeeze(mean(nps(:,LFB_range,:),2));

%% find rest conditions specific to behavior that preceded them
    tr_sc(find(and(tr_sc==0,[0 tr_sc(1:(end-1))]==1)))=10; % rest after speech block
  

%% comparisons - signed r-squared and unpaired t-test
for chan=1:num_chans
    % hand (tr_sc==1)        
        r_voice_HFB(chan)=rsa(HFB_trials(chan,find(tr_sc==1)),HFB_trials(chan,find(tr_sc==10)));
        r_voice_LFB(chan)= rsa(LFB_trials(chan, find(tr_sc==1)), LFB_trials(chan,find(tr_sc==10)));   
        [temp, p_voice_HFB(chan)]=ttest2(HFB_trials(chan,find(tr_sc==1)),HFB_trials(chan,find(tr_sc==10)));
        [temp, p_voice_LFB(chan)]= ttest2(LFB_trials(chan,find(tr_sc==1)), LFB_trials(chan, find(tr_sc==10))); 

end 
disp('hi')

%% wrap into a structure
    rvals.HFB_range=HFB_range;
    rvals.LFB_range=LFB_range;
    
    rvals.HFB_trials=HFB_trials;
    rvals.LFB_trials=LFB_trials;
    
    rvals.r_voice_HFB=r_voice_HFB;
    rvals.r_voice_LFB=r_voice_LFB;
    rvals.p_voice_HFB=p_voice_HFB;
    rvals.p_voice_LFB=p_voice_LFB;
    
end
    
