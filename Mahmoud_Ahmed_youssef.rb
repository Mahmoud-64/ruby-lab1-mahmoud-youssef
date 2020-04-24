class ComplexNumber
    attr_reader :real, :imaginary
    attr_writer :real, :imaginary

    @@counter=0
    @@counterMull=0
    @@counters={"add" => 0, "mul" => 0,"bulkAdd" => 0,"bulkMull" => 0}

    def initialize(real, imaginary)
        @real = real
        @imaginary = imaginary
    end
    
    def +(other)
        temp = ComplexNumber.new(0,0)
        temp.real=real+other.real
        temp.imaginary=imaginary+other.imaginary
        @@counters["add"]+=1
        temp
    end
    
    
    
    def *(other)
        
        temp = ComplexNumber.new(1,1)
        temp.real=real * other.real - imaginary * other.imaginary
        temp.imaginary=imaginary * other.real + real * other.imaginary
        @@counters["mul"]+=1
        temp
    end
    

    
    def self.bulk_add(arr)
        temp = ComplexNumber.new(0,0)
        arr.each do |x|
            temp.real=x.real+temp.real
            temp.imaginary = x.imaginary+temp.imaginary            
        end
        @@counters["bulkAdd"]+=1
        temp
    end


    def self.bulk_mull(arr)
        temp = ComplexNumber.new(1,1)
        arr.each do |x|
            temp.real=temp.real * x.real - temp.imaginary * x.imaginary
            temp.imaginary=temp.imaginary * x.real + temp.real * x.imaginary
        end
        @@counters["bulkMull"]+=1
        temp
    end
    
    
    def self.getStat()
    #    puts @@counter
       puts "Number of addition = #{@@counters["add"]}"
       puts "Number of multiplication = #{@@counters["mul"]}"
       puts "Number of bulk addition = #{@@counters["bulkAdd"]}"
       puts "Number of bulk multiplication = #{@@counters["bulkMull"]}"


    end

    def to_s
        puts "#{real}+#{imaginary} i"
    end
    
end




#########################
##    RESULT TESTS     ## 
#########################


# x=ComplexNumber.new(15,2)
# y=ComplexNumber.new(15,2)
# (x+y).to_s
##########################

# x=ComplexNumber.new(15,2)
# y=ComplexNumber.new(15,2)
# (x*y).to_s
##########################

# x=ComplexNumber.new(15,2)
# y=ComplexNumber.new(15,2)
# w=ComplexNumber.new(15,2)
# z=[x,y,w]
# a = ComplexNumber.bulk_mull(z)
# a.to_s
###########################

# x=ComplexNumber.new(15,2)
# y=ComplexNumber.new(15,2)
# w=ComplexNumber.new(15,2)
# z=[x,y,w]
# a = ComplexNumber.bulk_add(z)
# a.to_s
###########################

# x=ComplexNumber.new(15,2)
# y=ComplexNumber.new(15,2)
# x+y
# x+y
# x+y
# x*y
# x*y
# z=[x,y]
# a = ComplexNumber.bulk_add(z)
# a.to_s
# ComplexNumber.getStat



