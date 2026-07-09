Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B636314B950
	for <imx@lists.linux.dev>; Thu,  9 Jul 2026 03:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783569448; cv=none; b=XtFWPBJhu9eSdsiX69qh/BMFrlrR5XjLFfbMpDYD2bDeVbu4NNV6elJETmZvJMp8oDNjg6p20b2qEw1LMdx0Fjmb1LWvyn0eZenXyuExlK9oaqtN0UKQhGB+aMnC7WltCSDVCUUbPy5GcQ13I3APTZECp2W8zAayN0QeiFIqkpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783569448; c=relaxed/simple;
	bh=CDFdtE8OY6bbI5KgRtsGpsEFE8mtNUGdRn6OmWFVepU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZTk4cwIKiJaR8EvtaZLWFePdfsC4jrntFLHklk9UwKi3IGA7GN57ZJC/mr5XMzhASxR/Dysw8LhBV+AwRiUmuf04ectOQxAzGqXlqchYUbd6kj/hvCiEd68J8vu+B5lmTibf6f1o4kDCdtbl7W6GDsjK/WPBHBuacX6qTD/UiJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FGnURMG/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGnURMG/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 701DF1F000E9;
	Thu,  9 Jul 2026 03:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783569447;
	bh=brh4qIqP72FSu7mlyK/zTMxPYFAXptmkH5I/fVdM1AM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FGnURMG/8bwd9m0BEttxW/xCYZ5zWHczvjcKY8gA7Aqf89ehLYpua7tsStcZfqi1F
	 4cD/RsMCoUu+gFgCvcamZIKMRAU20V+T+I49NwYnSQCXj7LRxi84SlmZzgF4uwSX6g
	 032oWNNSpWd+DySkYR9F0wa7n5tWbEMkzWnrO5N0WzqTzjvndowTtlBewaiUk8ZfeA
	 IsfE3Om9G3vuV2h3MbFYtA8JbviE+xFW+YtoYtJv3feGS61wyY+EcCg9e9kHr1IvOY
	 mHOYs3KUvzOUIKvT7FSikW8yqYALuZIX7KynzTKEgvnfSA4PkWOYlIAvieIN9/+Rq5
	 cvSJFKSPsZ4bw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 28/43] power: supply: pf1550-charger: Remove redundant
 dev_err()/dev_err_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260709033428.362970-29-panchuang@vivo.com>
References: <20260709033428.362970-1-panchuang@vivo.com>
 <20260709033428.362970-29-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 09 Jul 2026 03:57:26 +0000
Message-Id: <20260709035727.701DF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Inverted logic when turning on the charger based on battery presen=
ce in `pf1550_reg_init()`.
- [High] Use-after-free vulnerability during driver unbind or probe failure=
 due to incorrect `devm` registration order.
- [High] Guaranteed probe failure for device trees omitting the optional `c=
onstant-charge-voltage-max-microvolt` property due to unhandled `-EINVAL`.
- [Medium] Resource leak of `struct power_supply_battery_info` due to uncal=
led `power_supply_put_battery_info()`.
--

--- Patch [28]: [PATCH 28/43] power: supply: pf1550-charger: Remove redunda=
nt dev_err()/dev_err_probe() ---
commit 7f7745c9eb293f3e6b24f5df79b35be592a07130
Author: Pan Chuang <panchuang@vivo.com>

power: supply: pf1550-charger: Remove redundant dev_err()/dev_err_probe()
   =20
The devm_request_threaded_irq() and devm_request_irq() now automatically
log detailed error messages on failure. This eliminates the need for
driver-specific dev_err() and dev_err_probe() calls.

> diff --git a/drivers/power/supply/pf1550-charger.c b/drivers/power/supply=
/pf1550-charger.c
> index 41036f4cb64a0..94fe81bab5a21 100644
> --- a/drivers/power/supply/pf1550-charger.c
> +++ b/drivers/power/supply/pf1550-charger.c
> @@ -612,8 +612,7 @@ static int pf1550_charger_probe(struct platform_devic=
e *pdev)
>  						IRQF_NO_SUSPEND,
>  						"pf1550-charger", chg);
>  		if (ret)
> -			return dev_err_probe(&pdev->dev, ret,
> -					     "failed irq request\n");
> +			return ret;
>  	}
> =20
>  	pf1550_dt_parse_dev_info(chg);

[Severity: High]
This is a pre-existing issue, but does this devm registration order leave=20
a use-after-free window during device unbind?

In drivers/power/supply/pf1550-charger.c:pf1550_charger_probe(), the delayed
works are registered before the power supplies:

	ret =3D devm_delayed_work_autocancel(chg->dev, &chg->vbus_sense_work,
					   pf1550_chg_vbus_work);
	...
	chg->charger =3D devm_power_supply_register(&pdev->dev,
						  &pf1550_charger_desc,
						  &psy_cfg);

Since devres cleans up in reverse order, the power supplies will be freed
first. If pf1550_chg_vbus_work executes before the work is canceled, it
will call power_supply_changed(chg->battery) on a freed power supply
pointer.


[Severity: Medium]
This is a pre-existing issue, but does this code leak the battery info
structure?

Looking at pf1550_dt_parse_dev_info(), it calls power_supply_get_battery_in=
fo():

	if (power_supply_get_battery_info(chg->charger, &info))
		chg->constant_volt =3D PF1550_DEFAULT_CONSTANT_VOLT;
	else
		chg->constant_volt =3D info->constant_charge_voltage_max_uv;

The same call also occurs in pf1550_reg_init(). However, there are no
matching calls to power_supply_put_battery_info() in the driver to free the
memory allocated by these lookups.


[Severity: High]
This is a pre-existing issue, but does this code handle missing devicetree
properties correctly?

In pf1550_dt_parse_dev_info():

	if (power_supply_get_battery_info(chg->charger, &info))
		chg->constant_volt =3D PF1550_DEFAULT_CONSTANT_VOLT;
	else
		chg->constant_volt =3D info->constant_charge_voltage_max_uv;

If the devicetree lacks the optional constant-charge-voltage-max-microvolt
property, info->constant_charge_voltage_max_uv is set to -EINVAL. This
negative error code is then cast to the u32 chg->constant_volt, which
becomes 4294967274 and guarantees a failure in later upper-bound checks.


[Severity: High]
This is a pre-existing issue, but is the logic for enabling the charger
inverted here?

Looking at pf1550_reg_init():

	if (power_supply_get_battery_info(chg->charger, &info)) {
		ret =3D regmap_write(chg->pf1550->regmap,
				   PF1550_CHARG_REG_CHG_OPER,
				   PF1550_CHG_BAT_ON);

Since power_supply_get_battery_info() returns 0 on success and an error code
like -ENODEV on failure, this condition evaluates to true only when the
battery info lookup fails. This appears to turn on the charger exactly when
the battery is missing or misconfigured.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260709033428.3629=
70-1-panchuang@vivo.com?part=3D28
