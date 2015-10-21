#--------------------------------------------------------------------
#File_Name:attr_accessor_with_history.rb
#File_Type:ruby
#File_Size:1235B
#Description:homework#02
#Line_Number:40
#Version:
#Last_Modified:2015-Oct-18 14:34:19
#Author:Alostar Linc
#Mail:linc.musoom@foxmail.com & 138982002@qq.com
#Phone:
#--------------------------------------------------------------------

class Class

  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}=(value)
        #before the first setter,after the initialization,the value of attribute is null
        if @#{attr_name}==nil then
          @#{(attr_name+"_history")}=Array.new
          @#{(attr_name+"_history")}.push(nil)
        end
        #start setter
        @#{attr_name}=value
        @#{(attr_name+"_history")}.push(value)
      end
      #rewrite the setter of attr_name+"_history"
      def #{attr_name+"_history"}
        if @#{attr_name}!=nil then
          @#{(attr_name+"_history")}.pop
        end
        @#{attr_name+"_history"}
      end
    }
  end
end
