Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0053FB074
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 10:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889692; cv=none; b=YeTjMz3zBpgBamr4gx7eA//0FYz/LMILW5XU12tsnvqqe4U1RiWjcxvObgfW4bmndQgY2k3v/dZ+PeTIY9b0849FJhqZOswN5Dr4qhuM+jR2/kAN3pdUgvO7/dKdzcf3Y0aAf8m+GENojMwPfW0phszpxPR7diRVm81fI35YgZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889692; c=relaxed/simple;
	bh=336YUisyoLhgZF0q9zmeRHx80pxTCj0LSG/h5EHDC9A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YPEMwvHXvo+sAatS7KT3WPUsMq67MIKSRcxmfEj7ULyH+MxOM0ELhTHBpXgkfutyC8MtQ8aOSWT4G2vQlVtdCWAxLyOH9yyOEPpxOreBrhVjXN9FrLDO9bL96LuSJRoX8WbfBXUepplV2q7Fpb22mJAPJSayJQ0ZhAYKU2qAy2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gH+C3OcE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gH+C3OcE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E2141F000E9;
	Fri, 24 Jul 2026 10:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784889690;
	bh=ddWdkWvb3tEguG9JZpWUhH8B8b+WWGKHxAf+vgpFJQ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gH+C3OcEjjtIwHj3Oa5BaFOUE2KgwXAF5jw8E9OVDcjCjyGxwm+Dgm1l3KBOAP5co
	 v23PcFQ/A3QSjU1O7rt6spa18GuGH6+K9ILczOBVso8UzcdS+6qjoBh+ukUf+BIjvK
	 SnITm/5tBu2TkUza4s9qGjFFUbFjL8aNWbkqv0wodrWL1gvwEQQM7Vpn1bycZzMhcd
	 J/uWtgIngGNeHJa+p1duKoNNJTf+65pQKCsk7kcCtAf5VPy3tkIR3huq0Is4853Us2
	 6ZK5ExEEWsQuw6B3IWMAxSsyhlmzr04oCCVj00XCVZ/irNuGhjdm5tSIJ6ty11QfBz
	 e8YXHI0907XEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] regulator: fp9931: Fix Runtime PM usage count
 underflow in v3p3 ops
Reply-To: sashiko-reviews@lists.linux.dev
To: robby.cai@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260724103441.800522-3-robby.cai@oss.nxp.com>
References: <20260724103441.800522-1-robby.cai@oss.nxp.com>
 <20260724103441.800522-3-robby.cai@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 10:41:29 +0000
Message-Id: <20260724104130.5E2141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Dropping the runtime PM reference in fp9931_v3p3_enable() allows t=
he PMIC to auto-suspend, physically powering off the active V3P3 regulator =
and violating framework guarantees.
- [High] Disabling the V3P3 regulator while the PMIC is runtime-suspended c=
auses a spurious 3.3V power-on glitch.
--

--- Patch [2]: [PATCH v2 2/2] regulator: fp9931: Fix Runtime PM usage count=
 underflow in v3p3 ops ---
commit 195ff0977cf3484ecb06ab9189df30e12979d50c
Author: Robby Cai <robby.cai@nxp.com>

regulator: fp9931: Fix Runtime PM usage count underflow in v3p3 ops

This commit scopes the Runtime PM reference lifetime to the register
access itself in the v3p3 enable and disable callbacks. It pairs
pm_runtime_resume_and_get() and pm_runtime_put_autosuspend() within
each function to fix a usage count underflow issue.

> diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
> index ff743a8b0dfe8..0d926546221a6 100644
> --- a/drivers/regulator/fp9931.c
> +++ b/drivers/regulator/fp9931.c

[ ... ]

> @@ -214,8 +214,7 @@ static int fp9931_v3p3_enable(struct regulator_dev *r=
dev)
>  		return ret;
> =20
>  	ret =3D regulator_enable_regmap(rdev);
> -	if (ret < 0)
> -		pm_runtime_put_autosuspend(data->dev);
> +	pm_runtime_put_autosuspend(data->dev);

[Severity: High]
Does dropping the runtime PM reference here allow the PMIC to auto-suspend
while the V3P3 regulator is still logically enabled by consumers?

If a consumer enables V3P3, fp9931_v3p3_enable() will acquire and then
unconditionally release the reference after setting the register.=20

When the PMIC subsequently auto-suspends, fp9931_runtime_suspend() could
disable the main vin_reg power supply, causing the V3P3 output to physically
power down and break framework guarantees.

> =20
>  	return ret;
>  }
> @@ -225,6 +224,10 @@ static int fp9931_v3p3_disable(struct regulator_dev =
*rdev)
>  	struct fp9931_data *data =3D rdev_get_drvdata(rdev);
>  	int ret;
> =20
> +	ret =3D pm_runtime_resume_and_get(data->dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	ret =3D regulator_disable_regmap(rdev);

[Severity: High]
Can this resume trigger a spurious 3.3V power-on glitch if the device was
already suspended?

Since the device can now auto-suspend while V3P3 is logically enabled, call=
ing
regulator_disable() could trigger fp9931_v3p3_disable() while the device is
suspended.

In this state, pm_runtime_resume_and_get() wakes the device and
invokes fp9931_runtime_resume(), which calls regcache_sync().

Because the regcache still contains the 'enabled' state for V3P3, wouldn't
regcache_sync() write that state to hardware, physically turning V3P3 ON ju=
st
before regulator_disable_regmap() clears the bit and turns it OFF?

>  	pm_runtime_put_autosuspend(data->dev);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724103441.8005=
22-1-robby.cai@oss.nxp.com?part=3D2
