#--------------------------------------------------------------------
#File_Name:dessert.rb
#File_Type:ruby
#File_Size:1546B
#Description:homework#02
#Line_Number:76
#Version:
#Last_Modified:2015-Oct-15 00:27:04
#Author:Alostar Linc
#Mail:linc.musoom@foxmail.com & 138982002@qq.com
#Phone:
#--------------------------------------------------------------------

class Dessert
  def initialize(name, calories)
    IdentifyString(name)
    IdentifyNumber(calories)
    @name=name
    @calories=calories
  end
  def name=(name)
    IdentifyString(name)
    @name=name
  end
  def calories=(calories)
    IdentifyNumber(calories)
    @calories=calories
  end
  def name
    @name
  end
  def calories
    @calories
  end
  def IdentifyString(sstr)
    raise ArgumentError,"Bad argument for ISBN" if !sstr.instance_of?(String)
    raise ArgumentError,"Bad argument for ISBN" if sstr.size==0
  end
  def IdentifyNumber(number)
    raise ArgumentError,"Bad argument for PRICE" if !number.is_a?(Numeric)
  end
  private:IdentifyString
  private:IdentifyNumber
  def healthy?
    if @calories<200 then
      return true
    else
      return false
    end
  end
  def delicious?
    return true
  end
end

class JellyBean < Dessert
  def initialize(flavor)
    IdentifyString(flavor)
    @flavor=flavor
    super(@flavor+" jelly bean",5)
  end
  def flavor
    @flavor
  end
  def flavor=(flavor)
    IdentifyString(flavor)
    @flaver=flavor
  end
  def delicious?
    if @flavor=="licorice" then
      return false
    else
      super
    end
  end
end
