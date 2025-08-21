Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DA82C21CA
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 11:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777041; cv=none; b=obJuLJVF4PLf/XygtXL1PmRGIlI1qJY9S8jxNQXU9HqSLGV05hGt0rtmuiqrE4UZgK4DkJKTdAPYyGmen59FOzuNhl2yV8TKMzzE4DN5qbgrVMzBLSOs5aPAGBlSgK4ZoNCrFwIj/aYppycqYf9njyMK4GiKl0NdjuGdkuMzkXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777041; c=relaxed/simple;
	bh=GI2XcWaMkZXf3XlixG2IPGL+6e9Vy4tl86zb1yjrRNY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H7yUl7CUyn3Arfe2VIuhmELuy4rqgFgWiH9I/bRt04abItNcJ4a0axfig9/LzecoXxlzMH1lKkzGD53v24YgVfuFx77Coock9Dk5rEvBdYYbwUwxsAzQcUiob4dAGQIpV/93IsmfvgD0Cn6y8m9AKhkgV8YVuftLY9vU3ZFPVm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com; spf=pass smtp.mailfrom=melexis.com; dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b=iW2Wiqzu; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=melexis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=melexis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=melexis.com header.i=@melexis.com header.b="iW2Wiqzu"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7e87067b15aso96418685a.3
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 04:50:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=melexis.com; s=google; t=1755777037; x=1756381837; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GI2XcWaMkZXf3XlixG2IPGL+6e9Vy4tl86zb1yjrRNY=;
        b=iW2WiqzuS30I34d2dy6x27wBzTJzncGKYVxsHaqhp9FKtTv2PAYV4j0oBICQen9Yyc
         6ekLfMSHmPa/R8UdnPfEDOUl7UeFI0Gb0xw8AiAb6O1nUdWpPTAGn92mw0zjbnepNVDC
         UAgnk0OIkKTT4cDWQvqsWzULN5zRd6xAv1M5NVoWNK4CSY0+RjmVy4Oxk6Dgcn8iiVoq
         FfcBmaSc340GQpBYQcxVSBO0ihRhi+lI2ajaSKwj0ZGLWKr/SXq9MPSLQl2zZvDW/N61
         FseFHaeLOkTTTUip2S5xVitKZmCxIeMJfH/F3x3hQVPKiPeEQTgTMTXICIgstMc2LAgY
         vgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777037; x=1756381837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GI2XcWaMkZXf3XlixG2IPGL+6e9Vy4tl86zb1yjrRNY=;
        b=ojfWcTA0cPhjIKT6ja4vdROg+CLWbEdse4NIztqFlfggIPANtkybn2iYGP7CFKmrEq
         0fpPQdg740Hit84VwnxmKAc1jjp84W5BK5DV2t3EZKt1vSvXmidYLvyMazxI+aP0GM/e
         yob7pXAPqojzTwIFlFXOX5NGisOSTppzUB+yiK4kKrBoQc/xvkf8zkWoEN7yJE2VukuD
         1z0N2LRORjvALafmaxkkbVr4Q44mgtqh2/y8BD9PD4AGWKqNF7jn9F+AZElIvAq2tikL
         52jyYbmyMudfIUjNyiNxmVeX+cQAMh8F4wXvCySlPQIv5ORJwmDgcc3cMq+iXOx6hkGK
         9QXw==
X-Forwarded-Encrypted: i=1; AJvYcCWRMwSHs1kRmuPD6RR5EYqsVjl5gctEh0W7rUlzTW6uwSGUSueFYTyND+fWP8SXQFJSvhs=@lists.linux.dev
X-Gm-Message-State: AOJu0YyaHUxTLyAto6/6CRxy+QI3+dpcm7R2VhSPA6c68QVkhXzOCgab
	ZNN4rcrrnF75cKdlaHb6CBs9iTF+zbTEhw6fZVTmYbCmQhCSOSJcNs96rTZPmxDrJZxpNwapThK
	PWUld1vDGEsg9k0GQM4T18FSVj6d1Q+HS4Zwf0eoH
X-Gm-Gg: ASbGnctQKZ5rJn/V4D7NIJc4iB+P/4aafasg/GVF/CRhwQrfgQ0uwTtivHlVEzZK2fv
	iTDClgxUg2L3y82ewVAT6QnsJ/IMX5E9nKwlptJPxDIy3NDySkkJ7JU/t088qo1RwfaL4erevga
	wMk3+DNlYbVNZuyTbETv9lZgSqW3rpikzuj2WCY45LWeXk4TuvpipcWmjeLGucpB63fV0DjRqQ+
	+Z8Y2sAjA==
X-Google-Smtp-Source: AGHT+IFXgN4z+V5r61maVUoVH7Q+4oGAXqZzaV+iRCJ0lg/aewM1N1+KmnykJmm4zHXRs1rwg//XUIeBfKZTRO4+v7g=
X-Received: by 2002:a05:620a:4548:b0:7ea:5aa:84fe with SMTP id
 af79cd13be357-7ea08c78a25mr207064785a.2.1755777037356; Thu, 21 Aug 2025
 04:50:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821080723.525379-1-zhao.xichao@vivo.com> <CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
In-Reply-To: <CAHp75VeDvK8cOr=rVGj_hVX5YzXM-UqrWRBgUrhiA1wzYn7C_w@mail.gmail.com>
From: Crt Mori <cmo@melexis.com>
Date: Thu, 21 Aug 2025 13:50:00 +0200
X-Gm-Features: Ac12FXxGX8W0hsOM6YtKDXVSOgl06ennUByjlBCRIy2fIDyre-p0gjpggdKZ2cA
Message-ID: <CAKv63uvfHYATd7ZFweZ0LMfTLt-idHVgYJqOV8PvzaNeigbt9w@mail.gmail.com>
Subject: Re: [PATCH 0/7] iio: Remove dev_err_probe() if error is -ENOMEM
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Xichao Zhao <zhao.xichao@vivo.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Andreas Klinger <ak@it-klinger.de>, Haibo Chen <haibo.chen@nxp.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Marius Cristea <marius.cristea@microchip.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, Gustavo Silva <gustavograzs@gmail.com>, 
	Tomasz Duszynski <tomasz.duszynski@octakon.com>, Jagath Jog J <jagathjog1996@gmail.com>, 
	Per-Daniel Olsson <perdaniel.olsson@axis.com>, Waqar Hameed <waqar.hameed@axis.com>, 
	Yasin Lee <yasin.lee.x@gmail.com>, Julien Stephan <jstephan@baylibre.com>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Sorry duplicate - as I commented on driver.

On Thu, 21 Aug 2025 at 10:13, Andy Shevchenko <andy.shevchenko@gmail.com> w=
rote:
>
> On Thu, Aug 21, 2025 at 11:07=E2=80=AFAM Xichao Zhao <zhao.xichao@vivo.co=
m> wrote:
> >
> > The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
>
> when the error
>
> > Therefore, remove the useless call to dev_err_probe(), and just
> > return the value instead.
>
> In favour of this series,
> Reviewed-by: Andy Shevchenko <andy@kernel.org>
> (yes, I indeed looked at all patches in this one :-)
>
I am not sure I agree with this. It provides an error message with
reason and I understand we want as few as possible, but this would be
a valid remark inside the logs, but without it we only get error value
to figure out where it comes from?

> --
> With Best Regards,
> Andy Shevchenko
