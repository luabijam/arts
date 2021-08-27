<?php
//https://labuladong.gitbook.io/algo/di-ling-zhang-bi-du-xi-lie/er-fen-cha-zhao-xiang-jie

$nums = [1,2,3,4,5,6,7];
$target = 3;
// echo binarySearch($nums, $target);

function binarySearch($nums, $target) {
	$left = 0;
	$right = count($nums); // [left, right)
	// $right = count($nums) - 1; // [left, right]

	while ($left < $right) { // [left, right)
	// while ($left <= $right) { // [left, right]
		$mid = $left + intval(($right - $left) / 2);

		if ($nums[$mid] == $target) {
			return $mid;
		} else if ($nums[$mid] > $target) {
			$right = $mid - 1;
		} else if ($nums[$mid] < $target) {
			$left = $mid + 1;
		}
	}

	return $nums[$left] == $target ? $left : -1; // [left, right)
	// return -1; // [left, right]
}

$nums = [1,2,2,3,4,5];
$target = 2;
// echo left_bound($nums, $target);

function left_bound($nums, $target) {
	$left = 0;
	$right = count($nums); // [left, right)
	// $right = count($nums) - 1; // [left, right]

	while ($left < $right) { // [left, right)
	// while ($left <= $right) { // [left, right]
		$mid = $left + intval(($right - $left) / 2);
		echo 'mid ' . $mid . PHP_EOL;
		echo 'left ' . $left . PHP_EOL;
		echo 'right ' . $right . PHP_EOL;
		echo PHP_EOL;

		if ($nums[$mid] == $target) {
			$right = $mid; // [left, right)
			// $right = $mid - 1; // [left, right]
		} else if ($nums[$mid] > $target) { 
			$right = $mid; // [left, right) [left, mid), [mid + 1, right)
			// $right = $mid - 1; // [left, right] [left, mid - 1], [mid + 1, right)
		} else if ($nums[$mid] < $target) {
			$left = $mid + 1;
		}
	}

	if ($left == count($nums)) { // [left, right)
		return -1;// [left, right)
	}// [left, right)

	return $nums[$left] == $target ? $left : -1; // [left, right)

	// if ($left >= count($nums) || $nums[$left] != $target) { // [left, right]
		// return -1;// [left, right]
	// }// [left, right]

	// return $left; // [left, right]
}

$nums = [1,2,2,3,4,5];
$target = 2;
echo right_bound($nums, $target);

function right_bound($nums, $target) {
	$left = 0;
	$right = count($nums); // [left, right)
	// $right = count($nums) - 1; // [left, right]

	while ($left < $right) { // [left, right)
	// while ($left <= $right) { // [left, right]
		$mid = $left + intval(($right - $left) / 2);

		if ($nums[$mid] == $target) {
			$left = $mid + 1; 
		} else if ($nums[$mid] > $target) {
			$right = $mid; // [left, right)
			// $right = $mid - 1;// [left, right]
		} else if ($nums[$mid] < $target) {
			$left = $mid + 1; 
		}
	}

	if ($right == 0) { // [left, right)
		return -1; // [left, right)	
	} // [left, right)

	return $nums[$left - 1] == $target ? ($left - 1) : -1; // [left, right)

	// if ($right < 0 || $nums[$right] != $target) { // [left, right]
		// return -1; // [left, right]
	// }  // [left, right]

	// return $nums[$right] == $target ? $right : -1; // [left, right]
}

