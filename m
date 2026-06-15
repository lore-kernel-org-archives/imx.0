Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCDD3DB62E
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517114; cv=none; b=AjJOovdZo1/pfi+96LrcLEkWJh9/GpgiqtP4w/3DYFzR3XmWzjKbK4pjAfVj7K0oH0c5fTF8SHT6EXhDzf1dfjGPuPan8A27+8W65G+O3SyLdTalSqkglKhjVlL99jgKhbUUENgQ7fHgbAOlv92+p4pUNSS6gpzbepJ7Zhyto6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517114; c=relaxed/simple;
	bh=x+mTsPtxQaB11JW1OGNsY51RHCbwI3cyGWXqNUyb2xc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WuJeurC+1anojkxV7qMyd8Eqkpj6K+Cq/06g2gv0wXisIc3ddQjQfHHUYSbE+joF/tLniikqZWW5aBonhRWvIOFnYl2zd9o+VG4KHfA2jP7UBe9jZRmodc4y4+c3+CtuE6gmYYiQwbCZ2JXSilAOpoENxQCZV4u7Veenfb5XIE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HkDUckP/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HkDUckP/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE6291F00A3A;
	Mon, 15 Jun 2026 09:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781517113;
	bh=wjJJ04R8PlssnANj7B3mMb0dOO+Ejo/dQwim9Zhv4rY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HkDUckP/5JHbTa3tPpjteEwedQD9I0xbKTsV5RLaNZYmHbPAucopB2RS8kaJYjJVJ
	 Qjd7wWpce2E69r27a5xJ1ek/Muz6Jp8JTlETysIPzmPKXeHRe8XswP/13KZ1hgKyul
	 3UGVD2fSB5t4cVqY2l7poiJd20hmQbWt7+v11WEpSgQ7Kq4BUTfyr6fPbOiikWwfjg
	 alvYnDx7gyuTERRihPBtKVE4efMXVeM0iiyUS9MJJPlnzTZDintrX58oytcyB9sd2o
	 3nCynDq8hj+sGHqyD+aIDCKRgQa1UFM6z1BsYvpNBjkQ5ALCmq0RUu4Ap7MgKp9KM/
	 qedmdyBwxODbg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/11] ASoC: imx-audio-rpmsg: Use guard() for spin
 locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260615093824.115751-9-phucduc.bui@gmail.com>
References: <20260615093824.115751-9-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 09:51:52 +0000
Message-Id: <20260615095152.CE6291F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Processing unexpected or malicious RPMSG messages before the strea=
m or driver is fully initialized triggers a divide-by-zero or NULL pointer =
dereference.
- [High] Missing length validation on incoming RPMSG messages allows out-of=
-bounds reads.
- [High] An error pointer in `rpmsg_pdev` can be dereferenced if the platfo=
rm device registration fails.
--

commit 61d5b2e3f34cf71daf31644fa46cc656a302b3a3
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

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for the remote
processor to send a message smaller than sizeof(struct rpmsg_r_msg)?

There does not appear to be any validation of the len parameter before cast=
ing
data to a struct pointer and later unconditionally copying
sizeof(struct rpmsg_r_msg) bytes. Could this lead to an out-of-bounds read
if a truncated message is received?

>  	struct rpmsg_info *info;
>  	struct rpmsg_msg *msg;
> -	unsigned long flags;
> =20
>  	if (!rpmsg->rpmsg_pdev)
>  		return 0;

[Severity: High]
This is a pre-existing issue, but does this check adequately handle platform
device registration failures?

If platform_device_register_data() fails during probe, it returns an ERR_PTR
which would pass this NULL check. If an incoming message arrives during this
race window, could this lead to an invalid pointer dereference when
platform_get_drvdata() is called below?

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
This is a pre-existing issue, but are we certain that info and its fields
are fully initialized before this callback can be invoked?

The RPMSG endpoint is created in rpmsg_dev_probe() before the driver's own
probe completes. If the remote processor sends a TX_PERIOD_DONE message
immediately upon endpoint creation, could this race cause a NULL pointer
dereference on info->lock if platform_get_drvdata() returned NULL?

> +				msg =3D &info->msg[TX_PERIOD_DONE + MSG_TYPE_A_NUM];
> +				msg->r_msg.param.buffer_tail =3D
> +							r_msg->param.buffer_tail;
> +				msg->r_msg.param.buffer_tail %=3D info->num_period[TX];

[Severity: High]
This is also pre-existing, but if the stream is uninitialized due to the sa=
me
race condition mentioned above, could info->num_period[TX] be zero and
trigger a divide-by-zero exception here?

> +			}
>  			info->callback[TX](info->callback_param[TX]);

[Severity: High]
Similarly, as a pre-existing issue, could info->callback[TX] be uninitializ=
ed
and lead to a NULL function pointer dereference if the stream is not yet
prepared?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615093824.1157=
51-1-phucduc.bui@gmail.com?part=3D8
