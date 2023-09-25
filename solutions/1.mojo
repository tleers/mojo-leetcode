def main():
    let nums = Tuple(2,7,11,15)
    let target = 9
    let correct_result = Tuple(0,1)
#     print(twosum(nums, target))

fn twosum(
    borrowed nums: Tuple[Int], 
    borrowed target: Int
) -> Tuple[Int]:
    for i in range(0, len(nums)):
        for j in range (i + 1, len(nums)):
            if nums.get[i, Int] + nums.get[j, Int] == target:
                return Tuple(i, j) 
    return Tuple()

