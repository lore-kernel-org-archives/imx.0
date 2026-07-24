Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1092534D4D6
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 10:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887837; cv=none; b=H5V9YWdxoaBR+yCPFKx1O/ump39qDsh99nst9t2Q1kn+1+z9o0stxCgX0vjqVhQqOQVUPhbOvRGuwpTuCJN6JpVZvv3GE3+AHJq/tZEbW/pdhB7JLFIC/SRQfX8mK505fWngnFZhjF4NapRDXKkM28KrMuvqmxBKLnHkTPptvfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887837; c=relaxed/simple;
	bh=ZofmaJauXnkg/zRhDqo+cIlA8kFgiWLH2dzrG7fo46c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VdN4J4tgq7QH+1c735oQwuPboUs911CPlTmNDEdKAacIKDao+y5MdzzWGzJNCpmQ6ymuH+za4KeLVP3t2m5C8DJ61k5LsAaozQHR+T0crBQPyCJHaOeUuzaTYcglRz/5R3LrXT7NDt/7+kuLtuh1UJRlD5J78Or2LSqmEDebhr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BVBmq0Fz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BVBmq0Fz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B0C81F000E9;
	Fri, 24 Jul 2026 10:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784887835;
	bh=yJ2yByZEk/ilJi8RnAFoKGy1U42Wy0X94+hUB/X/RqY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BVBmq0Fz4K1ApXDdOyqQXW+WIeHX976Ke39Jy7uokXSmZ+/BFTycgqHAQL13EfPj3
	 irFFyXLk8qPlCD6NnZVag9ALcRfQX2QONhlbmRom8G2dzpOODbemOI8k6VeDjGqF82
	 ahKeJXgK0NXdkqUMhuRb0ROiuFwxJWkfnoE7W0BosUWvv4v+SCpYIQ+DJG5gii5fDx
	 oIPT3ZcACdnrQGAnNgwTvOHr0ZPXXs3m0a2Bt8btRGtgrRLMU1+fsmfXWNQV/q2Pf1
	 EskvSN4dGMzvBXHLR6SYvD/hynR78EMhKDMN1IWY4Arobi/DYWXoxv/3wSLWZ0X5CM
	 /mpNV+wmff/eA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] power: supply: pf1550: enable charging when battery
 profile exists
Reply-To: sashiko-reviews@lists.linux.dev
To: raoxu <raoxu@uniontech.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <097F0559A936ACCB+20260724095437.368905-1-raoxu@uniontech.com>
References: <097F0559A936ACCB+20260724095437.368905-1-raoxu@uniontech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:10:34 +0000
Message-Id: <20260724101035.4B0C81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unspecified `constant-charge-voltage-max-microvolt` causes driver =
probe to fail due to unsigned conversion of `-EINVAL`.
- [High] Delayed works are initialized before power supplies are registered=
, leading to a potential Use-After-Free during teardown.
--

--- Patch [1]: [PATCH v2] power: supply: pf1550: enable charging when batte=
ry profile exists ---
commit d674322929d0145285ab1259aa1b4032720d8bd7
Author: Xu Rao <raoxu@uniontech.com>

power: supply: pf1550: enable charging when battery profile exists

PF1550 starts in charger mode 1, where charging is disabled. The driver
comment says that mode 2 should be selected for applications using a
battery, but the condition is inverted: PF1550_CHG_BAT_ON is written only
when power_supply_get_battery_info() fails.

Cc: stable@vger.kernel.org

> diff --git a/drivers/power/supply/pf1550-charger.c b/drivers/power/supply=
/pf1550-charger.c
> index a457862ef4610..a826a938f52d7 100644
> --- a/drivers/power/supply/pf1550-charger.c
> +++ b/drivers/power/supply/pf1550-charger.c
> @@ -514,7 +514,7 @@ static int pf1550_reg_init(struct pf1550_charger *chg)
>  	 * a battery. The other supported mode is mode 2, the charger is turned
>  	 * on to charge a battery when present.
>  	 */
> -	if (power_supply_get_battery_info(chg->charger, &info)) {
> +	if (!power_supply_get_battery_info(chg->charger, &info)) {
>  		ret =3D regmap_write(chg->pf1550->regmap,
>  				   PF1550_CHARG_REG_CHG_OPER,
>  				   PF1550_CHG_BAT_ON);

[Severity: High]
This isn't a bug introduced by this patch, but if the device tree specifies
a simple-battery but omits the optional constant-charge-voltage-max-microvo=
lt
property, power_supply_get_battery_info() leaves
info->constant_charge_voltage_max_uv initialized to -EINVAL.

This negative error code is assigned to chg->constant_volt (a u32) in
pf1550_dt_parse_dev_info():

drivers/power/supply/pf1550-charger.c:pf1550_dt_parse_dev_info() {
    ...
    if (power_supply_get_battery_info(chg->charger, &info))
        chg->constant_volt =3D PF1550_DEFAULT_CONSTANT_VOLT;
    else
        chg->constant_volt =3D info->constant_charge_voltage_max_uv;
    ...
}

Later, pf1550_set_constant_volt() checks this huge unsigned value and
fails its bounds check, returning -EINVAL:

drivers/power/supply/pf1550-charger.c:pf1550_set_constant_volt() {
    ...
    if (val < 3500000 || val > 4440000)
        return dev_err_probe(chg->dev, -EINVAL,
                             "Wrong value for constant voltage\n");
    ...
}

Could this cause the driver probe to unconditionally fail when the property
is missing?


[Severity: High]
This is a pre-existing issue, but I noticed the delayed works are
initialized before the power supplies in pf1550_charger_probe():

drivers/power/supply/pf1550-charger.c:pf1550_charger_probe() {
    ...
    ret =3D devm_delayed_work_autocancel(chg->dev, &chg->vbus_sense_work,
                                       pf1550_chg_vbus_work);
    ...
    chg->charger =3D devm_power_supply_register(&pdev->dev, ...);
    ...
}

Since devres framework cleans up resources in reverse order (LIFO), during
unbind or late probe failure, the power supplies will be unregistered and
freed first, and the delayed works cancelled afterward.

If pf1550_chg_vbus_work() executes in this window, it calls
power_supply_changed(chg->battery). Will this dereference a freed power
supply pointer and cause a use-after-free?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/097F0559A936ACCB+20=
260724095437.368905-1-raoxu@uniontech.com?part=3D1
