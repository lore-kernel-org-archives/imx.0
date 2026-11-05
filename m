Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870418;
	b=A380aAwQuNXFzGrTekpxMvWRRNof9fIgVzfQjdao1gBXmu7N69w22lBdXiEEZTK1NQmX
	 EcVPeIuyT/SSDJ8CLJPrck8eYSRDA9zaNqNhKTnEWuoBrotp9AlLonnBcgUNSos2K6oL1
	 sz++mRiWTUfr7lXtv55wEDXLaIiW5V1tlYo0M9s+gZY9YASzanRdCInMmC6gcc8WdEbZD
	 nzvI2gzROtMwdf+G/hgjZntFJVP7a4zMbzX8t4DTjGINaRK3sMvmLzBbfVnsx86U3Zz8R
	 pG8+iad/3gM4/4KQ21aPq/THbD7as5siUAYIUF5vhZPkuLj7uQmG0r9S4LbGOuTPDtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870418;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
	b=Z941R/0QOx1kPgnjCwNME/efoe4oVsly7xo6EjYaTw+ZHVXv+iIItCUnGKGI/+L7HgmL
	 Nck/ZU2VbP5xfFDqiQgg8o3qbh4MoIS1CtSeVgBPiWQNH6Os3VFWgRoZ2nkUbFbblPmLa
	 TTLjudHZ8xHn7lWlAW+g19fdGO6vAJj3F1T6W0z6KoDdue37WnFUX3Od6K/mTY7NFiR4j
	 yZCNS8c2Mkv9RnMnSq10Mls67tuQKGsvzuaV/uaQmsrsFpyjJN/UFeBHZZMCd/ghKr+9r
	 kHDTRdn5Rsqg7+7JTUrUaWOXN/gOJambkIYLre1meidg0HF93USWphnJhJMC09tvRrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.221.180
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AB7606A326
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 09:20:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60AB7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5eafaeb8684so498525e0c.3
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 01:20:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870417; x=1794475217;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9pg1eAqFe+iTfmNTfa/GRPtY3M6bs2CHPsTRd5ndQTA=;
        b=p7TAmRJ0NQEh8/Z9F0BIwwG/rFHXyhhOFZBwuUT3BUBYIp+q430EZLARIKQAcwrWAA
         P45LTyQvaXPWCE/aI8Jeo0/JPohemIQdbUNEEkO8azyIicsOCQxxXQEK+JqCIeqeylVl
         LffpfTDxuwxKiFtFy9btnfPdXQkBNIoIhcpaXmnM4h8qcFms3cPb3BRAaXJ93TkyaPjl
         7uinC5y+pZupVqXSh24xtIy6rZzMSXUwKcRnBEzdyzZg4o1MELJJ9+tNeYWtD3a97OWA
         ZBUg9HvgOjkE9unIi7SGpKexuHs3PKaILIAUTEJviK5A1DqlQ4CGZqEvjcArPQj7axfK
         VCCQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTcuQIteM8z3lDcaN0/7aZbRf2a5NJXaXqQIJZLEbdfeTnlxDwQ7VutSCku56ob6huBK8=@lists.linux.dev
X-Gm-Message-State: APuU4Z8lVzuWsj5GkQr4APUJB44/Wv0vvVvlIZMeuphzaJP0Qx3tOox4
	/z6oOwymeMHf59h/zkYMIhJ6bgBqok7ZR51Wjzuw4zC0kW+TQfgIOKbVlxr+o50sG6s=
