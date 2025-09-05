Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9562132F743;
	Fri,  5 Sep 2025 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757064873; cv=none; b=PhuapJ8S9qnaUQ7+jevrHb/S5wxmXKAv9oZHB6CFAHJ9lRcn3mbfZDagDtqT5F0eQJkJ4W9lQbeAMID7T3VNc41pjwBz7ytYRLAE/UY9dEnfnIuUKF8iTl9KCu8TpfgUmw8cABDt9sLIbSyR1bSXjdGTOW5zbTwy5KG447fPEcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757064873; c=relaxed/simple;
	bh=fxW6po38fpa+VnoP8FiDQdHk6gPNDw4WKNm1oy92zAc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBK0rMxCbzHnt5xIMXO92xWHVVkQ+pOS1wOdifkNeh/QaCEmYbEalc7MLUA0QudFh8Ci0/OZ1IOZluFOontlzXXJp6pIDhKfCBo9ddkEcriacxiAUQgyD2wREVsCJBHp4KwDmchq2lBGUw0F5TvS589UI7UhCCpZ57Wcjcw6caw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KScCQNCv; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KScCQNCv"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b04770a25f2so286709966b.2;
        Fri, 05 Sep 2025 02:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757064870; x=1757669670; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZXKC69S7By8Ya1ZMREMZuen7JwS2/FHlmhonyDWpnQ=;
        b=KScCQNCvinTalCTmPHNU/XVa1yVd8L7P64XDLNGY8F0FvkeLJ+YUsaIuxlpmCS2nrC
         nvQ7TUK5TtPONF4C/op/0GN8shJX9grPRC4rT9yeqlSjKHMlFp60iMgAl+idkU0BHZKd
         /mfwcjUZQx7SlnBYs6Rrltk8DuGPcjwI8HUJGHhUcUgdOlhGyCvnOMKck7+GCYOdY5VB
         NTy1tIzNf68hjAPC0M0JEXi/fcHuxkyCgqn2l0xwYUtLi3qxQh2dUuNIcbSebMK0QEdm
         g9neP7PF1RS8E/0YwcROzZBBFdfbBgxQDjlp8hYYRJmeDxPlzle3ggXJuvy75/SWJ4tp
         Xw1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757064870; x=1757669670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZXKC69S7By8Ya1ZMREMZuen7JwS2/FHlmhonyDWpnQ=;
        b=nCxtz8EdgMcyWTD5h2zzgzKwgIfQ589fW0ySd1IBzIXZewDfeQVyRZ3iqJ9ja5b1Fl
         YMZ12iXiHsEqfMXwEmYfbq5yynR1/ksV+ENaK6oMVXocr7wAOAeUSLGkNfbPkIY3vr7l
         Hy6+1dBRWDRUh40TyrD7w/P/sBJ0ayAXPkQpCIrlTh1VQKrQosyLt/qY9OXYuA0mxp7A
         t2dX6Bi/Gs3ZYWoxn4rQVRzR3kRg8tGkGbqVRMgPGlnp65tK43GM1/Wmo2hbRPFdsBur
         +Eeu0Sf3SKIdy4bLdURiO1eZpxCJnJHooGaEx6FwY7ZZYcki0e8RcbrN7XfT3Aa48tue
         9Lww==
X-Forwarded-Encrypted: i=1; AJvYcCUgVbNnjTv+tknzk4iZANDR3ievZFH5ITznxOh4/5+JJlxkeLjPjISE35I5R6cr33oZ7Rk=@lists.linux.dev, AJvYcCVLMizurkaazoFslnhSs3qJYLfbk8cwNQH07621uSvWWGkEF7xQ7u2DRb65Tci8+PXOHa3WQNHyPLEb6HE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8rQRahDUpnxnRlJbeN3UjF/vwkzvXL7NkDEuZfNCIbZ7+yRF2
	W7JldFdEzOjXuHWVVbtifbUSkM+cJgytYZR3g3d5xXN68fKUtsPYUVx5fcBb0bSu9i1P4UQYxJG
	meNPHmro5rrBLQ64snXrtufT3xaVSito=
X-Gm-Gg: ASbGncv93+wgsSNrQoGAfqFGsgL/z7XcQZCYuZZqS003isOmX7uiH8VJZwIc04jSTtt
	6GFJY6uOyrtI5A/DrrZ/7N+Zt1FiC5TVkUqQTTN4qFJY1cz4KeHDnGLQmrb/NTlqXu3J2v9QaLW
	vCLcTYiOIQ8Gp1yCPtnaDbdYw12kt70d0lOhFgaqs5Q6Hz05McaGah8LbkdC8NSNjAXjUVuU+CS
	PuDNIU7deX6XgQrbB+j
X-Google-Smtp-Source: AGHT+IFNrkynh+/Ymp/HCHyA5XGYRylr5jF6GjIL2qDKGYyZpbM+uW2yDfuf4gc8lpHjzkwCg5YwNrLoynQjYkyhMFI=
X-Received: by 2002:a17:907:928a:b0:b04:5b3d:c31f with SMTP id
 a640c23a62f3a-b045b3dc692mr1195506366b.49.1757064869658; Fri, 05 Sep 2025
 02:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250905072423.368123-1-zhao.xichao@vivo.com> <20250905072423.368123-2-zhao.xichao@vivo.com>
In-Reply-To: <20250905072423.368123-2-zhao.xichao@vivo.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 5 Sep 2025 12:33:53 +0300
X-Gm-Features: Ac12FXxbms9z4N7jI4jHPwNjVwlV8d4OiE5hmfmL25yynmREhxdRP_mz9jzg-_c
Message-ID: <CAHp75VforxjsHWzxrxfD_YOshvg0Y=KwrpmAPWwhyarNm2wNjQ@mail.gmail.com>
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

On Fri, Sep 5, 2025 at 10:25=E2=80=AFAM Xichao Zhao <zhao.xichao@vivo.com> =
wrote:
>
> devm_thermal_of_zone_register() does not print any error message
> when registering a thermal zone with a device node sensor fails
> and allocating device resource data fails.
>
> This forces each driver to implement redundant error logging.
> Additionally, when upper-layer functions propagate these errors
> without logging, critical debugging information is lost.
>
> Add dev_err_probe() in devm_thermal_of_zone_register() to unify
> error reporting.

...

>         ptr =3D devres_alloc(devm_thermal_of_zone_release, sizeof(*ptr),
>                            GFP_KERNEL);
> -       if (!ptr)
> +       if (!ptr) {

> +               dev_err(dev, "Failed to allocate device resource data\n")=
;

We do not add error messages for ENOMEM.

>                 return ERR_PTR(-ENOMEM);

Even if you want so eagerly to do that, it should be

   return dev_err_probe();

But, it will ignore the ENOMEM error code for printing.

> +       }

So, the bottom line, no need to add this message here.

...

>         tzd =3D thermal_of_zone_register(dev->of_node, sensor_id, data, o=
ps);
>         if (IS_ERR(tzd)) {
> +               dev_err_probe(dev, PTR_ERR(tzd),
> +                             "Failed to register thermal zone sensor[%d]=
\n", sensor_id);
>                 devres_free(ptr);
>                 return tzd;

I don't see how ptr is related to the mesasge. Can't we use

  return dev_err_probe(dev, PTR_ERR(...), ...);

instead?

--=20
With Best Regards,
Andy Shevchenko
