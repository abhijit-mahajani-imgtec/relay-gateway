 ###################################################################################################
 # Copyright (c) 2016, Imagination Technologies Limited and/or its affiliated group companies
 # and/or licensors
 #
 # All rights reserved.
 #
 # Redistribution and use in source and binary forms, with or without modification, are permitted
 # provided that the following conditions are met:
 #
 # 1. Redistributions of source code must retain the above copyright notice, this list of conditions
 #    and the following disclaimer.
 #
 # 2. Redistributions in binary form must reproduce the above copyright notice, this list of
 #    conditions and the following disclaimer in the documentation and/or other materials provided
 #    with the distribution.
 #
 # 3. Neither the name of the copyright holder nor the names of its contributors may be used to
 #    endorse or promote products derived from this software without specific prior written
 #    permission.
 #
 # THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR
 # IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
 # FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
 # CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 # DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
 # DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 # WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY
 # WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 #

#!/bin/sh
GPIO=$1
GPIODIR=/sys/class/gpio/gpio$GPIO

#check if the gpio is already exported
if [ ! -e "$GPIODIR" ]
then
        echo $GPIO > /sys/class/gpio/export
        echo out > /sys/class/gpio/gpio$GPIO/direction
        echo 0 > /sys/class/gpio/gpio$GPIO/value
fi

if [ $? -ne 0 ];then
    exit 1
fi
