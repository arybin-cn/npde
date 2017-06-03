%FE
T=0.5; h=0.001; U0=[1 1]';
A=-[99 7*sqrt(2);7*sqrt(2) 2];

U1=solve_by_abe(h,T,A,U0,1);
U2=solve_by_abe(h,T,A,U0,2);
U3=solve_by_abe(h,T,A,U0,3);
U4=solve_by_leapfrog(h,T,A,U0);
