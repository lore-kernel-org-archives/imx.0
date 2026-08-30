Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AD79282F34
	for <imx@lists.linux.dev>; Sun, 30 Aug 2026 16:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788105911; cv=none; b=DX4wlmu7/0rNjOd+IpJSWaC9YucDUViQawJwHgMcq3KnRVOfyg1Vo5oJzLNu1GjkzeRNgRGK+4b3Xm2j+ne9h/OPvT6NzlZ/le5BoO5kAICqTPmHiweBuxL54OoHY8C4HakojhKct8XZ9sEX5/UQPaZNSLXbnRZW+qlYkUweWPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788105911; c=relaxed/simple;
	bh=u1ESALNmzsQCU6yqcD6Ggi6AL3kKXMNEtmGenk5jjNE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=O+bn/miZ+jOpxfcQfJq/mtFiryT7w2Kf8yDH+5w5CMFFL4QMoeYm8l6Yr6xwtn4pn2fyi4QEo8qI5H9rLBIgouxOdAfPV45/rNWNa4k3IZAIpV69A5oKucCS9wNlSNH2f6CeUWFlCI8E/zWlSSTnrlTyVUWe2Lj+AEJeRlNUaiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B4D3yes3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B4D3yes3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84C701F000E9;
	Sun, 30 Aug 2026 16:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788105906;
	bh=PVVqIl9cKCi5vnEcND17b4w2afuysvi+Ey7by5iR8x0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B4D3yes3AIOK16KRuBQ5oP+agFqtYQhjF3iJ6mSfbpz2sCs/5HRwlANyQZPnn9vV9
	 vGytwqRFLiZUs1fUofF7Mx6m5TSNKcqXiHrmbPbqEOgnxIuPrx6wOdMu9BDdZeFqnQ
	 /xQG84/2nA5YI0nALxVZj1oa3SufatfxmsaI9hFfws0budzcgfNeqQK981Ebr35R8K
	 BusPXJ3a8+kcC4jERLk0nt73VAki3P9VrkAGp1l/yr5Ier3Kns0hIR9ASJwygJL9tX
	 zun+Oo1Aqgfh6FyGieXLNPc+MYMrsMk+Ll6kCwXwD8JLZ7SSyR8eRCAUvKP1oagJVJ
	 SO155/6v5cdew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5] ARM: imx: Fix suspend/resume crash with Clang CFI
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?WW8nYXYgTW9zaGU=?= <linux@yoavmoshe.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260830155100.1020620-1-linux@yoavmoshe.com>
References: <20260827194508.446733-1-linux@yoavmoshe.com>
 <20260830155100.1020620-1-linux@yoavmoshe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 16:05:06 +0000
Message-Id: <20260830160506.84C701F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Global CFI Check Failure on fncpy() copied Suspend/PM routines (IM=
X5, AT91, OMAP1) due to missing kCFI hashes.
--

commit 24f4d3cbee4d4f64e23b67ce2fbbb6d3e3eb8db1
Author: Yo'av Moshe <linux@yoavmoshe.com>

ARM: imx: Fix suspend/resume crash with Clang CFI

The suspend code that runs from OCRAM is copied there with fncpy(), which d=
oes
not copy the kCFI type hash preceding the function. With CONFIG_CFI=3Dy the
indirect call through imx6_suspend_in_ocram_fn therefore panics.

> diff --git a/arch/arm/mach-imx/pm-imx6.c b/arch/arm/mach-imx/pm-imx6.c
> index a671ca498f887..3c73e2cdb8ceb 100644
> --- a/arch/arm/mach-imx/pm-imx6.c
> +++ b/arch/arm/mach-imx/pm-imx6.c

[ ... ]

> @@ -568,6 +581,13 @@ static int __init imx6q_suspend_init(const struct im=
x6_pm_socdata *socdata)
>  			mmdc_offset_array[i]);
>  	}
> =20
> +	/*
> +	 * Mask out the Thumb bit, as cfi_get_func_hash() expects the
> +	 * function's actual start address. Returns 0 if CONFIG_CFI=3Dn.
> +	 */
> +	pm_info->cfi_type =3D
> +		cfi_get_func_hash((void *)((uintptr_t)&imx6_suspend & ~1UL));
> +
>  	imx6_suspend_in_ocram_fn =3D fncpy(
>  		suspend_ocram_base + sizeof(*pm_info),
>  		&imx6_suspend,
[Severity: High]
This isn't a bug introduced by this patch, but since fncpy() strips the 4-b=
yte
kCFI type hash during SRAM copying, wouldn't other ARM architectures using
fncpy() for suspend routines also fail their CFI checks and panic in the ex=
act
same way?

For instance, this happens during suspend or idle when the copied PM routine
is called indirectly.

In arch/arm/mach-imx/pm-imx5.c:mx5_suspend_enter():
    if (imx5_suspend_in_ocram_fn)
        imx5_suspend_in_ocram_fn(suspend_ocram_base);

In arch/arm/mach-at91/pm.c:at91_pm_suspend():
    at91_suspend_sram_fn(&soc_pm.data);

In arch/arm/mach-omap1/pm.c:omap1_pm_idle():
    omap_sram_suspend(omap_readl(ARM_IDLECT1),
                      omap_readl(ARM_IDLECT2));

In arch/arm/mach-omap1/pm.c:omap1_pm_suspend():
    omap_sram_suspend(arg0, arg1);

Do these architectures need a similar fix to ensure the kCFI hash is
physically located before the function copy in SRAM?

>  		MX6Q_SUSPEND_OCRAM_SIZE - sizeof(*pm_info));

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830155100.1020=
620-1-linux@yoavmoshe.com?part=3D1
