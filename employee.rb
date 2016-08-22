require 'byebug'

class Employee
  attr_reader :subordinates, :salary
  attr_accessor :boss

  def initialize(name, salary, boss = nil)
    @name = name
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee

  def initialize(name, salary, boss = nil, subordinates = [])
    super(name, salary, boss)
    @subordinates = subordinates
  end

  def bonus(multiplier)
    total_subordinates_salary * multiplier
  end

  def add_sub(employee)
    employee.boss = self
    @subordinates.push(employee)
  end

  def total_subordinates_salary
    #debugger
    total = 0
    @subordinates.each do |sub|
      if sub.is_a? Manager
        total += sub.salary
        total += sub.total_subordinates_salary
      else
        total += sub.salary
      end
    end
    total
  end

end

david = Employee.new("David", 10_000)
shawna = Employee.new("Shawna", 12_000)
darren = Manager.new("Darren", 78_000)
ned = Manager.new("Ned", 1_000_000)

darren.add_sub(shawna)
darren.add_sub(david)
ned.add_sub(darren)

 p ned.bonus(5) # => 500_000
 p darren.bonus(4) # => 88_000
 p david.bonus(3) # => 30_000
