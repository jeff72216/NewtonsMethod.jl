module NewtonsMethod

using LinearAlgebra, ForwardDiff

function newtonroot(f, f′; x₀, tolerance=1E-7, maxiter=1000)
    x_old = x₀
    normdiff = Inf
    iter = 1
    while normdiff > tolerance && iter <= maxiter
        x_new = x_old - (f(x_old) / f′(x_old))
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
    if iter > maxiter && normdiff > tolerance
        return NaN
    else
        return x_old
    end
end

function newtonroot(f; x₀, tolerance=1E-7, maxiter=1000)
    x_old = x₀
    f′ = x -> ForwardDiff.derivative(f, x)
    normdiff = Inf
    iter = 1
    while normdiff > tolerance && iter <= maxiter
        x_new = x_old - (f(x_old) / f′(x_old))
        normdiff = norm(x_new - x_old)
        x_old = x_new
        iter = iter + 1
    end
    if iter > maxiter && normdiff > tolerance
        return NaN
    else
        return x₀
    end
end

export newtonroot

end