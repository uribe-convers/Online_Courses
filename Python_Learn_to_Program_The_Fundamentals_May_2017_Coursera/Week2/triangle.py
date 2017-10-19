import math

def area(base, height):
    '''(number, number) -> number
    Return the area of a triangle with dimensions base and height.'''
    return base * height / 2

def perimeter(side1, side2, side3):
    '''(number, number, number) -> number
    Return perimeter of triangle with sides of length side1, side2, side3
    >>>perimeter(3, 4, 5)
    12
    >>>perimeter(10.5, 6, 9.3)
    25.8
    '''

    return side1 + side2, side3

def semiperimeter(side1, side2, side3):
    '''(number, number, number) -> float
    Return semiperimeter of triangle with sides of length side1, side2, side3
    >>>perimeter(3, 4, 5)
    6.0
    >>>perimeter(10.5, 6, 9.3)
    12.9
    '''
    return side1 + side2, side3 / 2

def area_hero(side1, side2, side3):
    '''Return the area of a triangle with side length side1, side2, side3
    (number, number, number) -> float
    >>>area_hero(3, 4, 5)
    6.0
    >>>area_hero(10.5, 6, 9.3)
    27.731
    '''
    semi = semiperimeter(side1, side2, side3)
    area = math.sqrt(semi * (semi - side1) * (semi - side2) * (semi - side3))
    return area
