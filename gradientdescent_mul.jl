"""
gradient descent with multiple varibales

This is explained with equation of line
y = m.*x .+ c
we are going to find the best estimate of m and c
"""

#use packages
using StatsPlots
using ForwardDiff

#consider a line 

f(x) = 2.0.*x .+ 3.0

x = collect(range(0.0,10.0,length=100))
y = f.(x)

#plot the line
plot(x,y)

cosfunc(x,y,slope, intercept) = sqrt(sum((y .-(intercept .+ slope.*x)).^2)./length(x))

function gradient_descent(x,y, itr, η, stop)
	intercept_old = 0.0
	intercept = 1.0
	slope_old = 0.0 
	slope = 1.0
	i = 0
	
	while (i < itr) && (cosfunc(x,y,slope, intercept) > stop)
		intercept_old = intercept
		slope_old = slope
		mse(intercept, slope) = sum((y .-(intercept .+ slope.*x)).^2)./length(x)		
		grad_val = ForwardDiff.gradient(z -> mse(z[1], z[2]), [intercept, slope])
		intercept -= η*grad_val[1]
		slope -= η*grad_val[2]
		i += 1
		@show i cosfunc(x,y,slope, intercept) stop
	end
	return (intercept, slope)
end;

(intercept, slope) = gradient_descent(x,y, 10_0, 0.001, 0.01)



