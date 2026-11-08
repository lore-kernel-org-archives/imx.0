Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794116131;
	b=e6RZvk99ywgTqiFIGkX5f2aXLQrtY9YVCw6c2mGOd3qxUdvCCtEpzC5po0ZDHZWNAGpi
	 hkwrMlVsI4ETyibGK7XR96mqm7fHaHM/XV6Fx/nCKd41e5+lSJdFKH9wJ4F7ZsCOWgYHq
	 oScXw7n4wfBsmK+LwfMyr8756KOERy/5raw/jxRwUGzp36Qxhm6foQFOKmxtP7grISs37
	 YvnyE1csvbYZbFopO1BILGG0hNw23g5MEuu00dRxrNjIVPN009ESbhgKPIl3YoSsV9qm9
	 H0hE+VYFmeHWP4MSMaTZ6P8Ur8WY0SfHrTFHq0fPr8yyc5JZBbJZYm5zVSqVj8bXFKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794116131;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=EpvRHKSaGurB7+RpH1jAa7ngpGVSnL2fqGVB5eykYb8=;
	b=y6Xup/+v8hzIIbREB/68fShFhLvnLyBOJ5kYOiLV5Q3cwNV7GrlXOby5Gm3OTJLECDya
	 1KG06cw9Opiai349p3HLYvyQ+Q0aTC/qlR+QvkNPamnFYf/r32tgX5qikCV+FQlCR6NDW
	 5/0bZcqCUACCQn4Ap4yVxkf8oUx94QfJNW1xwUk+VMl/lY9FRHw4zXxJmU5ZbYEtZiGOW
	 9UQO7JwyZv1jVAaXieb/9zWvNPvah9/ZSV8pgXCgI3b5IuH5WcXAdTZsnUg7HiNk8bxHU
	 0IYBnsV34oJQgcH5bNpIkWOyUlu02P5SaFQ0cGg4yo7duc01WF2IGCQGOg6Pnb5ByDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nEjLWW/v";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BB2606A31A
	for <imx@lists.linux.dev>; Sun,  8 Nov 2026 05:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nEjLWW/v
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD69B1F0089F;
	Sun,  8 Nov 2026 05:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794116131;
	bh=EpvRHKSaGurB7+RpH1jAa7ngpGVSnL2fqGVB5eykYb8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nEjLWW/vyJOZA96f4azbQWnhV2TPd3rummSL/9hCb9GXuZfTDyRMLVeKwolQoqtOu
	 nLhX3jpS1puRUMkhBqyRCck1JcPlW6zszyN0DxgcuyoHnuIrM395rxjg+rUpsBlTmk
	 rgkQew8WnrHoxA9AclftephhY+GKLN5Ghq3Dym8gHDiYaP4DRZu3XGEC2VaNt+1GLq
	 FnPb6895ttIlnG3EBdAviCTM4tZljhMHbWeNFjAu8k5pyWOIqyVx1uAtQIoFf4UF9Z
	 cTrQIbjbNNAhrlzN5/fASw7Wx30eNJl4w5Pt/zcLJV0gLENtCY5jKeNPkg5ZqgVGRW
	 yn24bVb33jnLA==
Message-ID: <sashiko-outbox-203585@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] staging: media: imx: ic-prpencvf: add FORMAT_TRY frame
 interval support
Reply-To: sashiko-reviews@lists.linux.dev
To: DelaySystem <DelaySystem@tubot.lat>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261107-batch1-m2-prpencvf-try-v1-1-76bd9f505710@tubot.lat>
References: <20261107-batch1-m2-prpencvf-try-v1-1-76bd9f505710@tubot.lat>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 05:35:30 +0000
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
- [Medium] staging: media: imx: unpropagated TRY interval in
  prp_set_frame_interval()
--

commit 39c074ccbb9c23c1bfb8a1a38f0cced39b190229
Author: DelaySystem <DelaySystem@tubot.lat>

staging: media: imx: ic-prpencvf: add FORMAT_TRY frame interval support

This commit adds V4L2_SUBDEV_FORMAT_TRY support to the frame interval
callbacks in imx-ic-prpencvf by storing TRY intervals in the subdev state
and initializing them from the default active interval in a new init_state
callback.

> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/stagin=
g/media/imx/imx-ic-prpencvf.c
> index 3430ddeac3569..fd70c9a36f7ee 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -795,6 +795,18 @@ __prp_get_fmt(struct prp_priv *priv, struct v4l2_sub=
dev_state *sd_state,
>  		return &priv->format_mbus[pad];
>  }
> =20
> +static struct v4l2_fract *
> +__prp_get_frame_interval(struct prp_priv *priv,
> +			 struct v4l2_subdev_state *sd_state,
> +			 unsigned int pad,
> +			 enum v4l2_subdev_format_whence which)
> +{
> +	if (which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
> +		return v4l2_subdev_state_get_interval(sd_state, pad);
> +
> +	return &priv->frame_interval;
> +}
> +

[ ... ]

> @@ -1231,24 +1246,50 @@ static int prp_set_frame_interval(struct v4l2_sub=
dev *sd,
>  				  struct v4l2_subdev_frame_interval *fi)
>  {
>  	struct prp_priv *priv =3D sd_to_priv(sd);
> -
> -	/*
> -	 * FIXME: Implement support for V4L2_SUBDEV_FORMAT_TRY, using the V4L2
> -	 * subdev active state API.
> -	 */
> -	if (fi->which !=3D V4L2_SUBDEV_FORMAT_ACTIVE)
> -		return -EINVAL;
> +	struct v4l2_fract *interval;
> +	int ret =3D 0;
> =20
>  	if (fi->pad >=3D PRPENCVF_NUM_PADS)
>  		return -EINVAL;
> =20
>  	mutex_lock(&priv->lock);
> +	interval =3D __prp_get_frame_interval(priv, sd_state, fi->pad,
> +					    fi->which);
> +	if (!interval) {
> +		ret =3D -EINVAL;
> +		goto out;
> +	}
> =20
>  	/* No limits on valid frame intervals */
>  	if (fi->interval.numerator =3D=3D 0 || fi->interval.denominator =3D=3D =
0)
> -		fi->interval =3D priv->frame_interval;
> +		fi->interval =3D *interval;
>  	else
> -		priv->frame_interval =3D fi->interval;
> +		*interval =3D fi->interval;
> +out:
>  	mutex_unlock(&priv->lock);
> =20
> -	return 0;
> +	return ret;
> +}

[Severity: Medium]
Should prp_set_frame_interval() keep the sink and source pad intervals in
sync when fi->which is V4L2_SUBDEV_FORMAT_TRY?

For V4L2_SUBDEV_FORMAT_ACTIVE, __prp_get_frame_interval() ignores pad and
returns the single shared &priv->frame_interval because the IC preprocess
task does not change the frame rate between PRPENCVF_SINK_PAD and
PRPENCVF_SRC_PAD.  For V4L2_SUBDEV_FORMAT_TRY, v4l2_subdev_state_get_interv=
al()
returns a separate slot per pad, and prp_set_frame_interval() only updates
fi->pad without propagating the interval to the other pad (unlike
prp_set_fmt(), which propagates sink pad changes to PRPENCVF_SRC_PAD).
Userspace negotiating TRY frame intervals on PRPENCVF_SINK_PAD will read a
stale interval on PRPENCVF_SRC_PAD, or configure different TRY intervals on
the two pads that the hardware and ACTIVE state cannot represent.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-batch1-m2-=
prpencvf-try-v1-1-76bd9f505710@tubot.lat?part=3D1
