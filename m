Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBFE9170A10
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 10:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725099373; cv=none; b=uAxOV7GFF9IL/aJ+wAWYi04F8Jo0aMsUktl4cDEDKh/+Cna2O/lX9ci+3fNG9J3rGffm7ZFCcyaQHGaoL9D7aZ4++lF7I4865ezQSm5dryX67KF//9PvzfejYeC6xmwMRjg6H1QskifJtw37ciVeYO9F3//30zk5vQfCjszyqVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725099373; c=relaxed/simple;
	bh=7PxAHyswZLjCEcDDdIaCvCLTaRGZ61BCN7GeRk75FeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NemTxmpYKX4OJc/r0CGJ1Cz0dPFJRXqiiR5uSha8JPqEssJKFRKGm+mO/zLq3y4qUk1Hi4DYDiRjxPKvDWGDfUAOWLesLCdug6PEi0xm+hKaV8s3iBMyef9IvqnrNlIB/rAAlcPirEr01uVPZ8fBJ2JGjnXy7obJ4DBYKdO52gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QIaBe+2Z; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QIaBe+2Z"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a8684c31c60so302653566b.3
        for <imx@lists.linux.dev>; Sat, 31 Aug 2024 03:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1725099369; x=1725704169; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEegHeLswHgSFD60AbReMGvZ27oxPCuhcc/xuWI/93U=;
        b=QIaBe+2ZBg3CGf6XBlsLYZtLPXV5kxcWr6FqlS/fv2nTd3tLIc7i4q+hrnkAxLmeSs
         Op2Q7YYqLwsi95dqerHcbcTmzo1JapTRwPR0zewmxsliiQIRJCIAsvmstqG2Fd+LGnFv
         ZGTbEXTwwhkD+7RD6Cb1glZMw6I+SDaCNa0v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725099369; x=1725704169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xEegHeLswHgSFD60AbReMGvZ27oxPCuhcc/xuWI/93U=;
        b=ETEzxW3GfYlyt1k5FcrC6oeJ2E8Lpa5lckwgAx/S9XiBbFDBpEWOzk/AhstCECzdpd
         ePqsVzKyMNJkZIjoMn7xgpFtsguQxkZxmkEZo6DR0rN+SgE7y9P4bX7n6e+VjYxOKikd
         X64hLzeMRCEN2Eo75qp97ggZPoFzXsHUvrs4/l9feCSwH5ZP0ur0MGkDYpYFdQBk2jMx
         BgRUhLjMqs2MzsOBwRqsrli8FPjujUuzVHYS7bFYAd/XE9pcPOg7Db/2h8gXZsJ5WPWM
         D40Uhd0qah6XBqEU4l5rd/c8Bp8qG+tUwCQ3Fp1u6IR+Yobhp6pSYHQEvsPP3nE8Gfbg
         Q4yA==
X-Forwarded-Encrypted: i=1; AJvYcCVETMk+qD6FmS5ZZ7vTVW9RAsby6JgLCM8GYOTc/wLpQEu6WymlgCov1zSlkaGP/P/JIjo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+RF14CqucjCDyiDat52tNbU7SKVelosQfXrqpbzGwzIUo5Omj
	bdE+7eRqW5eHDyOMI59e04vBysdKVHC+xqNfku2CqpilgctKOhB+Oy33gsD5c2iEmKx6Odl9Osu
	4jUy/dVKEawOJe/LFQ5cQQ3AqpX+sVyWzOt4Xwg==
X-Google-Smtp-Source: AGHT+IEljKe8Ivg1opymQ8s5TmiI5igE90nWvac0fE5HAogxs6IEzVOg+qUSFUw6dqnweZ0GuJo22CElxQCvmh+Yss4=
X-Received: by 2002:a17:906:d542:b0:a86:af10:6a47 with SMTP id
 a640c23a62f3a-a897fad60e1mr629129166b.60.1725099368529; Sat, 31 Aug 2024
 03:16:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240831101129.15640-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20240831101129.15640-1-krzysztof.kozlowski@linaro.org>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Sat, 31 Aug 2024 12:15:56 +0200
Message-ID: <CAOf5uwk+40-qQdVYcqkEOKUdmn1UZcL2BCG_Pdd_8rphc94JWw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: dts: imx6ul-geam: fix fsl,pins property in
 tscgrp pinctrl
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Matteo Lisi <matteo.lisi@engicam.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Parthiban Nallathambi <parthiban@linumiz.com>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

HI

On Sat, Aug 31, 2024 at 12:11=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> The property is "fsl,pins", not "fsl,pin".  Wrong property means the pin
> configuration was not applied.  Fixes dtbs_check warnings:
>
>   imx6ul-geam.dtb: pinctrl@20e0000: tscgrp: 'fsl,pins' is a required prop=
erty
>   imx6ul-geam.dtb: pinctrl@20e0000: tscgrp: 'fsl,pin' does not match any =
of the regexes: 'pinctrl-[0-9]+'
>
> Cc: <stable@vger.kernel.org>
> Fixes: a58e4e608bc8 ("ARM: dts: imx6ul-geam: Add Engicam IMX6UL GEA M6UL =
initial support")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts b/arch/arm/boot/dt=
s/nxp/imx/imx6ul-geam.dts
> index cdbb8c435cd6..601d89b904cd 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-geam.dts
> @@ -365,7 +365,7 @@ MX6UL_PAD_ENET1_RX_ER__PWM8_OUT   0x110b0
>         };
>
>         pinctrl_tsc: tscgrp {
> -               fsl,pin =3D <
> +               fsl,pins =3D <
>                         MX6UL_PAD_GPIO1_IO01__GPIO1_IO01        0xb0
>                         MX6UL_PAD_GPIO1_IO02__GPIO1_IO02        0xb0
>                         MX6UL_PAD_GPIO1_IO03__GPIO1_IO03        0xb0
> --
> 2.43.0
>

Reviewed-by: Michael Trimarchi <michael@amarulasolutions.com>

Thank you
Michael
