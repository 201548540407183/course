#--------------------------------------------------------------------
#File_Name:fun_with_strings.rb
#File_Type:ruby
#File_Size:5127B
#Description:homework#02
#Line_Number:157
#Version:
#Last_Modified:2015-Oct-12 23:06:57
#Author:Alostar Linc
#Mail:linc.musoom@foxmail.com & 138982002@qq.com
#Phone:
#--------------------------------------------------------------------

module FunWithStrings
  def palindrome?
    sstr=self
    #justify whether sstr is a string
    if sstr.instance_of?(String) then
      #get the length of sstr
      iStrLength=sstr.size
      #justify whether sstr is empty
      if iStrLength!=0 then
        #change the char of sstr to downcase
        sStrDowncase=sstr.downcase
        #substitute nonword character for null
        sLetterDowncase=sStrDowncase.gsub(/[^a-z]/,'')
        #reverse the string
        sLetterReverse=sLetterDowncase.reverse
        if sLetterDowncase==sLetterReverse then
          printf "[ %s ] is a palindrome!\n",sstr
          return true
        else
          printf "[ %s ] is not a palindrome!\n",sstr
          return false
        end
      else
        printf "The input string [ %s ] is empty!\n",sstr
        return false
      end
    else
      printf "The input parameter [ %s ] is not a string!\n",sstr
      return false
    end
  end

  def count_words
    sstr=self
    #justify whether sstr is a string
    if sstr.instance_of?(String) then
      #get the length of sstr
      iStrLength=sstr.size
      #initialize hash with valur of zero
      hWordTime=Hash.new(0)
      #justify whether sstr is empty
      if iStrLength!=0 then
        #change the char of sstr to downcase
        sStrDowncase=sstr.downcase
        #split sstr by non-letter
        aStrSplit=sStrDowncase.split(/[^a-z]+/)
        aStrSplit.each do |element|
          #if string not starts with a letter
          if element.size!=0
            puts "get the element [ #{element} ] of string!"
            hWordTime[element]+=1
          end
        end
        puts hWordTime
      else
        printf "The input string [ %s ] is empty!\n",sstr
      end
      return hWordTime
    else
      printf "The input parameter [ %s ] is not a string!\n",sstr
      return false
    end
  end

  def anagram_groups
    sstr=self
    #justify whether sstr is a string
    if sstr.instance_of?(String) then
      #initialize eventual array
      aGroupAnagram=Array.new
      #get the length of sstr
      iStrLength=sstr.size
      #justify whether sstr is empty
      if iStrLength!=0 then
        #the first step,get the char_array of the element of array splitted
        aElementCharArray=Array.new
        #get the sort_array of the element of source_array
        aSortArray=Array.new
        #get the uniq sort_array of the element of source_array
        aSortUniq=Array.new
        #change element to array
        aTempArray=Array.new
        #the flag of index of array
        i=0
        #the counter of iterator
        count=0
        aStrSplit=sstr.strip.split(/[^A-Za-z]/)
        aStrSplit.each do |element|
          count+=1
          aElementCharArray.clear
          aSortArray.clear
          aTempArray.clear
          #puts "The current element_array is [ #{aTempArray} ] ...[ #{count} ]"
          # the flag of whether uniq element
          j=0
          element.each_char do |letter|
            aElementCharArray.push(letter).sort!
          end
          aSortArray.push(aElementCharArray.join(""))
          puts "The current split_sort_array is [ #{aSortArray} ] ...[ #{count} ]"
          if aSortUniq.size!=0 then
            aSortUniq.each do |uniqelement|
              if uniqelement==aSortArray[0] then
                j=1
              end
            end
            if j!=1 then
              i=i+1
              aSortUniq.push(aSortArray[0])
              puts "The current join_array is [ #{aSortUniq} ] ... [ #{count} ]"
              aTempArray.push(element)
              puts "The current element_array is [ #{aTempArray} ] ...[ #{count} ]"
              aGroupAnagram.push(aTempArray.clone)
              puts "The current group_array is [ #{aGroupAnagram} ] ...[ #{count} ]"
            else
              i=aSortUniq.index(aSortArray[0])
              aGroupAnagram[i].push(element)
              puts "The current group_array is [ #{aGroupAnagram} ] ... [ #{count} ]"
            end
          else
            aSortUniq.push(aSortArray[0])
            puts "The current join_array is [ #{aSortUniq} ] ..."
            aTempArray.push(element)
            aGroupAnagram.push(aTempArray.clone)
            puts "The current group_array is [ #{aGroupAnagram} ] ..."
          end
          #aPermutation=aElementCharArray.permutation(iElementSize).to_a.uniq
        end
      else
        puts "The input string [ #{sstr} ] is empty!"
      end
      return aGroupAnagram
    else
      puts "The input parameter [ #{sstr} ] is not a string!"
      return false
    end
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
