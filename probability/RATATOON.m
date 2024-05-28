%%%%%%%%%%%%%%%%%%%%%%%%%%% START of CODE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%% start of parameters %%%%%%%%%%%%%
nm = 10; % num of males
nf = 10; % num of females
n=nm*nf; % total number of possible pair-ups (combinations)
total_period = 30; % duration of monthly cycle of blind match-ups
match_interval = 3; % this ensures that a match-up happens when the preferred
%dates of a male and female pair is within a day of each other
match_percent = 5; % minimum target match-ups in percentage
req_matchups = ceil(0.01*match_percent*n);% 0.0x*n means atleast x% must be
%matchups
kmax = req_matchups - 1; % the running index for the Poisson heuristic
nmax = 100000; % number of times the computer experiment is conducted
%%%%%%%%%%%%% end of parameters %%%%%%%%%%%%%

match_cnt = 0;
for i=1:nmax
    % RATATOON
    males = ceil(total_period*rand(1,nm)); % list of date preferences by males
    females = ceil(total_period*rand(1,nf));% list of date preferences by females
    [men,women] = meshgrid(males, females);
    pairs = [men(:) women(:)]; % all pair-ups are stored in matrix form
    diff_pairs = mod(abs(pairs(:,1) - pairs(:,2)),total_period); % difference
    % between dates preferred by the male and the female in a pair
    Ans = [diff_pairs pairs]; % concatenating diff_pairs and pairs in one matrix
    matchups = find(Ans(:,1)<=1); % matchups happen if diff_pairs is within one unit
    num_matchups = length(matchups);
    prob_sim_matchups = num_matchups/(n); % this is not really necessary but just for fun to compare with p
    if num_matchups >= req_matchups % this condition calculates the required
        match_cnt = match_cnt + 1; % probability over multiple repetition of the experiment
    else 
        continue;
    end
end
prob_sim_final = match_cnt/nmax; % experimental estimate of the required
% probability poisson heuristic approximation
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
p=(1 - ((total_period - match_interval)/total_period)); % p = 1 - pc
mu = n*p;
k=[0:kmax];
prob = 1-sum(exp(-mu)*(mu.^k)./(factorial(k))); % calculating the required
% probability by using the Poisson heuristic
prob_final = vpa(prob,8); % expressing the answer up to 8 decimal places
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% END of CODE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%