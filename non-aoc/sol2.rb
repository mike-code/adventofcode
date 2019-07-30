# 1st attempt -> Inefficient
#
# def solution(list)
#   list_end = list.length-1
#   0.upto(list_end - 4).map { |idx_b|
#       beg = list[0..idx_b].sum

#       (list_end).downto(idx_b + 3).map { |idx_e|
#           break if list[idx_e..list_end].sum > beg

#           if list[idx_e..list_end].sum == beg then
#               return true if list[idx_b+2 .. idx_e - 2].sum == beg
#           end
#       }
#   }

#   return false
# end

def solution(ω)
    idx_beg = -1
    idx_end = ω.length
    val_beg = 0
    val_end = 0
    val_mid = ω[idx_beg+2..idx_end-2].inject(:+)

    while idx_beg < idx_end - 3 do
        return true if val_end == val_beg && val_beg == val_mid

        if val_end < val_beg
            val_end += ω[idx_end-=1]
            val_mid -= ω[idx_end-1]
        else
            val_beg += ω[idx_beg+=1]
            val_mid -= ω[idx_beg+1]
        end
    end

    false
end

p solution([1,3,4,2,2,2,1,1,2]) == true
p solution([1,1,1,1,1,1]) == false
p solution([1,1,1,2,1,3,2,2,5]) == true
p solution([1,1,1,1,1,1,1,1,1,1,1,5,5,1,10]) == true
p solution([2,1,2,5,5,4,4]) == false
p solution([2,1,2,5,5,5,5]) == true
p solution([1,2]*9139) == true
p solution([2,100,2,100,2]) == true
p solution([1,1,2,1,1,2,1]) == false
