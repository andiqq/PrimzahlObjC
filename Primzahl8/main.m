//
//  main.m
//  Primzahl8
//
//  Created by Dr. Andreas Plagens on 04.04.25.
//

#import <Foundation/Foundation.h>
#import <math.h>
#import <stdio.h>

int main(void) {
    int maxNumberOfPrimes = 10000000;
    int *primes = malloc(maxNumberOfPrimes * sizeof(int));
    primes[0] = 2;
    int candidate = 3;
    int primesCount = 1;

    NSDate *startTime = [NSDate date];

    while (primesCount < maxNumberOfPrimes) {
        int maxTeiler = (int)sqrt(candidate);
        BOOL isPrime = YES;

        for (int i = 0; i < primesCount; i++) {
            if (primes[i] > maxTeiler) break;
            if (candidate % primes[i] == 0) {
                isPrime = NO;
                break;
            }
        }

        if (isPrime) {
            primes[primesCount] = candidate;
            primesCount++;
        }

        candidate += 2;
    }

    NSTimeInterval executionTime = -[startTime timeIntervalSinceNow];

    printf("Execution Time: %f seconds\n", executionTime);
    printf("Number of primes: %d\n", primesCount);

    free(primes); // Free allocated memory
    return 0;
}
