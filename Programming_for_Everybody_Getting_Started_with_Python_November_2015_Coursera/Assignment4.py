def computepay(hrs,r):
   h = float(hrs)
   rate = float(r)
   overrate = rate*1.5
   if h <= 40:
    pay= h * rate
    print pay
   else:
    over=h-40
    total = over * overrate + 40 * rate
    
    return total

hrs = raw_input("Enter Hours:")
r = raw_input("Enter Rate:")
print computepay(hrs,r)