Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A065125AA
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 07:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784014467; cv=none; b=SipB9nxg6t9XRZvIY+eZPbEZOSPVxLNo1qy9IgsyumDEI/sHl9XmXa5GFv4KlBTcVUfV0eJ4EjaaTYu/VjqATdoGFS5LPrjUy3nMEUdNKxjAEPR/VnsuJrONLSX9NOcHzKx/yr16et7ICPTzvpl+MeE9jCZwS08PEHftxOrKFNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784014467; c=relaxed/simple;
	bh=ByzCT3WQ1IC7Fj3hAaN0cXQyieggrGJY7iTNWe1HDEc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rv8U4pzTcCH1A9nqVOTlrngZSJKaV2VDptCu8jPVswtvxRl0cPxjkhxtYhbuoqztt7EX4j7Hpu8X077ZjfmF/kWgLnCChnhsBCRVgYmwChCJ91F8XLHLwR6f0igX86RpDQPICstKRtgx6gnJ5rIeZlwR57lCn1WHzF4T1e/QLUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVEiSHWk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVEiSHWk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6181F000E9;
	Tue, 14 Jul 2026 07:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784014466;
	bh=wWc3NNf4Mow64HmVvOEIy59FoIRTqGvqc3fXMO0d8NQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EVEiSHWkGBRyHWg9K4TaJUnZKeD6ETfCr8/T0HHm3F7vCR2RoNrh4magWSz5p+U2+
	 BD3xPAGhECkeBLLqwyL5SCiEM1tMbu//hp3e5jfSatjalLpbViULEH9eIYYdOonYz4
	 xf4RdFFuGOwd59IV4Zhbblx0TXdGcUvDiqrEhLWMBQVNuNpA1OwHyNVj/LYO6+GFV3
	 hkLe4togIVB9QNuNUDbISbs1qv2XvPHDuNA2NnrqIROAokxOkCpprJ8lQEOTKUo5Gt
	 0VH8EeGwWon3bIkZBMAzzCLpk6XXGVLt/BdWm/Tx/oJFnmTpcZDSfOJRqOucWrwFaW
	 WXlO5J4RV5Sdg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 07/20] gpio: Add missing OF module annotations
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?= <u.kleine-koenig@baylibre.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
 <72f0871dda4d65bb2b6ff8827da6a3b2dfdffab6.1784013063.git.u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 07:34:25 +0000
Message-Id: <20260714073425.CA6181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing MODULE_DEVICE_TABLE export for the mpc52xx_simple_gpiochip=
_match table.
--

--- Patch [7]: [PATCH v1 07/20] gpio: Add missing OF module annotations ---
commit 292bbbdcede3ce86fe1309d514a852f272c27bac
Author: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@baylibre.c=
om>

gpio: Add missing OF module annotations

A driver module matching devices using an of device id table is supposed
to declare that in the module's metadata. Add this information for
several drivers that failed to declare these.

[ ... ]

> diff --git a/drivers/gpio/gpio-mpc5200.c b/drivers/gpio/gpio-mpc5200.c
> index 00f209157fd0f..2c828bc922ae3 100644
> --- a/drivers/gpio/gpio-mpc5200.c
> +++ b/drivers/gpio/gpio-mpc5200.c
> @@ -180,6 +180,7 @@ static const struct of_device_id mpc52xx_wkup_gpiochi=
p_match[] =3D {
>  	{ .compatible =3D "fsl,mpc5200-gpio-wkup", },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, mpc52xx_wkup_gpiochip_match);
> =20
>  static struct platform_driver mpc52xx_wkup_gpiochip_driver =3D {
>  	.driver =3D {

[Severity: High]
This isn't a bug introduced by this patch, but since the patch focuses on
adding missing OF module annotations, should it also add one for the second
match table in this same file?

Further down in drivers/gpio/gpio-mpc5200.c, mpc52xx_simple_gpiochip_match
is also missing an export:

static const struct of_device_id mpc52xx_simple_gpiochip_match[] =3D {
	{ .compatible =3D "fsl,mpc5200-gpio", },
	{}
};

static struct platform_driver mpc52xx_simple_gpiochip_driver =3D {
	.driver =3D {
		.name =3D "mpc5200-gpio",
		.of_match_table =3D mpc52xx_simple_gpiochip_match,
    ...

Without exporting this second match table, the module lacks the modalias for
"fsl,mpc5200-gpio". Could this prevent it from automatically loading if the
system's device tree only contains the simple GPIO node (such as when the
wakeup node is absent or disabled)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1784013063.gi=
t.u.kleine-koenig@baylibre.com?part=3D7
