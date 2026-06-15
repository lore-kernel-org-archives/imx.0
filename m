Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C867430D40C
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516928; cv=none; b=FDWkZOG+ZCP4toidiS/xaVpBdRECHGH8BGIFXkmAAX4Ph+SDTNpmRlAPeQGltAaBbwBEhqWGXFUnQFoLLjeFONluQkwfB0gxAhwsGzLBCr85OInkkpSvp1VAA76fgLnANKZNZVUbFhRneILGf2oA2fg3c3PdlxfQbbBM567edi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516928; c=relaxed/simple;
	bh=ME14eLMzgPG9ZIvhfs17K3AsV2XV9AP4X4QEZdqt92s=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=vCcwdMDJf4LXtVblk1xIo+7UrVnVpSRQcDdkYD8qkVZRLYGAQOXhbttS3Gztc5KRNYeYAJL2a6z2WsRlYD3ZSpRkbJVeqYFlii3N7eAGSlVnJVXF7uIzZTsgt8uXrm1M2EoqtsW58+49xuL/vFjYegZVn2L2rTL5wvFZx+hKKuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OEFXn4VB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OEFXn4VB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12AF31F000E9;
	Mon, 15 Jun 2026 09:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781516927;
	bh=vnH5fWhxp+LunV7YBIjnZK0Z4NvqnY2Gep6ry0/aDn8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OEFXn4VB+0ZhtVOJLXqccnuVDcJv1TSfYck9bamM4DmllbUTHexV5mEIpIVTsOl2l
	 pSpGh80F7+T9qVBlRYVtBSW8OfqO9HgQXGYvp26v1O2g/WuDCAynK7TtdSohGioSjY
	 ZVbfU4QkqkEtQO1XkTORsH8DDK2G3w5I1n0w4WLRvkjVOzsIDz+bYC6Hm5pm7jjvNr
	 KgsaU3jOOj87rxfZYELv6yTaGMjaCLA++Mvk323FFzH1Oqz2X8F07PhLg0MCfP7yf2
	 PGqxShT1QfctuVMlUuSDk3Zc9vQ8NutvR80cWpoECzCVnRtIhUwGbSBQiaF1I4xd54
	 Oi4BdrgDXk5gA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 03/11] ASoC: fsl_easrc: Use guard() for spin locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260615093824.115751-4-phucduc.bui@gmail.com>
References: <20260615093824.115751-4-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 09:48:46 +0000
Message-Id: <20260615094847.12AF31F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch erroneously removes `return 0;` from the success path in=
 `fsl_easrc_runtime_resume()`, causing it to unconditionally fall through t=
o the error handler and disable the memory clock.
- [Medium] The function `fsl_easrc_runtime_resume` improperly mixes `goto`-=
based error handling with scope-based cleanup helpers (`scoped_guard`).
--

commit d28002047081c21222edc1134f1efc00e25fe426
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
>  	}

[Severity: Medium]
Does this code improperly mix goto-based error handling with scope-based
cleanup helpers?

The function fsl_easrc_runtime_resume() now uses scoped_guard() but still
contains goto disable_mem_clk error handling further down.

According to the cleanup subsystem architecture rules, for a given routine,
all resources needing cleanup should be converted to scope-based cleanup, or
none of them should be. Mixing goto and scoped guards can lead to confusing
ownership semantics.

> -	easrc_priv->firmware_loaded =3D 1;
> -	spin_unlock_irqrestore(&easrc->lock, lock_flags);
> =20
>  	ret =3D fsl_easrc_get_firmware(easrc);
>  	if (ret) {
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
Does removing this return statement cause a normal success path to fall
through to the error handler?

By removing the skip_load label and its return 0 statement, the normal
success path of fsl_easrc_runtime_resume() directly falls through to the
disable_mem_clk block.

This incorrectly disables the memory clock while returning 0 to indicate
success, potentially causing bus faults on subsequent register accesses.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615093824.1157=
51-1-phucduc.bui@gmail.com?part=3D3
