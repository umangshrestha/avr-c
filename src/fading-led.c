#include <avr/io.h>
#include <util/delay.h>

#define LED_PIN   PB0
#define DELAY_MAX 5120
#define DELAY_MIN 100

int main(void)
{
    /* set LED pin as OUTPUT */
    DDRB |= (1 << LED_PIN);
    int step = -1;
    uint16_t delay = DELAY_MIN;

    while (1) {
            /* changing duty cycle */
            if (delay<=DELAY_MIN||delay>=DELAY_MAX) {
                    step  = -step;
            }
            delay += step;
            /* LED off */
            PORTB &= ~(1 << LED_PIN); 
            _delay_loop_2(delay);
            /* LED on */
            PORTB |= (1<<LED_PIN); 
            _delay_loop_2(DELAY_MAX - delay);
    }
}