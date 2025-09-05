Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C0D1F4613;
	Fri,  5 Sep 2025 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757064973; cv=none; b=MjRlPGLV/YJXDed45asPJFK4pnuxzk231xZKu3TwDwMhzKi0i4/cR94N+sdcjyOimTHNPX0bBGYjNZhwmOLgdiZbHOEqbs+/Qw3qSwd2AnAiVt8tkHxEmCJEd1L990U7nBjJauLOEca3QHBJzyxfTGiYhDqi2GT6hhwZ1LT1P3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757064973; c=relaxed/simple;
	bh=KmBSaHkbj+xeQP4PQxDtYAKPe6uOtfo1+bk6LyYR/PI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=efSwO4As4bTXW7j0ehZ5Bt6RuqLbbzzIrgc5iXy/SWt2A6o90HuMSUjOZM4WnDpMgqofYBDCva9rsfTQWfBKHYoV2VnI71a/ZnUyzVvodsCfFZqORaDxOn5oiK0XFfl00PzHExqyXd8wu51KoXccDNvqDEtAGyVJ/JFPLOGi8fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BYWGQV5f; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BYWGQV5f"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b047f28a83dso283976266b.2;
        Fri, 05 Sep 2025 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757064970; x=1757669770; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqf6D6Y//+lOVA7z+yQJwo2jJaSIwyijSnsvcGjMTK4=;
        b=BYWGQV5f7biPpGtjHa9910vxxhXT7HAZYVU+m97bBI2pnbBt7j91x/hlYkGe8Dz+G6
         fm7/bpW7PF1bcNcI1wOrJwtI4KUTAgBHBBLETUniDyzLN7bElQdrHdqRkY0a8WvaoJFP
         dDuSAe1sGMLfIgDlx3pDtkRGVI9Sqy/205ySY8woaNLB1gtalWghuCg9mkVLiu09ijKf
         lf25836qTlfnzcN/UUqJXpsI4TE3eS4QksRgUesSvZp3gi9rebbA88Wck+zm4vvARjAc
         KsvpKR2QHUyJKrXEtPSwfILtpZ08cTrU2iqpapJyxZDix9nZ7lxFOW5lk4h6M7NWFvZT
         prMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757064970; x=1757669770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nqf6D6Y//+lOVA7z+yQJwo2jJaSIwyijSnsvcGjMTK4=;
        b=pah7cmEWIDNQ6orr3BM/bsYYUIn8T19O4K62VPx+jYLseQC48WTs9H4ZW/IflFM0Ni
         SHrVSi0/s+vZGJL0aCl3arhlGUUAWC3RSueSqk5OQBscAKaXZxOoUVQypb7U5JfUrymY
         fJUGhjjadvmm49z93QQP9YaxBKsUQ0D1zZpIn4oh6/6GW2bgjBqo/uIUJCEkWyML0JJK
         cobHubq0iN98Wk4zajBDqvndBqh7AgPZxrKP1aerY5NX3Fk5/64k78Sb6VfVv5iiiXLq
         TR+3/R1Vmq3riA+SXZdSbZFy8lVw6sAGbQ5c6pHyi/w0mayxsOdYHEIfe8SbR/aVvwt9
         +Czg==
X-Forwarded-Encrypted: i=1; AJvYcCUaW/ehXWLnFEsyDIuBDEBENgEWQ55tHrqphXx8tZN2/oAd0hVhbAM6IYQAYU0yRsIKUss=@lists.linux.dev, AJvYcCWt5PpcKaLiMBu7ZSJ2+Zbbfq4YXea78mnyKLydCrappt0NZHnskckMVFBFrQ7h019iWUaD8NA+wqOBF9M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7DE9HEVIHe4kLq5AlovU6Ep+zZAjSA5tPuL3rkBHI2+c7LMex
	/bfC0jIBU9nhefGXUTVbWJOUvumS7zekqLK9UxoHTCSeRiOQ7qAQYlqY1nOmKzXeiqZ1AE3OC7i
	Ett+h2BtNWHwN3ki6eM7g7WMpXCpP4hI=
