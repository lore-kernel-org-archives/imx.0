Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895A739280D
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271444; cv=none; b=EjxZsMeN6hVoGFbwITfBJ4wkvJivYEn9U1AgrVholGMq40xlGKaCmMk95HBM9ksvK+436DQR5tyXpDkuGFl1h7acYR3eykufm+p8mb0t71OtiqovjiMKDHLClA0w/LzjQkZwQXesjcSmrvgnoiKmjzjN6piVOTSEpJCGwpgQhuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271444; c=relaxed/simple;
	bh=zXFvQ0E5XXvfYjLLaHN9nooLsOx11sH8GUySoHzSKwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tkut4u7RfCGivBb0wQDMTjuO0K87dhYEPxhmoIbs7kRa5mfEBKadU36jnBawtzEvBiLUWHaKNArR4IiPOAzKPVIBVjwsAeRGFgBP7Z/lNalxBvnqW0JfPYLtLL7gF0T/z+U8TN02FyyTMdoi6csPDlV/fVAZo+7wk2YnN/ISUZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h//ToKaZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h//ToKaZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BCDB1F000E9;
	Fri, 12 Jun 2026 13:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271443;
	bh=UJaO+qzNu0R63COj84ZnHNEbJ4DN4GjXSuw0GGoPWdg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h//ToKaZTPo4XZlOGhxFOZuQ7jrs14vDji+KWphUYCaa3kn2ah65XnyZAsZEQbWlj
	 h5HoeHWdTGHKpeFnKt4wjC9wP1X93/SgwIZly3lNz6HlO2a9n8xSAVt3sFw7dgS5r+
	 VDicjzWIHxuY8tJYAnvIFgEqC52PxcQsI6yfyXz1vxv+/fLoygfbjozmEOEPHGOI5j
	 Qeoveg1U2A0HasJ4eK51TE4HZiVvEiCwXMeaGWR+QTydtEBY4HWKZZdye9zAgY7wTb
	 yzsFnGGDvxLKxSc0MQ+pmY47XA0M64zrdPCL1Br4gI4+WRPVR8WOv24fPRDaQT01J8
	 7UCnmPhA9Dh+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/11] ASoC: fsl_xcvr: Use guard() for spin locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260612132639.78086-8-phucduc.bui@gmail.com>
References: <20260612132639.78086-8-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 13:37:22 +0000
Message-Id: <20260612133723.4BCDB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The work struct `xcvr->work_rst` can be re-scheduled by the IRQ ha=
ndler after it is cancelled in `fsl_xcvr_remove()`, leading to a Use-After-=
Free.
--

commit cd76e5a17f7950836eed0759c4053e72e241e545
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_xcvr: Use guard() for spin locks
   =20
Clean up the code using guard() for spin locks. Merely code refactoring,
and no behavior change.

> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 6677d3bf36ec2..41d100500534f 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c

[ ... ]

> @@ -1448,11 +1445,10 @@ static void reset_rx_work(struct work_struct *wor=
k)

[Severity: High]
This is a pre-existing issue, but could this work struct be rescheduled by =
an
interrupt after it has been cancelled during removal, leading to a
use-after-free?

In fsl_xcvr_remove(), the driver calls cancel_work_sync(&xcvr->work_rst),
but hardware interrupts are not explicitly disabled before devres cleans
up. Because irq0_isr() was registered with devm_request_irq(), the interrupt
handler remains active after fsl_xcvr_remove() returns.

If an interrupt fires in this window, irq0_isr() can call:

    if (isr & (FSL_XCVR_IRQ_PREAMBLE_MISMATCH |
               ...)) {
        schedule_work(&xcvr->work_rst);
    }

This queues reset_rx_work() on a device structure (xcvr) that devres will s=
oon
free, resulting in a use-after-free when the work queue executes.

>  {
>  	struct fsl_xcvr *xcvr =3D container_of(work, struct fsl_xcvr, work_rst);
>  	struct device *dev =3D &xcvr->pdev->dev;
> -	unsigned long lock_flags;
>  	u32 ext_ctrl;
> =20
>  	dev_dbg(dev, "reset rx path\n");
> -	spin_lock_irqsave(&xcvr->lock, lock_flags);
> +	guard(spinlock_irqsave)(&xcvr->lock);
>  	regmap_read(xcvr->regmap, FSL_XCVR_EXT_CTRL, &ext_ctrl);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612132639.7808=
6-1-phucduc.bui@gmail.com?part=3D7