X-Gm-Gg: AYBFou1keoQYa9GQNRQI/BLUKQViTigtIgv+/quZ2zUP9FbgkybIi9FyoBVY0pwin5S
	/xu7MQkjdw6zsr2mPWryrsYYmlYdxZaaj6yooRvgoYltM7hzFFJ2AAmRjl7tr9qbGwTR0zZYf7O
	nJ/MsBG6BUQGXhT/IDKDmQHmW983qR3sroT4xi/xs+9owEeAuR6TWWy86/RoJyNlz/Si23MpRi3
	pLHuXYf5W706SwgwZxZDjA5moqWmKiDR1TXoV/nG9z6Efb8xBNNjio1F0gIsxNxS550Dal/o69p
	8xXkxbMVKqPMbFvvluoeEHBRbrwyifjghhBnfooNq2WAwhGL2QlD3Vbi/58JKbCi94wQX4B9lMC
	fsPfMsHnbb2nJV61NFNVvu2surRpcn2aQAb/ykNkJmHTgxF24SDBX8CA3SdKlWSmODXtyhgz66h
	iwdx4TGXdGH7pQNA8WP1PBZYUQtU0ZyVQe41tr4nv3Wvs+KmAKgK+3EFmQkU3jMvISeFkl0jh9o
	Qt9DCGZrcLkGC1asIYWBQjGtSuXaKC2PEtao/ozFDFoMEAE1UsAA/iKAwKRxElJlqBz7hvxCO3/
	yZAvaWgQrXngs9uz2HaLWTzKmR+H+4njTJs3rOvajjt8lnWixACckYiYboMthZeIxQ==
X-Received: by 2002:a05:6122:3b86:b0:5ea:bea1:705e with SMTP id 71dfb90a1353d-5ec686ff139mr8326158e0c.7.1793870417237;
        Thu, 05 Nov 2026 01:20:17 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8e0956csm3690096e0c.17.2026.11.05.01.20.15
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:20:15 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-9908c849564so441169241.3
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 01:20:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwxk6NE8fJX4IIWL5Hf6/Ed5ajkCfobdvT8GHwYK9VzEcFKHUMQM5PDZMdI3qlIEzxCuXc=@lists.linux.dev
X-Received: by 2002:a05:6102:e0b:b0:7cc:1045:610 with SMTP id
 ada2fe7eead31-7d072cc4a42mr6604019137.27.1793870415083; Thu, 05 Nov 2026
 01:20:15 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
In-Reply-To: <20261104152253.3279052-1-Frank.Li@oss.nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:20:03 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
X-Gm-Features: AclHuK-9tAw2bAtaZucYUxK8rDds9GR808jJtyoj1R1Fxu-dNuDK-M2tP9yoLrk
Message-ID: <CAMuHMdUfYZmbf6ADFFoKSod6yhu7jQVt5CBNuQpmRUUWR3OZGw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Frank.Li@oss.nxp.com
Cc: Mark Brown <broonie@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, 
	"moderated list:ARM/Microchip (AT91) SoC support" <linux-arm-kernel@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:FREESCALE DSPI DRIVER" <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:RENESAS RZ/V2H(P) RSPI DRIVER" <linux-renesas-soc@vger.kernel.org>, 
	"open list:SAMSUNG SPI DRIVERS" <linux-samsung-soc@vger.kernel.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>, 
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Thierry Reding <treding@nvidia.com>
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

On Wed, 4 Nov 2026 at 16:30, <Frank.Li@oss.nxp.com> wrote:
> From: Frank Li <Frank.Li@nxp.com>
>
> Replace open-coded assignments to callback and callback_param fields
> of struct dma_async_tx_descriptor with calls to the
> dmaengine_desc_set_callback() helper across SPI bus drivers.
>
> No functional change intended. Prepare make to struct
> dma_async_tx_descriptor private to the DMA engine.
>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Reviewed-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> Acked-by: Alain Volmat <alain.volmat@foss.st.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> Acked-by: Thierry Reding <treding@nvidia.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change in v2
> - add missed set_callback in rspi_dma_transfer() (sashiko
> - collect review by tags
> - drop void *

You have lost the "# Renesas related drivers" part from Wolfram's
review?
https://lore.kernel.org/all/auoQiuIm9FxdOrYl@shikoro/



Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
