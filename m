Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42AB626ACC;
	Thu,  9 Jul 2026 17:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617300; cv=none; b=rKuqcxH/icZlA8XJkzCPAXKXrTG/UQvumtjAcgLP1DFXHEUn9lleoCMEy1kGFNDCaeLCAiW0y1H+E8VBNJjQmbTRSYBPCLwNr2szF/Daq+vPWir5HbIS4oS6e6kfZ9I5EGKiTCDken0Adr00kztIt0ELDdOrPMEqmJIjRGMqkHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617300; c=relaxed/simple;
	bh=q/fWZB38ybOViJyA8aBNkOH7hpHM4ak1JUFjy3UKNNI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HutQ+wXNKmz3zDZ85pvl6HgeY4LbrDvKHpN6Npw0aG25rUjCs+dJLUBBC4zN0GW5o7IMn7fp8oWGu397RQy4jk7TFz59sF4zp27XhrCPFZ1lg+O8RuzmiKQeqFgUXXvdH+HZDz2Cw+3bO3zejAxBFzDuqzs1M6OHzpXNWn0hvBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ICxtZqRl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ICxtZqRl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE72A1F000E9;
	Thu,  9 Jul 2026 17:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783617299;
	bh=oFpbxVk83nbXtfvulIEfh3qDgaIfrT2XQcTJapNFmYo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ICxtZqRl5Se61ncDQpaveXNJiSZpqe4tSp/3dO+N8mINpjmF6LNoHrdnqSot1/SEy
	 e0TKc7gHiQZ8bLsIvi8uKmPWV8khkEH/7bQdqp2YzQhEmdOasvUzLl9j0r7GzVvBTn
	 qaatK5ouS4kOvEDMYMQ1rsKLtbmSpFg6NlmZZk221AzH0xN+47N2KNY32m6X1+UtRu
	 yigD/5aHA0UWJMJ5Ie7gT0K83qP/S6Z0oVqCtAbrHe4SgtITnW+Mwc3aKohspZe51w
	 mIRGw/dx5irsv7245391wZcE+sBNIq/0HjWnl5R5nCeYykx7q159lk7ssWDI+Yx6uf
	 R6MjDOTdI/J4w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 13/23] mfd: Use named initializers for arrays of
 i2c_device_id
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: Frank.Li@kernel.org, mfd@lists.linux.dev, wsa+renesas@sang-engineering.com, imx@lists.linux.dev, lee@kernel.org
In-Reply-To: <244319440376f5f34b213c5df3ae3996dec5e732.1783615311.git.u.kleine-koenig@baylibre.com>
References: <cover.1783615311.git.u.kleine-koenig@baylibre.com>
 <244319440376f5f34b213c5df3ae3996dec5e732.1783615311.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 17:14:58 +0000
Message-Id: <20260709171458.CE72A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing `.remove` callback and cleanup for `mfd_add_devices()` lea=
ds to Use-After-Free on unbind.
- [High] Dynamic amendment of a global non-const `mfd_cell` array.
- [High] Passing complex pointers and platform data via the `.data` field o=
f the `of_device_id` match table.
--

--- Patch [13]: [PATCH v3 13/23] mfd: Use named initializers for arrays of =
i2c_device_id ---
commit 17d93c846df3c3e646099533f0b8856a806eee55
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

mfd: Use named initializers for arrays of i2c_device_id

This commit updates various MFD drivers to use named initializers for
i2c_device_id arrays. This improves code readability and ensures robustness
against future changes to the i2c_device_id struct definition.

> diff --git a/drivers/mfd/ti-lmu.c b/drivers/mfd/ti-lmu.c
> --- a/drivers/mfd/ti-lmu.c
> +++ b/drivers/mfd/ti-lmu.c
> @@ -206,11 +206,11 @@ static const struct of_device_id ti_lmu_of_match[] =
=3D {
>  MODULE_DEVICE_TABLE(of, ti_lmu_of_match);
> =20
>  static const struct i2c_device_id ti_lmu_ids[] =3D {

[Severity: High]
This is a pre-existing issue, but looking at ti_lmu_of_match just above
this hunk in drivers/mfd/ti-lmu.c, it appears to pass pointers to platform
data structs (like &lm3631_data) via the data field of the of_device_id
match table.

The MFD subsystem guidelines prohibit passing complex pointers through match
tables due to memory safety hazards and initialization ordering races. Could
this be refactored to use integer IDs or enums instead?

> -	{ "lm3631", LM3631 },
> -	{ "lm3632", LM3632 },
> -	{ "lm3633", LM3633 },
> -	{ "lm3695", LM3695 },
> -	{ "lm36274", LM36274 },
> +	{ .name =3D "lm3631", .driver_data =3D LM3631 },
> +	{ .name =3D "lm3632", .driver_data =3D LM3632 },
> +	{ .name =3D "lm3633", .driver_data =3D LM3633 },
> +	{ .name =3D "lm3695", .driver_data =3D LM3695 },
> +	{ .name =3D "lm36274", .driver_data =3D LM36274 },
>  	{ }
>  };

[ ... ]

> diff --git a/drivers/mfd/tps65090.c b/drivers/mfd/tps65090.c
> --- a/drivers/mfd/tps65090.c
> +++ b/drivers/mfd/tps65090.c
> @@ -225,7 +225,7 @@ static int tps65090_i2c_probe(struct i2c_client *clie=
nt)
> =20
> =20
>  static const struct i2c_device_id tps65090_id_table[] =3D {

[Severity: High]
This isn't a bug introduced by this patch, but looking at
tps65090_i2c_probe() in drivers/mfd/tps65090.c, it modifies the global
tps65090s array dynamically before getting to this table:

tps65090s[CHARGER].num_resources =3D 0;

Since this modifies a shared global mfd_cell array, can this cause a data
race or initialization corruption if multiple instances of the driver probe
concurrently or sequentially with different IRQ configurations?

> -	{ "tps65090" },
> +	{ .name =3D "tps65090" },
>  	{ }
>  };

[ ... ]

> diff --git a/drivers/mfd/tps65218.c b/drivers/mfd/tps65218.c
> --- a/drivers/mfd/tps65218.c
> +++ b/drivers/mfd/tps65218.c
> @@ -336,8 +336,8 @@ static int tps65218_probe(struct i2c_client *client)
>  }
> =20
>  static const struct i2c_device_id tps65218_id_table[] =3D {

[Severity: High]
This is a pre-existing issue, but earlier in tps65218_probe() in
drivers/mfd/tps65218.c, mfd_add_devices() is called manually without using
the devm_mfd_add_devices variant.

Since there is no remove callback for this driver to call
mfd_remove_devices(), does this leak the child devices and cause a
use-after-free on the devm-allocated parent data when the driver is unbound?

> -	{ "tps65218", TPS65218 },
> -	{ },
> +	{ .name =3D "tps65218", .driver_data =3D TPS65218 },
> +	{ }
>  };
>  MODULE_DEVICE_TABLE(i2c, tps65218_id_table);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783615311.gi=
t.u.kleine-koenig@baylibre.com?part=3D13
