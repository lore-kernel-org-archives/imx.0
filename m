Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793870660;
	b=MeRXeQywd611agUzh/cIQmlop1HUyC7RDmx0FYsotYf+q7jWvP/skh3xkzgJhavxcLlX
	 8hP0as14SjUmKhxz9nSO2xaY2FaYN4I9R6njzhTlyNXI0vA0Y2m3qt+Pfhx8w+3VV9Ntj
	 INuPxt90QnDwo+esIEXD0/TbSq7QU4QMtx7euJ4DqGLE1DURIuHqXIUCybSeV+OpSx2Jv
	 5Ha71UNmGi9ZQM+w7O//ijghFUpn8GKUbeUuCg6Hdrzmw36H+K98Gl26C+FbxoTDxnxhK
	 M/p+dfgnxikazlsD7ZuE/8YWTKGQhCIEGisGVg45Gsq6mPFXCJLqQgH8T1ljfMFPmaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793870660;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=pdLSFARJtZZaOSy89wvFfnir+tkCHpND5r/hzAKJUn0=;
	b=zgfiWiGbrqEYHAceBAbF/UmoEJ6HrSgsu2yDv76jA2PrtOrB/8zG0/Kd5afHTtBmSHtO
	 yYJj3DU6yUqnR2GDaQs+LpH5/5ta8CIEUR8IHKF7de5GFULHk8QMBm1YOAqNRVzWipB92
	 BpId7mLDtbUXiBP3xyGWYem1v5kzyLvhjHZSw4QLLNbqG1amlm28v1LstVPm2MJITnwXt
	 HlCWaz/z+JNSk/R+jp+xvcvWP1oJt3kagnCkfVZsoB73P45VbtlNPzJfxGB19N8XuHV2M
	 FLiPos/KcI7KaUA+Cw2U2K3+5srrIknA/texpbavWExm5VIMbH5LOTxovEMZwJFTIqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.215.171
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C91606A328
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 09:24:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C91606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-cc758830601so1159364a12.2
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 01:24:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793870659; x=1794475459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pdLSFARJtZZaOSy89wvFfnir+tkCHpND5r/hzAKJUn0=;
        b=1LhjBBiOqlJzU7TF28TawApDUJP9+nIBPcDi6pjuK+IbDl291ZjEYh6K3KRbnu/moy
         KvcNN5+O9JQyGZHzyZEp3Wp75NAqelFo8PBVR9FV20NX2Dv3sAG8WAKW4lMcsrPVc4cx
         DxW/Llx0K84KLKcdNHeJIo8tAjKn+oNgi3HqB8nQUBLcgEG2Y+1aVG4ddYlLZrNJ2UwJ
         29F4Xsh9iPeAN6gRqjboH7ba5G0txNEUziFewO16B9wG44/L2IhDeYNAYIAuTZwLwGwu
         YA9qJZUaISAaFUsznqfHSsHUZg7oBxx6JornQpBG8/3BvssEgn1lY843raHIuC98OGCh
         KdGQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkkrT1pd+7lhwvXGM6z1fe3hEY1CxLM0wx+8uN+8dU3mx+LBeB6lCts06GdY0fvZYrK4o=@lists.linux.dev
X-Gm-Message-State: APuU4Z8A6bWTusF6Fo2C2YeEVXrklkJF1bzsrC0LI0HNGFxOV33LOB0h
	sckf6BXSVjxluXa9nqy78YtcGQfUtTA/U/8ZlW2wRVeoaRsf4cQHVQ1mhLhT7no6VVU=
X-Gm-Gg: AYBFou33klDAvLeh2BdIZiDhCfpDOTgzfzv/pDI/RvdT/CifHAUp3o+OVf0rDcwbvlT
	0hjTncqnr1b2M/TAJ0j5oNv7Iz8Y2WaSapWWXwFWmHGws4/1KjdVKm7atgwbcwPmlkn2Hl7eeZe
	8kS7HkyaEclfybQhQC+DJ+WMTK33YGzUHSchG6qSxCAS9Rq0JXRTbwXbj7y6w0y+rGpHMlBuSR/
	IMeGVrKaCKX7GDfAKmznegdDfYcb/B43CM2++Ycuv7yfD3Sm9F3UogpjUE7aU2nMdX5P1ZcV1I2
	f0FuwzNqgufinrTiiWx88cufJsushEQ9dzhDW3aZyQ8YBxK4tStMu3TioNW1dIheor5eWxSCAix
	I1hFkeb2Ju4dIOqPI7MNzaGtdS2QINi/KwvmTCZG4BJmADxXWTy5QJP3rvOnGv/yyys93/xvZMO
	QCKzSNZwS/ekeFX3TNIQ7ytTRED+vjBs9EAk7aunVmtOuFP7QLa5mkWfQc7YI5vTpepQ4QOZhPO
	6pRR1PTayynEh3NZYPegsaWgK+iEseUe1YzbBcEohbdHv2MAoAKQM1WznNldW6p7CRAFfQR3m25
	1yVXkkOVJ9PcktiMCgSSTC8KZQlSjDBNgWYedciJNV3jniO7iLWpTudi21EoKArifMmH
