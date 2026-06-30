Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E56D2403B19
	for <imx@lists.linux.dev>; Tue, 30 Jun 2026 10:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782816773; cv=none; b=UK2BQ3vbMfGe5M8om0qk5g98bR87zky774cQr1E7EDZxOFn+bELayiZJZksLgeJBaQh4DoOY8TTSpHhGWSGZccC0KiXfa57+1TIXAeHcoGWMzYP42Bqh0YYw0H7A1N9vWQhm18AinnG4+quDDaY94xR9YXHnUDV5W6nrvmUg7so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782816773; c=relaxed/simple;
	bh=0pJDoQNVAl+vUyAXUq1cVHWifjLjmES9E8ChDISZpQI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XyEI13aH7rYxrc5YaKg96OmNgEaUtpdsqO+rX2LR73LvWx772JW6Hlj8B8tDO9AHRlzDgB0OU6uAN2DRaYBNkOEtbMThbkFiR+ExHVlV/2PJVVetismnFRvBeAVhBvieS12crWdciMx+1mDAdyLXspchBSFfMD0KFvzkp8Alw6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYF/1TzH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYF/1TzH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE621F00ACA;
	Tue, 30 Jun 2026 10:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782816764;
	bh=pZiwdHb5NM+LDKwDaBQ4jpdM2owSKEOXvHH5zt4wVzE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AYF/1TzHChvmxLfHURa5RlAXuVESYNzJa8kPLTgmXlH+GAh8Fhm3nExZ/IiuzyW+Q
	 los+dDubcizU4wbPRY60CQ9OQ4R4kJUbkqG8GU557bvD0Aco6+593a7EkJCQzr376Z
	 rL5T3/d2YLpedWOBTB8o71O8MODZvudWiiONOEsYPqOKB6e5r6yHUI+pDyUjMAPVKZ
	 sgwiIoDfHMs235hIwY9bvkepZ9GZEKp9Sw1QjfbRFSL74K833tS7rj03Xwsk5e4m61
	 rUG6wW17OL8GZaVYi/cm1ItkSrmMdbqbagUuJLkidRkSulUvtIWjdPqclhdqunm8Hm
	 CBMlHGnea7hyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] phy: fsl-imx8mq-usb: add runtime PM support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Xu Yang" <xu.yang_2@oss.nxp.com>
Cc: imx@lists.linux.dev, vkoul@kernel.org, linux-phy@lists.infradead.org, olteanv@gmail.com, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260630-imx8mp-usb-phy-improvement-v5-3-25d616403844@nxp.com>
References: <20260630-imx8mp-usb-phy-improvement-v5-0-25d616403844@nxp.com>
 <20260630-imx8mp-usb-phy-improvement-v5-3-25d616403844@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 30 Jun 2026 10:52:43 +0000
Message-Id: <20260630105244.2CE621F00ACA@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `pm_runtime_disable()` in `imx8mq_usb_phy_probe()` error p=
aths causes a `disable_depth` imbalance and PM state corruption.
--

commit e9418c8d510e8492ef9a52ace4cb6d672041d448
Author: Xu Yang <xu.yang_2@nxp.com>

phy: fsl-imx8mq-usb: add runtime PM support

This commit adds runtime PM support to ensure the PHY is properly powered
and clocked during register access, preventing potential system hangs.

> diff --git a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c b/drivers/phy/fre=
escale/phy-fsl-imx8mq-usb.c
> --- a/drivers/phy/freescale/phy-fsl-imx8mq-usb.c
> +++ b/drivers/phy/freescale/phy-fsl-imx8mq-usb.c

[ ... ]

> @@ -708,6 +695,9 @@ static int imx8mq_usb_phy_probe(struct platform_devic=
e *pdev)
>  	if (IS_ERR(imx_phy->base))
>  		return PTR_ERR(imx_phy->base);
> =20
> +	pm_runtime_set_active(dev);
> +	pm_runtime_enable(dev);
> +
>  	phy_ops =3D of_device_get_match_data(dev);
>  	if (!phy_ops)
>  		return -EINVAL;

[Severity: High]
Does this code need a cleanup path to call pm_runtime_disable() on probe
failures?

If functions following pm_runtime_enable() fail (such as
of_device_get_match_data(), devm_phy_create(), or devm_regulator_get()),
the driver returns the error directly without cleaning up the PM state.

This can leave the disable_depth counter out of sync. If the device probe
defers (for example, if devm_regulator_get() returns -EPROBE_DEFER) and
runs again, the subsequent pm_runtime_enable() could drop the counter
below zero. This might trigger an unbalanced pm_runtime_enable warning
and leave the device permanently stuck in RPM_ACTIVE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260630-imx8mp-usb=
-phy-improvement-v5-0-25d616403844@nxp.com?part=3D3
