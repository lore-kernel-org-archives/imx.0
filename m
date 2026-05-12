Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF5C332635;
	Tue, 12 May 2026 05:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778562784; cv=none; b=tRSsQSgC01LXn9A6VoYrRbYDcUeJ/M0NenkzAeQlZusZXvcACGZ9pg9xpsd8f/RDmSgUB+BylkRPoT4I/7/JJJptRiCPqqJj3LKbIVgcg2W3++x3hiMVPWgH8oMnSOpTuCtALsukGPVgyhnaq9QyA4GaclbG5gutb9AFxHIaQL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778562784; c=relaxed/simple;
	bh=MO8afgFCICfmXxmbdiaMYmHHFZJchgcWA7TMHdmCU0E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mITTx1twaW6kv4ohPFi1414MYF3TmbrSqtJB/KkbzgNER+dgHDSkU7SA5muRQxMfONBGZmVlFpwRnwxb4a/0WyRtCGZjQkvQlbHPaTWPjdIW1CPfLwE6fZkfpvmrB5a5WzKx1ZIgcNElZaaL+bdwYn4CBqvXAW/JGqYva3W877Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GsHJjsbI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GsHJjsbI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D4F1C2BCB8;
	Tue, 12 May 2026 05:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778562783;
	bh=MO8afgFCICfmXxmbdiaMYmHHFZJchgcWA7TMHdmCU0E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=GsHJjsbIjyPzgdzrGrGQqcumMQ8TrESTsLThSgudFBmnlb0gQmRtqQh7H+LXLQ6E4
	 xKR+iJqF4cADaopgZsesG3/vlFWjcp/vC97B8n6RHGigyUvCrsnN/jrKaAXfPfI6Wj
	 UlvaFtrwpZWvo/hv11pm9PPsXlBl6+wcNJ5YFdQhBctc4GmyCuy4HBLeGM4nYLXy1W
	 lF6ltVnaj/tU6pK9p3xnIlNd3Dg5DCEwDfONhJYUfy7PEjHc20ahJxMwWRH9c3AEyz
	 PG39GpboRsReA4tv+HfnHGWq+E7Kg/SUsQbOoHey16AqeAO0RT+jPkggp/Lz1CWt/7
	 fVgn22K65J0Ig==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] media: hi846: Add 6MP and 8MP modes support
Reply-To: sashiko@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org
In-Reply-To: <20260511103927.279550-5-mitltlatltl@gmail.com>
References: <20260511103927.279550-5-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 05:13:03 +0000
Message-Id: <20260512051303.7D4F1C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The V4L2 crop rectangles for the newly added 6MP and 8MP modes e=
xceed the static V4L2 crop bounds returned by `hi846_get_selection()` and c=
ontradict the hardware register configurations.
--

commit ba8b377e2d211a8774704df370bcbc25d095a60c
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: Add 6MP and 8MP modes support

This patch adds 6MP and 8MP modes to maximize sensor utilization on the
hi846 sensor. These modes require 4-lane MIPI CSI-2 and use register
sequences extracted from the downstream Windows driver.

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index c77b34a5e1662..12df1dc96163e 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1028,6 +1028,106 @@ static const struct hi846_reg mode_1632x1224_mipi=
_4lane[] =3D {

[ ... ]

> +static const struct hi846_reg mode_3264x2448_config[] =3D {
> +	{HI846_REG_MODE_SELECT,			0x0000},
> +	{HI846_REG_Y_ODD_INC_FOBP,		0x1111},
> +	{HI846_REG_Y_ODD_INC_VACT,		0x1111},
> +	{HI846_REG_Y_ADDR_START_VACT_H,		0x0040},
> +	{HI846_REG_Y_ADDR_END_VACT_H,		0x09cf},
> +	{HI846_REG_UNKNOWN_005C,		0x2101},
> +	{HI846_REG_FLL,				0x09de},
> +	{HI846_REG_LLP,				0x0ed8},
> +	{HI846_REG_BINNING_MODE,		0x0022},
> +	{HI846_REG_HBIN_MODE,			0x0000},
> +	{HI846_REG_UNKNOWN_0A24,		0x0000},
> +	{HI846_REG_X_START_H,			0x0000},

Does this register configuration contradict the crop configuration below?=20

HI846_REG_X_START_H is configured to 0x0000, meaning the hardware reads
from column 0. However, the crop left offset is set to 0x46 (70). Exposing
a left crop offset to userspace while the hardware is programmed to read
from 0 seems contradictory.

> +	{HI846_REG_X_OUTPUT_SIZE_H,		0x0cc0},
> +	{HI846_REG_Y_OUTPUT_SIZE_H,		0x0990},

[ ... ]

> @@ -1128,9 +1228,59 @@ static const struct hi846_mode supported_modes[] =
=3D {
>  			.width =3D 1632 * 2,
>  			.height =3D 1224 * 2,
>  		},
> -	}
> +	},

[ ... ]

> +	{
> +		.width =3D 3264,
> +		.height =3D 2448,
> +		.pll_cfg_4lane =3D 0x4124, /* HI846_REG_PLL_CFG_MIPI2_H */
> +		.fps =3D 30,
> +		.frame_len =3D 2526,
> +		.llp =3D HI846_LINE_LENGTH,
> +		.reg_list_config =3D {
> +			.num_of_regs =3D ARRAY_SIZE(mode_3264x2448_config),
> +			.regs =3D mode_3264x2448_config,
> +		},
> +		.reg_list_2lane =3D {
> +			.num_of_regs =3D 0,
> +		},
> +		.reg_list_4lane =3D {
> +			.num_of_regs =3D ARRAY_SIZE(mode_3264x2448_mipi_4lane),
> +			.regs =3D mode_3264x2448_mipi_4lane,
> +		},
> +		.crop =3D {
> +			.left =3D 0x46,
> +			.top =3D 0x40,
> +			.width =3D 3264,
> +			.height =3D 2448,

Could this crop configuration break userspace boundary checks?=20

In hi846_get_selection(), V4L2_SEL_TGT_CROP_BOUNDS unconditionally returns =
a=20
hardcoded rectangle:

static int hi846_get_selection(...)
{
...
	case V4L2_SEL_TGT_CROP_BOUNDS:
	case V4L2_SEL_TGT_NATIVE_SIZE:
		sel->r.top =3D 0;
		sel->r.left =3D 0;
		sel->r.width =3D 3264;
		sel->r.height =3D 2448;
		return 0;
...
}

With the newly introduced 3264x2448 mode defining its active crop rectangle
with .left =3D 70 and .top =3D 64, the right boundary becomes 3334 and the =
bottom=20
boundary becomes 2512.=20

These values strictly exceed the crop bounds. According to the V4L2
specification, any valid crop rectangle must fit completely inside the crop
bounds. Returning a crop bound that is physically smaller than the allowed=
=20
crop geometries breaks boundary checks in applications like libcamera.

> +		},
> +	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511103927.2795=
50-1-mitltlatltl@gmail.com?part=3D4
