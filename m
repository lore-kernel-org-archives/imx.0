Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5AB253324
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 21:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739999459; cv=none; b=W9WoR9aSjX0dFkMQC6iPLLC9r+U+N54VkwqKZjQsFOGFyjL5o2SDCGXcMDIQEdz9zCPLvywPd1Y9g9ZOe82+96RJ7xaDO7tVL+ciCPMzcVMwqW6dZjIEkZnSZ2qHavnXTtp3ZEnfAW87tYJHBPTJHSNDMs6vj1Cokdpak3i/81A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739999459; c=relaxed/simple;
	bh=v5P9JdcmAkaoegDp6G807wPeaePuirzxwsGg/y2egdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HYngM9AcAqmr/JeK6EsYzTinHtLW3XDGh47ywiwln57BAIt8kuJ9DrAKUu0sZWK1bgLQ0iqJGJ/f8wyJzUYhy01kG4e9HpON3oDCuF7Cm0URmfLgj0H6R6d8W/fhd9UUUzyqWv52jgcxthIh1E0OcNyQaXywDPUdvojwqPffsYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d2+sCF7l; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d2+sCF7l"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-54529e15643so1213111e87.1
        for <imx@lists.linux.dev>; Wed, 19 Feb 2025 13:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739999456; x=1740604256; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D+9nshjszkcCQWCB05PcXblSy4ZtTLxbSnQOVwr49OE=;
        b=d2+sCF7lSHIHkP98n/6rGUkFaH+0hE7DcAzbQ3ZSu/aXgSNxyXSpz44+uBMZrjhA0c
         H8FYmzKav5hPmPVPuI8luWQuivuKey/qHEd9p+ZUZXwqmAKJlCJqb7eEQKiZ7wls6auj
         FZG/zIvtM+LSGy/p+aEZTO34ETw+xp3Nna0qmMAm9MySXLkqXTKkp6Ryuh5MyosuCDg0
         qcHBJ+5LkAk9QwNvEK3nvEds29x9cSncTWRt1kWSc9ZOpYlU0UJasurRI+Rgal+seKy0
         bD+cCT0y8hlgAspxxgNpDret9Y5zVoLipCEs7WVFvN6kCWfZGOIRHCQi4Afbf0WEaYYK
         kFeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739999456; x=1740604256;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D+9nshjszkcCQWCB05PcXblSy4ZtTLxbSnQOVwr49OE=;
        b=A7GMcQTMgCMoKWOcFQ2IEHaqjg29lR7x7EJkk8iKh79x7ZxsmVTOHYGGd0PlfQqm8P
         EORLFMrSlF6AZ6rIU8EgvIDi5kEuzrCR398q9VY50Ko64wTlQOgZMzqaybtnhNgYxnB3
         7lBV+eS2bTaDxXP2qRb7fc+bMsd7kdin1tC+O9uaRnlVVY/u/DtpQxi4c+Tx9x//cTUe
         O6mMlApy3RAaus0Um23rcQZEzTKr7u2iULJnUF34F9DI3KlGZ15EjRjsyZNIu1Gqpqv6
         GW7P61re349aN4AXukdoh0AyhKS4yxQJQdBsLiWrhBxq9qNrcdlG9grMAwqE0bYydSCN
         AHdg==
X-Forwarded-Encrypted: i=1; AJvYcCVA3m9bJ/udZEWkXsnf6rq4IwwWyK+zPZ2FcyearCycCSfHVZW9+VTaPcrtbcLvm8ZOqE0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1zateekUPQrwMG6DQerZPnb2AH1cIeyBerfADqsk4Ug9J/gbI
	fNfePAdQigfquaTd/msmxron84LAEiqaLWc0E2cnl1UKmy3afZhv1rOQj82tAb/yqCrHOadz89e
	evyjqHG/e27ndfm6N00VkREoMO6oQ3Kqdsfjlqg==
X-Gm-Gg: ASbGnctyJx07OssubI84f7vIPWsZ/v5uIyUZz0DsepfblObwSfXXdek7mlaMaYA6KEv
	x0QP2N0qlPZVlCg1K9t7H8nDmU4351CVw9iBPh2bsKKgs2hPZMPCinvGVy7HnXSYcATWgRHnW
X-Google-Smtp-Source: AGHT+IFhOg9c7nz7Nl8AqPHQXn/ERl9cr5f9aNzv5wEI7EP9Xr+1zNonhiaiACnauyFsgWXV/OTiuBxpuRx/YDNPCe4=
X-Received: by 2002:a19:6411:0:b0:545:6a2:e59 with SMTP id 2adb3069b0e04-546e50004aemr198735e87.18.1739999455702;
 Wed, 19 Feb 2025 13:10:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250215-vf610-mmio-v2-0-4a91f8c8e8d5@linaro.org>
 <20250215-vf610-mmio-v2-2-4a91f8c8e8d5@linaro.org> <DU0PR04MB949653EE20B91B84D4B615A590FB2@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB949653EE20B91B84D4B615A590FB2@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Feb 2025 22:10:44 +0100
X-Gm-Features: AWEUYZnagEgkG_yMWnK2eJXBuoCS0AflXol8RNjMmUvrT6R5_r_FQz-HR7EiNfk
Message-ID: <CACRpkdZ=HcPMOWs1Ts=YWW7YcwKGntEGNvEAVWaN8qJZggr0dg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gpio: vf610: Switch to gpio-mmio
To: Bough Chen <haibo.chen@nxp.com>
Cc: Johan Korsnes <johan.korsnes@remarkable.no>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bough,

thanks for testing all my patches!

On Mon, Feb 17, 2025 at 12:24=E2=80=AFPM Bough Chen <haibo.chen@nxp.com> wr=
ote:

> 1, need to use port->gpio_base instead port->base.

Oh, what a mistake. Fixed.

> 2, vf610 has register GPIO_PDIR, if find the direction is input, need to =
read this register to get the input value.
> But for mmio driver, it will read the gc->reg_set, which is GPIO_PSOR wit=
h flags
> BGPIOF_READ_OUTPUT_REG_SET,  this is not correct. Seems current bgpio_ini=
t()
> need to add another parameter to input this GPIO_PDIR, but this will has =
big impact.
>
> I try to adjust the bgpio_init like this:
> ret =3D bgpio_init(gc, dev, 4, port->gpio_base + GPIO_PDIR, port->gpio_ba=
se + GPIO_PSOR,
>  port->gpio_base + GPIO_PCOR, port->sdata->have_paddr ? port->base + GPIO=
_PDDR : NULL, NULL, flags);
>
> But still can't work fine, because when gpio is config in output mode, it=
 will read GPIO_PSOR
> as output value, but for vf610, read GPIO_PSOR/GPIO_PCOR already return 0

But what happens if we *only* specify PSOR as setting register to bgpio?

Usually when there are set/clear registers, the block also allows direct
read/modify/write on the output data register (I have seen this once
before...)

I sent a v3 like that. Does this work?

Else I think we should perhaps simply bite the bullet and add a new
argument to bgpio_init() for passing set/clear/data triplets. It can't
be avoided: if this sort of hardware does exist with set and clear
and a non-writeable data register, then gpio-mmio should support
it.

Yours,
Linus Walleij
