Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFC117D8
	for <imx@lists.linux.dev>; Fri, 21 Oct 2022 08:27:14 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id ot12so5406013ejb.1
        for <imx@lists.linux.dev>; Fri, 21 Oct 2022 01:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NZZVthiUsfhuSQCQF/2Kz3M4VDmTpfQlRvTbiOafepY=;
        b=v36u6Zx+Z9iCMEesPTfEFaJQNf/UIR/IGkzaIYkQuXvm8w8CZ646Phdytr4AzQi1m+
         TX8JDCGARVuTApmwjEGn0binwnF7sDpg/mYIzKVDau418a9fTXyt0bglGAqXV95L4b/m
         XIdY0oGWxz//fyB5SeBeqfjrDTCli3q9pFb9Yniw1FBi/EogMVn+TwPkfrPUirPU53SY
         WPgBMPumvYKn28wKWHk/hTgweSimYm3Y+0N3l9QMIn7yJPH54goC5Xc5rZ3hV1kAGHQN
         QrPn5cF1pwvFIeLPrZdwl3IV8pKxJXM0vL2vv5i/a4kgIdGVL0yr0SO+mlOiAvXZyuvJ
         6yog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NZZVthiUsfhuSQCQF/2Kz3M4VDmTpfQlRvTbiOafepY=;
        b=ca8FWD5M2SiTkrx9AP56y86+BzOVJfWio4vi7NraXltrO+UQ7AGl8f5FSP6QViTJH0
         g3wSX5zc8nkD5HBu0cvGmZAB24RPXWx+UoPjLx78n67PkOsRhFJjpbVjEqBFn5sINMpG
         QAigu5nw0CADOdt0PzV4OSG0GvMVJvv6wnhVggWcmqqY23E0uv/esMsVX3XbFlNgsdJC
         JyLINhcew0XOZ3TV4WIAaJfk5x73TKpQVLty1mlG/X53Lw9IwlbOPNFYNC75BB4Bz74E
         NYrpQZzMmu7d4+7KN2rD4Y+AYSS2VJRRz/+vJ36Uh8bLNg8PdoAd2jAmnbahTKlFvLRS
         3Idg==
X-Gm-Message-State: ACrzQf0aSyiXIvIv2wwmR6eq/YkJhWTpNThe38QwhzEM2TUydb+09P4j
	M+9hj706IqaULUKN2PQEs7Sw+4Ark4M5PqXmT50tyw==
X-Google-Smtp-Source: AMsMyM4J2JvAflrC06L/U2vIYE2FhpntoqRXP7GwQ6oK/QB+8ORhydUcw8PaegivA9Cw98BZArn//1/E/qa6LuU5gPM=
X-Received: by 2002:a17:907:7606:b0:78e:61d:757e with SMTP id
 jx6-20020a170907760600b0078e061d757emr13674851ejc.690.1666340832730; Fri, 21
 Oct 2022 01:27:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221007152853.838136-1-shenwei.wang@nxp.com> <CACRpkdaKncznz5qej6owA2OGMeqbrif9e_QO3CWN6+sGhEApDw@mail.gmail.com>
 <PAXPR04MB9185AE67BF20108CFBF0546289299@PAXPR04MB9185.eurprd04.prod.outlook.com>
 <CACRpkdZ1hCZ1WoTQ0e584bQxEyBWq9gkZKPPFnm85QnMnNyvHQ@mail.gmail.com> <PAXPR04MB9185639BA2F9D61FB935741589289@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185639BA2F9D61FB935741589289@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 21 Oct 2022 10:27:01 +0200
Message-ID: <CACRpkdaa0=m9FNiV+3XJ7MUGF4eJxc5mNVKUEUn_d8SMBiOTSw@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH v2 1/1] gpio: mxc: add suspend/resume support
 for i.mx8x SoCs
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, Pengutronix Kernel Team <kernel@pengutronix.de>, Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 18, 2022 at 9:42 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:

> #define PINCTRL_PIN(a, b) { .number = a, .name = b }
> #define IMX_PINCTRL_PIN(pin) PINCTRL_PIN(pin, #pin)
>
> The imx8qm_pinctrl_pads array gives each PIN a string type of name.  The array I defined in
> this patch adds another dimension information of the PIN, which is the GPIO index. These
> two are not duplicated information.
(...)
> The purpose for the array here is to record the relationship of a GPIO line with a PIN.
(...)
> From the PINCTRL driver, you may get the information regarding a PIN's Mux status
> and something relating to the signal settings like pullup/pulldown/drive strength. So
> you can know if a PIN is a GPIO function PIN or not, but you can't know which GPIO port and
> which GPIO line the PIN belongs to.

Cross-referencing GPIO line numbers to pins/pads is literally the
job of gpio-ranges (the DT property) and we have excellent support in
the GPIO library to do exactly this.

It can even be made using static data in the driver if gpio-ranges for
some reason cannot be encoded in the device tree.

(...)
> In order to build up the cross-reference between GPIO lines and the PINs, you need
> have a pre-prepared gpio-ranges mapping in advance. Because the relationship between
> the PIN and the GPIO line is not a linear, you end up to build up the gpio-ranges in the same
> way like the array in this patch. This turns to a chicken-egg problem.

I don't get it. gpio-ranges can contain any number of "holes" and whatever,
the name "rangeS" (plural) implies it can be an array of ranges. If you want
you can have a list of single-pin ranges, no problem.

> As I explained above, this is not the duplicated information. It adds another
> dimension of a information regarding a PIN. As these information is standalone
> and self-contained,  no matter how you change the pin tables, it won't impact
> the function here.

Since the information/setting pertains to an electronic or similar property
of a pin it falls under the pin config umbrella.

> This is a kind of GPIO wakeup function, and it happened to be given a name called
> pad wakeup. From the user point of view, it works the same way as the native
> GPIO wakeup. Except the name itself, it has nothing to do with the PINCTRL.

Hardly.

The MMC/SD card bus has ways of waking up devices by pulling a line
low, as does things such as UARTs. And then the pin isn't even used as
GPIO.

I bet a million to one that the exact same setting is used inside the
SCU for waking up on such events on the pins.

I don't believe that just because a pin is muxed to something else than GPIO
it cannot be programmed to wake the system up.

If you look into my presentation "building GPIO and pins from the ground up":
http://www.df.lth.se/~triad/papers/pincontrol.pdf
see the picture on page 13 and page 18. The asynchronous edge detector is
what takes the system online in sleep. That is a property of the pin
cell, it has
nothing to do with the GPIO block, which is further in.

It belongs in pin control because it is a property of the pin hardware.

> As I explained in the above, this is not the problem of two clients accessing the same
> resource, so there is no conflict between the two drivers. It works in the same way
> like SCU power domain driver and SCU clock driver. The communication integrity is
> guaranteed by the call of imx_scu_call_rpc itself.

I understand that it makes your life simpler to just implement this as a hack
in the MXC GPIO driver like this, but it is not a proper solution, and I ask you
to do the more complicated and work consuming task instead.

This is because it will have partitioned the problem in a clear way that is
recognizable by the maintainers and will scale to other SoCs in the future.

I also wonder where all the other i.MX maintainers are. I need their input
in this discussion.

Yours,
Linus Walleij
