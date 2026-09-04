Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B493466AE7
	for <imx@lists.linux.dev>; Fri,  4 Sep 2026 11:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788520241; cv=none; b=le396wkwHR81JdurXjhcZBWI8c+yZzKiTERJcFdbX4IJQXS3h5K0gQrBtlqI3rnWad477S3P1sKV07TTCYaf5jA/57QZdoymiaaAPulJ1kzVZWnbCb/JcK2ZouDGeV/O0lWV0JmFQeUb4UP+xCD5fhexuUK542XA2NfKTRQyuDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788520241; c=relaxed/simple;
	bh=HzOIckyhrn+FhZmz8OJWwp3BC7C9ZtkHykplPEX2gpI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LcSeJGwBDSkJOuX290NofoMofevtbY7QL6b5E/x5CXBs3Jv0mf/0coQY0RjAdpWHM86lcY7Fr0ckbRXrC15Ud5/9jHv/z0ttuH9u3ojNXdiIIb4Cvf/eMGe2p+TBMoX4IvLG/o9/xPtEFmAv+oczTrvDP7vZFkeubVppsXNcTAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GqRC9L8n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GqRC9L8n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 705FA1F00A3D;
	Fri,  4 Sep 2026 11:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788520239;
	bh=6c+mbWOXA6hiVloU1d3D9zT8XhjiuS3nGGOBBbu3C8A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GqRC9L8nEgzWzrzHGQmhrDJwaoLA6iTDCTnntmQSWTENk9DzYQR1QYmPBZVsUpVq0
	 Hns4pv2xL4OAsNVr9r2FL2rViPM1p4RRWc3qU2M5O92XstZEuaFRw84fSuTLMpWth7
	 s5PGNzLPwOiZpss1lsy1GJLykc9dSxUfjhfNdhmQTARxhxWGVPObekAUfcgptGArFu
	 X5BvsLaFUHv1OaE50Fxijj6qWlRoJTWWcH/9qnFQK4L7IUkhAR/qZy4qau/4y0WeVp
	 4U6dDdUEHQJ99bM/p2+aE4eNGzRjgxY8LuSLuOwN/p33xkXSxehExMErDCNMbcIn1C
	 YobBL8bjlUysg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] regulator: pf1550: fix which regulator is notified
Reply-To: sashiko-reviews@lists.linux.dev
To: "Donggeun Yoo" <donggeunyoo.kernel@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260904105624.48577-1-donggeunyoo.kernel@gmail.com>
References: <20260904105624.48577-1-donggeunyoo.kernel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 11:10:38 +0000
Message-Id: <20260904111039.705FA1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The interrupt handler unconditionally returns IRQ_HANDLED even whe=
n it completely fails to recognize the interrupt, defeating spurious interr=
upt detection.
--

commit 756013e824bd37aa338c50b32f4e6024e5f64dfc
Author: Donggeun Yoo <donggeunyoo.kernel@gmail.com>

    regulator: pf1550: fix which regulator is notified

This commit fixes the regulator notification logic in the pf1550 driver.
It replaces string-based matching of regulator names with ID-based lookups
to reliably notify the correct consumer when a fault occurs.

> diff --git a/drivers/regulator/pf1550-regulator.c b/drivers/regulator/pf1=
550-regulator.c
> index 610eac9bb9cb2..ceee553a84b23 100644
> --- a/drivers/regulator/pf1550-regulator.c
> +++ b/drivers/regulator/pf1550-regulator.c
[ ... ]
> @@ -283,63 +283,61 @@ static struct pf1550_desc pf1550_regulators[] =3D {
[ ... ]
>  static irqreturn_t pf1550_regulator_irq_handler(int irq, void *data)
>  {
> +	const struct pf1550_regulator_irq *map;
>  	struct pf1550_regulator_info *info =3D data;
>  	struct device *dev =3D info->dev;
>  	struct platform_device *pdev =3D to_platform_device(dev);
>  	int i, irq_type =3D -1;
> -	unsigned int event;
> =20
>  	for (i =3D 0; i < PF1550_REGULATOR_IRQ_NR; i++)
>  		if (irq =3D=3D platform_get_irq(pdev, i))
>  			irq_type =3D i;
> =20
[ ... ]
> +	if (irq_type < 0 || irq_type >=3D (int)ARRAY_SIZE(pf1550_regulator_irqs=
)) {
> +		dev_err(dev, "regulator interrupt: irq %d occurred\n", irq_type);
> +		return IRQ_HANDLED;
                ^^^^^^^^^^^^^^^^^^^
[Severity: High]
This is a pre-existing issue, but returning IRQ_HANDLED when the driver
completely fails to recognize the interrupt defeats the kernel's spurious
interrupt detection.

If pf1550_regulator_irq_handler() is invoked with an IRQ that does not match
any index in the loop, irq_type remains -1 and this branch is taken. Since
IRQ_HANDLED is returned, the spurious interrupt detection is falsely told
the interrupt was handled successfully and will not mask the virtual IRQ li=
ne.

If the PMIC continuously asserts an unhandled fault, could the parent
regmap-irq thread loop endlessly resulting in an interrupt storm and CPU
lockup? Should this return IRQ_NONE instead?

>  	}
> =20
> +	map =3D &pf1550_regulator_irqs[irq_type];
> +
> +	for (i =3D 0; i < PF1550_MAX_REGULATOR; i++)
> +		if (rdev_get_id(info->rdevs[i]) =3D=3D map->id)
> +			regulator_notifier_call_chain(info->rdevs[i],
> +						      map->event, NULL);
> +
>  	return IRQ_HANDLED;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904105624.4857=
7-1-donggeunyoo.kernel@gmail.com?part=3D1
