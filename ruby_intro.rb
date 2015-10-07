#--------------------------------------------------------------------
#File_Name:ruby_intro.rb
#File_Type:ruby
#File_Size:6485B
#Description:homework#1
#Line_Number:250
#Version:
#Created_Time :2015-Oct-07 16:48:18
#Last_Modified:2015-Oct-07 17:05:03
#Author:Alostar Linc
#Mail:linc.musoom@foxmail.com & 138982002@qq.com
#Phone:
#--------------------------------------------------------------------

# Part 1

def sum(arr)
  #if array includes the value of non-integer,change it to 1
  iIntegerFlag=0
  #initialize the value of the sum of array's elements
  iSum=0
  #identify array
  if arr.instance_of?(Array) then
    #get the length of arr
    iArrLength=arr.size
    #justify whether the each element of array is a integer
    for value in arr do
      if !value.is_a?(Integer) then
        iIntegerFlag=1
        break
      end
    end
    if iIntegerFlag==1 then
      puts "The array must be consisted of integers!"
      return false
    else
      if iArrLength!=0 then
        for n in 1..iArrLength
          iSum=iSum+arr[n-1]
        end
      end
      return iSum
    end
  else
    puts "Please input an array!"
    return false
  end
end

def max_2_sum(arr)
  #if array includes the value of non-integer,change it to 1
  iIntegerFlag=0
  #initialize the value of the sum of array's elements
  iSum=0
  #identify array
  if arr.instance_of?(Array) then
    #get the length of arr
    iArrLength=arr.size
    #justify whether the each element of array is a integer
    for value in arr do
      if !value.is_a?(Integer) then
        iIntegerFlag=1
        break
      end
    end
    if iIntegerFlag==1 then
      puts "The array must be consisted of integers!"
      return false
    else
      if iArrLength==0 then
        return iSum
      elsif iArrLength==1 then
        return arr[0]
      else
        aSortArr=arr.sort
        iSum=aSortArr[-1]+aSortArr[-2]
        return iSum
      end
    end
  else
    puts "Please input an array!"
    return false
  end
end

def sum_to_n?(arr, n)
  #if array includes the value of non-integer,change it to 1
  iIntegerFlag=0
  #if any two elements in the array sum to n ,change it to 1
  iExistenceFlag=0
  #initialize the value of the sum of array's elements
  iSum=0
  #justify whether n is a integer
  if n.is_a?(Integer) then
    #identify array
    if arr.instance_of?(Array) then
      #get the length of arr
      iArrLength=arr.size
      #justify whether the each element of array is a integer
      for value in arr do
        if !value.is_a?(Integer) then
          iIntegerFlag=1
          break
        end
      end
      if iIntegerFlag==1 then
        puts "The array must be consisted of integers!"
        return false
      elsif iArrLength<2 then
        puts "The length of array is less than two!"
        return false
      else
        for out_number in 1..(iArrLength-1) do
          for in_number in (out_number+1)..iArrLength do
            iSum=arr[out_number-1]+arr[in_number-1]
            if n==iSum then
              printf("The sum of The array's [ %i ]th element and [ %i ]th element is equal to [ %i ]!\n",out_number-1,in_number-1,n)
              iExistenceFlag=1
            end
          end
        end
        if iExistenceFlag==1
          return true
        else
          return false
        end
      end
    else
      puts "The first parameter [arr] must be a array!"
      return false
    end
  else
    puts "The second parameter [n] must be a integer!"
    return false
  end
end

# Part 2

def hello(name)
  sStr1="Hello, "
  sStr2=name
  #justify whether name is a string,if not,change it to a string
  if !name.is_a?(String)
    sStr2=name.to_s
  end
  sStr1+=sStr2
  return sStr1
end

def starts_with_consonant?(s)
  #justify whether s is a string
  if s.instance_of?(String) then
    iStrLength=s.size
    if iStrLength==0 then
      puts "The input string is empty!"
      return false
    else
      #identify the string starts with a letter
      if /\A[A-Za-z]/ =~ s then
        if /\A[AEIOUaeiou]/ !~ s then
          printf "The string [ %s ] starts with a consonant!\n",s
          return true
        else
          printf "The string [ %s ] doesn't starts with a consonant!\n",s
          return false
        end
      else
        printf "The first char of the string [ %s ] is not a letter!\n",s
        return false
      end
    end
  else
    puts "Please input a string!"
    return false
  end
end

def binary_multiple_of_4?(s)
  #justify whether s is a string
  if s.instance_of?(String) then
    #get the length of s
    iStrLength=s.size
    if iStrLength==0 then
      puts "The input string is empty!"
      return false
    else
      if /^[01]*$/ =~ s then
        printf "The string [ %s ] can represent a binary number!\n",s
        sBinaryNumber='0b'+s
        iDecimalNumber=Integer(sBinaryNumber)
        if iDecimalNumber%4==0 then
          printf "The binary number string [ %s ] represents is a multiple of 4!\n",s
          return true
        else
          printf "The binary number string [ %s ] represents is not a multiple of 4!\n",s
          return false
        end
      else
        puts "The string cannot represent a binary number!"
        return false
      end
    end
  else
    puts "Please input a string!"
    return false
  end
end

# Part 3

class BookInStock
  def initialize(isbn,price)
    IdentifyString(isbn)
    IdentifyLessZero(price)
    @isbn=isbn
    @price=price
  end
  def isbn=(isbn)
    IdentifyString(isbn)
    @isbn=isbn
  end
  def price=(price)
    IdentifyLessZero(price)
    @price=price
  end
  def isbn
    @isbn
  end
  def price
    @price
  end
  def IdentifyString(sstr)
    raise ArgumentError,"Bad argument for ISBN" if !sstr.instance_of?(String)
    raise ArgumentError,"Bad argument for ISBN" if sstr.size==0
  end
  def IdentifyLessZero(number)
    raise ArgumentError,"Bad argument for PRICE" if !number.is_a?(Numeric)
    raise ArgumentError,"Bad argument for PRICE" if number<=0
  end
  private:IdentifyString
  private:IdentifyLessZero
  def price_as_string
    fToFloat=sprintf("%.2f",@price)
    sFromatPrice="$"+fToFloat.to_s
    printf "Get the value of [ %s ]...\n",sFromatPrice
    return sFromatPrice
  end
end

