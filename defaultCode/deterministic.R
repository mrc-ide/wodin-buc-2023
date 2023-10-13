# parameters
N <- user(1e4)
I_init <- user(1)
beta <- user(4)
d <- user(0.5)

# variables
deriv(S) <-  - beta * S * I / N
deriv(I) <- beta * S * I / N - (1/d) * I
deriv(R) <- (1/d) * I

# initial conditions
initial(S) <- N - I_init
initial(I) <- I_init
initial(R) <- 0


