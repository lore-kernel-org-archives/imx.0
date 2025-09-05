Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01F9D261B64;
	Fri,  5 Sep 2025 07:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757058257; cv=none; b=qIkncFOPlJb5lInOJkgNqLcxjz0sERWdMv7cpgBpu+9QrYnZ1o1++fTlPrwPSwFgpE7PZ74B4zT0AVUcXv2kLVcssa6Ky6XpH1TiASXZxwzgcIhocpVkKpdU/nSeim1b1jlzfhu3DmL31w5xIBai31sGpQ+KObPP2C8UyLLhsiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757058257; c=relaxed/simple;
	bh=zZ6OUkF3arMN0uqPqWBlucr5q8ZUtJb/8hJRQOLxenY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cklADeN0SfGaGgARds2WeTqVoAbwyvluPpCpZ3kMjAKtzJASDAdGNJAKFAaMrky9fGeXhx+rm/LGxi/SAGewNeE6BDP1s8mPVAjzvxvZpFjH4sz39sQSGjNvUofhE/XSqbMdHw22U9L/lT84587exc4lKLVEsfZnky+2oMEldLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-55f76454f69so1751733e87.0;
        Fri, 05 Sep 2025 00:44:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757058254; x=1757663054;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HUDpg8P80ENhLzXkkjoWR5Wm8BjOXjAXH7uDrrOc9Oo=;
        b=BS+Ud9TZXysgmz76VKY+T08IhVXvNZinyBJCiLRv4Nq9rynjvbnYCLvfccvQVTvmFW
         rdJIaRSE91Ge86D8Wj5rMWMoxMiOgB9SMzaHSLuK8rM2vM6izgrrYLCXDVEiBrgWSKXX
         daO3K8XlIZq0rPYL1XB+m4UVGfLsP7+EPM0Pq4a9IHNX8NReeoOW6zXcd37zVBjI4HKj
         l4aIvGoT8a//z5XUklBbLrJWAeMuiH9KxWDON2zzaOYhXixCfasK6aaGjG5YGejzvi9F
         h1cilAfLrPxWp/aX86JPeCdNDkmfuEuI5dvwyowdYL6cxvYAINtFCyldtUYABXMK/B8H
         mJgg==
X-Forwarded-Encrypted: i=1; AJvYcCWYtUEpK7FHuXOvBfwOviI9hJTISGKGr+33N8cIMZjkSNQJqBOHVcPShku0PZutCpTb1VjnVZU0lE36AfU=@lists.linux.dev, AJvYcCXT+Ah47j08yDJVWavFe2zzY0V8eoxdwrhzkabJyS/WeTdW6xFsm7pIskJgR0r21pUGmec=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/srEQZ9oaWsvlYNWmYFwL0zzi2UU04szwM3XllQ3aOlUm0V4n
	aDxCoURo9jcNNVwtTXgNMuLA0XDd4WlMwoirpMAO7FurZ6hWKkP5e7LbmhmJZSeTbDY=
X-Gm-Gg: ASbGncsTuaYMiroHcLaMyF1TFNoJUm7qSJZB1BwJYxDoVc1jDCQLyIRscS56EBTXu+4
	oY4pBeBv3g5B6H89Vm+anLjD3jHCSiXdXbSKUJPfmExFP19TMJB0s91ybXWwzAvsuIUcqZINu2Z
	Rt7uY2J9T61v96SyDXr2JltZPAx2Yt4HmA9ufE7pdDoEN7lXrE5BLh9Ix+rKeYMUMOZ95Vr/jrj
	Cn/fkd0Hs16OZBEeknnE6VxBGDl8b8c+dytKnv0oDmc8KcTeyjn4cQ5svGvEnQGBFBLThtZUawF
	RgdLh97eaFzjdxCbIBkgsZuSpCGXE1FFYDZvA+FpWyzcAel1mVmE/VQbLYHc40akMMLcU3BXgdx
	Q2g8WduSzkNrHSOyi4P2FpjVX/XQTS/zO1dNRC9jVRlLiezc1gsXnz3RpGuyakQ==
