# Booth Multiplier

This repository contains a Verilog implementation of the Booth Multiplier using radix-4 encoding. The Booth Multiplier is an efficient algorithm for performing signed binary multiplication. It uses radix-4 encoding to reduce the number of partial products, which improves performance compared to conventional multiplication methods.

---

## **Module Description**

### **`booth_multiplier`**
The top-level module, `booth_multiplier`, takes two 8-bit signed inputs `m` (multiplicand) and `M` (multiplier) and produces a 16-bit signed output `result`.

#### **Inputs**
- `m` (8 bits): Multiplicand
- `M` (8 bits): Multiplier

#### **Output**
- `result` (16 bits): The product of the multiplication.

### **Submodules**
1. **`radix4_encoder`**: Encodes three input bits into a control signal for Booth's algorithm.
2. **`extend`**: Performs sign extension and computes shifted versions (`eM`, `eM_bar`, `eM2`, `eM2_bar`) of the multiplicand.

---

## **Radix-4 Encoding Table**

The radix-4 encoding table used in this implementation is as follows:

| **Input (`inp`)** | **Encoded Output (`out`)** | **Operation**      |
|--------------------|---------------------------|--------------------|
| 000                | 000                       | Add 0 (No operation) |
| 001                | 001                       | Add `M`            |
| 010                | 001                       | Add `M`            |
| 011                | 010                       | Add `2M`           |
| 100                | 110                       | Subtract `2M`      |
| 101                | 101                       | Subtract `M`       |
| 110                | 101                       | Subtract `M`       |
| 111                | 000                       | Add 0 (No operation) |

---

## **Example**

### Input:
- Multiplicand (`m`) = `8'b00010110` (22 in decimal)
- Multiplier (`M`) = `8'b11111011` (-5 in decimal)

### Step-by-Step Calculation:
1. **Radix-4 Encoding for Multiplier (`m`):**
   - Bits `{m[1], m[0], 1'b0}` → Encodes to operation: `Add M`
   - Bits `{m[3], m[2], m[1]}` → Encodes to operation: `Subtract M`
   - Bits `{m[5], m[4], m[3]}` → Encodes to operation: `Subtract 2M`
   - Bits `{m[7], m[6], m[5]}` → Encodes to operation: `No operation`

2. **Partial Product Calculations:**
   - `v1` = `M`
   - `v2` = `-M << 2`
   - `v3` = `-2M << 4`
   - `v4` = `0M << 6`

3. **Result Calculation:**
   - `result = v1 + v2 + v3 + v4`
   - `result = 22 * (-5) = -110` (Decimal)

### Output:
- `result` = `16'b1111100110010010` (-110 in decimal)

---

## **Usage**
### Reference:
[Link Text](https://www.ripublication.com/aeee/006_pp%20%20%20%20683-690.pdf "Booth multiplication")

### Simulation
To simulate the Booth Multiplier, instantiate the `booth_multiplier` module in your testbench and provide the required inputs. Example:

```verilog
module tb_booth_multiplier;
    reg signed [7:0] m, M;
    wire signed [15:0] result;

    booth_multiplier uut (
        .m(m),
        .M(M),
        .result(result)
    );

    initial begin
        m = 8'b00010110; // 22
        M = 8'b11111011; // -5
        #10;
        $display("multiplicand : %d , multiplier : %d ,Result: %d",m,M,result); // Expected: -110
    end
endmodule
