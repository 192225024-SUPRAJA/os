#include <stdio.h>
#define NUM_PARTITIONS 6
#define NUM_PROCESSES 5
int main() {
    int partitions[NUM_PARTITIONS] = {300, 600, 350, 200, 750, 125};
    int processes[NUM_PROCESSES] = {115, 500, 358, 200, 375};
    int allocated[NUM_PROCESSES] = {-1, -1, -1, -1, -1};
    printf("Memory Partitions:\n");
    int i;
    for (i = 0; i < NUM_PARTITIONS; i++) {
        printf("%d KB\t", partitions[i]);
    }
    printf("\n\n");
    for (i = 0; i < NUM_PROCESSES; i++) {
        int size = processes[i];
        int j;
        for (j = 0; j < NUM_PARTITIONS; j++) {
            if (partitions[j] >= size) {
                partitions[j] -= size;
                allocated[i] = j;
                break;
            }
        }
        if (allocated[i] == -1) {
            printf("Process %d of size %d KB could not be allocated.\n", i + 1, size);
        } else {
            printf("Process %d of size %d KB allocated to partition %d (size remaining: %d KB).\n",
                i + 1, size, allocated[i] + 1, partitions[allocated[i]]);
        }
    }
    return 0;
}
