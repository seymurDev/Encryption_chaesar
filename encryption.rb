require 'tk'

def caesar_encrypt(text, shift)
    encrypted_text = ''
    text.each_char do |char|
        if char.match?(/[a-zA-Z]/)
            shifted = char.ord + shift
            if char.match?(/[a-z]/)
                shifted -= 26 if shifted > 'z'.ord
                shifted += 26 if shifted < 'a'.ord
            elsif char.match?(/[A-Z]/)
                shifted -= 26 if shifted > 'Z'.ord
                shifted += 26 if shifted < 'A'.ord
            end
            encrypted_text += shifted.chr
        else
            encrypted_text += char
        end
    end
    encrypted_text
end

def encrypt_text
    input_text = text_entry.value
    shift_value = shift_entry.value.to_i
    encrypted_text = caesar_encrypt(input_text, shift_value)
    result_label.text = "Encrypted text: #{encrypted_text}"
end

# Create a Tkinter window
window = TkRoot.new { title "Caesar Cipher Encryption" }

# Create text entry widget
text_label = TkLabel.new(window) { text "Enter text:"; grid(column: 0, row: 0, sticky: 'w') }
text_entry = TkText.new(window) { height 5; width 40; grid(column: 1, row: 0) }

# Create shift entry widget
shift_label = TkLabel.new(window) { text "Enter shift value:"; grid(column: 0, row: 1, sticky: 'w') }
shift_entry = TkEntry.new(window) { grid(column: 1, row: 1) }

# Create encrypt button
encrypt_button = TkButton.new(window) { text "Encrypt"; command { encrypt_text }; grid(column: 0, row: 2, columnspan: 2, pady: 10) }

# Create label to display result
result_label = TkLabel.new(window) { text ""; grid(column: 0, row: 3, columnspan: 2) }

Tk.mainloop