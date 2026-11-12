# Lab 11 - Counters and Dividers

In this lab, we learned how to make clock dividers from two types of counters.

## Rubric

| Item | Description | Value |
| ---- | ----------- | ----- |
| Summary Answers | Your writings about what you learned in this lab. | 25% |
| Question 1 | Your answers to the question | 25% |
| Question 2 | Your answers to the question | 25% |
| Question 3 | Your answers to the question | 25% |

## Names
- Carson Brown & Patrick McClain
## Summary
- We built two clock dividers on the Basys 3, using btnC as the clock and btnU as the reset. The ripple counter is three chained T flip-flops that divide the clock by 8.
The modulo counter is a 3bit counter made from full adders and D flip-flops. It counts 0 to 5, then resets and toggles an output flip-flop, which divides the clock by 12.
## Lab Questions

### 1 - Why does the Modulo Counter actually divide clocks by 2 * Count?
- The output toggles once each time the counter reaches its count. One full clock period is two toggles, low to high and back to low, so one output period takes 2 × Count input clocks.
### 2 - Why does the ring counter's output go to all 1s on the first clock cycle?
- Each stage is clocked by the rising edge of the previous stage output. On the first clock stage 1 goes 0 to 1. That rising edge makes stage 2 go 0 to 1, and stage 2's rising edge makes
stage 3 go 0 to 1. The change ripples through every stage, so the counter counts down from 000 and wraps to 111.
### 3 - What width of ring counter would you use to get to an output of ~1KHz?
- 17 bits. 100 MHz / 2^17 = 763 Hz is the closest power of 2 to 1 kHz. 16 bits would give 1526 Hz.
