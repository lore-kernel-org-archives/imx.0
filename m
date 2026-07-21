Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63683B9DA8
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628424; cv=none; b=RpLcXVphOFz/ebRP95I47ydCZeI3krirQqUfskdqf1p1cfoIzae6nZLg0AwWa/F6onzVija6ClUFTgbysV1ejvMO+lwplQ4UBRGcEah8aqe2oe/SZP5zyniKMOTgFeQ4BYJsZZUhXGS6I3AK0MOLlKTLY2JAPhBgNksf5gQzl0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628424; c=relaxed/simple;
	bh=VANzIkJ3FO3d1eEChd5rVkRwzLMtnCQbztbjkoZBYXk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JvvNSwI01l20n0RqBE25BCoUGVyydABpYa/qj+eBZ8esksNcxemgcLTHVEOuY1d9X4ZlCdUCFH5QqjbGwTultZva1Wqp2HO7OIWkvgALF65duw/UcFayXBAxssOV+hT6CCS60rQDNs5SrBb8QW+4RHoQ4SsBEd+nrH7+EK98vZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MawvEDNc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MawvEDNc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44B3A1F000E9;
	Tue, 21 Jul 2026 10:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784628423;
	bh=sIbe05UtoPzoJvetiFdI3zF0j2VtFS0o8LQ1pcYbIZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MawvEDNcfYo5QemSi4eFrW3q8HVcQUpUnOpeIrQBls4MOsrIzyT00JfFX5Ulu/nb6
	 zJjRbXEuE/+eR6ump4CjtmoUGgePaRZldDkfAY2e8DL/GJN3Xo/zl60NXXzi30FrAX
	 XxMBAlXei2So3bsNQG8/0Jn+CBUZix96n3C16RdMyn41jX+mxFGFpYqZdJIHDClTW5
	 qEO9va9N9GQCvUakCKIJhwDMA9fZs78mig0UYH7yCucQC427WO1QK1Cvj8Rap29UJJ
	 ch2JiRj70LvtVR6iaEMvl7JuKYtQPUEv7H3m6EJVNz/ENBuNXgOKmHeqv/iGj6l+jD
	 vOfc5i+Cc1yfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] regulator: fp9931: Fix Runtime PM usage count
 underflow in v3p3 ops
Reply-To: sashiko-reviews@lists.linux.dev
To: robby.cai@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260721095959.1855436-3-robby.cai@oss.nxp.com>
References: <20260721095959.1855436-1-robby.cai@oss.nxp.com>
 <20260721095959.1855436-3-robby.cai@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 10:07:02 +0000
Message-Id: <20260721100703.44B3A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Dropping the Runtime PM reference in the regulator enable path all=
ows the device to auto-suspend while the regulator is logically active, cau=
sing silent power failure.

Pre-existing issues:
- [High] The VCOM regulator's disable callback unconditionally drops a runt=
ime PM reference, causing a usage count underflow if disabled during cleanu=
p.
- [High] Calling `regulator_enable()` from within a `runtime_resume` callba=
ck triggers a WW Mutex nesting deadlock and lockdep BUG.
--

--- Patch [2]: [PATCH 2/2] regulator: fp9931: Fix Runtime PM usage count un=
derflow in v3p3 ops ---
commit e0c7f5e5591f4d063d494917c2e53d290ddca4e4
Author: Robby Cai <robby.cai@nxp.com>

regulator: fp9931: Fix Runtime PM usage count underflow in v3p3 ops

This patch attempts to fix a runtime PM usage count underflow by scoping
the PM reference lifetime strictly to the register accesses in the v3p3
enable and disable callbacks.

> As a result, fp9931_v3p3_disable() may call pm_runtime_put_autosuspend()
> when the device runtime PM usage count has already reached 0, triggering:
>=20
>   fp9931 1-0018: Runtime PM usage count underflow!

[Severity: High]
This is a pre-existing issue, but doesn't this warning actually stem from
the VCOM regulator's fp9931_clear_enable() unconditionally dropping a
runtime PM reference?

If the regulator framework disables VCOM during late init cleanup (for
example, if it is marked boot-on but has no active consumers),
fp9931_clear_enable() calls pm_runtime_put_autosuspend() without a
corresponding get. This unbalanced put drops the shared usage count, which
seems to be the actual root cause of the underflow warning mentioned here.

> diff --git a/drivers/regulator/fp9931.c b/drivers/regulator/fp9931.c
> index 5eee21034f6b7..3ffba6fb75ff2 100644
> --- a/drivers/regulator/fp9931.c
> +++ b/drivers/regulator/fp9931.c
> @@ -243,8 +243,7 @@ static int fp9931_v3p3_enable(struct regulator_dev *r=
dev)
>  		return ret;
> =20
>  	ret =3D regulator_enable_regmap(rdev);
> -	if (ret < 0)
> -		pm_runtime_put_autosuspend(data->dev);
> +	pm_runtime_put_autosuspend(data->dev);

[Severity: High]
Does dropping the runtime PM reference immediately after enabling the
regulator allow the device to auto-suspend while the regulator is logically
still active?

If the usage count reaches 0, the device will suspend. The auto-suspend
triggers fp9931_runtime_suspend(), which calls
regulator_disable(data->vin_reg). This would cut physical power to the IC,
causing silent power failure for any consumers using the v3p3 regulator.

> =20
>  	return ret;
>  }
> @@ -254,6 +253,10 @@ static int fp9931_v3p3_disable(struct regulator_dev =
*rdev)
>  	struct fp9931_data *data =3D rdev_get_drvdata(rdev);
>  	int ret;
> =20
> +	ret =3D pm_runtime_resume_and_get(data->dev);

[Severity: High]
This is a pre-existing issue, but does calling pm_runtime_resume_and_get()
from within a regulator callback trigger a WW mutex nesting deadlock?

The regulator framework holds the v3p3 regulator's WW mutex when calling
this disable callback. The synchronous resume triggers
fp9931_runtime_resume(), which executes:

fp9931_runtime_resume()
    regulator_enable(data->vin_reg);
   =20
This attempts to acquire the vin regulator's WW mutex using a new context
while already holding another WW mutex of the same class
(regulator_ww_class).

> +	if (ret < 0)
> +		return ret;
> +
>  	ret =3D regulator_disable_regmap(rdev);
>  	pm_runtime_put_autosuspend(data->dev);
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721095959.1855=
436-1-robby.cai@oss.nxp.com?part=3D2
