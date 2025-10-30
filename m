Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C512773F0
	for <imx@lists.linux.dev>; Thu, 30 Oct 2025 15:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761839110; cv=none; b=u/MKqywtRypO3Rip1oTRJ2ZLcJs3vzd1aCqAYr1xaDbRNMzXvFHoLy+xQkxfdT4aD6V4A2JsYHRmXGIniPsXcnTtWRF7kpVg8B5l2v5ONreG3Rb+j92jb+Wtx1vN6w8xkXq+nUBq8LRJ7PxWrPd1BcBmtrIWtdjf8sMXxEjIQxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761839110; c=relaxed/simple;
	bh=4wdI/kWWVfqayanlY8MhgqBGSqVwUCmL94mPJ7ck8EA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xxd0493E9NLGLfs0o4JAN9JHQQ7q72aGXqB9HYqcOUPl7bVVLbu+KrmTsPCTL5bxrJcrWnOJpfRyzvf57ib1QiB+JdRxodIr7s9iiDAqREuhh7TdKEYAQy75JguOMp1pkHeREOeqZxW8EPQBRyt63gOjInoI06hIO8TZ7BBzCog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=EZDaJRuW; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="EZDaJRuW"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-378d50e1c82so11653351fa.3
        for <imx@lists.linux.dev>; Thu, 30 Oct 2025 08:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1761839106; x=1762443906; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6akgDw0rUZ91b2lrMYaxRTJHPHTR7/7d9qqAaAZpCEw=;
        b=EZDaJRuWvYEk/0jWOoItLMifYg6Zxeskr+bsW354v3cHSt6H2lM3JKt9gJYsDcH6U0
         631Ah+2ByYZXhNW8uTT7psPf33dvn4V2hTeqedGJcsQSw153YvRra/EuslhANmsHMCZZ
         2/HZbnip0cg8YFkObYjKLvOXU1eeSk47lfCRt5zaDfH+pi7cY7QMyoOZ2OEeXqPEhciC
         LYtIzazDX7I74XbV6OQlFCGMdZLjbrhGiHi+Rp3JR9uhcXsPBm8epxr9sGrcDtPKkKd6
         qWold5ZO1N0gRybdyF8eDLVpeukxmVRfXHJiadtDsuFauEgYE8gK9HjbK/ZOkwBMhJBT
         PpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761839106; x=1762443906;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6akgDw0rUZ91b2lrMYaxRTJHPHTR7/7d9qqAaAZpCEw=;
        b=snQWtdge9AVWMmcSG+msSh1/aVufblXUjCu+p1T/ApugiSexY56T6vJ7O4f+5aVI6G
         fJXh4UpW1fGLjnIPSCMYWQ7pfgnO53sFB4x5MCpJVjG3bjrLjccHeWvNtuanJ9asxYsT
         69/Cif1C3rx/FeQOiCRnMxt5hHW9aMjHKWhgWAflFLOba59b9dRLQMnRYWehX1qe6/JO
         UPiDOgmrbasAcorF8T0U16uA/DQHG6PshNgVy18O57x/OdPY0m3SQM+8ri66g02H+1+C
         TNg4vmGoEw/ux5M/vNbrs6o3fQgAT0Uzqm56PtOVkcNhDa2O1uM5aW1I43LoPubXwOx0
         q1nA==
X-Forwarded-Encrypted: i=1; AJvYcCVZlxPw8ip5f6sfrVFuQFPvye50Rs/lvrEvEd6ni7IFCtERqKVk343EQY6NiDoEUZ0MLBY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0UqUW4VnZULVHVfu+9J4OuouwWwsPAiTVS6FdMSO7C5oM+Q2M
	OBe8uU/ByS13pfiGWSDwK3+E7ErnSQhZZhgdXwr+m3ZX8Ox3aiaw8+dNtuuWinO9tv2XeKWG/3R
	x1T/RfSiLJ2Jf4O6e/wyPEy4KKEsc2tZZrTHU5j3+6A==
