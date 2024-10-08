% Author: Yevhenii Kovryzhenko / yzk0058@auburn.edu
% Date: 2024-09-01
% Assignment Name: hw00

% The following class defines 3 functions for each problem respectively.
% Please follow the instruction inside each function. 

classdef hw00 
    methods (Static)

        function a_m = p1(m)
            % This function takes an integer m and returns the term a_m in the sequence defined by 
            % a_0 = 0, a_1 = 1, a_2 = 1, and a_n = a_{n-1} + a_{n-2} + a_{n-3} for n >= 3.
            % :param m: an integer
            % :return: the m-th term in the sequence

            if m < 0
                error('m must be a non-negative integer')
            else 
                a_0 = 0;
                a_1 = 1;
                a_2 = 1;
                
                switch m
                    case 0
                        a_m = a_0;
                    case 1
                        a_m = a_1;
                    case 2
                        a_m = a_2;
                    case 3
                        a_m = a_2 + a_1 + a_0;
                    otherwise
                        for i = 3:m
                            a_m = a_2 + a_1 + a_0;
                            a_0 = a_1;
                            a_1 = a_2;
                            a_2 = a_m;
                        end
                end
            end

        end

        function det_A = p2(A)
            % This function takes a matrix A of size n x n and returns the determinant of A.
            % :param A: a matrix of size n x n
            % :return: the determinant of A

            if size(A,1) ~= size(A,2)
                error('A must be a square matrix')
            else
                n = length(A);
                if n > 1
                    det_A = 0;
                    ids = 1:n;
                    for i = 1:n
                        Ai1 = A(i,1);
                        if Ai1 ~= 0
                            Bi1 = A(ids~=i,2:end);
                            det_A = det_A + (-1)^(i+1)*Ai1*hw00.p2(Bi1);
                        end
                    end
                else
                    det_A = A;
                end
            end
        end

        function p3()
            % This function should have a run time about 1 second.
            % :return: no returns

            % Write your code here
            pause(1)
        end
    end
end
