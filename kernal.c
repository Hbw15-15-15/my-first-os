void clear_screen() {
    char* video_memory = (char*) 0xb8000;
    for (int i = 0; i < 80 * 25 * 2; i += 2) {
        video_memory[i] = ' ';      // Clear character
        video_memory[i+1] = 0x07;   // Black background
    }
}

void kernel_main() {
    clear_screen();
    char* video_memory = (char*) 0xb8000;
    const char* str = "Welcome to My OS!";
    
    for (int i = 0; str[i] != '\0'; i++) {
        video_memory[i * 2] = str[i];
        video_memory[i * 2 + 1] = 0x0A; // Green text color
    }
}
