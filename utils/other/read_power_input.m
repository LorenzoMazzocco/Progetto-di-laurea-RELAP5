function [tt, pp] = read_power_input(filepath, first_card)

fileID = fopen(filepath','r');

% Predetermino il numero di lines
tline = fgetl(fileID);
n_lines = 0;
while ischar(tline)
    tline = fgetl(fileID);
    n_lines = n_lines +1;
end

% Salvo ogni line in un'apposita array
fileID = fopen(filepath','r');
lines = string.empty(n_lines,0);
for i=1:n_lines
    tline = fgetl(fileID);
    lines(i) = tline;
end

% Trovo l'indice corrispondente alla prima card (first_card)
for i=1:length(lines)
    words = split(lines(i));
    if strcmp(string(first_card), words(1))
        idx_init = i;
    end
end

% Trovo l'indice corrispondente all'ultima card
for i=idx_init:length(lines)
    words = split(lines(i));
    if strcmp("*", words(1))
        idx_final = i-1;
        break
    end
end

% Leggo i tempi e le corrispondenti potenze
tt = [];
pp = [];

for i=idx_init:idx_final
    words = split(lines(i))
    tt = [tt words(2)];
    pp = [pp words(3)];
end

end