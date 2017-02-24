/**
 * @file   main.c
 *
 * @brief  Continuously samples the ADC and outputs frequency.
 *
 * @date   10/15/2016
 * @author Philip Lee <plee2@andrew.cmu.edu>
 * @author Saurabh Sharma <saurabh2@andrew.cmu.edu>
 * @author Tong Bian <tbian@andrew.cmu.edu>
 */

#include <stdio.h>
#include <kiss_fftr.h>
#include <349libc.h>
#include <unistd.h>

/** @brief Sound channel number */
#define SOUND_CHANNEL 2
/** @brief number of samples */
#define NUM_SAMPLES 1600
/** @brief Frequency to sample at */
#define FREQ 1598 // 1598
/** @brief Used for low pass filter */
#define BIN_SIZE .999  
/** @brief Used to print spaces every round */
#define ROUND 200
/** @brief Cutoff value for lowpass filter */
#define CUTOFF_FREQ 340
/** @brief Buffer selector */
#define BUFF_VAL 0
/** @brief Buffer used for holding samples */
volatile kiss_fft_scalar buffer1[NUM_SAMPLES];
/** @brief Buffer used for holding samples */
volatile kiss_fft_scalar buffer2[NUM_SAMPLES];
/** @brief Value that indicates which buffer to write samples into */
int ch_buffer = 0;
/** @brief Number of samples written */
int cnt = 0;

/**
 * @brief Callback function to load ADC samples.
 * 
 * @param sample sample value from ADC
 */
void sample_fn(uint16_t sample) {

  if(cnt < NUM_SAMPLES){  

    if(ch_buffer == BUFF_VAL){
      buffer1[cnt] = (kiss_fft_scalar)sample;
    }
    else{
      buffer2[cnt] = (kiss_fft_scalar)sample;
    }
    cnt++;// Increment sampled count
  }
  return;
}

/**
 * @brief User main function.
 * 
 * Continuously samples ADC and outputs frequency.
 * 
 * @return Program exit status.
 */
int main(void) {
  int i;
  kiss_fft_cpx fft_output[NUM_SAMPLES/2+1]; // Buffer for output of fft analysis
  kiss_fftr_cfg cfg = kiss_fftr_alloc(NUM_SAMPLES, 0, 0, 0);
  sample_adc_start( NUM_SAMPLES, SOUND_CHANNEL, sample_fn);

  while(1){
    if(cnt >= NUM_SAMPLES){ // Buffer is ready to use
      ch_buffer = (ch_buffer + 1)%2; // Increent buffer selector
      cnt = 0; // Reset counter
      if(ch_buffer == BUFF_VAL) // Select buffer to read from and pass through FFT
        kiss_fftr(cfg, (const kiss_fft_scalar *)buffer2, fft_output);
      else
        kiss_fftr(cfg, (const kiss_fft_scalar *)buffer1, fft_output);
      
      int end_i = (int) (CUTOFF_FREQ / BIN_SIZE) + 1; // Cutoff at 340 Hz
      int max_i = 0;
      float max_val = 0;
      for (i = 1; i <= end_i; i++) {
        float val = fft_output[i].r*fft_output[i].r + fft_output[i].i*fft_output[i].i;
        if (val > max_val) {
          max_val = val;
          max_i = i;
        }
      }
      printf("freq=%f\n", max_i * BIN_SIZE);
    }
  }

  return 0;

}
