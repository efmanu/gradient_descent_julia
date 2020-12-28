#Simple JULIA implementation of gradient descent algorithm

##use packages
```julia
using Calculus
using StatsPlots
```
##define function for parabola
```julia
f(x) = (x.+5.0).^2
```
##plot function
##generate 1000 values between -5 to 5 
```julia
x = range(-25.0,15.0,length=1000)

plot(x, f(x))
```

##find the derrivative of the function
```julia
df = derivative(f)


gd_step(x_new, x_prev, stop_value, η)
```
gd_step do the gradient descent operation. It takes the initial or previous value 
and generates new value. Stop the iteration with stop_value. The values updated based
on learning rate


```julia
function gd_step(x_new, x_prev, stop_value, η)
	while abs(x_new - x_prev) > stop_value
       #update value of x
       x_prev = x_new

       #calculate the derrivative
       x_d = df(x_prev)

       #identify new x value
       x_new = x_prev - (x_d*η)

       append!(x_trace, x_new)
   end
   return 0
end
```
#initialize parameters
```julia
global x_trace = zeros(0)
x_new = 20.0
x_prev = 0.0
stop_value = 0.005
η = 0.01
```

#run gradient descent algorithm
```julia
gd_step(x_new, x_prev, stop_value, η)

println("The minimum value of x is $(x_trace[end])")
println("The minimum value of x identified in  $(length(x_trace)) steps")
```
#plot x and correspnding function values
```julia
y_out = f(x_trace)
plot(x_trace, y_out)
```




