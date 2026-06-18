Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8310F2EBBB7
	for <imx@lists.linux.dev>; Thu, 18 Jun 2026 02:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781748419; cv=none; b=EhJShnykahdVkz7rAN6rtdib9NxN9n5G3ALVrg5uxUNSyzn8WQS7Jj0nG1emFcxw/h2+/ui0xF2mIZunAnQP05eLyYLnhLEltCg3Yyls0A7v+UQwW5K5xME3FNmb14VaOMYKvDDqYG6gCcPJ4xniU/q7FTdPX90nfU5ucH8ChhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781748419; c=relaxed/simple;
	bh=fNClGgfvDCutX7H1/X/OfEaGgGWXcQbgZ1gvrAb+WOU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WmMt/tsp/DOUjIs0KXQVMa7kbHFXWAVy1QlOr3z4c+Pw6k2PGkh6XKq02bo9QFgLbQgqJCMSO37jKsW+B5rX0Gu5inELM6cVh4tD6MTzBDwwazLXWSJeoZgDbY5e8rebwRHCpvl0aWVppE90aTLSLf1fBDmiqbhhUMbNebPoVOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oyxf6Bjo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oyxf6Bjo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0BA81F000E9;
	Thu, 18 Jun 2026 02:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781748418;
	bh=W8/yJo+A8kU6zQEsPAKSo7E/COARmBvNI5NAUrdk/Ig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Oyxf6Bjob5Hwlih9UuPKiGtfj7jbUBPKz2ajghNXO+vRMqR1MA8BanHViceES7k6l
	 nu9UDeVGhieGzNQu5JmwLjicFkakNzDOC5UnYsm7W65o/tH90dMEgTNQJ/XvulXueh
	 mNr69y8lWYdT6bF0fmQAro43m819rNO9cPoDvD6/zrTWHSIRFtL+0x4JQ2STw1W93I
	 fK6hn8ZAFrcGcH5D+Pb5eRuA3RPAQTEkPYKZXpbGB6W3xRHNzpREtTBl6Ibqu0IxwM
	 WODvl/nhvZKgwA/UQxc770qx0O8rcDpvAZS8kdV73WsnY3Kxnxx/+Vgdn0+aM+hG/X
	 ipZ4bRRg0dG3w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] regulator: pf0900: Modify volatile register range
 definition
Reply-To: sashiko-reviews@lists.linux.dev
To: joy.zou@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260618-b4-regulator-opt-v1-2-c43b1f62aaf6@oss.nxp.com>
References: <20260618-b4-regulator-opt-v1-0-c43b1f62aaf6@oss.nxp.com>
 <20260618-b4-regulator-opt-v1-2-c43b1f62aaf6@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 18 Jun 2026 02:06:57 +0000
Message-Id: <20260618020657.F0BA81F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `.n_yes_ranges` field in `pf0900_volatile_regs` is hardcoded t=
o 1, causing most volatile registers to be ignored.
- [High] Interrupt status registers (_INT) are omitted from the volatile ra=
nges, breaking IRQ handling.
--

commit 8da34e61f8f6ebeaacd20e2bb532c2786ad28d72
Author: Joy Zou <joy.zou@nxp.com>

regulator: pf0900: Modify volatile register range definition
   =20
The pf0900_range was incorrectly defined as a single continuous range
from PF0900_REG_DEV_ID to PF0900_REG_SYS_DIAG. This commit ensures only
volatile registers are read from the device on each access, while other
registers can be cached by regmap.

> diff --git a/drivers/regulator/pf0900-regulator.c b/drivers/regulator/pf0=
900-regulator.c
> index 5c44d2dbcab4d..bca76c58ed3bf 100644
> --- a/drivers/regulator/pf0900-regulator.c
> +++ b/drivers/regulator/pf0900-regulator.c
> @@ -284,13 +284,24 @@ struct pf0900_regulator_irq {
>  	unsigned int  event;
>  };
> =20
> -static const struct regmap_range pf0900_range =3D {
> -	.range_min =3D PF0900_REG_DEV_ID,
> -	.range_max =3D PF0900_REG_SYS_DIAG,
> +static const struct regmap_range pf0900_range[] =3D {
> +	regmap_reg_range(PF0900_REG_SYSTEM_INT, PF0900_REG_SYSTEM_INT),
> +	regmap_reg_range(PF0900_REG_STATUS1_SNS, PF0900_REG_STATUS1_SNS),

[Severity: High]
Does this new configuration omit the interrupt status registers needed by
pf0900_irq_handler()?

Looking at pf0900_irq_handler(), it relies on regmap_read() to query the
hardware interrupt status:

pf0900_irq_handler() {
	...
	ret =3D regmap_read(pf0900->regmap, regu_irqs[i].reg, &val);
	...
}

Since these _INT registers are no longer listed in the volatile ranges,
will regmap reads return cached values instead of the actual hardware
state, causing the driver to silently ignore active interrupts?

[ ... ]

> +	regmap_reg_range(PF0900_REG_SECURE_WR1, PF0900_REG_SECURE_WR1),
> +	regmap_reg_range(PF0900_REG_WD_CNT1, PF0900_REG_WD_CNT2),
> +	regmap_reg_range(PF0900_REG_SYS_DIAG, PF0900_REG_SYS_DIAG),
>  };
> =20
>  static const struct regmap_access_table pf0900_volatile_regs =3D {
> -	.yes_ranges =3D &pf0900_range,
> +	.yes_ranges =3D pf0900_range,
>  	.n_yes_ranges =3D 1,

[Severity: High]
Should this be updated to ARRAY_SIZE(pf0900_range)?

With n_yes_ranges hardcoded to 1, won't the regmap subsystem ignore all
but the very first entry (PF0900_REG_SYSTEM_INT) in the array? This
could cause reads to the remaining hardware status registers to return
stale cached values.

>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260618-b4-regulat=
or-opt-v1-0-c43b1f62aaf6@oss.nxp.com?part=3D2
