#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int main() {
    int n = 5; 
    int track[n]; 
    int head, total_head_movement = 0;
    printf("Enter the track positions: ");
    int i;
    for (i = 0; i < n; i++) {
        scanf("%d", &track[i]);
    }
    printf("Enter the head position: ");
    scanf("%d", &head);
    total_head_movement += abs(head - track[0]);
    head = track[0];
    for (i = 1; i < n; i++) {
        total_head_movement += abs(head - track[i]);
        head = track[i];
    }
    printf("Total head movement = %d\n", total_head_movement);
    printf("Average head movement = %0.2f\n", (float)total_head_movement/n);
    return 0;
}
