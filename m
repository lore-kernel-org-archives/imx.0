Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3509F29B766
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781516989; cv=none; b=C/HiH99WIRncuXjS6m7F7K17KjZU7gFQrlyeP1S3rRlbf7OaIlsunSUDhjTek4DgsQqRQRKZv0HyzCm7EhyDj0V8CbI744dS/A7HDQvNtvCtTfxIsur79PRzaM/fGCruWe54ad49hUIvBxvopHpQlR3BKBgQvkCINZ6LcPVbnAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781516989; c=relaxed/simple;
	bh=7O4GebrEvZjmx3udPAvg5dk+zfHliMMjlqUP9HIaa0Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mUiOq9BCGM68/g/9tWBMXw+0vQDNKlhg4MHSZ8/1Pkv0OFV4Oz38yvb4SBE4dL7aDYkbBn6JeExi5unmEEIwISOal00sAfU497nY9v9ITfR6JN8gbazIORmRkSTnVrC8m2GcwawzwfOOZ/zaiCefbZDQnSHNIPD3KN/wHYdB1SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z36O5H+9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z36O5H+9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E543C1F000E9;
	Mon, 15 Jun 2026 09:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781516988;
	bh=EqSB/Wxujd09vRVj347WtQUC+I1QlS3MRg8/ijPeQYM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z36O5H+9Yw/x078OaUs691lrCsm7BF/+igh2MymckscbyNLxfKgbDcEoTDY3GMygP
	 de6lhDqgAiAeBEYd6hVhuaGVs8a5DWp5ELg+Rh8luN/O+4x/UVciY0XB3fj5jNY7o5
	 WhegJPv466I6fzixuX8spZzU1wgzIbq7XEJ6LvYeIw5nRpokmOqCMW6HRmbKFtbFfv
	 T9W9VpX759SPoOMVInaVYOQuG0MeVBOstEpQnCnWPej6hQPuhChHm314KjKxBEe+gj
	 dXePNEXYQVVdqUqrNLdzgO8NJOkyKQaMQ8HgtT5aH4FtZQJOfjB631V2UJqFTzAHYc
	 ZqNKkM+VXVeFA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/11] ASoC: fsl_xcvr: Use guard() for spin locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260615093824.115751-8-phucduc.bui@gmail.com>
References: <20260615093824.115751-8-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 09:49:47 +0000
Message-Id: <20260615094947.E543C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The probe function registers the IRQ handler and ALSA component be=
fore initializing the spinlock and workqueue, creating a critical race cond=
ition.
- [High] Device removal cancels the work struct before the IRQ is unregiste=
red, permitting a Use-After-Free if an interrupt fires during the teardown =
phase.
--

commit aee7964df24f937c0fe7fa3afd74a51f848bcd2f
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_xcvr: Use guard() for spin locks

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> index 6677d3bf36ec2..41d100500534f 100644
> --- a/sound/soc/fsl/fsl_xcvr.c
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -797,10 +797,9 @@ static int fsl_xcvr_trigger(struct snd_pcm_substream=
 *substream, int cmd,
>  {
>  	struct fsl_xcvr *xcvr =3D snd_soc_dai_get_drvdata(dai);
>  	bool tx =3D substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK;
> -	unsigned long lock_flags;
>  	int ret =3D 0;
> =20
> -	spin_lock_irqsave(&xcvr->lock, lock_flags);
> +	guard(spinlock_irqsave)(&xcvr->lock);

[Severity: High]
This is a pre-existing issue, but since we are modifying the lock usage her=
e,
could the uninitialized lock be acquired if an interrupt fires early or ALSA
binds immediately?

In fsl_xcvr_probe(), the IRQ handler and ALSA component are registered
before the lock and workqueue are initialized:

fsl_xcvr_probe() {
	...
	ret =3D devm_request_irq(dev, irq, irq0_isr, 0, pdev->name, xcvr);
	...
	ret =3D devm_snd_soc_register_component(dev, &fsl_xcvr_comp,
					      &fsl_xcvr_dai, 1);
	...
	INIT_WORK(&xcvr->work_rst, reset_rx_work);
	spin_lock_init(&xcvr->lock);
	...
}

If an interrupt fires immediately upon registration, irq0_isr() will invoke
schedule_work() on an uninitialized work struct.

Similarly, if ALSA immediately invokes the stream trigger callbacks upon
component registration, fsl_xcvr_trigger() will attempt to acquire the
uninitialized spinlock.

[ ... ]

> @@ -1448,11 +1445,10 @@ static void reset_rx_work(struct work_struct *wor=
k)
>  {
>  	struct fsl_xcvr *xcvr =3D container_of(work, struct fsl_xcvr, work_rst);
>  	struct device *dev =3D &xcvr->pdev->dev;
> -	unsigned long lock_flags;
>  	u32 ext_ctrl;
> =20
>  	dev_dbg(dev, "reset rx path\n");
> -	spin_lock_irqsave(&xcvr->lock, lock_flags);
> +	guard(spinlock_irqsave)(&xcvr->lock);

[Severity: High]
This is a pre-existing issue, but could there be a use-after-free during
device removal if an interrupt fires after the work struct is cancelled?

The driver manages the IRQ lifetime using devres, which defers the IRQ
unregistration until after fsl_xcvr_remove() returns:

fsl_xcvr_remove() {
	...
	cancel_work_sync(&xcvr->work_rst);
	pm_runtime_disable(&pdev->dev);
}

Because the IRQ is still actively registered at this time, an incoming
interrupt right after cancel_work_sync() completes will cause irq0_isr() to
call schedule_work(&xcvr->work_rst) again.

As the removal sequence proceeds, devres ultimately frees the xcvr struct,
leaving a scheduled work item in the system pointing to freed memory.

When reset_rx_work() subsequently executes, it will dereference the freed
pointer.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615093824.1157=
51-1-phucduc.bui@gmail.com?part=3D7
