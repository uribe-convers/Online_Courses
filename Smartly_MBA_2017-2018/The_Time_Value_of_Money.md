# The Time Value of Money
The term **Time value of money** means that money today is worth more than the same money in the future because if you deposit the money in a bank, it will grow.

The **present value (PV)** is the monetary value today, also think of it as moving money backwards in time to calculate today's value, usually to time zero. Present value **does not** mean present day, it can be an earlier year.

The **future value (FV)** refers to the monetary value at a specific time in the future, or moving money forward in time to calculate its value at a specific time in the future.

The term **cash flows** means a series of cash payments received or paid out.

Future payments can only be compared to their PV! This means that a PV moves money backward in time to today. Conversely, a FV calculation moves money forward in time.


# The Timeline

It helps visualize time value of money scenarios. The time intervals must always be equal. The first period starts at time **zero** and end and the beginning of **time 1**. _Tip_: Similar to indexing in python.

The timeline usually has the **time periods** on the top of the line and the **cash flows** below it.

For **cash flows**, inflows are represented by positive numbers while outflows are negative. It' like depositing or withdrawing money from the bank account.

# Moving money through time: Compounding

When moving money forward in time, you are **compounding**. Conversely, when moving money backwards in time you are **discounting**.

To compound money, you multiple some value by a number >1, thus, the money increases over time.

The equation to compound money for one time period is: `FV1 = C0 * (1 + r)`, where FV1 is the future value at time 1, C0 is the cash flow at time zero, and r is the return earned. 

# Moving money through time: Discounting

This is used to move money backwards in time and uses division of the cash flow by a number >1, thus, always decreases the amount. This is usually done to calculate present values.  
The equation for this for one time period is: `PV = C1 / (1 +r)`, where PV is present value, C1 is cash flow at time 1, and r is the return. 

# Moving money forward over multiple years

To figure out the future value of moving money forward over multiple years, use the same formula for a single year but add an exponential to the return `(r)`, i.e., `FVn = C0 * (1 + 3)^n`. For example, $10,000 at a 10% return for three years would be `FV3 = $10,000 * (1 + 0.10)^3`, or `FV3 = $10,000 * 1.10^3`.

# Moving money backwards over multiple years

To calculate the present value of moving money backwards, use the same formula for one year but add an exponential to the `1 + r` part of the equation.

# Moving cash flows through time 

When moving cash flows through time, we need to calculate the return for each year. We could do it one year at a time with the above formula, but to be more efficient, we use a summation across all years where `N` is the final year (or the number of periods).

```
N
∑ Cn / (1 + r)^n
n=0

# For example, $10,000 for six years at a 8% return

	   6
Fv6 = ∑ 10,000 * 1.08^6
	   n=0

```

# Net Present Value (NPV)

Net present value (NPV) is the difference between the present values of all the benefits (cash inflows) and all the costs (cash outflows). This is represented by `NPV = PV (benefits) - PV (costs)`. If the NPV of an investment is positive (benefits are larger than costs), the investment should be made.
