Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F9535E1B0
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271768; cv=none; b=SjZatPfcpvnrbVDZXEi1N8FbR0rdSnXGRuhaFFYYaqcxeJ5GWRFd0EAO1sp1HlgbQvbjkSNANCMMrFSnC55AzqYl7ngPRyWuPWOYwZl/pL1BrJozvt8aGQ8VNU0qfux22Z6yVNh4u6tsbWgFjq+Y2GMRQht7bXE2p6FAMOqvHHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271768; c=relaxed/simple;
	bh=Frq1ml7ShzVWKcVcnmdn0CdMx3u5qE+QjekgroTzCpo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=X/XCtF9htJ8WDdpEOpwIZxX3Vs0D3bMyZ1rFbnyFNXVHE0kBc9RgeQTNjKJT0zq6gtMe3UU4DiEmqU/iB/kcfkhclhjKzUSn8UZfHNdJRio2S8pHN6vPiTi/55QNq0IdlMz0PxP0EiHZwccZf1troMDeN0zARciY2OC+UJmYbGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JJQAg08b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JJQAg08b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88D141F00A3A;
	Fri, 12 Jun 2026 13:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271765;
	bh=L1F45gcZUCEqBihPNAcbacXcei+aHwmaj6zce59AjFs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JJQAg08bzBRo1WGG+y1WZV7zCFElOgVusgS78jugQuyHolT4GqTfyjtB/aBdjbt0R
	 B0PTh43S2NO9/F2xAjY5/TZSwJpkT09HSkyzJ4QWr8eKu8CMhKioko3klU4bmq0+ie
	 4WobvhhyZBRZas0McF/dtLCAKkA+OkBlhyHz5wpH2bMc5qThlIjjhRJZX5LSjWAanJ
	 cNHCi8o8OwIduDkjOs8Oy14/sxs8zyBDNeBggeCmSBcHoFGfpb3i8Hx9JI81h7oyI8
	 ZQ4Zbs6nYcsIsZwiS9X2ruzugkBejYq3bnae+6TtMEy4x+R/9fehpUhSTySNb1+a7b
	 AHLKa7JjNdJEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 11/11] ASoC: fsl: mpc5200_psc_ac97: Use guard() for
 mutex locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260612132639.78086-12-phucduc.bui@gmail.com>
References: <20260612132639.78086-12-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 13:42:45 +0000
Message-Id: <20260612134245.88D141F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Build failure due to invalid guard class name `mutex_lock` in `scop=
ed_guard()`.
--

commit 1d8ae1620f1469808672c10039fce92329ce78b6
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl: mpc5200_psc_ac97: Use guard() for mutex locks

This commit cleans up the MPC5200 PSC AC97 driver by replacing manual
mutex lock and unlock calls with the scope-based guard() and scoped_guard()
macros to simplify execution paths.

> diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc=
_ac97.c
> index 8554fb690772c..80666da923d02 100644
> --- a/sound/soc/fsl/mpc5200_psc_ac97.c
> +++ b/sound/soc/fsl/mpc5200_psc_ac97.c

[ ... ]

> @@ -83,16 +82,15 @@ static void psc_ac97_cold_reset(struct snd_ac97 *ac97)
>  {
>  	struct mpc52xx_psc __iomem *regs =3D psc_dma->psc_regs;
> =20
> -	mutex_lock(&psc_dma->mutex);
> -	dev_dbg(psc_dma->dev, "cold reset\n");
> +	scoped_guard(mutex_lock, &psc_dma->mutex) {

[Severity: Low]
Does this code compile successfully? The scoped_guard() macro expects the
lock class name as its first argument, which for a standard mutex should be
"mutex", not "mutex_lock".

Passing "mutex_lock" here will likely result in a build failure due to an
undefined guard class type.

> +		dev_dbg(psc_dma->dev, "cold reset\n");
> =20
> -	mpc5200_psc_ac97_gpio_reset(psc_dma->id);
> +		mpc5200_psc_ac97_gpio_reset(psc_dma->id);
> =20
> -	/* Notify the PSC that a reset has occurred */
> -	out_be32(&regs->sicr, psc_dma->sicr | MPC52xx_PSC_SICR_ACRB);
> +		/* Notify the PSC that a reset has occurred */
> +		out_be32(&regs->sicr, psc_dma->sicr | MPC52xx_PSC_SICR_ACRB);
> =20
> -	/* Re-enable RX and TX */
> -	out_8(&regs->command, MPC52xx_PSC_TX_ENABLE | MPC52xx_PSC_RX_ENABLE);
> -
> -	mutex_unlock(&psc_dma->mutex);
> +		/* Re-enable RX and TX */
> +		out_8(&regs->command, MPC52xx_PSC_TX_ENABLE | MPC52xx_PSC_RX_ENABLE);
> +	}
> =20
>  	usleep_range(1000, 2000);
>  	psc_ac97_warm_reset(ac97);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612132639.7808=
6-1-phucduc.bui@gmail.com?part=3D11
