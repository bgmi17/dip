import tkinter as tk
from tkinter import ttk
from tkinter import filedialog
from PIL import Image, ImageTk, ImageOps
# Define the intensity level slicing function
def intensity_level_slicing(image, lower_threshold, upper_threshold):
    grayscale_image = ImageOps.grayscale(image)
    thresholded_image = grayscale_image.point(lambda p: p if lower_threshold <= p <= 
upper_threshold else 0, 'L')
    return ImageOps.colorize(thresholded_image, (0, 0, 0), (255, 255, 255))
# Define the bit-level slicing function
def bit_level_slicing(image, bit_plane):
    grayscale_image = image.convert('L')
    pixel_data = list(grayscale_image.getdata())
    for i in range(len(pixel_data)):
        pixel_value = pixel_data[i]
    new_pixel_value = (pixel_value >> bit_plane) & 1 # Extract the bit at the specified position
    pixel_data[i] = 255 * new_pixel_value # Convert to 8-bit grayscale value
    sliced_image = Image.new('L', grayscale_image.size)
    sliced_image.putdata(pixel_data)
    return sliced_image
def load_image():
    global original_image, img_label_intensity, img_label_bit
    file_path = filedialog.askopenfilename(filetypes=[("Image files", "*.jpg *.jpeg *.png")])
    if file_path:
        original_image = Image.open(file_path)
        img_tk_intensity = ImageTk.PhotoImage(original_image)
        img_label_intensity.config(image=img_tk_intensity)
        img_label_intensity.image = img_tk_intensity
        img_tk_bit = ImageTk.PhotoImage(original_image)
        img_label_bit.config(image=img_tk_bit)
        img_label_bit.image = img_tk_bit
def apply_intensity_slicing():
    lower_threshold = int(lower_threshold_entry.get())
    upper_threshold = int(upper_threshold_entry.get())
    try:
        if 0 <= lower_threshold <= upper_threshold <= 255:
            img = intensity_level_slicing(original_image, lower_threshold, upper_threshold)
            img_tk = ImageTk.PhotoImage(img)
            img_label_intensity.config(image=img_tk)
            img_label_intensity.image = img_tk
        else:
            result_label_intensity.config(text="Invalid threshold values. Please ensure 0 <= Lower <= 
        Upper <= 255.")
    except ValueError:
        result_label_intensity.config(text="Invalid threshold values. Please enter valid integers.")
    def apply_bit_slicing():
        bit_plane = int(bit_plane_entry.get())
        try:
            if 0 <= bit_plane <= 7:
                img = bit_level_slicing(original_image, bit_plane)
                img_tk = ImageTk.PhotoImage(img)
                img_label_bit.config(image=img_tk)
                img_label_bit.image = img_tk
            else:
                result_label_bit.config(text="Invalid bit plane value. Please enter a value between 0 and 7.")
        except ValueError:
        result_label_bit.config(text="Invalid bit plane value. Please enter a valid integer.")
# Create the main window
root = tk.Tk()
root.title("Image Slicing")
notebook = ttk.Notebook(root)
notebook.pack(padx=10, pady=10)
# Tab 1: Intensity Level Slicing
tab1 = ttk.Frame(notebook)
notebook.add(tab1, text="Intensity Slicing")
load_button_intensity = ttk.Button(tab1, text="Load Image", command=load_image)
load_button_intensity.pack(pady=10)
lower_threshold_label = ttk.Label(tab1, text="Lower Threshold:")
lower_threshold_label.pack()
lower_threshold_entry = ttk.Entry(tab1)
lower_threshold_entry.pack()
upper_threshold_label = ttk.Label(tab1, text="Upper Threshold:")
upper_threshold_label.pack()
upper_threshold_entry = ttk.Entry(tab1)
upper_threshold_entry.pack()
apply_button_intensity = ttk.Button(tab1, text="Apply Slicing", command=apply_intensity_slicing)
apply_button_intensity.pack(pady=10)
img_label_intensity = ttk.Label(tab1)
img_label_intensity.pack()
result_label_intensity = ttk.Label(tab1, text="")
result_label_intensity.pack()
tab2 = ttk.Frame(notebook)
notebook.add(tab2, text="Bit Slicing")
load_button_bit = ttk.Button(tab2, text="Load Image", command=load_image)
load_button_bit.pack(pady=10)
bit_plane_label = ttk.Label(tab2, text="Bit Plane (0-7):")
bit_plane_label.pack()
bit_plane_entry = ttk.Entry(tab2)
bit_plane_entry.pack()
apply_button_bit = ttk.Button(tab2, text="Apply Slicing", command=apply_bit_slicing)
apply_button_bit.pack(pady=10)
img_label_bit = ttk.Label(tab2)
img_label_bit.pack()
result_label_bit = ttk.Label(tab2, text="")
result_label_bit.pack()
root.mainloop()
