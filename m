Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715DC3B7B66;
	Fri, 31 Jul 2026 10:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785493832; cv=none; b=rNrHB8NizzpcIAiMPAVFBoPQcnpOP6UztZ/PNuiT+mYUOvyYwCB2S+2DMbCvvdV7mZhphXVszfM2NhgPacqQ8xmtnh+MzIQGC4qtjDXFlZrF078QnefFVoR4jYl3BduvqmsmEfkjtKIFItnK0O0GtMHjmSqMLCtWLwP6vu54U/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785493832; c=relaxed/simple;
	bh=uVmergoTWylFr2Uw2vAI4u8rIXft244541362EoLcKg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ROUz0RK2hI61fz2MSpFzG5AauUJjjqYxJvTgEk0jwv5plDdani0840Nt7R7Iin7u8Te9R4M2Lqvb1psR2/pktY3rEb+DsM+dig89KkIgazv4xXfaFInfpTVZ5f9jmES857p7a+JdO8/mmeIxIpdXbb6ZlR/l0VkkoiZrLbgsWaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5FYpbxl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5FYpbxl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ABB581F00A3A;
	Fri, 31 Jul 2026 10:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785493819;
	bh=6cMgcqCGqjp50nWT3F/7rUXq2znbQG+0MwA8SBTXNQo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5FYpbxlh4dj2JEaAcVltR84vy68F2CGJRzvMNeWRmR3Ltq+Sx7RGWEDy/cu3vX6b
	 6hImdylkB5cslt1aWri2RIPAZU2rSt3zLYhi80bOiBoT0LW0cg+8swntuocLAWet7B
	 v3J6YMP/U1hb0GUc/LujtU1le4SvnbzDj508xACh9Niw+7DUXkb3yHUysbakkzQsMd
	 /9icsPlS3DduC+E9zH2RhgIbkI5QwFXDUIsuo/Mvu4qOPT2OAOnOROBBu3hR4dm5gS
	 O92dp9IYZ1vtIYKCdNtdcDK2hdTTJpS0G5MMrui//LuCZpvqoUx4dBisGHDo8UBTUT
	 iDNXpJG1lPmaw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] regulator: pfuze100: add set_suspend_disable for
 LDO ops
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joy Zou" <joy.zou@oss.nxp.com>
Cc: imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260731-b4-regulator-pf01-v2-2-a406c8737fdb@oss.nxp.com>
References: <20260731-b4-regulator-pf01-v2-0-a406c8737fdb@oss.nxp.com>
 <20260731-b4-regulator-pf01-v2-2-a406c8737fdb@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 31 Jul 2026 10:30:18 +0000
Message-Id: <20260731103018.ABB581F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The callback `pfuze100_ldo_set_suspend_disable` does not explici=
tly clear the Low Power mode bit (`VGENxLPWR`), relying on the fragile assu=
mption that the bootloader left it at its reset value of 0. If it is 1, the=
 LDO enters low-power mode instead of powering off.
--

--- Patch [2]: [PATCH v2 2/3] regulator: pfuze100: add set_suspend_disable =
for LDO ops ---
commit b5ef15eff59cfdbe79ee9305f34ea04f79252ea1
Author: Joy Zou <joy.zou@oss.nxp.com>

regulator: pfuze100: add set_suspend_disable for LDO ops

This commit adds a set_suspend_disable callback to pfuze100_ldo_regulator_o=
ps.
This supports the regulator-off-in-suspend DTS property for the VGEN LDO
regulators, allowing unused LDO regulators to be properly disabled during
system suspend.

> diff --git a/drivers/regulator/pfuze100-regulator.c b/drivers/regulator/p=
fuze100-regulator.c
> index 7d56c22b5e400..d3a0e25055248 100644
> --- a/drivers/regulator/pfuze100-regulator.c
> +++ b/drivers/regulator/pfuze100-regulator.c

[ ... ]

> @@ -158,6 +158,25 @@ static int pfuze100_set_ramp_delay(struct regulator_=
dev *rdev, int ramp_delay)
>  	return ret;
>  }
> =20
> +static int pfuze100_ldo_set_suspend_disable(struct regulator_dev *rdev)
> +{
> +	struct pfuze_chip *pfuze100 =3D rdev_get_drvdata(rdev);
> +	int id =3D rdev_get_id(rdev);
> +	struct pfuze_regulator *desc =3D &pfuze100->regulator_descs[id];
> +
> +	/*
> +	 * Set the standby bit so the LDO output is turned off when the PMIC
> +	 * receives a STANDBY event, using the per-regulator stby_reg/stby_mask
> +	 * that describe the standby control for each LDO.
> +	 *
> +	 * The stby_mask only covers the VGENxSTBY bit. The VGENxLPWR stays at
> +	 * its reset value of 0, so the LDO is switched off rather than put
> +	 * into low-power mode.
> +	 */
> +	return regmap_update_bits(pfuze100->regmap, desc->stby_reg,
> +				  desc->stby_mask, desc->stby_mask);

[Severity: Medium]
Will this sequence reliably turn off the regulator if the bootloader has
previously set the VGENxLPWR bit to 1?

Since this only updates the VGENxSTBY bit defined in stby_mask, it relies on
the VGENxLPWR bit remaining at its reset value of 0.

If the bootloader modified this bit, does the LDO enter low-power mode
instead of completely powering off during system suspend?

Could the VGENxLPWR bit be explicitly cleared here to guarantee the regulat=
or
turns off, similar to how it is handled in pfuze_power_off_prepare()?

> +}
> +
>  static const struct regulator_ops pfuze100_ldo_regulator_ops =3D {
>  	.enable =3D regulator_enable_regmap,
>  	.disable =3D regulator_disable_regmap,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260731-b4-regulat=
or-pf01-v2-0-a406c8737fdb@oss.nxp.com?part=3D2
