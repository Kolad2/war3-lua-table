do
    stats = stats or {}

    stats.exp = {}
    local exp = stats.exp
    exp.__index = exp

    local function cdf(x, lambda) return 1 - math.exp( - x / lambda) end
    local function pdf(x, lambda) return math.exp(- x / lambda) / lambda  end


    function exp.create(cls, lambda, min, max)
        local obj = setmetatable({}, cls)
        self.cdf_min = 0
        self.cdf_max = 1
        if min then self.cdf_min = cdf(min, lambda) end
        if max then self.cdf_max = cdf(max, lambda) end
        return obj
    end

    function exp:rvs()
        local v = math.random()
    end

    function exp:cdf()

    end

    function exp:pdf()

    end
end