X-Google-Smtp-Source: AGHT+IG+Pn74a++TNMw0sUTa+x1zn7hMVv8APBGrvTyWgqluoP7UIkuVpUcfu15GMQkKV3kcljofww==
X-Received: by 2002:a05:651c:2344:20b0:336:c01c:7ffa with SMTP id 38308e7fff4ca-336caf7ba00mr52767211fa.41.1757058253390;
        Fri, 05 Sep 2025 00:44:13 -0700 (PDT)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com. [209.85.167.42])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-337f4c50317sm19914451fa.2.2025.09.05.00.44.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 00:44:13 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-55f68d7a98aso1952583e87.3;
        Fri, 05 Sep 2025 00:44:13 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWAIIHHwRsKbCMzv4wXcgvgk6vWHdvGYlPFVNUbY55MzPFLsgQqdcRAyjscO15l/ZUHKLP+Kgx8wjm7HdQ=@lists.linux.dev, AJvYcCXcPmHJta65/yYaVJ0HGER5vFAEsBqtTzAY+ieGyGnep5Dit3h3JH62Fmko+rfToPLf5ag=@lists.linux.dev
X-Received: by 2002:a05:651c:1545:b0:337:ed76:7212 with SMTP id
 38308e7fff4ca-337ed767a08mr38641871fa.40.1757057857304; Fri, 05 Sep 2025
 00:37:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905072423.368123-1-zhao.xichao@vivo.com> <20250905072423.368123-4-zhao.xichao@vivo.com>
In-Reply-To: <20250905072423.368123-4-zhao.xichao@vivo.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 5 Sep 2025 15:37:24 +0800
X-Gmail-Original-Message-ID: <CAGb2v665Ukqdy2dxH7d=WKuLnWNz=Qwp3U+QxnrdfEPpwVL5mg@mail.gmail.com>
X-Gm-Features: Ac12FXwDAvrTIRtRT03_-9LcU10SU7B9zXfyLBZJD9DODV-PWNu2aOFrKkfI70k
Message-ID: <CAGb2v665Ukqdy2dxH7d=WKuLnWNz=Qwp3U+QxnrdfEPpwVL5mg@mail.gmail.com>
Subject: Re: [PATCH 03/12] iio: adc: Remove redundant error log prints
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Guillaume La Roque <glaroque@baylibre.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, 
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

On Fri, Sep 5, 2025 at 3:26=E2=80=AFPM Xichao Zhao <zhao.xichao@vivo.com> w=
rote:
>
> devm_thermal_of_zone_register() prints error log messages when
> it fails, so there is no need to print error log messages again.
>
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>  drivers/iio/adc/sun4i-gpadc-iio.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
>
> diff --git a/drivers/iio/adc/sun4i-gpadc-iio.c b/drivers/iio/adc/sun4i-gp=
adc-iio.c
> index 6b8d6bee1873..3b33480813fe 100644
> --- a/drivers/iio/adc/sun4i-gpadc-iio.c
> +++ b/drivers/iio/adc/sun4i-gpadc-iio.c
> @@ -640,12 +640,8 @@ static int sun4i_gpadc_probe(struct platform_device =
*pdev)
>                  * Do not fail driver probing when failing to register in
>                  * thermal because no thermal DT node is found.
>                  */
> -               if (IS_ERR(info->tzd) && PTR_ERR(info->tzd) !=3D -ENODEV)=
 {
> -                       dev_err(&pdev->dev,
> -                               "could not register thermal sensor: %ld\n=
",
> -                               PTR_ERR(info->tzd));
> +               if (IS_ERR(info->tzd) && PTR_ERR(info->tzd) !=3D -ENODEV)

I think the comment above is pretty clear that we don't want a failure
or an error message when it is failing just because the DT is missing
thermal zones.

ChenYu

>                         return PTR_ERR(info->tzd);
> -               }
>         }
>
>         ret =3D devm_iio_device_register(&pdev->dev, indio_dev);
> --
> 2.34.1
>
