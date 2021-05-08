#include <avr/io.h>
#include <util/delay.h>

#define LED      PB5
#define SLEEP_MS 500

int main(void) {
    /* initializing PB5 which is connected to port 13 of uno*/
    DDRB |= (1<<LED);

    while (1) {
        /* toggling the PB5 to alternate between on-off state*/
        PORTB ^= (1<<LED);
        _delay_ms(SLEEP_MS);
    }
}