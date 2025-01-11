import math
import numpy as np
import matplotlib.pyplot as plt

from triangle_functions import sierpinski_gasket
from circle_functions import unit_circlev2

def plot_sierpinkski_gasket(n = 0):
    x, y = sierpinski_gasket(n)
    plt.plot(x, y)
    plt.show()


def cheeky_fractal():
    # plot aesthetics
    plt.axis("equal")

    # unit circle 'dimension'? D
    cx, cy = unit_circlev2()
    plt.plot(cx, cy)

    # area of a circle so i can know if growth point is
    # outside of it?
     
    ox = [0]
    oy = [0]

    # what is the size of the point?
    plt.scatter(ox, oy, color="red")    






    plt.show()


cheeky_fractal()
