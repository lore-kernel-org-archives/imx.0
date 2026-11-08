Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794116030;
	b=kIfrkcyM7U5+Hm9b13JwQnADav7tvnAW3z2wOEog4rJaDvM8o+VOC+e9xbBD4mPto5+G
	 4QmYKlz7z1FPTxD+ppTGHoV5ccDzgsIWnsRt9z4OLjebeiaF5Uv4f9miSksep4xQgERpc
	 T+024pwVxeq3CDo9HOTjFJo2DVMTT7Vkf3GlzRwcVoEwNcOYJ4owRHLDDguSZR0ozr0rp
	 wnrnuZcT6YT1mYJo20hQsXHunwxCGEg13t3lk9Q7rXTGXY2MmF0s7nASLrTaKBw/c5hIx
	 lkhijcH9nu+6io22nTtoJoa1NjTjhGY/6N6QfVTHdYvM2wQV0/OyJJpBJaRFmX0iAzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794116030;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=hcR1NWGAvY3wb4CUWwKL2D7Gweq/wlUCeLzsfq8RdU8=;
	b=ouXxZ3NPI/4yuu6mMyyfOtzSV2E+HPkxzX6ZWXuSGOnfkKrVgSQfW9PnlaOA5uzT+xMx
	 3LPkQDXkaM7Ct7YhBrS/bfDPLa83hSAOZJUB4mzJApGOqStp7SHvPnqyedN3DSZTn4wV0
	 5sbMeDnIxrzysm4jIj9p+lafQddTlzPHo8SoyaigIzeQTNoYq26OB7zzShlKxstZWSqoP
	 jYRXTKxfRnp/SN2KyZFIFLz+8C93J6S1y+W8LJ+coSE5hC0XETUFYHbrlif6MHnmaqCKj
	 4KmY0SNe6TXFdaa+/izhN9MKVP/UWeGdZcRs6ArcuH1u7d5ReSW2CdgJ6aiDhOihAwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6CeUsZ+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18457606A31A
	for <imx@lists.linux.dev>; Sun,  8 Nov 2026 05:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c6CeUsZ+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501361F0089F;
	Sun,  8 Nov 2026 05:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794116029;
	bh=hcR1NWGAvY3wb4CUWwKL2D7Gweq/wlUCeLzsfq8RdU8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=c6CeUsZ+9GisWReieQbG9d4i+m02GUpugO5oTqZanVbgSqfqnWKqbQu2vOW+iAUhW
	 BVqjGV/K8ovjTShQJJ4R9yfQbSx7WdH4Gg9Q8mFs6cWT+/E//J/WBMxQbdm2m0T685
	 9zJmPbadi/QdliqqFW67E56LRf0ZKT28BTQFvymrdDX80iu5+cpaygHp9A/vu1tFMk
	 irsS8r4VXL502Ix0w3bk4uQ1rC6YWi6oIVxlBlcAkeKM05zb6uyJt/Pw2QdddyJbng
	 LBX6kuuanLMGAFC6VMLMRRpAVl09ew9dMGYdhpEHSWggG7W+9bjoKe16a2GgRO+Z2L
	 YZjKWb15rQU4A==
Message-ID: <sashiko-outbox-203584@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] staging: media: imx: ic-prp: add FORMAT_TRY frame
 interval support
Reply-To: sashiko-reviews@lists.linux.dev
To: DelaySystem <DelaySystem@tubot.lat>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261107-batch1-m1-prp-try-v1-1-56a08f54791b@tubot.lat>
References: <20261107-batch1-m1-prp-try-v1-1-56a08f54791b@tubot.lat>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 08 Nov 2026 05:33:48 +0000
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
- [Medium] staging: media: imx: ic-prp: inconsistent TRY vs ACTIVE pad
  frame intervals
--

commit ea3f743cedd8910d8654eb2253132f006f78cf9d
Author: Vickram Kapoor <vickramk.207@gmail.com>

staging: media: imx: ic-prp: add FORMAT_TRY frame interval support

This commit adds V4L2_SUBDEV_FORMAT_TRY frame interval support to the i.MX
IC pre-process router subdev by storing and retrieving per-pad intervals in
v4l2_subdev_state and initializing them in a custom init_state callback.

Link: https://lore.kernel.org/all/20260426002659.119625-1-vickramk.207@gmai=
l.com/

> diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/med=
ia/imx/imx-ic-prp.c
> index b2c648149964c..3f1690d22483e 100644
> --- a/drivers/staging/media/imx/imx-ic-prp.c
> +++ b/drivers/staging/media/imx/imx-ic-prp.c
> @@ -87,6 +87,18 @@ __prp_get_fmt(struct prp_priv *priv, struct v4l2_subde=
v_state *sd_state,
>  		return &priv->format_mbus;
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

[ ... ]

> @@ -421,24 +436,50 @@ static int prp_set_frame_interval(struct v4l2_subde=
v *sd,
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
>  	if (fi->pad >=3D PRP_NUM_PADS)
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
Should prp_set_frame_interval() keep the source pad frame intervals in sync
with PRP_SINK_PAD for V4L2_SUBDEV_FORMAT_TRY?

The IC pre-process router does not perform frame rate conversion, and
__prp_get_frame_interval() returns the single shared &priv->frame_interval
for all pads when fi->which is V4L2_SUBDEV_FORMAT_ACTIVE.  For
V4L2_SUBDEV_FORMAT_TRY, however, v4l2_subdev_state_get_interval() returns a
separate struct v4l2_fract per pad.  Setting a TRY interval on PRP_SINK_PAD
leaves PRP_SRC_PAD_PRPENC and PRP_SRC_PAD_PRPVF with stale TRY intervals,
and calling VIDIOC_SUBDEV_S_FRAME_INTERVAL on a source pad allows setting an
independent TRY interval that cannot exist in V4L2_SUBDEV_FORMAT_ACTIVE,
unlike prp_set_fmt():

drivers/staging/media/imx/imx-ic-prp.c:prp_set_fmt() {
	...
	case PRP_SRC_PAD_PRPENC:
	case PRP_SRC_PAD_PRPVF:
		/* Output pads mirror input pad */
		sdformat->format =3D *infmt;
		break;
	...
}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261107-batch1-m1-=
prp-try-v1-1-56a08f54791b@tubot.lat?part=3D1
