# need loan amount
# need Annual Percentage Rate (APR)
# need loan duration

# need to calculate monthly interest rate
# need to calculate loan duration in months
# need to calculate monthly payment

def prompt(message)
  Kernel.puts("=> #{message}")
end

loop do
  prompt("Welcome to the Lovely Loan Calculator!")
  prompt("<3 We calculate loans with love <3")

  prompt("What is the loan amount?")

  amount = ''

  loop do
    amount = Kernel.gets().chomp()
    if amount.empty?() || amount.to_f() < 0
      prompt("Must enter a positive number.")
    else
      break
    end
  end

  prompt("What is the interest rate?")
  prompt("(Example: 3 for 3% or 1.85 for 1.85%)")

  interest_rate = ''

  loop do
    interest_rate = Kernel.gets().chomp()
    if interest_rate.empty?() || interest_rate.to_f() < 0
      prompt("Must enter positive a number.")
    else
      break
    end
  end

  prompt("What is your loan's duration in years?")

  loan_duration = ''
  loop do
    loan_duration = Kernel.gets().chomp()
    if loan_duration.empty?() || loan_duration.to_i() < 0
      prompt("Please enter a valid number.")
    else
      break
    end
  end

  annual_interest_rate = interest_rate.to_f() / 100
  monthly_interest_rate = annual_interest_rate / 12
  months = loan_duration.to_i() * 12

  monthly_payment =
    amount.to_f() *
    (monthly_interest_rate / (1 - ((1 + monthly_interest_rate)**(-months))))

  prompt("Your monthly loan payment is: $#{format('%.2f', monthly_payment)}")

  prompt("Want to calculate another loan?")
  another = Kernel.gets().chomp()
  break unless another.downcase().start_with?('y')
end

prompt("Thanks so much for using the Lovely Loan Calculator.")
prompt("Good luck on your path to financial freedom!")
