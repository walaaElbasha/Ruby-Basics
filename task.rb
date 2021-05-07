class ComplexNumber
    @@timesOfAdd = 0
    @@timesOfMultiply = 0
    @@timesOfBulkAdd = 0
    @@timesOfBulkMultiply = 0

    attr_accessor :real, :imag
    
    def initialize(r,i)    
        @real, @imag = r, i
    end

    def +(cn)     
        @@timesOfAdd += 1
        return ComplexNumber.new(self.real + cn.real, self.imag + cn.imag)
    end

    def *(cn)      
        @@timesOfMultiply += 1
        real= self.real* cn.real - self.imag* cn.imag;
        imag= self.real* cn.imag + self.imag* cn.real;
        return ComplexNumber.new(real, imag)
    end

    def self.bulk_add(cns)  #complex addition for array
        @@timesOfBulkAdd += 1
        result =  ComplexNumber.new(0, 0)      
        for cn in cns 
            result = (result + cn)
        end
        return result
    end

    def self.bulk_multiply(cns) #complex multiplication for array
        @@timesOfBulkMultiply += 1
        result =  ComplexNumber.new(1, 0)      
        for cn in cns 
            result = (result * cn)
        end
        return result
    end

    def self.get_stats() #get how many times the calculator used 
        puts "Total number of additions: #@@timesOfAdd
        Total number of additions: #@@timesOfMultiply
        Total number of bulk additions: #@@timesOfBulkAdd 
        Total number of bulk multiplication: #@@timesOfBulkMultiply"
    end
    
end


cn1 = ComplexNumber.new(10, 20)
cn2 = ComplexNumber.new(10, 20)
cns = []
cns << cn1
cns << cn2
#addition
add_result = cn1 + cn2
puts ("Addition Result = #{add_result.real} + #{add_result.imag}i")

#multiplication
multiply_result = cn1 * cn2
puts ("Multiplication Result = #{multiply_result.real} + #{multiply_result.imag}i")

#array addition
bulk_add_result = ComplexNumber.bulk_add(cns)
puts ("Bulk Addition Result = #{bulk_add_result.real} + #{bulk_add_result.imag}i")

#array multiplication
bulk_multiply_result = ComplexNumber.bulk_multiply(cns)
puts ("Bulk Multiplication Result = #{bulk_multiply_result.real} + #{bulk_multiply_result.imag}i")

ComplexNumber.get_stats()
