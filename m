Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794961663;
	b=Uv1vezd1VJfwDrNLBW700u6HXqdR5bNhZGERtrBu5FwROiDv5+3630okIxD+56ay+mEn
	 NWTDbblt9mUA6ZsJey3JS7Mo0CJTgoHeRjbXlJb02o2Gm0dZNSCv5LSkgdPgIdbxW5qz4
	 /Zl5ycziWQDUVr91GieE8RAqLMWSLQmIWxd90ibf3SfaO81J2TtDSEvDloZzgiaS5b9I1
	 uykWvA1Cb4Z1xluYhE/JX1U/uItrKHd5L/8a+ucl7SYAW5NWHFINQaHVn/ETCAeNzhaCI
	 LRLab1Z0nGLKcdLSRbEiGoDA/8b+2LqL6w7LcZtC7vBiN+kdRTh4aMjpCtHVdabBlnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794961663;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=yae3qijt8GJTqeTlCMEs36FXAbgpDkVqH045G3fLWOc=;
	b=i/S4k7tbmcRmIyDgeZ/05PXam5g+QLDZgEFIAE4aBgOPkVU6ERx9Rl5iC8F/aOW9XVD1
	 r7kOjSxS4wYd7QptB7Y2aFDxurDdCVwUzrDjYM5P0KpYUfE8Dd2Rk9pRr8sz2dgk8Wt/7
	 Gtwr6jHfYuPIbKqvr3We8nPwTVUcxReJy2MKqwEufvHdQFjl8PiobGmOjM7B4Hk3itcsP
	 M4zrrQbyHJAT1Grq1+EGYXDfYzGwcRgK1Eogz5Wn0/y6aofthFeZR89NgUm1tYgx5qMQS
	 bLUGmlrpUKlAA+IemXu4v9mBgGz5DFm4Y1w0DttDdpidvAUdlxWyHbqCEv/rj9/y3Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JhdNJ+ds;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F121E606A31C
	for <imx@lists.linux.dev>; Wed, 18 Nov 2026 00:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JhdNJ+ds
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F91B1F000C4;
	Wed, 18 Nov 2026 00:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794961662;
	bh=yae3qijt8GJTqeTlCMEs36FXAbgpDkVqH045G3fLWOc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JhdNJ+dsqHA+e3JDa/k0xQ5zhsHMshY1Y+8WVkf6WESngaYzRJ2SsmWGiOkNpNqOk
	 p82GPlBghhgDnaCh5tsEzQEpr+mFQSE/+vweTrGOQmocIhM0taAKruUEtXrqY1rN5s
	 XpW6NVXagvBpgUBr7lDaySyF52xPgb5fo8NGRnZTUktiSnXgMYPAnq5B6SFjOrsAZf
	 YDre4S83VmJigPKdIe+UEwFuxJYnkGzFEQPrdKhliaaPMWGAaH+/TMSgmQ/qcjSx7G
	 67ifFkqTaLML+GY7ZYJDJSSMr1Gm0YgBGpCpYBGs4vgfJm1mXDlx2tN/nxGoWBHtkT
	 dZetr0nZ2xMcg==
Message-ID: <sashiko-outbox-219842@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] staging: media: imx: ic-prpencvf: add FORMAT_TRY
 frame interval support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Maximo Manriquez Lizarraga" <DelaySystem@tubot.lat>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261117-batch1-m2-prpencvf-try-v2-1-dd331ab13137@tubot.lat>
References: <20261117-batch1-m2-prpencvf-try-v2-1-dd331ab13137@tubot.lat>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 00:27:41 +0000
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
- [Low] staging: media: imx: divergent TRY pad intervals in
  prp_set_frame_interval()
--

commit ab0674eed0b91380970c6973e29f82828fdedc3b
Author: Maximo Manriquez Lizarraga <DelaySystem@tubot.lat>

staging: media: imx: ic-prpencvf: add FORMAT_TRY frame interval support

This commit adds V4L2_SUBDEV_FORMAT_TRY support for frame intervals in
the i.MX IC prpencvf subdev by storing TRY intervals in the subdev state
and initializing them in a custom init_state callback.

> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/stagin=
g/media/imx/imx-ic-prpencvf.c
> index 3430ddeac3569..5ce0eb56be5bf 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c

[ ... ]

> @@ -1231,24 +1246,68 @@ static int prp_set_frame_interval(struct v4l2_sub=
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
> -	if (fi->interval.numerator =3D=3D 0 || fi->interval.denominator =3D=3D =
0)
> -		fi->interval =3D priv->frame_interval;
> -	else
> -		priv->frame_interval =3D fi->interval;
> +	if (fi->interval.numerator =3D=3D 0 || fi->interval.denominator =3D=3D =
0) {
> +		fi->interval =3D *interval;
> +	} else {
> +		*interval =3D fi->interval;
> +
> +		/*
> +		 * The IC task does not change the frame rate between sink
> +		 * and source, so keep both TRY slots in sync the same way
> +		 * prp_set_fmt() propagates formats to the source pad.
> +		 * (ACTIVE uses a single shared interval and needs nothing.)
> +		 */
> +		if (fi->which =3D=3D V4L2_SUBDEV_FORMAT_TRY &&
> +		    fi->pad =3D=3D PRPENCVF_SINK_PAD) {
> +			struct v4l2_fract *src_interval;
> +
> +			src_interval =3D __prp_get_frame_interval(priv, sd_state,
> +								PRPENCVF_SRC_PAD,
> +								fi->which);
> +			if (src_interval)
> +				*src_interval =3D fi->interval;
> +		}
> +	}

[Severity: Low]
Can setting a V4L2_SUBDEV_FORMAT_TRY frame interval on PRPENCVF_SRC_PAD
cause the sink and source TRY intervals to diverge?

For V4L2_SUBDEV_FORMAT_ACTIVE, both pads share priv->frame_interval, so
calling prp_set_frame_interval() on PRPENCVF_SRC_PAD updates both pads.
For V4L2_SUBDEV_FORMAT_TRY, *interval =3D fi->interval overwrites the
source pad slot without either clamping it to the sink pad interval or
updating the sink pad slot to match, leaving the two pads with different
TRY frame intervals even though the IC does not alter the frame rate.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117-batch1-m2-=
prpencvf-try-v2-1-dd331ab13137@tubot.lat?part=3D1
