Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF18342538
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 10:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889692; cv=none; b=jqO+skDPFsI8NcP4loZEN7Lqt3r+ntLOjP9HUKcINNALGEWrVf3dN6+3Bj8YVdxfIQY7xI3sA8Kz8azMgsoKFHUO0WGkDNe9MlvimlDbxHbptqRtTKuQ3L3mllhkN6OY/5RVevvdr2FNZa5jrExcwx2xLHwApcRPacDbvboK6nk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889692; c=relaxed/simple;
	bh=Mi4uwTQVjQhwNPjc57DZ1Cv3PnlvFd2u7R2jmVcmGx0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eP6ltTXp7PmoEj6uBFVdjnppOdiW+gzQ7/fKu9QGoEc45b8it/IK9a/81rw3g3208YzhuYj1QGol/znQ1cYViz9RlW+tL982bic7KZXR98FOivHz0bjaGZocTHT9qwJN5tHp0DL2B5Na84N7ViNkq5prGyJtCYGGqGLa/3KNLDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpgaK68/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpgaK68/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A7621F00A3A;
	Fri, 24 Jul 2026 10:41:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784889691;
	bh=OyfKu+3048pDPvZC9OZWlIN95UGHJHEPbMuu3uOTNLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IpgaK68/NBM3AkCSNtcFaZyffW5/zN96xEKdfQBXJ0hIBehaModEXuHKA2oucWYfs
	 uU7k8kHC6gIYPEzzReToKEo1/pOKvGL/KEIq3TnM9W416QXQAhrg3OalxpvtacyBNZ
	 RrAORvmOPfJl816LXL4NBywcaSwJRvgrSR6E2ZC5EG1EoaNgDZ3kiavizzHlQPLlrY
	 1s5QCsIoiR5KrJDU84krX1oVvwiFUOWLRSAG6SAZb59Cd4WWDk8y7LgrteSGi4r+13
	 GywZa8F11hTCMKhdYmB1xM6JCB8PW38YpL7eYNQICwhNicgPm+MoQlsM8JUZcAsSns
	 zTy4byc/mQSyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] regulator: fp9931: Fix VPOS/VNEG voltage
 selector table
Reply-To: sashiko-reviews@lists.linux.dev
To: robby.cai@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260724103441.800522-2-robby.cai@oss.nxp.com>
References: <20260724103441.800522-1-robby.cai@oss.nxp.com>
 <20260724103441.800522-2-robby.cai@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:41:30 +0000
Message-Id: <20260724104131.3A7621F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

New issues:
- [Medium] The commit message makes technically inaccurate claims about the=
 VPOSNEG_table size and an out-of-bounds access.

Pre-existing issues:
- [High] The vcom regulator is configured with n_voltages =3D 255 but its v=
sel_mask is 0xFF, preventing the maximum voltage level from being reached.
- [High] fp9931_set_enable() leaves en_gpio asserted when wait_for_completi=
on_timeout() fails.
- [High] Incomplete error handling in fp9931_runtime_resume() leaks physica=
l regulator enable and GPIO state on regcache_sync failure.
--

--- Patch [1]: [PATCH v2 1/2] regulator: fp9931: Fix VPOS/VNEG voltage sele=
ctor table ---
commit 96adb91729b2025db8107f97477744ebe2be390d
Author: Robby Cai <robby.cai@nxp.com>

regulator: fp9931: Fix VPOS/VNEG voltage selector table

This commit fixes the VPOSNEG_table voltage mapping in the FP9931 regulator
driver. It removes a duplicate entry for 7.04V and appends missing entries
to properly clamp higher selectors to 15.06V, matching the datasheet
specifications.

> 2. Selectors 0x29~0x3F should all clamp to 15.06V (23 entries), but
>    the table has only 41 entries. Any selector value above 0x28
>    would result in an out-of-bounds table access.

[Severity: Medium]
Are these claims accurate?

The original table had 42 entries, not 41 (six 7.04V entries plus 36 other
entries).

Also, an out-of-bounds array access is not possible here since the regulator
core bounds-checks the requested selector against n_voltages (which was
correctly set to ARRAY_SIZE(VPOSNEG_table)).


While reviewing this patch, I noticed a few pre-existing issues in the same
file:

drivers/regulator/fp9931.c:fp9931_runtime_resume() {
...
> 	if (data->en_ts_gpio) {
> 		gpiod_set_value_cansleep(data->en_ts_gpio, 1);
> 		/* wait for one ADC conversion to have sane temperature */
> 		usleep_range(10000, 15000);
> 	}
>=20
> 	ret =3D regcache_sync(data->regmap);
>=20
> 	return ret;
> }

[Severity: High]
This isn't a bug introduced by this patch, but could this leak resources if
regcache_sync() fails?

It returns early without disabling data->vin_reg or clearing
data->en_ts_gpio.

This leaves the hardware perpetually on since the PM core will keep the
device in RPM_SUSPENDED without calling runtime_suspend().


drivers/regulator/fp9931.c:fp9931_set_enable() {
...
> 	wait_for_completion_timeout(&data->pgood_completion,
> 				    msecs_to_jiffies(PGOOD_TIMEOUT_MSECS));
> 	dev_dbg(data->dev, "turned on");
> 	if (gpiod_get_value_cansleep(data->pgood_gpio) !=3D 1) {
> 		pm_runtime_put_autosuspend(data->dev);
> 		return -ETIMEDOUT;
> 	}
>=20
> 	return 0;
> }

[Severity: High]
This is a pre-existing issue, but might this timeout path leave en_gpio
asserted?

If the enable operation times out, it returns -ETIMEDOUT but leaves
data->en_gpio set to 1.

Since the regulator framework assumes the device is disabled, it will not
issue a disable() call, which might leave the physical pin asserted
indefinitely.


drivers/regulator/fp9931.c:regulators
...
> 	{
> 		.name =3D "vcom",
> 		.of_match =3D of_match_ptr("vcom"),
> 		.regulators_node =3D of_match_ptr("regulators"),
> 		.id =3D 2,
> 		.ops =3D &fp9931_vcom_ops,
> 		.type =3D REGULATOR_VOLTAGE,
> 		.owner =3D THIS_MODULE,
> 		.n_voltages =3D 255,
> 		.min_uV =3D 0,
> 		.uV_step =3D 5000000 / 255,
> 		.vsel_reg =3D FP9931_REG_VCOM_SETTING,
> 		.vsel_mask =3D 0xFF
> 	},

[Severity: High]
This isn't a bug introduced by this patch, but does the n_voltages value
prevent the maximum voltage level from being reached?

By setting n_voltages to 255 instead of 256 for an 8-bit vsel_mask (0xFF),
the valid selectors are restricted to 0..254.

The maximum selector 0xFF (255) would be rejected by the regulator core,
meaning the maximum intended voltage cannot be set.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724103441.8005=
22-1-robby.cai@oss.nxp.com?part=3D1
