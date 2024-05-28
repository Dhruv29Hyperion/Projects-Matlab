function [path] = viterbi(obs, states, start_p, trans_p, emit_p)
% obs: a sequence of observations
% states: a set of states
% start_p: start probabilities
% trans_p: transition probabilities
% emit_p: emission probabilities

% Initialize variables
T = length(obs);
N = length(states);
V = zeros(T,N);
path = zeros(1,T);

% Initialize first observation
V(1,:) = start_p .* emit_p(:,obs(1))';

% Recursion
for t=2:T
    for j=1:N
        [max_prob, prev_state] = max(V(t-1,:) .* trans_p(:,j)');
        V(t,j) = max_prob * emit_p(j,obs(t));
        path(t-1,j) = prev_state;
    end
end

% Termination
[~, path(T)] = max(V(T,:));

% Path backtracking
for t=T-1:-1:1
    path(t) = path(t+1);
end

end
