hrs = raw_input("Enter Hours:")
h = float(hrs)
rate = 10.5
overrate = rate*1.5
if h <= 40:
    pay= h * rate
    print pay
else:
    over=h-40
    total = over * overrate + 40 * rate
    print total
    