function [new] = Gauss_Elm(A, b)

    %calculating the number of unknowns
    unwn = length(A);

    %calling the r_e_f function for matrix A and getting its rank
    [~, r1] = r_e_f(A);

    %calling the r_e_f funtion for augmented matrix A | b to get form and rank
    aug = [A b];
    [B, r2] = r_e_f(aug);

    sln = zeros(unwn, 1);

    if (r1 ~= r2) %if the ranks of coeffiecient matrix and augmented matrix aren't equal
        disp("Inconsistent Solution - No Solution");
    elseif (r1 == r2) && (r2 == unwn)
        disp("Consistent Solution - Unique Solution");
        sln(unwn) = B(unwn, unwn + 1) / B(unwn, unwn);

        for i = unwn:-1:1 %to go backwards in list
            sln(i) = (B(i, unwn + 1) - B(i, i + 1:unwn) * sln(i + 1:unwn)) / B(i, i); %performs back substitution from by iterating backward and storing and updating the values as it's used each time
        end

    else
        disp("Consistent Solution - Infinetely Many Solution")
    end

    new = sln;
