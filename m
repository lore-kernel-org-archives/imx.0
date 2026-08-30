Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586D43BED5F;
	Sun, 30 Aug 2026 16:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788106688; cv=none; b=bETSiCbLufHURouEOrqDvpM+aTyT2Ctlqmxoy8JmK6VXIdDgw1uf8NEXRvIFonEiL7Nf/hwjaA6gXL/Bg+WDay9e5ieZZm7sQ95aci08LtJkT/i7cUw47g6t2EhobxoBrA22/wMi19ryDnHR/s6yWA1ZMwFQWJ4u8tQEpimQz4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788106688; c=relaxed/simple;
	bh=VJ8KSNdOms/52I/FFynH/3c+i1lBlRNyFlqz0j07+ZU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=P5M06VZzTB5Lyb4XHftjRr3SAyOnreeyY3j/PTZEaIGNqpjigg4j58I8Zz0kbFIOvJBXPS5bYVrOl4j/ffGoi89wnzdowOyIbB7kg7nivStBGePH98/aHFOrrQH2hpMZXwANAO+Rwa5/tSq5m850imzYzrmDoGmI57WQy4ge8pM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vu/SmAow; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vu/SmAow"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2401F000E9;
	Sun, 30 Aug 2026 16:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788106684;
	bh=xTe6sJhzyDHYKNrYo2defPCOBN0mbyRQs/VI5UCi/3A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vu/SmAowbmY59uL/no5biU+cY3x+vkv2LplvoxgDEMWSEkgZeDFRFCVdvsbeoPkAG
	 akHt0hxr9B4FJnLNJQsxBqdzcOTZ+UoLv5fnuhnG6ojTL8gs2SxE6c+Ohng3385eiB
	 G4PhUATVYCvCIGi0vPopZh4QWklv9bJNnBXw3pSnnC3ia3amFK1JWawoOv28wFTjLC
	 r+VKBt4ETdRcfpYBWFXfoTPS+Kzxsj5kU1/yLkUNbcOo37eypvzNzs7UmcdsNFQjpP
	 CvU4yVMpFzZKiElZSYMWN+Y57SyHfWusklFjNY1S3l4H564rKRoZ2jLhQcmobaLIy1
	 FJCFyYk4UUN9A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/5] media: hi846: Add 6MP and 8MP modes support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: conor+dt@kernel.org, robh@kernel.org, media-ci@linuxtv.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260830160025.211384-5-mitltlatltl@gmail.com>
References: <20260830160025.211384-1-mitltlatltl@gmail.com>
 <20260830160025.211384-5-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 30 Aug 2026 16:18:03 +0000
Message-Id: <20260830161804.1E2401F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Medium] The crop rectangles for the newly added 6MP (3264x1836) and 8MP =
(3264x2448) modes overflow the native crop bounds of the sensor.

Pre-existing issues:
- [High] Missing mutex_unlock() on the error path in hi846_set_format(), le=
ading to a deadlock.
- [High] Unchecked return value from v4l2_find_nearest_size_conditional() l=
eads to a NULL pointer dereference in hi846_set_format().
--

commit e8c04d7885133a51b470ee7348db670b6ed848dd
Author: Pengyu Luo <mitltlatltl@gmail.com>
Date:   Sun Aug 30 16:00:24 2026 +0000

    media: hi846: Add 6MP and 8MP modes support
   =20
    Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
    mode for years. This patch adds 6MP and 8MP modes to maximize sensor
    utilization.

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 26b4290148b61..7ad691364cdc1 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
[ ... ]
> @@ -1136,7 +1236,59 @@ static const struct hi846_mode supported_modes[] =
=3D {
>  			.width =3D 1632 * 2,
>  			.height =3D 1224 * 2,
>  		},
> -	}
> +	},
> +	{
> +		.width =3D 3264,
> +		.height =3D 1836,
[ ... ]
> +		.crop =3D {
> +			.left =3D 0x46,
> +			.top =3D 0x172,
> +			.width =3D 3264,
> +			.height =3D 1836,
> +		},

[Severity: Medium]
Will this crop configuration violate the V4L2 API contract?

The crop rectangle extends beyond the native crop bounds of the sensor.
The hardcoded absolute crop bounds in hi846_get_selection() are:

	case V4L2_SEL_TGT_CROP_BOUNDS:
	case V4L2_SEL_TGT_NATIVE_SIZE:
		sel->r.top =3D 0;
		sel->r.left =3D 0;
		sel->r.width =3D 3264;
		sel->r.height =3D 2448;

For this new 3264x1836 mode, an offset of (70, 370) with a width of 3264 me=
ans
the right boundary extends to 3334, which strictly exceeds the advertised
3264 maximum limit. Strict userspace frameworks like libcamera or
v4l2-compliance might reject or clip this, breaking functionality.

> +	},
> +	{
> +		.width =3D 3264,
> +		.height =3D 2448,
[ ... ]
> +		.crop =3D {
> +			.left =3D 0x46,
> +			.top =3D 0x40,
> +			.width =3D 3264,
> +			.height =3D 2448,
> +		},

[Severity: Medium]
Similarly, does this crop configuration overflow the native width and height
bounds?

With an offset of (70, 64) and size 3264x2448, the boundaries are pushed
to 3334x2512, exceeding the 3264x2448 limits from hi846_get_selection().

Should the native bounds be expanded to accommodate these crop offsets, or
should the offsets be adjusted to 0?

While reviewing this patch, I also noticed a couple of pre-existing issues =
in
the file introduced earlier in this series:

> static int hi846_set_format(struct v4l2_subdev *sd,
> 			    struct v4l2_subdev_state *sd_state,
> 			    struct v4l2_subdev_format *fmt)
> {
[ ... ]
> 	hi846->cur_mode =3D
> 		v4l2_find_nearest_size_conditional(supported_modes,
> 						   ARRAY_SIZE(supported_modes),
> 						   width, height,
> 						   mf->width, mf->height,
> 						   filter_modes, hi846);
>=20
> 	dev_dbg(&client->dev, "%s: found mode: %dx%d\n", __func__,
> 		hi846->cur_mode->width, hi846->cur_mode->height);

[Severity: High]
This isn't a bug introduced by this patch, but does
v4l2_find_nearest_size_conditional() return NULL if no matching mode is fou=
nd?

If the device tree configuration provides data-lanes =3D <4> but the
link-frequencies property only matches modes that have 0 registers for 4-la=
ne
configurations, filter_modes() will evaluate to false for every mode.=20

This would cause v4l2_find_nearest_size_conditional() to return NULL, leadi=
ng
to a kernel crash when hi846->cur_mode->width is unconditionally dereferenc=
ed.

[ ... ]
> 	idx =3D hi846_get_link_freq_index(hi846, hi846->cur_mode);
> 	if (idx < 0) {
> 		dev_err(&client->dev,
> 			"failed to get link freq index: %d\n", idx);
> 		return -EINVAL;
> 	}

[Severity: High]
This is a pre-existing issue, but does this error path leave hi846->mutex
locked?

The function returns without calling mutex_unlock(&hi846->mutex), causing a
deadlock on subsequent calls to driver functions that acquire this mutex.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260830160025.2113=
84-1-mitltlatltl@gmail.com?part=3D4
