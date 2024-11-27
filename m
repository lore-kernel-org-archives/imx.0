Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759A420010A
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 21:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732743528; cv=none; b=qPoNsnge4oM2vT0pEaDfSSPhQhYx6knYuWGU+NMzh42X2Xyvg0Llaav4Fdy70CHUHfSG9ZMXn/+Zn0wvtPBhUDZsXJO93dgYTI8NXySE+YhrmMdM+qyzDTtrbITyPdE1u0q3th84ATgMNivq5KEjnZqOswhhQmqBWF/YPQe7lF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732743528; c=relaxed/simple;
	bh=a32dwi3I+ct+r4Lez1UL06jDs58S4+Lh3Ccrl6GbYHQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZG29FV1LeOQGTTKfWHNTArQ2tEGB8Qb4B4eROBcgvG0pmcYl/ueJeXswN7LwHFuGVrUdgw53EG3BTrRHS1iEfpsL/ejKBFbFbBrinNCANtgux25qFhU62MTklKuy+S+0mwlm6bQ7BF9YC7L7xKcVwlOBjDqdLORkbh7ExWeZlpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qk+j0/qk; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qk+j0/qk"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53df31ca44eso144700e87.2
        for <imx@lists.linux.dev>; Wed, 27 Nov 2024 13:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732743524; x=1733348324; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a32dwi3I+ct+r4Lez1UL06jDs58S4+Lh3Ccrl6GbYHQ=;
        b=Qk+j0/qkR4XO/TOrDLNVuWrsES7JqXrbxron1kJX0PoX9BaJdCBLpt7vuWe3OVoHiz
         N/jBWvru6KSIAtBiKYVSWhUQ+XtdWGv8YvoPCLkLeS2L5WVCk95SlMLa+lb2xtzNtWnC
         BLpMfX17L/HOesRGJLIt6CAgi1njVYpvImJWL47RpG61arIQSxMedrO/eCmEK6imqFR/
         BjB2m3Ouy6FfaJb5DhO7eRepUi0FhKrauV1y/5YaVVGBk99c541Su8vuAaIHT1JKH9hF
         pnwHNjKRbmuBzQIONADvwtwq6v34t1NksUCqzandFN/UHvnBbxp9G8YbBQ2MaFscdXuC
         iD2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732743524; x=1733348324;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a32dwi3I+ct+r4Lez1UL06jDs58S4+Lh3Ccrl6GbYHQ=;
        b=JuaNtYkK6t6g16NaEx1vwGKbw0QcC0WA9XGZwMqJ31H2yozVt8SA8OVnnfcoixlxp6
         Iwrcu9KJQOHwvyqcx+Lf6nPtsw8zkWdXus2vBKG1FdUDgjOnyt7QfVVlsS5mRl36RDv5
         rst5+HekQQg+aGCOBmwaaOOP8dyxdCZo0kXAC8J5Ggiemt1/71QwkkmzLw35t/G3UbsY
         uHUphiOzMKi05wIRWw7ox3PCrj2zkbI6DCEesJCcMt/GlyvJ5YUHnxMW6oOyppzstdsK
         jZEY+OobYHGtct+tHe5EyxM0slx2LQScLDWeDFNnT7LzUw6RgUGfv0/2Bk8a+jNL//5m
         +qbA==
X-Forwarded-Encrypted: i=1; AJvYcCUjFmiaQmLVI5J0bvIvnTzHkx6RpY/BfZfMTdFAd3wX6p0wbIHC1Kod3Lx0xQDzUzmgZ5k=@lists.linux.dev
X-Gm-Message-State: AOJu0YzHLym7S2aKq9fNI83axOYBBn4jdwN3t3pTvLCXMqqaKL0ddnSF
	Glzc5ZZkU+Gbbr8QTEXYsWktcohHxzzzk+HILLg0y2ON/YR94/MMPE45sC+Fqpda/eG7e+DKZaT
	S7CCNguVIOI+BUYOH5kMAPl+MExQNS8YrbQswxw==
X-Gm-Gg: ASbGnct/4QD5o+h7mShSgMNgWXgFz2W7oeupauP022jbTkDwyiBdTbG7xvudRuErrYP
	Sl1RsdkNfbOzL9E4tKtCIhL3DxNwmLg==
X-Google-Smtp-Source: AGHT+IHhrk7Oe1mo46bXXrnp90+4dmwR8w8R+FShHf5F+VcT9CvXBjjTqxBWxv0IEKj9iEI0oKllcWBS3HFl8fzSaHQ=
X-Received: by 2002:a05:6512:3a8f:b0:53d:d572:98da with SMTP id
 2adb3069b0e04-53df00dc973mr2789547e87.26.1732743524534; Wed, 27 Nov 2024
 13:38:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241127190605.1367157-1-festevam@gmail.com>
In-Reply-To: <20241127190605.1367157-1-festevam@gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 27 Nov 2024 22:38:33 +0100
Message-ID: <CACRpkdZ5oQZY62QeEmygq5md3Si5ZpSG-mL39JCe2upaUyJcEQ@mail.gmail.com>
Subject: Re: [PATCH v2] ARM: imx: Re-introduce the PINCTRL selection
To: Fabio Estevam <festevam@gmail.com>
Cc: shawnguo@kernel.org, linux@armlinux.org.uk, s.hauer@pengutronix.de, 
	esben@geanix.com, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux@roeck-us.net, arnd@arndb.de, Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 8:06=E2=80=AFPM Fabio Estevam <festevam@gmail.com> =
wrote:

> From: Fabio Estevam <festevam@denx.de>
>
> Since commit 17d210018914 ("ARM: imx: Allow user to disable pinctrl"),
> the CONFIG_PINCTRL option is no longer implicitly selected, causing
> several i.MX SoC pinctrl drivers no longer getting selected by default.
>
> This causes boot regressions on the ARMv4, ARMv5, ARMv6 and ARMv7
> i.MX SoCs.
>
> Fix it by selecting CONFIG_PINCTRL as before.
>
> This defeats the purpose of 7d210018914 ("ARM: imx: Allow user to disable
> pinctrl"), but it is the less invasive fix for the boot regressions.
>
> The attempt to build Layerscape without pinctrl can still be explored
> later as suggested by Arnd:
>
> "Overall, my best advice here is still to not change the way
> i.MX pinctrl works at all, but just fix Layerscape to not depend
> on i.MX. The reason for the 'select' here is clearly that the
> i.MX machines would fail to boot without pinctrl, and changing
> that because of Layerscape seems backwards."
>
> Fixes: 17d210018914 ("ARM: imx: Allow user to disable pinctrl")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Closes: https://lore.kernel.org/linux-arm-kernel/49ff070a-ce67-42d7-84ec-=
8b54fd7e9742@roeck-us.net/
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
