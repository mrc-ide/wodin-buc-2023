# parameters
N <- user(1e4)
I_init <- user(1)
beta <- user(4)
d <- user(0.5)

# step size, in units of time
dt <- 0.01

# initial conditions
initial(S) <- N - I_init
initial(I) <- I_init
initial(R) <- 0

FOI <- beta * I / N

n_S_to_I <- rbinom(S, FOI * dt)
n_I_to_R <- rbinom(I, (1/d) * dt)

# update for next time step
update(S) <- S - n_S_to_I
update(I) <- I + n_S_to_I - n_I_to_R
update(R) <- R + n_I_to_R

# to monitor if the epidemic goes extinct
initial(extinct) <- I == 0
update(extinct) <- I == 0
