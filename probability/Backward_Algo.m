function [beta] = Backward_Algo(states, trans_p, emit_p, obs_space, obs_set)

% Part I: Initialization
K = length(states);
T = length(obs_set);
beta = zeros(K, T);
beta(:, T) = 1;

% Part II: Induction
for t = T-1:-1:1
    for i = 1:K
        idx = contains(obs_space, obs_set(t+1));
        beta(i, t) = sum(emit_p(:, idx) .* (trans_p(i, :) * beta(:, t+1)));
    end
    %could be normalised to ensure the values sum to 1
    % beta(:, t) = beta(:, t) / sum(beta(:, t));
end

end
