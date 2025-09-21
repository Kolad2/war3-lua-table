do
    stats = stats or {}

    ---@class DistributionExponential
    stats.exp = {}
    local exp = stats.exp
    exp.__index = exp

    local function cdf(x, lambda) return 1 - math.exp( - x / lambda) end
    local function pdf(x, lambda) return math.exp(- x / lambda) / lambda  end

    ---@param cls DistributionExponential
    ---@param lambda number
    ---@param min number|nil
    ---@param max number|nil
    ---@return DistributionExponential
    function exp.create(cls, lambda, min, max)
        local obj = setmetatable({}, cls)
        self.cdf_min = 0
        self.cdf_max = 1
        self.lambda = lambda
        if min then self.cdf_min = cdf(min, lambda) end
        if max then self.cdf_max = cdf(max, lambda) end
        self.norm = self.cdf_max - self.cdf_min
        return obj
    end

    function exp:rvs()
        local v = 1 - (math.random() * self.norm + self.cdf_min)
        v = - self.lambda * math.log(v)
        return v
    end

    function exp:cdf()
        return cdf(x, self.lambda)
    end

    function exp:pdf()

    end

    setmetatable(exp, {__call = exp.create})
end