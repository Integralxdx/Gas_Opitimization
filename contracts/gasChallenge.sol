// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract gasChallenge {
    uint[10] numbers = [1,2,3,4,5,6,7,8,9,10]; // 1. Fixed-size array

    uint256 cachedSum; // 2. Cached state variable

    function getSumOfArray() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }

    function notOptimizedFunction() public {
        for (uint256 i = 0; i < numbers.length; i++) {
            numbers[i] = 0;
        }
    }

    function optimizedFunction() public {
        unchecked { // 3. Unchecked block
            for (uint256 i = 0; i < numbers.length; i++) { // 4. Different for loop increment syntax
                numbers[i] = 0;
            }
        }
        cachedSum = 0; // Cache the sum of the array
    }

    function getCachedSum() public view returns (uint256) {
        return cachedSum;
    }
}
