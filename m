Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C59E63DAAC8
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 09:16:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784884617; cv=none; b=ZqGVG8JbFdetc+qu14Oe+FIA0eaLgbyipfbXMpkYvP602WPBTXp68DqCdi9+osTmuUpW6UYGQGaA+DU/1dPnQR1vl8uSRsAb8W5mqhGTskJhOVC4v4sM39q0kWmDsKvG/9gtKvy4Q06uz7MPU4cl3VIgFPXd8eiPkO3SQuaNhjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784884617; c=relaxed/simple;
	bh=SF5OOxoUWob+aqUdZRacVxf8f9emMZJmdMOtJThxgFQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iVfeTp5AjlTRctMG1A8T555hPTak/RZUBcmBiGHNGTH5Gc1K05uPo+oBRPNH3ueYUB5z1jJ2fAwFPOtvDo6W7hxvnf6HiWvAdtlutRbnu/Y26ZD8Kl56/KAel4JUqr5HDNJzmw0lny4xTstZ3/l0MfpE2ixdPIZVmoAaudz2jzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FEMUaNRf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FEMUaNRf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62D081F000E9;
	Fri, 24 Jul 2026 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784884612;
	bh=GJ80ZrO8gk3KTzMOucen5uedac9Q5d9ZX/JnLqHM6Do=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FEMUaNRfGS+iFmW4uretmiRLGMA/ete2Kz6Y2ndPN2ksccxlmq+V1kFxvpYDOs5Om
	 t9RHBSEbAGePLgjkfGNU6hKzhWNFtmLtgYrWhUCeaPY/dEUhB8w3c3WRTdHUwAMg2a
	 Rru1mHmVYGDLuYFcc4wHHaQpJjK+HsA2HF462nvHoWVbZ4a+Fok712GIjObOn6hFLl
	 dFQWvWb/otpTsdh/akQwnc0Kjd0xuiG829bN0c9cqE/yuO9+0KgWlwqB5CrvWCS/zw
	 lTayLk7xUPFM30eavT041PTIC/xHNtvHQqeItmXffS1zTwHZLq3TKLV6TOo3sbSwSE
	 3ExqDV1/nb4Tg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] power: supply: pf1550: enable charging when battery
 profile exists
Reply-To: sashiko-reviews@lists.linux.dev
To: raoxu <raoxu@uniontech.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <D5A5255CD2B683AC+20260724090341.297438-1-raoxu@uniontech.com>
References: <D5A5255CD2B683AC+20260724090341.297438-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 09:16:51 +0000
Message-Id: <20260724091652.62D081F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Calling power_supply_put_battery_info() on a static battery profil=
e triggers a devm_kfree() WARN_ON.

Pre-existing issues:
- [High] Missing device tree property leads to probe failure due to -EINVAL=
 being cast to u32 and failing bounds checks.
--

--- Patch [1]: [PATCH] power: supply: pf1550: enable charging when battery =
profile exists ---
commit f509c83fb1ae8cc54a888243d6c3052c45c3c791
Author: Xu Rao <raoxu@uniontech.com>

power: supply: pf1550: enable charging when battery profile exists

This commit selects mode 2 for the PF1550 charger when a battery profile is
available, allowing it to charge instead of remaining in the default off mo=
de.
It also adds calls to release the battery-info objects after use.

Cc: stable@vger.kernel.org

> diff --git a/drivers/power/supply/pf1550-charger.c b/drivers/power/supply=
/pf1550-charger.c
> --- a/drivers/power/supply/pf1550-charger.c
> +++ b/drivers/power/supply/pf1550-charger.c

[ ... ]

> @@ -540,10 +543,12 @@ static void pf1550_dt_parse_dev_info(struct pf1550_=
charger *chg)
>  				     &chg->thermal_regulation_temp))
>  		chg->thermal_regulation_temp =3D PF1550_DEFAULT_THERMAL_TEMP;
> =20
> -	if (power_supply_get_battery_info(chg->charger, &info))
> +	if (power_supply_get_battery_info(chg->charger, &info)) {
>  		chg->constant_volt =3D PF1550_DEFAULT_CONSTANT_VOLT;
> -	else
> +	} else {
>  		chg->constant_volt =3D info->constant_charge_voltage_max_uv;

[Severity: High]
This is a pre-existing issue, but does assigning this value directly withou=
t=20
validation cause the probe to fail if the device tree omits the optional=20
constant-charge-voltage-max-microvolt property?

In power_supply_get_battery_info(), constant_charge_voltage_max_uv is=20
initialized to -EINVAL. Since chg->constant_volt is a u32, the -EINVAL valu=
e=20
underflows to a very large unsigned number.

When pf1550_set_constant_volt() later evaluates this out-of-bounds value=20
against its allowed range, it looks like it will unconditionally reject it=
=20
and abort the driver probe.

> +		power_supply_put_battery_info(chg->charger, info);

[Severity: High]
Will calling this on a static battery profile trigger a devm_kfree() warnin=
g?

If the device tree specifies a static battery profile (like a
samsung,eb425161la battery), power_supply_get_battery_info() returns a
pointer to the statically allocated samsung_sdi_batteries array.=20

Because this array resides in the .data section rather than .rodata, when=20
power_supply_put_battery_info() attempts to free it:

power_supply_core.c:power_supply_put_battery_info()
    devm_kfree(&psy->dev, info);

The is_kernel_rodata() check bypasses, and the devres lookup fails, resulti=
ng=20
in a warning stack trace during probe.

> +	}
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/D5A5255CD2B683AC+20=
260724090341.297438-1-raoxu@uniontech.com?part=3D1
