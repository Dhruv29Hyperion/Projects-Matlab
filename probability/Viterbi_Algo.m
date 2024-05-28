function [bestPathSeq, viterbi_prob, viterbi_path] = Viterbi_Algo(states, start_p, trans_p, emit_p,obs_space, obs_set)

% Part I: Initialization
K = length(states);
T = length(obs_set);
viterbi_prob = zeros(K, T);
viterbi_path = zeros(K, T);
for i = 1:K
    idx = contains(obs_space,obs_set(1));
    viterbi_prob(i,1) = start_p(i) * emit_p(i,idx);
    viterbi_path(i,1) = 0;
end

% Part II: Compute Viterbi probabilities and Viterbi path
for j = 2:T
    for i = 1:K
        [max_prob, max_idx] = max(emit_p(i,contains(obs_space,obs_set(j))) * trans_p(:,i) .* viterbi_prob(:,j-1));
        viterbi_prob(i,j) = max_prob;
        viterbi_path(i,j) = max_idx;
    end
end

% Compute the final state of the most likely path
[~, final_state] = max(viterbi_prob(:,T));
bestPath(T) = final_state;

% Part III: Retracking the most likely path X
for j = T-1:-1:1
    bestPath(j) = viterbi_path(bestPath(j+1), j+1);
end

for i = 1:T
    bestPathSeq(i) = states(bestPath(i));
end




