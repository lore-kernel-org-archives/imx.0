Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870058;
	b=HfLxFMHN5PyzYyo8VIJc2dAQeECdIS71UBiKq2J0cLS57nKbgw7UJoJg6gqi5fsGu/vk
	 Ua+cFuZsOI5UHdQZHsHbYRufY6mdNFaFGDWMzPouf99p3s6hEMx8mj3dw/Dv952+VZRCs
	 YDYLdW+uNnW/DhByK6MkThevIdCWHjZxscGe3vHBlOvrLSNJ9G5fAh9wOrMSLxRDnsat7
	 14Ed1F9RjvHWmPA8zUtYF1bdXGuM1RSyyMZcI2jN6Q1m1kGlZ+8OcqQEB2vE6dmo7foiT
	 dXOpeEDtczhyn6VHzBAxkxyhsWKE2I/cchORXusFelHcDzgjIP8c7J51UzAajapMeIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870058;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=szpNfl+GjhJRGxd5gIdXT6EIIa0n90qEKCnRhD5COi8=;
	b=O7vbBR8sLqR13+7t29RSNDSXqSJQrWs43546uMlqYsxFO4/xYYlcCEfbwhjCVTdbpfrG
	 CTtBxT8SEXY3GdnWnEJrjVnlWuDUqhk03c/CxLZXHvBb7YEszBCWydr2kovMqq2cmiKXi
	 I+k8oCxky59UaNhul5NF2++VBG20L0awnXjFKTELG8F9fXoCbgpUfX2EfRWPl7u/nrpQl
	 mTXy7xyPxsT6PAy2g+Fh13z0iUwQMtZM5qOUfNTAc+HCtsB0/dxsL009rEPWyUiI/M+5Y
	 ifaP+SJIRF0CHcbw9tuYdoifHFyw82poPnzE/lcUz93NHV/fNxiWufxPu3FuV97PM+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.222.48
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E40C606A31B
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 09:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E40C606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-990835cec4bso927568241.1
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 01:14:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870057; x=1794474857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=szpNfl+GjhJRGxd5gIdXT6EIIa0n90qEKCnRhD5COi8=;
        b=0Lzje4m739b85huemua7leSzb0V6QNNL5R1cvjI3s7YXPUxPpL7pq2EmXpp+5BsGIu
         UsUGOsm0kcWL8FLTZFXfF3Dm83lO3pA/YslyFxwUuUcjIIA5BAXUgkwld+99VDh2rpeu
         PObh3vYC9oDLR0AvuoRz8GDsLJUFGqCkyOHDYKVihiXFfIxQ8q5ZKGUQIEaOJdnbiWL0
         qBSgY4gO6kxDnisnuICXFhSNNvvBsItmWONB5v4TdtPMOtcRrMvUTmCiQ/4gLHwSkI9w
         LH+RZ8KWVUVt3zSgI3XnlXYTrdfm/Hyavn3MGxQP9eaYuw4nrlwDolZt01evRLvqxyTb
         0cmA==
X-Forwarded-Encrypted: i=1; AKwUvBwRLe0TQk2XJ4pyeFj09sdPiNClXt1ZcNQN80/V3f/UaK/mTNvCBhIa292QtLUkitKcNtQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z/Iv8cLwk9INYdvNqD61jp8INnXTGpgvKATawnpDGyiZ2Qo1And
	deAvFcAnsgk0jzbf/cO/sBG3Rv+MP7cVTp5284w5p3x6tstP1buIG/oT56kFm6/4NMk=
X-Gm-Gg: AYBFou3tlcjaP9b6F5GmnLqbiaZzTujo+K8HqzlXqCvA5VIopOBn7R+Qfxr6di8+/0j
	e0sQ67Br4GhsZrNxJPe3eC0oirVZe7L2/vXKubtJoqjujHOtWbbpS0P3tIrGZkQ0eTJBukIqIar
	lu1vPUUJ8nx/vo24hpbjiIMFeNgTGlfVB/fy2jhmNDjVJ8kzfbgu0DDhKTK5PCYXpMxliicnKy4
	uYa+elcRZL3QeptpZyjtQCA7tRi5IYadGke9E9GD3hRbnPKgGw8pSzKn83L6KR5PGPOGiJqOgXg
	bGTxegCQE8sAInY/K5K7aIFfSeXWM/x0R0qyGlSg+pT16E6lxU6FPKNa5xWPbP/zqrZff6/8sjS
	Yhr4eZLP+/RVROq7IBKPdIsFRJMvTAQg58+aruD0iq0r70ThX3plLcmjNw2VfW7rRG9STj99I5a
	pYlCdS2EDTuEifACc95Y6pjhcaXDIlSwyg9zNLYSZ8L8YWXFUdlhU4bVAOz5v0TfCpHFYt1cFVa
	eg1ncZMtMkmyxLm4qpucDtXHKkHRtVfSjpolzZ1qd3kFqSI3IBPOg0H8O6b+3oWfDh5TpjYM1Qs
	PrEqxJe9tTmk4lG6xyL0/DE5LWhboOsnhlvQkv6P2OM0UOPps37vFEl5thRLzZsqMg==
