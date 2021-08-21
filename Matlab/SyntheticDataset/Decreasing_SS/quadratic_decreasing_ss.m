function visited_points = quadratic_decreasing_ss(x0, A, b, step_size, nstep_max, mu, sigma)

n = length(x0);
x_t = x0;
visited_x_t = [x_t];
visited_points = [x_t];
visited_gradients = [];
true_gradients = [];
steps_counter = 0;

while steps_counter < nstep_max
    K = steps_counter+1;
    decreasing_ss = step_size/K;
    noise = mvnrnd(mu,sigma,1).';
    grad = A * x_t - b;
    true_gradients = [true_gradients, grad];
    direction = grad + noise;
    visited_gradients = [visited_gradients, direction];
    consulted_points = visited_points;
    consulted_gradients = visited_gradients;
    x_t = x_t - decreasing_ss * direction;
    visited_points = [visited_points, x_t];
    steps_counter = steps_counter + 1;
end

end