X-Gm-Gg: ASbGncv7QWRol7aAxLdrPeL59hGypg4/+JdT366yoxJtCdzBxFLgYBRLTltgc5CjMrJ
	ZW4TqbaOqGAhJq3+DPf22moomrjHSIAyIaUziSZ9U57opryBHcmg1f03AMGXm5t04a30fXbcqUt
	n5yTdGIbm7nDXm/156k596acQXNc8hqHuHEoOrECklPah253Z+LPchh7Y2Re5YXRAL/tSzQ1xOR
	0JRcsfQbcf5zTlAsRDx
X-Google-Smtp-Source: AGHT+IH7OMu1dd1ZlYosPz3SPqptVrWuN6c3SeVJCBYbCfoyYDh6z1nFqhk/368zJOb4WYqLr166BLEihh9LvFYDNYs=
X-Received: by 2002:a17:906:48c9:b0:b04:10d9:48d4 with SMTP id
 a640c23a62f3a-b0410d9523dmr1630508566b.35.1757064970102; Fri, 05 Sep 2025
 02:36:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905072423.368123-1-zhao.xichao@vivo.com> <20250905072423.368123-2-zhao.xichao@vivo.com>
 <CAHp75VforxjsHWzxrxfD_YOshvg0Y=KwrpmAPWwhyarNm2wNjQ@mail.gmail.com>
In-Reply-To: <CAHp75VforxjsHWzxrxfD_YOshvg0Y=KwrpmAPWwhyarNm2wNjQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Sep 2025 12:35:33 +0300
X-Gm-Features: Ac12FXxkIEGZA5-qHqK-CmbOa_oJh7A8t90OuTImqynr4N5GOyYLVDsnRsxsyg0
Message-ID: <CAHp75VdRn1qnoiCr7aeZfHF9GEyQshOA5awTjiJ9oJiY6Q+Gsw@mail.gmail.com>
Subject: Re: [PATCH 01/12] thermal: of: Add error handling in devm_thermal_*_register()
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Guillaume La Roque <glaroque@baylibre.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Markus Mayer <mmayer@broadcom.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Talel Shenhar <talel@amazon.com>, 
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	"open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:THERMAL" <linux-pm@vger.kernel.org>, 
	"open list:THERMAL DRIVER FOR AMLOGIC SOCS" <linux-amlogic@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"open list:QUALCOMM TSENS THERMAL DRIVER" <linux-arm-msm@vger.kernel.org>, 
	"open list:RENESAS R-CAR THERMAL DRIVERS" <linux-renesas-soc@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>, 
	"open list:SAMSUNG THERMAL DRIVER" <linux-samsung-soc@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, 
	"open list:TI BANDGAP AND THERMAL DRIVER" <linux-omap@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 5, 2025 at 12:33=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Fri, Sep 5, 2025 at 10:25=E2=80=AFAM Xichao Zhao <zhao.xichao@vivo.com=
> wrote:

...

> >         ptr =3D devres_alloc(devm_thermal_of_zone_release, sizeof(*ptr)=
,
> >                            GFP_KERNEL);
> > -       if (!ptr)
> > +       if (!ptr) {
>
> > +               dev_err(dev, "Failed to allocate device resource data\n=
");
>
> We do not add error messages for ENOMEM.
>
> >                 return ERR_PTR(-ENOMEM);
>
> Even if you want so eagerly to do that, it should be
>
>    return dev_err_probe();
>
> But, it will ignore the ENOMEM error code for printing.
>
> > +       }
>
> So, the bottom line, no need to add this message here.

...

> >         tzd =3D thermal_of_zone_register(dev->of_node, sensor_id, data,=
 ops);
> >         if (IS_ERR(tzd)) {
> > +               dev_err_probe(dev, PTR_ERR(tzd),
> > +                             "Failed to register thermal zone sensor[%=
d]\n", sensor_id);
> >                 devres_free(ptr);
> >                 return tzd;
>
> I don't see how ptr is related to the message. Can't we use
>
>   return dev_err_probe(dev, PTR_ERR(...), ...);
>
> instead?

On top of that can we actually use devm_add_action_or_reset()?

--=20
With Best Regards,
Andy Shevchenko
