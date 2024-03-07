import tkinter as tk

def caesar_encrypt(text, shift):
    encrypted_text = ''
    for char in text:
        if char.isalpha():
            shifted = ord(char) + shift
            if char.islower():
                if shifted > ord('z'):
                    shifted -= 26
                elif shifted < ord('a'):
                    shifted += 26
            elif char.isupper():
                if shifted > ord('Z'):
                    shifted -= 26
                elif shifted < ord('A'):
                    shifted += 26
            encrypted_text += chr(shifted)
        else:
            encrypted_text += char
    return encrypted_text

def encrypt_text():
    input_text = text_entry.get("1.0", "end-1c")
    shift_value = int(shift_entry.get())
    encrypted_text = caesar_encrypt(input_text, shift_value)
    result_label.config(text="Encrypted text: " + encrypted_text)

# Create a Tkinter window
window = tk.Tk()
window.title("Caesar Cipher Encryption")

# Create text entry widget
text_label = tk.Label(window, text="Enter text:")
text_label.grid(row=0, column=0, sticky="w")
text_entry = tk.Text(window, height=5, width=40)
text_entry.grid(row=0, column=1)

# Create shift entry widget
shift_label = tk.Label(window, text="Enter shift value:")
shift_label.grid(row=1, column=0, sticky="w")
shift_entry = tk.Entry(window)
shift_entry.grid(row=1, column=1)

# Create encrypt button
encrypt_button = tk.Button(window, text="Encrypt", command=encrypt_text)
encrypt_button.grid(row=2, column=0, columnspan=2, pady=10)

# Create label to display result
result_label = tk.Label(window, text="")
result_label.grid(row=3, column=0, columnspan=2)

# Run the Tkinter event loop
window.mainloop()
