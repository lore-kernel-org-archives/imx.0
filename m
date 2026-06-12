Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B226E392C2E
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271402; cv=none; b=GEf7cE1XtlLQ2D+AecZTerWOUi6m01YEDveCLZsfFc+goagjPS3aOObLRxTDIrwIVx5LQvYoU8wj/iHX3VVWaIsVuUnd8y4zb4Hq2Gv+9yR1LagKDTc7CZesTSIwg1E4GC+7sAB1RFmViN+eNVPuhvavwoCcBB3vYFn4nS3/ygo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271402; c=relaxed/simple;
	bh=4HBg5dr15fVtPYxHq2uaDfqh5Ea0seGuPhKWvKA7weM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NYa3Qf0nFRqc3mptlxhsm4d1Mxhh+B0TE8P9w2fPUCv+GrhrPA7bOShdvPxGuUGScA54mBEEtgqe0NgmlAH7RFWSNvt8uxABJWe3KdXLpZ8G+Q0qZYHYnKXoy67JoCU6eDo61CA4DECJB3qy3/9aZJx1gm+VznoalV2z45gOHC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=osEiKdwl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="osEiKdwl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2746F1F000E9;
	Fri, 12 Jun 2026 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271401;
	bh=203fSnnnizZK7Rp24i9jciIs2oXAuXgVjhTdTzOAPTE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=osEiKdwl8PHVnpZzBZIWGKyeuCyUlpSxvDyGwmPA1YqNW0/NQEQKYaSRhuq3Nu41O
	 2kfIKo9+eQDZuHUuVWDSRBjZ/YTB9g++7ZYNCZWz+4IzsGRPWHnVrHS1NUUo60k9WH
	 PJ4TpgMSpndll8QGHtTE4vxNKUBhejHrGr5erKpVwMc7Wnd60J1tCWNP0e7iqgnxLI
	 CCveBJ9U25xRRXrM5jxWamPwvrkFLHjrIuWuq5QUur9+Q/nes0IHXfu8HGGoCcTqB/
	 IGIG1hnJiHq3MOaV6jl4lCdkhBqGPhCQueBVOmp/Ve0r4TNAezMF4yxLSweTZEzeo1
	 cfPMeOzMygitw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/11] ASoC: fsl_easrc: Use guard() for spin locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260612132639.78086-4-phucduc.bui@gmail.com>
References: <20260612132639.78086-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 13:36:40 +0000
Message-Id: <20260612133641.2746F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] The success path of `fsl_easrc_runtime_resume` falls through to th=
e error cleanup label, incorrectly disabling the device clock on success.
- [Medium] Mixing goto-based error handling with scope-based cleanup helper=
s (`scoped_guard`) in the same function violates subsystem rules.

Pre-existing issues:
- [High] The `firmware_loaded` flag is prematurely set to 1 before firmware=
 loading succeeds, leading to a NULL pointer dereference on subsequent resu=
mes if loading fails.
--

commit 4528b201cb9e89015d267dc100f8b7c044c41e30
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_easrc: Use guard() for spin locks

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

> diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
> index 114a6c0b6b730..edfd943197a00 100644
> --- a/sound/soc/fsl/fsl_easrc.c
> +++ b/sound/soc/fsl/fsl_easrc.c
[ ... ]
> @@ -2323,13 +2312,11 @@ static int fsl_easrc_runtime_resume(struct device=
 *dev)
>  	regcache_mark_dirty(easrc->regmap);
>  	regcache_sync(easrc->regmap);
> =20
> -	spin_lock_irqsave(&easrc->lock, lock_flags);
> -	if (easrc_priv->firmware_loaded) {
> -		spin_unlock_irqrestore(&easrc->lock, lock_flags);
> -		goto skip_load;
> +	scoped_guard(spinlock_irqsave, &easrc->lock) {
> +		if (easrc_priv->firmware_loaded)
> +			return 0;
> +		easrc_priv->firmware_loaded =3D 1;

[Severity: High]
This is a pre-existing issue, but does setting firmware_loaded to 1 here ca=
use
a NULL pointer dereference on subsequent resumes if fsl_easrc_get_firmware()
fails?

If the firmware load fails, it returns an error but leaves firmware_loaded
set to 1.

On the next resume attempt, this function will see firmware_loaded is 1, re=
turn
success immediately, and bypass initialization. This causes
fsl_easrc_prefilter_config() to dereference a NULL
easrc_priv->firmware_hdr->prefil_scen pointer.

>  	}
> -	easrc_priv->firmware_loaded =3D 1;
> -	spin_unlock_irqrestore(&easrc->lock, lock_flags);
> =20
>  	ret =3D fsl_easrc_get_firmware(easrc);
>  	if (ret) {
>  		dev_err(dev, "failed to get firmware\n");
>  		goto disable_mem_clk;

[Severity: Medium]
Does mixing goto-based error handling with scope-based cleanup helpers like
scoped_guard() in the same function violate the cleanup subsystem rules?

The expectation in include/linux/cleanup.h is that functions convert all
resources to scope-based cleanup or none of them.

[ ... ]
> @@ -2377,9 +2364,6 @@ static int fsl_easrc_runtime_resume(struct device *=
dev)
>  			goto disable_mem_clk;
>  	}
> =20
> -skip_load:
> -	return 0;
> -
>  disable_mem_clk:
>  	clk_disable_unprepare(easrc->mem_clk);
>  	return ret;

[Severity: High]
Since the return 0 on the success path was removed, does the success path in
fsl_easrc_runtime_resume() now fall through into the disable_mem_clk label?

It appears this will incorrectly disable the device clock when the firmware
initialization successfully completes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612132639.7808=
6-1-phucduc.bui@gmail.com?part=3D3
