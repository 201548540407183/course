#--------------------------------------------------------------------
#File_Name:rock_paper_scissors.rb
#File_Type:ruby
#File_Size:2536B
#Description:homework#02
#Line_Number:73
#Version:
#Last_Modified:2015-Oct-21 21:47:53
#Author:Alostar Linc
#Mail:linc.musoom@foxmail.com & 138982002@qq.com
#Phone:
#--------------------------------------------------------------------

class RockPaperScissors
  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    raise AugumentError,"#{player1} must be a array!" if !player1.instance_of?(Array)
    raise AugumentError,"#{player2} must be a array!" if !player2.instance_of?(Array)
    raise AugumentError,"#{player1} must has a length of 2!" if player1.length!=2
    raise AugumentError,"#{player2} must has a length of 2!" if player2.length!=2
    aStrategy=Array.new
    aStrategy.push(player1[1])
    aStrategy.push(player2[1])
    aStrategy.each do |value|
      case value
      when /[^RPS]/
        raise RockPaperScissors::NoSuchStrategyError,"Strategy must be one of R,P,S"
      end
    end
    if aStrategy[0]==aStrategy[1] then
      return player1
    else
      if (aStrategy[0]=="R" && aStrategy[1]=="S") || (aStrategy[0]=="P" && aStrategy[1]=="R") || (aStrategy[0]=="S" && aStrategy[1]=="P") then
        return player1
      else
        return player2
      end
    end
  end

  def self.tournament_winner(tournament)
    raise AugumentError,"#{tournament} must be a array!" if !tournament.instance_of?(Array)
    #get the length of tournament
    iTournamentLength=tournament.size
    #puts iTournamentLength
    raise AugumentError,"#{tournament} must not be empty!" if iTournamentLength==0
    #get the flatten array
    aTournametFlatten=tournament.flatten
    #get the length
    iFlattenLength=aTournametFlatten.size
    #initialize temporary array
    aTempArrayIn1=Array.new
    aTempArrayIn2=Array.new
    aTempArray=Array.new
    if iFlattenLength==4 then
      aTempArrayIn1=[aTournametFlatten[0],aTournametFlatten[1]]
      aTempArrayIn2=[aTournametFlatten[2],aTournametFlatten[3]]
      winner(aTempArrayIn1,aTempArrayIn2)
    else
      for n in 0...iFlattenLength do
        if n%4==0 then
          aTempArrayIn1=[aTournametFlatten[n],aTournametFlatten[n+1]]
          aTempArrayIn2=[aTournametFlatten[n+2],aTournametFlatten[n+3]]
          aTempArray.push(winner(aTempArrayIn1,aTempArrayIn2))
        end
      end
      #p aTempArray
      tournament_winner(aTempArray)
    end
  end
end
