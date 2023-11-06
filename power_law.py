import tkinter as tk
from tkinter import ttk
from tkinter import filedialog
import numpy as np
from PIL import Image, ImageTk
# Define the power law transformation function
def power_law_transformation(image, gamma):
    image_array = np.array(image)
    transformed_image = 255 * (image_array / 255) ** gamma
    return Image.fromarray(transformed_image.astype('uint8'))
# Load and display the image
def load_image():
    global original_image, transformed_image, img_label
    file_path = filedialog.askopenfilename(filetypes=[("Image files", "*.jpg *.jpeg *.png")])
    if file_path:
        original_image = Image.open(file_path)
        transformed_image = original_image.copy()
        img_tk = ImageTk.PhotoImage(transformed_image)
        img_label.config(image=img_tk)
        img_label.image = img_tk
# Apply the power law transformation
def apply_transformation():
    global transformed_image
    gamma = gamma_entry.get()
    gamma = float(gamma)
    transformed_image = power_law_transformation(original_image, gamma)
    img_tk = ImageTk.PhotoImage(transformed_image)
    img_label.config(image=img_tk)
    img_label.image = img_tk
root = tk.Tk()
root.title("Power Law Transformation")
load_button = ttk.Button(root, text="Load Image", command=load_image)
load_button.pack(pady=10)
gamma_label = ttk.Label(root, text="Gamma Value:")
gamma_label.pack()
gamma_entry = ttk.Entry(root)
gamma_entry.pack()
apply_button = ttk.Button(root, text="Apply Transformation", command=apply_transformation)
apply_button.pack(pady=10)
img_label = ttk.Label(root)
img_label.pack()
result_label = ttk.Label(root, text="")
result_label.pack()
root.mainloop()
