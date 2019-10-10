function [b,count,num,data] = four_ier(n)
%%The Four-ier Transform
%Finds the base in which the input has the most fours.
%For bases with the same number of fours, four_ier returns ten if it is
%one of the bases, or the lowest base.
%Defined for all n greater than or equal to nine.
%
%[b,count,num,data] = four_ier(n) returns b, base in which n has most fours,
%count, number of fours in that base, num, the representation of n in base
%b, and data, number of fours in bases up to n - 4.

validateattributes(n,{'numeric'},{'>=',9});
n = floor(n);

b = 0;
count = 0;
num = n;
data = zeros(1,n-8);
for ii = 5:n-4
    m = sum(vbase(n,ii) == 4);
    data(ii-4) = m;
    if (m > count) || (m == count && ii == 10)
        b = ii;
        count = m;
        num = vbase(n,ii);
    end
end

end