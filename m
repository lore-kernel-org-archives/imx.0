Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4583A4F4A;
	Sun, 12 Jul 2026 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783858393; cv=none; b=hZ13HiB2+9Tk72PVyxKY2/ov9GVN8jYW1NA5fg61TDpJMc/F3FyLylMS1WcPEI0erdHTNC4utlzZEqt5kI3M3j6YnOGXBQ5hJmlGT8SK4AXQnDG07akzdbM+U7kg7nE424ss09REThp2GKsOcNFeaMznvkXnlc6XuFxoa2jZIA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783858393; c=relaxed/simple;
	bh=D+X0O0chaY+dxk73/+5x15hGDZcG8k3ueF8xdzcT7Sw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H952usa5wDviiUw5s3Le9zfK37WHUvxUckjOM23u9px/ShcJc4CpEJ866qsrSFXA0wzyAhoDz67qGJ0P6AQQWgEhnwUDy63l1bhdrEQpmn2sgUixEs8b0eoG7uI2xLMLCV9fy6YnAvKWPeivBoYcxFC0cWqwI90pdI6MLF/Hf5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AWydNVvN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AWydNVvN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23F771F000E9;
	Sun, 12 Jul 2026 12:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783858391;
	bh=bwifOs3ARdMGHT87KJ+xGdNEjJ/ce/EhL8WqDfk2fN4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AWydNVvNuSVtau77GHGBTr7WnKtsDnmxElUT1rgAWJmReJUNK9DyuZvqy7mN7OfiE
	 SAhuUy4YvVdUwDYRSfMWdZ7LJeGRf0sjDzYNYX7xWjWmw/sIxJ2gkWqRvPpI3wfxyf
	 q26ifXjKTe9KQrELiy4DMT7vJ5elgUA8cPdb99o2A/bFfaMWr691JrU+xBuRJMVtAI
	 23qd3NcPQFMd+iiQ/uYL0OxWzeRG5ML2I2xmVJwAbCLX4PeOaZhARGgHzlPF1xdsG8
	 SbJ75e+mvZfsQisLS7FonQnk+fOhet0c4Y5H2uI7GudNfhBx/5+1EYxXfmdNVDEMMS
	 r+ltD6d6rDqaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/5] media: hi846: Add 6MP and 8MP modes support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pengyu Luo" <mitltlatltl@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260712115012.91600-5-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
 <20260712115012.91600-5-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 12 Jul 2026 12:13:10 +0000
Message-Id: <20260712121311.23F771F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Unconditional link frequency validation fails probe on 2-lane hard=
ware for modes with dummy frequencies.
- [High] Dynamic link frequency calculation breaks backward compatibility w=
ith existing device trees.
- [Medium] The active crop rectangles for the new 6MP and 8MP modes exceed =
the sensor's native crop bounds.
- [Low] The patch author failed to address reviewer feedback requesting the=
 use of separated fields for PLL configuration.

Pre-existing issues:
- [High] The default active mode lacks a 4-lane register configuration, lea=
ding to missing MIPI setup and streaming failures on 4-lane hardware.
--

--- Patch [4]: [PATCH v5 4/5] media: hi846: Add 6MP and 8MP modes support -=
--
commit 3cb5bb77cc3eceb92db3158280dae51e0e69e655
Author: Pengyu Luo <mitltlatltl@gmail.com>

media: hi846: Add 6MP and 8MP modes support
   =20
Hi846 is an 8MP sensor, but the upstream driver has only supported 2MP
mode for years. This patch adds 6MP and 8MP modes to maximize sensor
utilization.

Note that these modes require 4-lane MIPI CSI-2, as the downstream
driver only exposes 2MP, 6MP, and 8MP configurations in 4-lane
operation on the target device. The register sequences are extracted
from the downstream Windows driver.

> diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
> index df7ea3ecf0d82..0fc27545eec8b 100644
> --- a/drivers/media/i2c/hi846.c
> +++ b/drivers/media/i2c/hi846.c
> @@ -1028,6 +1028,106 @@ static const struct hi846_reg mode_1632x1224_mipi=
_4lane[] =3D {
[ ... ]
> +static const struct hi846_reg mode_3264x1836_mipi_4lane[] =3D {
[ ... ]
> +	{HI846_REG_UNKNOWN_095A,		0x9240},
> +	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},

[Severity: Low]
Does this still use raw register values instead of separated fields?

The v5 changelog states: "Use separated fields instead of raw register valu=
es
for PLL cfg (Sakari)".=20

However, this newly added array defines the PLL configuration using a raw 1=
6-bit
payload (0x4124) rather than using field preparation macros (FIELD_PREP) or
separated fields.

Was this reviewer feedback missed?

> +	{HI846_REG_TG_ENABLE,			0x0100},
> +};
> +
[ ... ]
> +static const struct hi846_reg mode_3264x2448_mipi_4lane[] =3D {
[ ... ]
> +	{HI846_REG_UNKNOWN_095A,		0x9240},
> +	{HI846_REG_PLL_CFG_MIPI2_H,		0x4124},

[Severity: Low]
Does this still use raw register values instead of separated fields?

As mentioned above, the v5 changelog indicates this should use separated fi=
elds
rather than a raw 16-bit payload.

> +	{HI846_REG_TG_ENABLE,			0x0100},
> +};
> +
[ ... ]
> @@ -1136,7 +1236,59 @@ static const struct hi846_mode supported_modes[] =
=3D {
>  			.width =3D 1632 * 2,
>  			.height =3D 1224 * 2,
>  		},
> -	}

[Severity: High]
This isn't a bug introduced by this patch, but does the default active mode
lack a 4-lane register configuration, leading to missing MIPI setup?

During probe, the driver sets the default format in hi846->cur_mode to
&supported_modes[0] (640x480). This mode has an empty 4-lane MIPI configura=
tion.

If a userspace application running on 4-lane hardware starts streaming with=
out
explicitly setting a supported format via VIDIOC_S_FMT, hi846_start_streami=
ng()
will attempt to apply the empty 4-lane register list.=20

Will this silently leave the sensor's MIPI interface unconfigured, resultin=
g in
capture hangs or deadlocks?

> +	},
> +	{
> +		.width =3D 3264,
> +		.height =3D 1836,
> +		.mipi_clk_div_2lane =3D 1, /* dummy */

[Severity: High]
Does this dummy frequency break probe on 2-lane hardware?

During probe, hi846_check_link_freqs() iterates over all elements in
supported_modes, calculating their link frequencies and verifying they exist
in the device tree endpoint.

Since this dummy frequency is not present in the 2-lane device tree's
link-frequencies property, will the check unconditionally fail and abort dr=
iver
probe, breaking 2-lane hardware configurations?

> +		.mipi_clk_div_4lane =3D 2,

[Severity: High]
Does this dynamic link frequency calculation break backward compatibility w=
ith
existing device trees?

Prior to this series, the driver hardcoded acceptable link frequencies (80M=
Hz
and 200MHz), and existing device trees list these specific values in their
link-frequencies property.=20

Since patch 2 ("media: hi846: Fix link frequency handling") replaced these
hardcoded values with a dynamic calculation based on mclk and lane count,
calculating it here yields 187.5MHz and 375MHz when driven by the previously
standard 25MHz external clock.=20

Because hi846_check_link_freqs() requires the exact calculated frequencies =
to
exist in the device tree, will probe fail on existing platforms using the l=
egacy
mandated values, violating Device Tree backward compatibility rules?

> +		.fps =3D 30,
[ ... ]
> +		.crop =3D {
> +			.left =3D 0x46,
> +			.top =3D 0x172,
> +			.width =3D 3264,
> +			.height =3D 1836,
> +		},

[Severity: Medium]
Do these active crop rectangles exceed the sensor's native crop bounds?

The V4L2 selection API strictly requires that any active crop rectangle mus=
t be
fully contained within the native bounds (V4L2_SEL_TGT_CROP_BOUNDS), which =
are
hardcoded to 3264x2448 in hi846_get_selection().

However, this crop rectangle is defined with a width of 3264 and a left off=
set
of 0x46 (70), positioning the rightmost edge at X =3D 3334, which exceeds t=
he
3264 width limit.

Can this API violation cause v4l2-compliance test failures and confuse
userspace applications?

> +	},
> +	{
> +		.width =3D 3264,
> +		.height =3D 2448,
> +		.mipi_clk_div_2lane =3D 1, /* dummy */
> +		.mipi_clk_div_4lane =3D 2,
[ ... ]
> +		.crop =3D {
> +			.left =3D 0x46,
> +			.top =3D 0x40,
> +			.width =3D 3264,
> +			.height =3D 2448,
> +		},

[Severity: Medium]
Similarly, does this crop rectangle exceed the sensor's native bounds?

With a top offset of 0x40 and height of 2448, the bottom edge is at Y =3D 2=
512,
which exceeds the 2448 native height limit, in addition to exceeding the wi=
dth
limit as seen in the previous mode.

> +	},
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260712115012.9160=
0-1-mitltlatltl@gmail.com?part=3D4
