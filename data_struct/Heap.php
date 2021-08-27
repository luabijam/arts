<?php
class Heap {
    public $count;
    public $current;
    public $heap;
    public $compareFunc;

    public function __construct($nums, $compareFunc) {
        $this->heap = $nums;
        $this->count = count($nums);
        $this->compareFunc = $compareFunc;
        $this->buildHeap();
    }

    private function buildHeap() {
        $this->heapify();
    }

    public function heapify($count = 0) {
        $count = $count ? $count : $this->count;
        $lastParentNodeIndex = ceil(($count - 1) / 2) - 1;
        for ($i = $lastParentNodeIndex; $i >= 0; $i--) {
            $leftNodeIndex = $i * 2 + 1;
            $rightNodeIndex = $i * 2 + 2;
            $rightNodeIndex = $rightNodeIndex <= $count - 1 ? $rightNodeIndex : 0;

            $maxNodeIndex = $i;
            $maxNode = $this->heap[$i];

            // if ($maxNode < $this->heap[$leftNodeIndex]) {
            if (($this->compareFunc)($maxNode, $this->heap[$leftNodeIndex])) {
                $maxNode = $this->heap[$leftNodeIndex];
                $maxNodeIndex = $leftNodeIndex;
            }

            // if ($rightNodeIndex !== 0 && $maxNode < $this->heap[$rightNodeIndex]) {
            if ($rightNodeIndex !== 0 && ($this->compareFunc)($maxNode, $this->heap[$rightNodeIndex])) {
                $maxNode = $this->heap[$rightNodeIndex];
                $maxNodeIndex = $rightNodeIndex;
            }

            if ($maxNodeIndex != $i) {
                $this->swap($i, $maxNodeIndex);
            }
        }
    }

    public function insert($num) {
        $this->heap[] = $num;
        $this->count += 1;
        $this->heapify();
    }

    public function extract() {
        if (!$this->count) {
            return null;
        }

        if ($this->count > 1) {
            $this->swap(0, $this->count - 1);
            $this->heapify($this->count - 1);
        }

        $top = array_pop($this->heap);
        $this->count -= 1;
        return $top;

    }

    public function sort() {
        for ($i = 1; $i < $this->count; $i++) {
            $this->swap(0, $this->count - $i);
            $this->heapify($this->count - $i);
        }
    }

    public function top() {
        return $this->heap[0] ?? null;
    }

    private function swap($nodeIndex1, $nodeIndex2) {
        $tmpNode = $this->heap[$nodeIndex1];
        $this->heap[$nodeIndex1] = $this->heap[$nodeIndex2];
        $this->heap[$nodeIndex2] = $tmpNode;
    }
}

$ff = [3,4,1,2,5,6];
// $heap = new Heap($ff, function ($a, $b) {return $a < $b;});
$heap = new Heap($ff, function ($a, $b) {return $a > $b;});
// $heap->insert(7);

echo json_encode($heap->heap) . PHP_EOL;
$heap->sort();
// echo json_encode($heap->heap) . PHP_EOL;;
