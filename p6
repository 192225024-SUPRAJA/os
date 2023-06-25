#include <stdio.h>
#define N 3
#define M 3
void calculate_need_matrix(int need[N][M], int max[N][M], int allocation[N][M])
{
	int i,j;
    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            need[i][j] = max[i][j] - allocation[i][j];
        }
    }
}

int is_deadlocked(int allocation[N][M], int max[N][M], int available[M])
{
    int need[N][M];
    int work[M];
    int finish[N] = { 0 };
    calculate_need_matrix(need, max, allocation);
    int i;
    for (i = 0; i < M; i++) {
        work[i] = available[i];
    }
    int count = 0;
    while (count < N) {
        int found = 0;
        int i;
        for (i = 0; i < N; i++) {
            if (finish[i] == 0) {
                int j;
                for (j = 0; j < M; j++) {
                    if (need[i][j] > work[j])
                        break;
                }
                if (j == M) {
                	int k;
                    for (k = 0; k < M; k++)
                        work[k] += allocation[i][k];
                    finish[i] = 1;
                    found = 1;
                    count++;
                }
            }
        }
        if (found == 0)
            return 1;
    }
    return 0;
}
int main()
{
    int allocation[N][M] = {
        {3, 3, 3},
        {2, 0, 3},
        {1, 2, 4}
    };
    int max[N][M] = {
        {3, 6, 8},
        {4, 3, 3},
        {3, 4, 4}
    };
    int available[M] = {1, 2, 0};
    
    if (is_deadlocked(allocation, max, available))
        printf("The system is in a deadlock state.\n");
    else
        printf("The system is not in a deadlock state.\n");
    
    return 0;
}
