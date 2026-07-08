Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB27432BDA;
	Wed,  8 Jul 2026 11:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510375; cv=none; b=Ths9hjdlduqV528avZ8nMugxvyXUa3nTmpJlewl9F0R3gKBMqOFEZzUARi0WIp3pv08xjS8mPqzKY9s0CxuWDup3Et++iHO4lrle7RbXNbqArZ0nzbosLzDsrUfqd3RNQ7cMGaLhplrCbcyOgNe4MllPFSC60f19WaplGJ19u0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510375; c=relaxed/simple;
	bh=XYdZIiu2wTXRO4tUC9BQam+herHWSxI13JNMqrMBJ74=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EeTSLkZgw3x8iRTXGiD9ZBt+VxS4Y/lfhUTDGecL7BDOPcRAVRxymRGF+E3GYth8dqVMXVRYi02kEy9tOROcuokaQlTBfHlUs4CIzUW76b1WbCTUmaFqIznIBSUadMFx2ghYzcLMFs94Dq/Sfp9zW//VT6+z/5qe+r8QBUaCqbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UO6AXAgz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UO6AXAgz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2083D1F000E9;
	Wed,  8 Jul 2026 11:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783510374;
	bh=nyPTOrupxzeqmhbVaY86CY4pdaXs7ETtN5oEClhDWJ0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UO6AXAgzYayS3RAh+LyXS+MxuUSoTOfAwwf4eLT2KiN2UfSi/Vrt6+Tzl2T85NYwl
	 BHLTHW30ghK48aCuYfAtWCbKmna2UyovS8TeROQpmwctLemo7FtQwAukQS7L08J3Ev
	 881sysQCcSdEWwlYCBcADivCJWCngAX03C0U8GB7sRn9USYUnG2oIPJaLTnCqEblxY
	 rzteI/w6nplGWMk0YGTUcyoCUwbnimxN5vHdNauaRe6Az3sgItr/HuvSPgcmUcJYb6
	 iobUmpNNWKuSrh+XKaBy+/UjkhIv8M6wO2frv88xt+GLBkN25AwOyzYYi3prQ2lPqY
	 TNdYTbUGgsbow==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 21/23] mfd: Unify style of of_device_id arrays
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: wsa+renesas@sang-engineering.com, Frank.Li@kernel.org, linux-sunxi@lists.linux.dev, neil.armstrong@linaro.org, imx@lists.linux.dev, mfd@lists.linux.dev, linux-amlogic@lists.infradead.org, lee@kernel.org
In-Reply-To: <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
References: <cover.1783507945.git.u.kleine-koenig@baylibre.com>
 <ce43f6ec640a7835d64d3d696ff09229c3d31075.1783507945.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 11:32:53 +0000
Message-Id: <20260708113254.2083D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Inconsistencies between the commit message's stated formatting rule=
s and the actual modifications in several files.
--

--- Patch [21]: [PATCH v2 21/23] mfd: Unify style of of_device_id arrays ---
commit 38160e259bf192b6d1cf5cbe5c20b7b81df1f0bc
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Unify style of of_device_id arrays

This commit unifies the coding style of of_device_id arrays across multiple
MFD drivers. It aims to ensure consistent spacing, comma placement, and
terminator formatting as specified in the commit message.

> diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
> --- a/drivers/mfd/stmpe-i2c.c
> +++ b/drivers/mfd/stmpe-i2c.c
[ ... ]
>  static const struct of_device_id stmpe_of_match[] =3D {
[ ... ]
> -	{ .compatible =3D "st,stmpe1801", .data =3D (void *)STMPE1801, },
> -	{ .compatible =3D "st,stmpe2401", .data =3D (void *)STMPE2401, },
> -	{ .compatible =3D "st,stmpe2403", .data =3D (void *)STMPE2403, },
> -	{},
> +	{ .compatible =3D "st,stmpe1801", .data =3D (void *)STMPE1801 },
> +	{ .compatible =3D "st,stmpe2401", .data =3D (void *)STMPE2401},

[Severity: Low]
This isn't a bug, but does this entry miss the required space before the
closing brace? The commit message mentions adding a space before a closing
brace as part of the style unification.

> +	{ .compatible =3D "st,stmpe2403", .data =3D (void *)STMPE2403 },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(of, stmpe_of_match);

> diff --git a/drivers/mfd/tps6507x.c b/drivers/mfd/tps6507x.c
> --- a/drivers/mfd/tps6507x.c
> +++ b/drivers/mfd/tps6507x.c
[ ... ]
>  #ifdef CONFIG_OF
>  static const struct of_device_id tps6507x_of_match[] =3D {
> -	{.compatible =3D "ti,tps6507x", },
> -	{},
> +	{ .compatible =3D "ti,tps6507x" },
> +	{}

[Severity: Low]
This isn't a bug, but should this list terminator have a single space insid=
e?
The commit message notes a rule for using a single space in the list
terminator.

>  };
>  MODULE_DEVICE_TABLE(of, tps6507x_of_match);
>  #endif

> diff --git a/drivers/mfd/tps6594-i2c.c b/drivers/mfd/tps6594-i2c.c
> --- a/drivers/mfd/tps6594-i2c.c
> +++ b/drivers/mfd/tps6594-i2c.c
[ ... ]
>  static const struct of_device_id tps6594_i2c_of_match_table[] =3D {
> -	{ .compatible =3D "ti,tps6594-q1", .data =3D (void *)TPS6594, },
> -	{ .compatible =3D "ti,tps6593-q1", .data =3D (void *)TPS6593, },
> -	{ .compatible =3D "ti,lp8764-q1",  .data =3D (void *)LP8764,  },
> -	{ .compatible =3D "ti,tps65224-q1", .data =3D (void *)TPS65224, },
> -	{ .compatible =3D "ti,tps652g1", .data =3D (void *)TPS652G1, },
> -	{}
> +	{ .compatible =3D "ti,tps6594-q1", .data =3D (void *)TPS6594 },
> +	{ .compatible =3D "ti,tps6593-q1", .data =3D (void *)TPS6593 },
> +	{ .compatible =3D "ti,lp8764-q1", .data =3D (void *)LP8764  },

[Severity: Low]
This isn't a bug, but are there two spaces before the closing brace on the
lp8764-q1 line? It looks like this might have been missed during the cleanup
to ensure a single space before the closing brace.

> +	{ .compatible =3D "ti,tps65224-q1", .data =3D (void *)TPS65224 },
> +	{ .compatible =3D "ti,tps652g1", .data =3D (void *)TPS652G1 },
> +	{ }
>  };

> diff --git a/drivers/mfd/tps6594-spi.c b/drivers/mfd/tps6594-spi.c
> --- a/drivers/mfd/tps6594-spi.c
> +++ b/drivers/mfd/tps6594-spi.c
[ ... ]
>  static const struct of_device_id tps6594_spi_of_match_table[] =3D {
> -	{ .compatible =3D "ti,tps6594-q1", .data =3D (void *)TPS6594, },
> -	{ .compatible =3D "ti,tps6593-q1", .data =3D (void *)TPS6593, },
> -	{ .compatible =3D "ti,lp8764-q1",  .data =3D (void *)LP8764,  },
> -	{ .compatible =3D "ti,tps65224-q1", .data =3D (void *)TPS65224, },
> -	{ .compatible =3D "ti,tps652g1", .data =3D (void *)TPS652G1, },
> -	{}
> +	{ .compatible =3D "ti,tps6594-q1", .data =3D (void *)TPS6594 },
> +	{ .compatible =3D "ti,tps6593-q1", .data =3D (void *)TPS6593 },
> +	{ .compatible =3D "ti,lp8764-q1", .data =3D (void *)LP8764  },

[Severity: Low]
This isn't a bug, but could we also reduce the double spacing before the
closing brace on this line to match the intended single-space style?

> +	{ .compatible =3D "ti,tps65224-q1", .data =3D (void *)TPS65224 },
> +	{ .compatible =3D "ti,tps652g1", .data =3D (void *)TPS652G1 },
> +	{ }
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783507945.gi=
t.u.kleine-koenig@baylibre.com?part=3D21
