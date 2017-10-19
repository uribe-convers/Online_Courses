def convert_to_celsius(fahrenheit):
    '''(number) -> float
    This will convert fahrenheit degrees and return the equivalent number of celsius degrees
    >>> convert_to_celsius(32)
    0
    >>> convert_to_celsius(212)
    100'''
    return (fahrenheit - 32) * 5 / 9
