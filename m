Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794035677;
	b=C3I88lggzaBeBJWTnsRjNPHQiE2RiqsMS3zzd9oldHK0D2u8ydFGDWJBZPvjjZI8hKrb
	 W8IddI0JwJX24UsemqnbtYT9eKAgJFEJTTEAlGpQVugm2msmGPejRfc2v+30dBcr5HLSX
	 gYXpQYdHdWPZi3CRPts16bNQ5ACk9ROZJeTXkIOVb8TB4UOGGmuABw33TR2XlH8w74oC3
	 8agLPuFhf4HFdeCLxotSQ7mKqQ3zeYjd+qQ+ef1q0aZ4O1zZnzWZWDmLdziEonn+qgfa0
	 2Nf/cXVbHImQJQohW2YTn4g0ZkKcYZuFQvTsDwcR6C0eNtTHBZXAYlAedl8wHXSV3nw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794035677;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bHhbMciYbnf1mWbkuCnHRN+tBorW6GQteatRQLPBcn4=;
	b=F3gyJ/4LHcIEMEABh6CDpmI5jnEUnw/EuPMFiwjH1xdVMOr780Dipv2L/TdCkegoWFLy
	 B69zLWKzqt2JVGHZQWYgGA2WOzOSpii24PN4R+JwrT/y2AHxfVO8WemuTBTC6Yny3e+Tw
	 eylXpM+kdTBc5N0gCM23dmHeX482MOSEjBUtJ34iPVnyyzhTaoh/qcgKdLCD/6QU7BBL2
	 AZ189wCQlCcl2c8EFymx4jX/M2+/4LUmdZwAP8YxQivqTvpgPSR3NcDaXQrbZgC8oOz03
	 YfEj81XRXP6y0ChZlOawpzVJ3q1Z5QoSsJp8LLXn3II3qqgks5Ypn0sUiBYQLKoJ4xQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HJ1ra0NT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF5A606A326
	for <imx@lists.linux.dev>; Sat,  7 Nov 2026 07:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HJ1ra0NT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6876C1F0089F;
	Sat,  7 Nov 2026 07:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794035676;
	bh=bHhbMciYbnf1mWbkuCnHRN+tBorW6GQteatRQLPBcn4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HJ1ra0NT8PKlDUlAP4vkpw4F7t8vapVDI9Uivv7fuO3lTXB5EVjYlTrqVvD2S2E+F
	 vZ1o/AkOMlTVdKZPgrqM6s9znCpcREzqKsAr43vTi8VuDvBW5ShEmYn3W6bwFaVVzL
	 nNCJCm2XwIA13MDOAFzxWYDzr3qaWk6n6yKo9uJvWQ7kG1zBm64+Oz5lMleRznKrxX
	 eaX7k7dftu5HCorbwQTdSWTEzGDQirV6UCTGHFA0IR15QMAna4F9dSJerBC6Z85VRB
	 t6eU6ezUpvt5kbMpaIXN6CXGblK13h7aNaLSQG1qhrWa/Ls3gq8i7MlxkniT3TJcrS
	 G0j3S9m3WlIGw==
Message-ID: <sashiko-outbox-202680@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: coda: Fix potential use-after-free after VDOA
 removal
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guangshuo Li" <liguangshuo@mail.sdu.edu.cn>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261107-0d0c29e10a-media-coda-1@mail.sdu.edu.cn>
References: <20261107-0d0c29e10a-media-coda-1@mail.sdu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 07 Nov 2026 07:14:36 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] media: coda: unstopped DMA and job desync on timeout in
  vdoa_stop()
It also noticed 1 related pre-existing issue this patch does not
introduce:
- [Medium] media: coda: resource leaks in coda_open() error paths [1]
--

commit 641eafc2847290538ca328a1783a635a0c449aa1
Author: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>

media: coda: Fix potential use-after-free after VDOA removal

