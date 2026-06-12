Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A94992F39C7
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271976; cv=none; b=gxQdfXuDRQSjfqKZ5bZ8+WsrHNV+gzqcGlqgI2NmMWR5nRNE0d0Zp325dDfBjHbn9HY0YqvmwTh/bdx9gAiUvYX0sWwWfkdL8i8Uqewyjwjz1qM9sv6eFf2pkmbayV4d5eRANjBTf4Q0oqO8av4kFSSiCPQdAaD5vz92VvsuTMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271976; c=relaxed/simple;
	bh=DBTZfEpReoZw2manL7lw//Ge2KArra7nBAdmv+v0FdM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rejnA1LYoS1LdqbssabwjuUU5evYLm282WYONfU1nLrL6fxi8ndMJHOTMSPd8rWSr1fFUseNNGRzfgJCtfHb2BhoT1netR7Q9Bt45QL31c/kuNjwCzgaKRKA+aTNIl/8GCbMZdnEf8jnB4NMjnZz4eu8i4K9mDh4ivR8kcKJ31M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnlKg6I4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnlKg6I4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54D51F000E9;
	Fri, 12 Jun 2026 13:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271974;
	bh=GdNuZmJ2SySJqmFXx4eASMIX6N83kZlQq7+5xT+tLIU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=OnlKg6I4Mp0JnAl0wLEx6OGoSaKS10IKtPQLXiv6kb4dECGniVZpdgauN+DJvVXWO
	 Fj1xtsgiSbAL3YL2ZWgyrbwL05R2r7T3EuNdKzkSH3OACRyqDCXAnQdbhEYTySZ/Rh
	 aMBxwTxUcUVD/Me2gPM/fXW47e8lyJKTNskM5kTD03dI6F3bzgMDa1TMCoREAlwT5s
	 DUXeVtK69v9DWi4m6OSpU0Dr8ClOB71MmsTtksuy6miMPT2xL+qYawM1c9GVQ6xT1z
	 hS5xWTwo45DAb34ZqGbt2nu4dVGLN1TXJWp0PXu4jzeZJiXFoCshCEvrTwGZP6kzLA
	 UFOIKhtp7CKxw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 08/11] ASoC: imx-audio-rpmsg: Use guard() for spin locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260612132639.78086-9-phucduc.bui@gmail.com>
References: <20260612132639.78086-9-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 13:46:13 +0000
Message-Id: <20260612134613.E54D51F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 7 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The rpmsg callback `imx_audio_rpmsg_cb` can be invoked before prob=
e initialization completes, leading to a NULL pointer dereference on the `r=
pmsg` variable.
- [High] Spurious or early messages from the M core cause a NULL pointer de=
reference on the `info` pointer.
- [High] Spurious or early `TX_PERIOD_DONE` / `RX_PERIOD_DONE` messages cau=
se a divide-by-zero panic due to an uninitialized `num_period` divisor.
- [High] Uninitialized callback execution upon receiving early messages cau=
ses a kernel crash.
- [High] The callback `imx_audio_rpmsg_cb` can execute concurrently with or=
 after driver removal, resulting in a Use-After-Free of the `info` and `rpm=
sg_pdev` structures.
- [High] Platform devices are leaked on the error paths of `imx_audio_rpmsg=
_probe()` due to missing cleanup.
- [Medium] The callback trusts the length of the incoming rpmsg payload wit=
hout validation, leading to out-of-bounds reads.
--

commit b1578c7b9299ee080ea08b2217771219cd8e93c4
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: imx-audio-rpmsg: Use guard() for spin locks
   =20
Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

> diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rp=
msg.c
> index 38aafb8954c76..b55dfbdb45026 100644
> --- a/sound/soc/fsl/imx-audio-rpmsg.c
> +++ b/sound/soc/fsl/imx-audio-rpmsg.c
> @@ -22,7 +22,6 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rpde=
v, void *data, int len,
>  	struct rpmsg_r_msg *r_msg =3D (struct rpmsg_r_msg *)data;
>  	struct rpmsg_info *info;
>  	struct rpmsg_msg *msg;
> -	unsigned long flags;
> =20
>  	if (!rpmsg->rpmsg_pdev)

[Severity: High]
This isn't a bug introduced by this patch, but could this lead to a NULL
pointer dereference?

The rpmsg endpoint is created and the callback registered before the driver=
's
probe function executes. If the remote core sends an early message, this
callback could run while rpmsg is NULL because dev_set_drvdata() hasn't
happened yet.

Additionally, if imx_audio_rpmsg_remove() unregisters the platform device w=
hile
the rpmsg endpoint is still active, could an incoming message execute this
callback and dereference freed memory for rpmsg_pdev and info?

>  		return 0;

[ ... ]

> @@ -37,21 +36,21 @@ static int imx_audio_rpmsg_cb(struct rpmsg_device *rp=
dev, void *data, int len,
>  		/* TYPE C is notification from M core */
>  		switch (r_msg->header.cmd) {
>  		case TX_PERIOD_DONE:
> -			spin_lock_irqsave(&info->lock[TX], flags);
> -			msg =3D &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
> -			msg->r_msg.param.buffer_tail =3D
> -						r_msg->param.buffer_tail;
> -			msg->r_msg.param.buffer_tail %=3D info->num_period[TX];
> -			spin_unlock_irqrestore(&info->lock[TX], flags);
> +			scoped_guard(spinlock_irqsave, &info->lock[TX]) {

[Severity: High]
This is a pre-existing issue, but can spurious or early messages cause a NU=
LL
pointer dereference here?

If a message arrives before the child probe completes initialization,
platform_get_drvdata() could return NULL for info, causing scoped_guard() to
dereference a NULL pointer when accessing &info->lock[TX].

> +				msg =3D &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
> +				msg->r_msg.param.buffer_tail =3D
> +							r_msg->param.buffer_tail;
> +				msg->r_msg.param.buffer_tail %=3D info->num_period[TX];

[Severity: High]
This isn't a bug introduced by this patch, but does this modulo operation
risk a division-by-zero panic?

If a spurious or early TX_PERIOD_DONE message arrives before the ALSA stream
is prepared, info->num_period[TX] will still be initialized to 0.

> +			}
>  			info->callback[TX](info->callback_param[TX]);

[Severity: High]
This is a pre-existing issue, but could this unconditionally execute an
uninitialized function pointer?

If an early message arrives before the ALSA stream starts, info->callback[T=
X]
might be NULL, triggering a kernel panic.


[ ... ]


There are a few other pre-existing issues in this file that might be worth
looking into:

[Severity: Medium]
This is a pre-existing issue, but does the callback trust the length of the
incoming rpmsg payload without validation?

In imx_audio_rpmsg_cb() for MSG_TYPE_B:

	memcpy(&info->r_msg, r_msg, sizeof(struct rpmsg_r_msg));

The callback casts data to struct rpmsg_r_msg * but doesn't validate that
len >=3D sizeof(struct rpmsg_r_msg). If the remote peer sends a smaller pay=
load,
this results in an out-of-bounds read from the IPC buffer.

[Severity: High]
This isn't a bug introduced by this patch, but are platform devices leaked =
on
the error paths of imx_audio_rpmsg_probe()?

If platform_device_register_data() for data->rpmsg_pdev fails, the code rec=
ords
the error but unconditionally proceeds to register data->card_pdev. If the
latter succeeds, the function returns the error from the first failure, lea=
ving
card_pdev permanently registered. Conversely, if rpmsg_pdev succeeds but
card_pdev fails, it returns without unregistering rpmsg_pdev.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612132639.7808=
6-1-phucduc.bui@gmail.com?part=3D8