X-Received: by 2002:a05:6102:290c:b0:7a8:10eb:96ce with SMTP id ada2fe7eead31-7d07277c1d1mr8252381137.4.1793870057524;
        Thu, 05 Nov 2026 01:14:17 -0800 (PST)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com. [209.85.222.44])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d2770ffbb4sm2933274137.0.2026.11.05.01.14.17
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:14:17 -0800 (PST)
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-99075306daaso868079241.3
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 01:14:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzjPYPMb5nM03phZn3n2kf5nKur+JTqd2ThCXh0ur2eZK0cWIdo3/5n/XgUr/KYSuH2S0s=@lists.linux.dev
X-Received: by 2002:a05:6102:a206:10b0:7d2:8610:3223 with SMTP id
 ada2fe7eead31-7d286103264mr1300643137.34.1793869578105; Thu, 05 Nov 2026
 01:06:18 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261102175527.3957740-1-Frank.Li@oss.nxp.com> <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
In-Reply-To: <a2d5ea00-bfa1-4883-923d-0a6a7eaa556d@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:06:06 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
X-Gm-Features: AclHuK_EWQ4VeHP65pJfIPjcWj5wVVyn8PWm9OHeuqD-F_-a-ZgbZgStzpLwqQc
Message-ID: <CAMuHMdUHf14DpLfk16qZ6YWtJKm8VDWEFA0Wqk22ysqnUFHoHQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] tty: serial: use dmaengine_desc_set_callback()
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@oss.nxp.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Russell King <linux@armlinux.org.uk>, Richard Genoud <richard.genoud@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Cunhao Lu <1579567540@qq.com>, Raul E Rangel <rrangel@chromium.org>, 
	Yenchia Chen <yenchia.chen@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	Carlo Caione <ccaione@baylibre.com>, Moteen Shah <m-shah@ti.com>, Kendall Willis <k-willis@ti.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Kartik Rajput <kkartik@nvidia.com>, 
	Fan Wu <fanwu01@zju.edu.cn>, Nicolai Buchwitz <nb@tipi-net.de>, 
	Karl Mehltretter <kmehltretter@gmail.com>, =?UTF-8?Q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>, 
	Shitalkumar Gandhi <shital.gandhi45@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	Sherry Sun <sherry.sun@nxp.com>, John Ogness <john.ogness@linutronix.de>, 
	Pan Chuang <panchuang@vivo.com>, Petr Mladek <pmladek@suse.com>, Robin Gong <yibin.gong@nxp.com>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Stephan Gerhold <stephan.gerhold@linaro.org>, Zhaoyang Yu <2426767509@qq.com>, 
	"Nikola Z. Ivanov" <zlatistiv@gmail.com>, Haoxiang Li <haoxiang_li2024@163.com>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Myeonghun Pak <mhun512@gmail.com>, 
	Wenhua Lin <Wenhua.Lin@unisoc.com>, Cixi Geng <cixi.geng@linux.dev>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-kernel@vger.kernel.org>, 
	"open list:TTY LAYER AND SERIAL DRIVERS" <linux-serial@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, 
	"open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <imx@lists.linux.dev>, 
	"open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>, 
	"open list:ARM/SAMSUNG S3C, S5P AND EXYNOS ARM ARCHITECTURES" <linux-samsung-soc@vger.kernel.org>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Kezysztof,

On Wed, 4 Nov 2026 at 18:41, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 02/11/2026 18:54, Frank.Li@oss.nxp.com wrote:
> > From: Frank Li <Frank.Li@nxp.com>
> >
> > Replace open-coded assignments to callback and callback_param fields
> > of struct dma_async_tx_descriptor with calls to the
> > dmaengine_desc_set_callback() helper across serial drivers.
> >
> > No functional change intended. Prepare to make struct
> > dma_async_tx_descriptor private to the DMA engine.
> >
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > ---
> >  drivers/tty/serial/8250/8250_dma.c  | 6 ++----
> >  drivers/tty/serial/8250/8250_mtk.c  | 3 +--
> >  drivers/tty/serial/8250/8250_omap.c | 6 ++----
> >  drivers/tty/serial/amba-pl011.c     | 6 ++----
> >  drivers/tty/serial/atmel_serial.c   | 6 ++----
> >  drivers/tty/serial/fsl_lpuart.c     | 6 ++----
> >  drivers/tty/serial/imx.c            | 6 ++----
> >  drivers/tty/serial/msm_serial.c     | 6 ++----
> >  drivers/tty/serial/mxs-auart.c      | 6 ++----
> >  drivers/tty/serial/pch_uart.c       | 6 ++----
> >  drivers/tty/serial/samsung_tty.c    | 6 ++----
> >  drivers/tty/serial/serial-tegra.c   | 6 ++----
> >  drivers/tty/serial/sh-sci.c         | 9 +++------
> >  drivers/tty/serial/sprd_serial.c    | 3 +--
> >  drivers/tty/serial/stm32-usart.c    | 6 ++----
> >  15 files changed, 29 insertions(+), 58 deletions(-)
>
> ...
> I did not look at this code at all...

[...]

> Therefore:
>
> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Then please add "# samsung", to make it clear and obvious.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
