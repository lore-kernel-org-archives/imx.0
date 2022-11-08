Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 371B98F4A
	for <imx@lists.linux.dev>; Tue,  8 Nov 2022 10:28:19 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id l11so21752900edb.4
        for <imx@lists.linux.dev>; Tue, 08 Nov 2022 02:28:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LlnvrOgzgIYzw4ErLSoSuTM9O5WrKKjLBVTFrQiiYrw=;
        b=uRJpmF7t1GC1Egg7oFX+ei1Qh/4yebt4vO9g2dik7FW03duXGG0BEOE2gI6Y0FfvMX
         +864UB7R9U4cJn8ChpItgijT6UBe7X+JpscotYbcxhiD3Dau1AWmEwQTqgXolQl7AAFs
         B/I5uIktqkJ5DeYb+ofF5AgkTYKV3PmfcEMQ9RYY27fIn+0m/IGGgr30FftKknpxpsrA
         WM1uByoGPRdftGxd7bpqJlLIGsKD8cSw4h925iIRw4C+2a/CtZMF4XuDS4YQoYC2xeZ2
         lrtAU/5z5jYxlgbN0Qan6wVpKpr5JyozVZniLuNlG8Z+V7RJ0L1W1NiEfENeNI1/aZI6
         Cr7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LlnvrOgzgIYzw4ErLSoSuTM9O5WrKKjLBVTFrQiiYrw=;
        b=T+UeGLhmk0WvUcOFTvgZkOGjmIwY6NemAItdnM57PIN0y/XESnxRXlljngn5A8ddJd
         m6ZRmEW5dnqWrU9AmIDtxQiCJ2PKc8mk0ez74Ud2hF9lnDGZHctWah+8gQfXqRME1J5w
         Mv6oPs6pc26wfm5jjyuI1txJl6V5jIwrtHbJ6DJS9/tRIvVFekDpEBu0WA/4YTuBd6Cb
         zZgNf32qr0FK9nHiF65S1bBGRHlbL9GHc5Q+f2bL8FGiLa1qfz5JkkJ1sr0D6TRMu+ry
         2888EzBR4Jm/dy1Dib+7Df2rTSVra29ot01rCtkyVYg1oh01WUaVvp9tfxHgOT2eqivr
         Cv3A==
X-Gm-Message-State: ACrzQf2wVcucgsDWu6nJJErBRiNQlR3e/o8AG4ZE6jh7e9kjJbPcTzjG
	H3kvnCsF+2kOurAQoi33vSiTCiL0mBWlfOCDzIeodA==
X-Google-Smtp-Source: AMsMyM7wG2afDMiM73wj4GBVpgdRAm1+t9UlWeLhKqAi3x0F1p1MKifmuIe2E4I5GKjvUkxMDbkL4KHlbwyp4q/gzGs=
X-Received: by 2002:aa7:d6d1:0:b0:463:ba50:e574 with SMTP id
 x17-20020aa7d6d1000000b00463ba50e574mr37155013edr.158.1667903297471; Tue, 08
 Nov 2022 02:28:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221027130859.1444412-1-shenwei.wang@nxp.com>
In-Reply-To: <20221027130859.1444412-1-shenwei.wang@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Nov 2022 11:28:06 +0100
Message-ID: <CACRpkdbCxW7yPKnMTFDsUhCH2LHja6Pf1GpbdmqhDMqLA28aRg@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] gpio: add suspend/resume support for i.mx8x SoCs
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Peng Fan <peng.fan@nxp.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 27, 2022 at 3:09 PM Shenwei Wang <shenwei.wang@nxp.com> wrote:

> On i.MX8QM/QXP/DXL SoCs, even a GPIO is selected as the wakeup source,
> the GPIO block will be powered off when system enters into suspend
> state. This can greatly reduce the power consumption of suspend state
> because the whole partition can be shutdown. This is called PAD wakeup
> feature on i.MX8x platform.
>
> This series of patches enable this wakeup feature on i.MX8QM/QXP/DXL
> platforms.

First: thanks a lot for fixing this the way I wanted it!

> Shenwei Wang (5):
>   arm64: dts: imx8dxl-ss-lsio: add gpio-ranges property
>   arm64: dts: imx8qm-ss-lsio: add gpio-ranges property
>   arm64: dts: imx8qxp-ss-lsio: add gpio-ranges property

Please push these into the SoC tree for i.MX.

>   pinctrl: freescale: add pad wakeup config
>   gpio: mxc: enable pad wakeup on i.MX8x platforms

I have applied these two to the pinctrl tree.

Yours,
Linus Walleij
