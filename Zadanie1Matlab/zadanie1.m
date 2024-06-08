clear all
close all

a = 200;
r_max = a/2;
n_max = 200;

x = zeros(1,n_max);
y = zeros(1,n_max);
r = zeros(1,n_max);
circle_area = zeros(1,n_max);
number_of_draws = zeros(1,n_max);

n = 1;
DRAWS = 0;
while n <= n_max
    X = rand * a;
    Y = rand * a;
    R = rand * r_max;
    if (X-R>0) && (X+R<a) && (Y-R>0) && (Y+R<a)
        check = 1;
        czy_rozlaczny = 1;
        while check <= n
            distance = sqrt ((x(check) - X)^2 + (y(check) - Y)^2);
            if distance <= r(check) + R
                czy_rozlaczny = 0;
            end
            check = check + 1;
        end
        if czy_rozlaczny == 0
            DRAWS = DRAWS + 1;
        else
            x(n) = X;
            y(n) = Y;
            r(n) = R;
            circle_area(n) = pi*R^2;
            DRAWS = DRAWS + 1;
            number_of_draws(n) = DRAWS;
            DRAWS = 0;
            plot_circle(X, Y, R)
            hold on
            pause(0.01)
            n = n + 1;
        end
    else
        DRAWS = DRAWS + 1;
    end
end

xlabel("x")
ylabel("y")
title("Pęcherzykowy kwadrat")

axis equal
axis([0 a 0 a])

sum_of_areas = cumsum(circle_area);

figure;
plot(sum_of_areas)
xlabel("Liczba narysowanych okręgów")
ylabel("Powierzchnia")
title("Powierzchnia całkowita kół")
print -dpng zadanie1a

sum_of_draws = cumsum(number_of_draws);
average_of_draws = sum_of_draws./(1:200);

figure;
plot(average_of_draws)
xlabel("Liczba narysowanych okręgów")
ylabel("Liczba losowań")
title("Średnia liczba losowań")
print -dpng zadanie1b