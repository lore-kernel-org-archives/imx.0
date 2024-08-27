Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A99F13C9A9
	for <imx@lists.linux.dev>; Tue, 27 Aug 2024 09:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724749694; cv=none; b=oNXI4m84TVSA7otqDfIgsQolZwTkWbJy7h13CghHBzp5Im+pa5cObPCAH3cgX0fjLJJEIE9Phr97FKBR1gQN2YZdp4686oqD0qHeonsMCMV8LTFoEYGzp+116hhSm0uYnnXPnZQWp2rLOlKWYY4RyaFf7n1/UHsRyCPLNdwFPto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724749694; c=relaxed/simple;
	bh=Igzhsr6xLKn34LLaq/367aBaun9102nWNVaY1z4JR44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jsMknwh/9z4evWz72Ul0JisWEU/ffgQF5D/90eFkciB8cUQk5mQkGp7IkRC3B2GmmbXLG08h7POQMjlhJTFPzKtSRmoUOX7mx4lOqO04/JDLiuOIYOBvabVXfWelf8V6k0LRMNTcWGNPfdO6Vxh9oxQa+y5KgXRVZtFg/xtYeLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rlde/GkT; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rlde/GkT"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-371b098e699so4170009f8f.2
        for <imx@lists.linux.dev>; Tue, 27 Aug 2024 02:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724749691; x=1725354491; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=x46mMvsDoL/gz4AXX+6m6jvlKSmgpq2B+loqNQXPG3M=;
        b=Rlde/GkTzVWtdw90/AuR5lhETZjenfaGzcU9r7b6Pv6kAXxssvp9e9jE7jYLi5HQ+z
         E+BCO0b45yUJko8XFCZHDJSpZAK33WK7wluatmGDkMp46QrnOUzn0RzdXY3x882QQNuG
         EotarBchru4oLp9sgDgyhcc6GFZI9/NqvhpakeTU2sgOuh/NypGu1Nl3L3PA9v9NcKUt
         mh5zOmQ9fPWj1VwFA0t4s9VddpTY2VZvSz95i5STjECr/zipNh8j0OB4DPg6Ocrvoe0v
         scCzcB/DNwhi7XdCn1c4TNbv2I6HRybL4GJ3OWxZrvPvCU5ycGGR5W/HI11lmMXXX9/D
         9Y9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724749691; x=1725354491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x46mMvsDoL/gz4AXX+6m6jvlKSmgpq2B+loqNQXPG3M=;
        b=YrbVuvE0U5m86I8ifk4wTWrt4TlGoBlRdZjaLKFgTGB69QOthYp+3F4y+mUO7cN+vg
         2Q3fgaHJvtB2cCsm2H5Ap+kPOElNS5ulLXCjrPkg55q6AddZqNhKT+Q31WMtFGo4cY+V
         PqRwcLFR0bmwfZ4Ueb2v3iaVyjnyv3/x0yst4khErfI8Fa0Co8JnpmjSAHd0/4w5yf3J
         bzyhZe8UeeUTKtxfByTVei2I/1z2XY2LGkaPPphnP03JEFYe8wIp6Gn8fC0thWYrzOwP
         zvPMdXsT7CL7aebajUY1WnWZZuTkGl3iwCeTgFXJNJEoFVMBeg7NXg8WfQIS+wfAE6pE
         noEw==
X-Forwarded-Encrypted: i=1; AJvYcCWEKWH9tdTFYp3wScY5JaN5w9AYfi9HXUt9u9orL05HbHY0TDqtAdJJlyhR1On2SkR9Ts8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4xvZs/iksbQVO0GVS5DxVqGsH6LUQ8GOqy+PMUF3a1puIsi8Z
	tEkg2wFAmXEu6wuadCG0EOla1Uq3DjT/zO5I2ozW+BHLSCEW1vZq
X-Google-Smtp-Source: AGHT+IFQLCNAPykfuZm35J5ShDF+paRGaZLn8ZiQyvmSeiQXC8xkPQFOp7wT6LPmO7u85DICVqVpfQ==
X-Received: by 2002:adf:f841:0:b0:371:7d3c:51bd with SMTP id ffacd0b85a97d-37311855c11mr9692614f8f.14.1724749690260;
        Tue, 27 Aug 2024 02:08:10 -0700 (PDT)
Received: from orome (p200300e41f29d300f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f29:d300:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-373081ff63esm12541788f8f.87.2024.08.27.02.08.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 02:08:09 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:08:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-input@vger.kernel.org, 
	Michael Hennerich <michael.hennerich@analog.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Hans de Goede <hdegoede@redhat.com>, 
	Tony Lindgren <tony@atomide.com>, Jeff LaBundy <jeff@labundy.com>, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 17/17] Input: tegra-kbc - use guard notation when
 acquiring mutex and spinlock
Message-ID: <m6mttlalfyekhmfmwtw7gk2j5hw7y27xowxjyn5cicdslkw4dh@4jmjzkr5cytd>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
 <20240825051627.2848495-18-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ab5cxs7alq7a5ikj"
Content-Disposition: inline
In-Reply-To: <20240825051627.2848495-18-dmitry.torokhov@gmail.com>


--ab5cxs7alq7a5ikj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 24, 2024 at 10:16:21PM GMT, Dmitry Torokhov wrote:
> This makes the code more compact and error handling more robust
> by ensuring that locks are released in all code paths when control
> leaves critical section.
>=20
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> ---
>  drivers/input/keyboard/tegra-kbc.c | 45 +++++++++++++-----------------
>  1 file changed, 19 insertions(+), 26 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--ab5cxs7alq7a5ikj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmbNl3cACgkQ3SOs138+
s6GX8RAAvqQ3qxdxgNEhzuoYU64kJDEhIbp45yyHPFYXnYAHVaCqfba9MDJxBrj1
PZjvM+kVrv7tGKfpffDPUOj3CGZP3fUwjtzD7igPP1HGSfhFYJZZms9SktzpomaR
A7O7v7uyrG2ViHe9NtGZFy5HcrwUhvrIShGqo2E4LJknvYrRzSjZRHWETX6batXa
ndo3ajfjFi1YjBCkB+ivqgBZcE6o9S1HkPOTXpAUKwssUk9H3rLQ9Lmaxn2YsDhl
gWhW2dW8UTjbB4AQJk8rC/HMtZdgJYJ7QKi2BgCFf+vjisF/tIi1kxco8rByx4No
HxPzqwKB813BInvUkUObGYIRujQR3nvmJQWrAhAezwsmiV5I02DuNA1EpoAip+FR
mhmVBSuvoSIZot03tyXA8Rqx89LZKKMwBat9+tkd3J+PsYLD9BPjzF1Gpjz6bz6f
nDqAZSQSBtQzYC/dYS+66sB4sDQdLsGZvUcWfWTiDU9qH41yoBb4QzhAd6+gNNeY
4C4Fr92yFJ+Ebd+81fdsFARzScGzszaRhuNzqyh8tDJ6welm1tREUnLWDDGP/F2p
ZAni38hyI51vkD0/WfoaZ4ZuZiI4F095fOE2rhOqEtX95VH7gxydbWVYbn9SnBOm
V24G2i/lfKeADWY2fFpUCvD3PP3HCQ6z4r90TSr1oBQCteLYhMA=
=g+bv
-----END PGP SIGNATURE-----

--ab5cxs7alq7a5ikj--