This commit reference-counts VDOA driver data across CODA consumers and
contexts, serializes VDOA hardware operations against driver removal, and
destroys the VDOA context if coda_open() fails.

> diff --git a/drivers/media/platform/chips-media/coda/coda-common.c b/driv=
ers/media/platform/chips-media/coda/coda-common.c
> index be37ea568bfe5..b519cf8541ded 100644
> --- a/drivers/media/platform/chips-media/coda/coda-common.c
> +++ b/drivers/media/platform/chips-media/coda/coda-common.c

[ ... ]

> @@ -2721,6 +2719,8 @@ static int coda_open(struct file *file)
>  err_clk_enable:
>  	pm_runtime_put_sync(dev->dev);
>  err_pm_get:
> +	if (ctx->vdoa)
> +		vdoa_context_destroy(ctx->vdoa);
>  	v4l2_fh_del(&ctx->fh, file);
>  	v4l2_fh_exit(&ctx->fh);
>  err_coda_name_init:

[Severity: Medium]
This problem wasn't introduced by this patch, but does this error path
still leak ctx->debugfs_entry and ctx->ctrls [1]?

coda_open() creates ctx->debugfs_entry with debugfs_create_dir() before
v4l2_fh_init() and initializes ctx->ctrls in coda_ctrls_setup(), but
neither debugfs_remove() nor v4l2_ctrl_handler_free() is called during
error unwind, leaving stale debugfs directories and leaked control handler
memory when opening the device fails.

[ ... ]

> diff --git a/drivers/media/platform/chips-media/coda/imx-vdoa.c b/drivers=
/media/platform/chips-media/coda/imx-vdoa.c
> index cd085c1c73f42..d9249c943dfa2 100644
> --- a/drivers/media/platform/chips-media/coda/imx-vdoa.c
> +++ b/drivers/media/platform/chips-media/coda/imx-vdoa.c

[ ... ]

> @@ -142,17 +150,43 @@ int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
> =20
>  	return 0;
>  }
> +
> +int vdoa_wait_for_completion(struct vdoa_ctx *ctx)
> +{
> +	struct vdoa_data *vdoa =3D ctx->vdoa;
> +	int ret;
> +
> +	mutex_lock(&vdoa->lock);
> +	ret =3D vdoa->removed ? -ENODEV : vdoa_wait(ctx);
> +	mutex_unlock(&vdoa->lock);
> +
> +	return ret;
> +}
>  EXPORT_SYMBOL(vdoa_wait_for_completion);
> =20
> +static void vdoa_stop(struct vdoa_data *vdoa)
> +{
> +	if (!vdoa->curr_ctx)
> +		return;
> +
> +	if (vdoa_wait(vdoa->curr_ctx))
> +		writel(VDOASRR_SWRST, vdoa->regs + VDOASRR);
> +	writel(0, vdoa->regs + VDOAIE);
> +	synchronize_irq(vdoa->irq);
> +	vdoa->curr_ctx =3D NULL;
> +}

[Severity: Medium]
When a transfer times out in vdoa_wait(), does vdoa_wait_for_completion()
leave DMA running while vdoa_stop() leaves submitted_job and completed_job
permanently out of sync?

When vdoa_wait_for_completion() returns -ETIMEDOUT to coda_finish_decode(),
the caller immediately releases the internal source frame and returns
dst_buf to videobuf2 without VDOASRR_SWRST or VDOAIE being written, so
VDOA DMA can still write to the returned buffer.  Furthermore, because
vdoa->curr_ctx is still set and completed_job is never updated to match
submitted_job when resetting the hardware in vdoa_stop(), the next
vdoa_stop() call waits another 300ms on the same timed-out transfer, and
every subsequent job on that context sees submitted_job !=3D completed_job
after completion and stalls for 300ms before resetting the hardware.

[1] https://sashiko.dev/#/bug/linux-28a3755d-8800-42ad-8451-7f7421db4955

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-0d0c29e10a=
-media-coda-1@mail.sdu.edu.cn?part=3D1