X-Gm-Gg: ASbGncsXUdlfJLReq0ou1wnw3FDN0fl8KxMakHoAI5woJpKrAone6xtis0cvBSx59Vo
	p3Bfp3VtKJFy2wK3j7ksifqeYTQOzqaM+kagg4WVkxL7ZS3sMLud+mwN4M9oCS1u2WOG/3cqUyE
	FLLImBNEmA/+BGE/ViUyPzwZAI0IJ73mxDx+uAIwQDLFACyhjFEasg5eipMFkuoTuNomRCrSphT
	mCZq6R3yFDZ1LL5G3yX36+wknaky2ZW+9aflF9bkAMJWJMQkz7YdHtPhzj47o45IC4Ww/i6yuSR
	0A/lu2SZ8zVYHr9bMn/dxZ/K8v9vdPNIMcMR
X-Google-Smtp-Source: AGHT+IG9DOL9q1v7PPKQQMl6FrbUdYwOVLW19Hk65lHsAqZGusbK2QYhJ0Pdixkxw3U1XGLanb9R8lxY//92OR2J93k=
X-Received: by 2002:a05:651c:25d1:20b0:376:533f:e15a with SMTP id
 38308e7fff4ca-37a18e7596bmr831601fa.48.1761839106061; Thu, 30 Oct 2025
 08:45:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251029195619.152869-1-shenwei.wang@nxp.com> <20251029195619.152869-5-shenwei.wang@nxp.com>
In-Reply-To: <20251029195619.152869-5-shenwei.wang@nxp.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 30 Oct 2025 16:44:52 +0100
X-Gm-Features: AWmQ_blSmI92ElztzCrUwjPlKqESQNc6fO4hMknU1QrcXqAqhR50Y93g9AsOVGA
Message-ID: <CAMRc=MfugHWP=t83+ki5LaSkyX8=STn2FV=+x6msxD++ogLSyQ@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] gpio: imx-rpmsg: add imx-rpmsg GPIO driver
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 8:57=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com>=
 wrote:
>
> On i.MX SoCs, the system may include two processors:
>         - An MCU running an RTOS
>         - An MPU running Linux
>
> These processors communicate via the RPMSG protocol.
> The driver implements the standard GPIO interface, allowing
> the Linux side to control GPIO controllers which reside in
> the remote processor via RPMSG protocol.
>

Looks good, just a couple nits.

> +
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/init.h>
> +#include <linux/irqdomain.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/rpmsg.h>
> +#include <linux/rpmsg/imx_rpmsg.h>

Also at least: mutex.h, completion.h, device.h (for devm_kzalloc() and
co.), module.h, mod_devicetable.h.

> +
> +static int imx_rpmsg_gpio_probe(struct platform_device *pdev)
> +{
> +       struct imx_rpmsg_driver_data *pltdata =3D pdev->dev.platform_data=
;
> +       struct imx_rpmsg_gpio_port *port;
> +       struct gpio_irq_chip *girq;
> +       struct gpio_chip *gc;
> +       int ret;
> +
> +       if (!pltdata)
> +               return -EPROBE_DEFER;
> +
> +       port =3D devm_kzalloc(&pdev->dev, sizeof(*port), GFP_KERNEL);
> +       if (!port)
> +               return -ENOMEM;
> +
> +       ret =3D device_property_read_u32(&pdev->dev, "reg", &port->idx);
> +       if (ret)
> +               return ret;
> +
> +       if (port->idx > MAX_DEV_PER_CHANNEL)
> +               return -EINVAL;
> +
> +       mutex_init(&port->info.lock);

devm_mutex_init() to allow mutex debugging

> +
> +static struct platform_driver imx_rpmsg_gpio_driver =3D {
> +       .driver =3D {
> +               .name =3D "gpio-imx-rpmsg",
> +               .of_match_table =3D imx_rpmsg_gpio_dt_ids,
> +       },
> +       .probe =3D imx_rpmsg_gpio_probe,
> +};
> +
> +module_platform_driver(imx_rpmsg_gpio_driver);
> +
> +MODULE_AUTHOR("NXP Semiconductor");

You can state copyright for a company in the header comment, please
put your name and email address in here.

> +MODULE_DESCRIPTION("NXP i.MX SoC rpmsg gpio driver");
> +MODULE_LICENSE("GPL");
> --
> 2.43.0
>

With the above fixed:

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
