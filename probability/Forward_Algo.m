function [Tot_prob] = Forward_Algo(states, start_p, trans_p, emit_p, obs_space, obs_set)

% Part I: Initialization
K = length(states);
T = length(obs_set);
forw = zeros(K, T);
Tot_prob = 0;
for i = 1:K
    idx = contains(obs_space, obs_set(1));
    forw(i, 1) = start_p(i) * emit_p(i, idx);
end

% Part II: Induction into the forward matrix
for t = 2:T
    for j = 1:K
        idx = contains(obs_space, obs_set(t));
        forw(j, t) = emit_p(j, idx) * (trans_p(:, j)' * forw(:, t-1));
    end
end

%Calculate final probability
for i = 1:K
    Tot_prob = Tot_prob + forw(i,T);
end

end