X-Received: by 2002:a17:90b:5147:b0:3ac:97bc:4c7b with SMTP id 98e67ed59e1d1-3ae897c7c28mr16909802a91.14.1793870659346;
        Thu, 05 Nov 2026 01:24:19 -0800 (PST)
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com. [74.125.82.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b313c143sm3013107a91.2.2026.11.05.01.24.19
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:24:19 -0800 (PST)
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3282db206d3so3173620eec.0
        for <imx@lists.linux.dev>; Thu, 05 Nov 2026 01:24:19 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwCOhR1sJpMk9nxrtLQ9vtCJrv9cxT2pZJ0F71vPPBGpfcJ5linulvLpJfPwJa23pkT2F4=@lists.linux.dev
X-Received: by 2002:a05:6102:3711:b0:7c8:1fd5:82b5 with SMTP id
 ada2fe7eead31-7d072695e4emr7033715137.14.1793870187629; Thu, 05 Nov 2026
 01:16:27 -0800 (PST)
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
 <b656861c-a087-4087-952e-91fd15fadd52@kernel.org> <auuZHTvr5UI9Q9Q4@ashevche-desk.local>
 <fbcb650d-0f60-468d-b1cc-255ea8a93db3@kernel.org> <auxF9RT5aljXkfh7@ashevche-desk.local>
 <auxGdYgJvjq9EBu6@ashevche-desk.local>
In-Reply-To: <auxGdYgJvjq9EBu6@ashevche-desk.local>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:16:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
X-Gm-Features: AclHuK9751j09IKd6_4EIkqyFvn0FA5bsvqOYkEgIDax6KzLeXviQYPveqzIsxk
Message-ID: <CAMuHMdUkzXMsv_4KHP20qidmH1B4Ew3=VuTJ8jqfqvx4_+pm4Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] spi: use dmaengine_desc_set_callback()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Konstantin Ryabitsev <mricon@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Frank.Li@oss.nxp.com, Mark Brown <broonie@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Radu Pirea <radu_nicolae.pirea@upb.ro>, CL Wang <cl634@andestech.com>, 
	Ryan Wanner <ryan.wanner@microchip.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vladimir Oltean <olteanv@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Han Xu <han.xu@nxp.com>, 
	Haibo Chen <haibo.chen@nxp.com>, Linus Walleij <linusw@kernel.org>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Heiko Stuebner <heiko@sntech.de>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yixun Lan <dlan@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
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

On Thu, 5 Nov 2026 at 10:04, Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
> On Thu, Nov 05, 2026 at 11:01:55AM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 05, 2026 at 12:02:21AM +0100, Krzysztof Kozlowski wrote:
> > > On 04/11/2026 21:44, Andy Shevchenko wrote:
> > > >> Andy,
> > > >> These three lines look correct.
> > > >>
> > > >> LGTM:
> > > >>
> > > >> Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
> > > >
> > > > As
> > > >
> > > >   Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org> # atmel-quadspi
> > > >
> > > > Note, it's in your power to ask the author to split out what you maintain
> > > > to a separate change. So, it's your choice what to do, Ack the full patch,
> > > > give a partial Rb, ask for a split, ignore reviewing (often means silent
> > > > agreement when maintainer just applies that kind of a patch)
> > >
> > > The "# note" after the tag solves the problem partially, if people were
> > > actually using it. Solves people looking at the Git commit and being
> > > mislead by partial review applying to entire commit. Does not solve
> > > credits, because Rb for three lines is not the same as for 100.
> > >
> > > From v1 of this patch, four people (Alain, Lab, Troy, Kunihiko) did not
> > > use it even though reviewing only part. Only Wolfram, so 20% of partial
> > > reviews, used that syntax. Without that syntax, b4 will pick up Rb tag
> > > like it was for entire commit.
> > >
> > > So I do repeat - if one does not want to use that syntax, then just Ack,
> > > instead of creating false impression of reviewing everything.
> >
> > +Konstantin, then we need to teach `b4` not to break that or convert it to
> > something like
> >
> >   [FirstName: reviewed only ...]
> >   Reviewed-by: FirstName LastName <...>
>
> And Ack is not the same as Rb, when I *reviewed* patch, I have *reviewed* it,
> even if it was partial one.

Exactly.

Ab means I won't take it through my tree, please take it through a
different tree.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
