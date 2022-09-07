function routh(pol)
    %% Show Polynomial
    poly2sym(pol)
    
    %% Building Routh Table
    order = length(pol);
    cols = floor((order+1)/2);
    Table = zeros(order, cols);
    stable = false;
    i = 1;
    
    for row = 1:order
        for col = 1:cols
            if row < 3
                r = col;
                c = row;
                Table(r,c) = pol(i);
                i = i + 1;
            else
                if col ~= cols
                    r = row;
                    c = col;
                    Table(r, c) = (Table(row-1,1)*Table(row-2,col+1)-Table(row-2,1)*Table(row-1,col+1))/Table(row-1,1);
                end
            end
        
            if Table(r, 1) < 0
                stable = false;
            end
        end
    end
    
    %% Check the stablity
    if stable
        fprintf('The system is UNSTABLE.\n\n');
    else
        fprintf('The system is STABLE.\n\n');
    end
    
    %% Print Routh Table
    spaces = '           ';
    m = 12;
    if mod(order ,2) == 0
        decrease = 1;
    else
        decrease = 0;
    end

    for r = 1 : order
        if (order-r) > 9
            separator = ' | ';
        else
            separator = '  | ';
        end
        
        fprintf(['s^',num2str(order-r),separator])
        
        for c = 1:cols
            aux = num2str(Table(r,c));
            tam = length(aux);
            left = floor((m-tam)/2);
            rigth = m - tam - left;
            fprintf([spaces(1:left),aux,spaces(1:rigth),' | ']);
        end
        
        fprintf('\n')
        
        if decrease > 0
            decrease = decrease - 1;
        else
            if cols ~= 1
                cols = cols - 1;
            end
            
            decrease = 1;
        end
    end
end