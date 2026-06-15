Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D61023395F
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517167; cv=none; b=nnzy1bJvWcFthYD1Qcy+zpJj09skxqxMHp5VxH92F8abwKP8HdhwboD0Snz5W/balHJ3ORVnZyrL7r5eIfZySExRpSjHAUJOGZiJvc/m9EcFNuaCnG+L8I9CTNfMhr4WmHClJqwlgf5Qrb/Hj4A0FPSXKbBp9/lmLBaIlkaa9JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517167; c=relaxed/simple;
	bh=joYSptAvmn/1TQmnyLwhy/KAAwsVotEFQBzVGbC5oJM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=prQFFo2oSzGZAyeRD5DREf/Z5sCzokIB7cCERQqinVcUINGOIUdWMupKsDbln4Qe/xCOJbZBeu/1Fb9d1lyRSSvHrPXauP7bVHUT7mmFB3ZG6HNXDzn56mlQoSs6DMjsKhQBarCAE1QUSYtKSsfV1137EgoqPO4aP7zzk9BYGSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O7srtGg3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O7srtGg3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9301F000E9;
	Mon, 15 Jun 2026 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781517166;
	bh=kOVUAz3axjo4C56tmySxKBbIJx+7lkr8V5n8wtfq0yA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=O7srtGg3ks2OThcDT6NcNqXXLFioWb6XGFCnnZrBFKLTe7vfmpibr5/qZ1gNtQpKO
	 4rqdWJtRV6lBi+8SAs+fYXFU/KAJqUpILDJPmxcwUpkmGosyQTycO4hF5eCt+75STk
	 mQVVvbIgMz4E8uIHrClwKXsvYwRUH5EpTJWYE315fnRRn4GHvmZ6LcVPNBC18ng18I
	 vcJRHsy817RmXxbabq4XuNFLn1v/SInLXSKO+AaHXvWy6FY8fA1rADAP3oXwTRZQdp
	 kN0HQyij11J6mE7iThOi94RHrkGvPtkJy50OV2ffE6ZYmboiZ7dU3GJ04g4FphA8jL
	 bpThpa1TYcp7g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 04/11] ASoC: fsl_esai: Use guard() for spin locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260615093824.115751-5-phucduc.bui@gmail.com>
References: <20260615093824.115751-5-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 09:52:45 +0000
Message-Id: <20260615095246.3B9301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Mixing goto-based error handling with scope-based cleanup in fsl=
_easrc_runtime_resume
--

commit d28002047081c21222edc1134f1efc00e25fe426
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_easrc: Use guard() for spin locks
   =20
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
> -	easrc_priv->firmware_loaded =3D 1;
> -	spin_unlock_irqrestore(&easrc->lock, lock_flags);
> =20
>  	ret =3D fsl_easrc_get_firmware(easrc);
>  	if (ret) {
> @@ -2377,9 +2364,6 @@ static int fsl_easrc_runtime_resume(struct device *=
dev)
>  			goto disable_mem_clk;
>  	}

[Severity: Medium]
Is it safe to mix scoped_guard() with the goto disable_mem_clk error path in
this function?

The subsystem guidelines for cleanup helpers (derived from
include/linux/cleanup.h) indicate that usage of goto and scope-based cleanup
should not be mixed in the same function.

Should fsl_easrc_runtime_resume() be converted to use scope-based cleanup f=
or
all resources, or should it avoid using scoped_guard() here to prevent
ownership confusion?

> =20
> -skip_load:
> -	return 0;
> -
>  disable_mem_clk:
>  	clk_disable_unprepare(easrc->mem_clk);
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615093824.1157=
51-1-phucduc.bui@gmail.com?part=3D4
