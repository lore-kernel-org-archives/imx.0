Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556BA19CD03;
	Tue, 12 May 2026 03:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556140; cv=none; b=qhHo8N57jd0rv4w1EeKFan4df6xGvENq8cFVoeiEszB3d5D2/rw8YGIduqsG3DPoXdp/COCx4WEi1TmHgjQE1u/LKSeC7w4itOF4ob5soKcnyxsopI01f8Fv0bxPKuWBbFrD8qvRkvQh6HUt/eVB/1S4FRPHKzfGWOM7aWKQXpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556140; c=relaxed/simple;
	bh=nH1cY8RpcWPmnVw048AwObCyJW5VnGbF0xnxUDcW/ko=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=InWs9S1EYOfBHlUDnEc8pzznoL6YHMjgpHcjUHc4muboAdNje5Ocy0WA1J4v8WL8l/kW6brCaSGMpEXUiXPnHl/SS8q8wRCYV7gjN1p5ueoA/ZRMx4PUhoZxdTppbm6XZvw/LnEctQUC9zpRM+XXZHyAQd1W9mYzvicloOwaEuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uYdr0ncG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uYdr0ncG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFFD6C2BCB0;
	Tue, 12 May 2026 03:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778556140;
	bh=nH1cY8RpcWPmnVw048AwObCyJW5VnGbF0xnxUDcW/ko=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=uYdr0ncGuL3vtoIjRbcL4/wds2Rc20KxXYIrF9AHX7rPuq0Y2Z/leXfhU4uNdSn9w
	 fMN/jxZQhwUA3Xs4AKSAoeMIAylt1p6FlwOR/lE9Tk6J3gCOykdQS6yjUoJigIDTro
	 uO0VyBH6Q6AnX0H72uzNKp1Fjdx2utl+Y7TEHgxJCAxiVXA8Y0UEFn6R4cIzFWuRhy
	 mHeF2lpr3kymAXPpNEmU6wxGYDzsjG6FQlJm+1CZTeDy1wGAOdvj3akrr5DWi2nI58
	 z7IQXHpiXjlHOu/ibUG5SoH/UaWFCnLuWoAp/Gvp6QHh48mSM8VnqRos27gwnKDU+v
	 xY8oOodIzrMVQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/5] media: hi846: Add 6MP and 8MP modes support
Reply-To: sashiko@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260511090924.269106-5-mitltlatltl@gmail.com>
References: <20260511090924.269106-5-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 03:22:19 +0000
Message-Id: <20260512032219.AFFD6C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Mismatch between hardware registers and V4L2 Selection API bounds =
for new 6MP/8MP modes.
- [Low] Brittle array size math for mode iteration depending on hardcoded a=
rray layout.
--

commit 6d3bd49fa87b78bd49f2c7ba2cecba16a37a6a83
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: Add 6MP and 8MP modes support

This patch adds 6MP and 8MP modes for the hi846 sensor using 4-lane MIPI
CSI-2. It extracts register sequences from a downstream driver to maximize
sensor utilization.

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index 9decfda747876..68302d0b7ca5f 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c

[ ... ]

> @@ -1028,6 +1028,106 @@ static const struct hi846_reg mode_1632x1224_mipi=
_4lane[] =3D {
>  	{HI846_REG_TG_ENABLE,			0x0100},
>  };
> =20
> +static const struct hi846_reg mode_3264x1836_config[] =3D {
> +	{HI846_REG_MODE_SELECT,			0x0000},
> +	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
> +	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
> +	{HI846_REG_Y_ADDR_START_VACT_H,		0x0172},
> +	{HI846_REG_Y_ADDR_END_VACT_H,		0x089d},
> +	{HI846_REG_UNKNOWN_005C,		0x2101},
> +	{HI846_REG_FLL,				0x09de},
> +	{HI846_REG_LLP,				0x0ed8},
> +	{HI846_REG_BINNING_MODE,		0x0022},
> +	{HI846_REG_HBIN_MODE,			0x0000},
> +	{HI846_REG_UNKNOWN_0A24,		0x0000},
> +	{HI846_REG_X_START_H,			0x0000},

[ ... ]

> @@ -1128,9 +1228,59 @@ static const struct hi846_mode supported_modes[] =
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

Does this crop configuration exceed the V4L2 Selection API bounds?

In hi846_get_selection(), V4L2_SEL_TGT_CROP_BOUNDS and
V4L2_SEL_TGT_NATIVE_SIZE are hardcoded to width 3264 and height 2448 with
left and top set to 0. Here, crop.left is 0x46 and crop.width is 3264,
resulting in a right bound of 3334, which exceeds the native size.

Also, there appears to be a contradiction in the hardware registers. The
crop.left is set to 0x46 here, but HI846_REG_X_START_H is explicitly set to
0x0000 in the mode_3264x1836_config array.

Should crop.left be 0x00, or do the V4L2 hardware bounds and X_START_H need
to be updated to match the physical pixel array?

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
> +	},
>  };
> -#define NUM_MODES_2LANE		ARRAY_SIZE(supported_modes)
> +#define NUM_MODES_2LANE		(ARRAY_SIZE(supported_modes) - 2)

Is it safe to rely on this array index arithmetic for mode support?

This implicitly assumes the supported_modes array is strictly ordered so
that the last two modes lack 2-lane support. If modes are added, removed,
or reordered in the future, these macros could silently produce incorrect
array boundaries.

Would it be safer to dynamically filter modes based on
reg_list_2lane.num_of_regs instead?

>  #define NUM_MODES_4LANE		(ARRAY_SIZE(supported_modes) - 1)

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511090924.2691=
06-1-mitltlatltl@gmail.com?part=3D4
