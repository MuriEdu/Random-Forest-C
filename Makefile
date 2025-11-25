CFLAGS = -std=c99 -O1 -fsanitize=address -g -Wall -Wextra -Wpedantic -Xpreprocessor -fopenmp -I/opt/homebrew/opt/libomp/include
LDFLAGS = -L/opt/homebrew/opt/libomp/lib -lomp

SRC = main.c \
      utils/utils.c \
      utils/data.c \
      utils/argparse.c \
      model/tree.c \
      model/forest.c \
      eval/eval.c \
      utils/log.c

OBJ = $(SRC:.c=.o)

TARGET = random-forest

all: $(TARGET)

$(TARGET): $(OBJ)
	$(CC) $(CFLAGS) -o $@ $(OBJ) $(LDFLAGS)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJ) $(TARGET)

test: $(TARGET)

	./$(TARGET) iris_binary.csv
