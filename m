Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384C12581
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 00:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732666393; cv=none; b=bWXLkmwkxwtrIHJt3YkFNw9uGI2D2DFGWEOVkFE0g6kyF74NLT5rvxVsW+biPqZLNlc4h+IhPDag3S3Wpk2v1AAhPScCygS3xvRwp8HLFOgSmy4kvGvTtc2GzU783YHA0lH85kPWd2C/PGqvxAAvjbkMsuxVrYAJpZg7M8QJemg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732666393; c=relaxed/simple;
	bh=1s0GMdOaub6JZFEU/3kZ6RzEwRPZmYNpUF3LvYdjTPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kL9SRWkFyIZfNVK9giyWfliad3iY1/VWwfakNulvTjVmE5SnqiFB58OnVaBh3IDicRClUfTXuCcZi+JM/oyx70qpBEdqszr06WIYNalkebBQkYXkPgnbNNKGM8L2xrHvQ2aUBG227WFJgm0JpnJ0cVmhHE2hUWLSy+96QcTiIpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HzdRi+u9; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HzdRi+u9"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2ffa12ad18cso72047921fa.2
        for <imx@lists.linux.dev>; Tue, 26 Nov 2024 16:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732666390; x=1733271190; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mHAZtZY187R1tmVbvpFVMB0HrZE579WEANnpnfyzOs=;
        b=HzdRi+u9teygXx7D317PJap5IZ09ugbTUZIoi+w6o/ZmCJgoL9VD+3rvFCkyFW7ula
         MkTLZzDSHk+Q0KA2MRoqEn7WGBIIpLEqB8z+lPrHMNqK7paHsH1X3bGaDH9Z/msOXOo7
         eAteKlQm+FS1BFEAw0UL80CE/Wwjp33Sq1ZPaIhtzrgxvY7kfqpoC2y+or+uhP1uFfXK
         u1YY4XYERT47+GyrErkmyVptghwA4/0gDhi6fhQZGl27lxhz1I4hEjwf7dNDkpgFpctE
         8S/T/8Eizqndi7scWTQ9aMnsQiKXl2H980s3wx84lE2kPn2zq8yOYp1bvhehuoToE8LB
         Fyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732666390; x=1733271190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mHAZtZY187R1tmVbvpFVMB0HrZE579WEANnpnfyzOs=;
        b=VTK1tSClmODVX+1gxQBI6Yr7NO8xFbUK6jvZTCyZPnI3BDnMx6gPOlyXB4MupiamW0
         JJnAwFpWET/ItLhx0NfCCCqAlGu4ih1EFzVOR6zI7kyZi9bNh+Es+rilNViaxTqLcZ/M
         YrzIh4g17GoXisKAm9tzu0iUUPumlTB0a+KAKUvjiPpldNqppz3rKVn+tT+zeoOEu0v7
         yAwAb85m5qGDcsM24qhJ0RBgYddmZLqsOcMO/mfDLTHIBuGmT3TJW9ezrzNWTTRGXAhz
         d3dN/AmqPy9MoWDMmMaDZy97sFZELijNzyUpAf7Nx40Gh1e3JLXJaEA3V/CRa+uvOxbf
         XuXg==
X-Forwarded-Encrypted: i=1; AJvYcCUwf+kbvUw7hAaq3mqIUeT/c12GRe+dx5k5rYGX5fSuzRAxRSVfnOsMjhXE4lw1SPr8N5A=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRasRR3shwtggolRK3C9JWxXVsXwksV9w4CeXcGQ6vZLgo7Yxi
	bMHDq3BqcANoB2qE+EdR75J5VyvmcqwRmAnljO8drqD7RAxZZQT8K3lANNJenUruOniKz0hlMD0
	d2fW/sgOib4o5KsaiG8dtVkaTdMk=
X-Gm-Gg: ASbGncu7ANxXTlZZzeDo78H09CieJi1dJt87DoGYaB9NFjrSxsX5WXTZYBGE62GUje3
	8JcfxYwUMy29gjXK0dwCosGJL+rFLsAYFC1RKe1jJq5bedcUbBP00cyDRPAEz0Ck=
X-Google-Smtp-Source: AGHT+IG8q8GRhyD6Rb04/tM7viMaskxhAL4cx8GuBAEbIRuca10p/iXJ1l1H05icicDUVP5+9Ae8JTKFG8Cdjh4SJgw=
X-Received: by 2002:a05:651c:12c4:b0:2ff:54f3:a91f with SMTP id
 38308e7fff4ca-2ffd60a5943mr4507171fa.24.1732666390097; Tue, 26 Nov 2024
 16:13:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240506-imx-pinctrl-optional-v2-0-bdff75085156@geanix.com>
 <20240506-imx-pinctrl-optional-v2-1-bdff75085156@geanix.com>
 <49ff070a-ce67-42d7-84ec-8b54fd7e9742@roeck-us.net> <CACRpkdaBR5mmj43y_80b9jd3TAqRWMdCyD9EP6AY-Y0-asz4TA@mail.gmail.com>
 <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
In-Reply-To: <1ff005f8-384d-465e-9597-b6d5fd903862@roeck-us.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 26 Nov 2024 21:12:58 -0300
Message-ID: <CAOMZO5DW3t-sof_uaFa_qJPE3WFq_155mFTxGMWh0m++csgopg@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] ARM: imx: Allow user to disable pinctrl
To: Guenter Roeck <linux@roeck-us.net>
Cc: Linus Walleij <linus.walleij@linaro.org>, Esben Haabendal <esben@geanix.com>, 
	Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Jacky Bai <ping.bai@nxp.com>, Arnd Bergmann <arnd@arndb.de>, 
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 8:53=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:

> My understanding (which may be wrong) is that being able to disable
> PINCTRL was the whole point of the patch.

Exactly.

Adding back the "select PINCTRL" line defeats the purpose of the patch
in Subject.

> Fabio submitted a patch enabling PINCTRL for imx_v4_v5_defconfig and
> imx_v6_v7_defconfig explicitly [1]. I don't know if that fixes the
> problem for good - I see CONFIG_ARCH_MXC in other configurations as
> well.

Good point. I can send a v2 adding CONFIG_PINCTRL=3Dy to the other defconfi=
gs.

However, after thinking more about it, I wonder if the patch in
Subject is worth it.

It can help reduce the kernel size for LS1021A that does not need
pinctrl, but on the other
hand, it will cause pain to lots of people who have i.MX products
running custom defconfigs.

When they update their kernel to 6.13-rc1 their i.MX will not boot and
that will be a very unpleasant experience.

What do you think?

Should we go with the approach of selecting  CONFIG_PINCTRL=3Dy or
should we revert this patch?

IMHO, the benefit of this patch does not justify the bad impact on users.
