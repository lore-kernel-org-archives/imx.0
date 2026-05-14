Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF493AEF44
	for <imx@lists.linux.dev>; Thu, 14 May 2026 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756783; cv=none; b=iFu/5DVVPMrdp3EiB56Qg8h66bD3apl6T2PPiOiUX5pZ7H2kY/bNnoKT6YTFDNlUk7rZJUrR7Olw59NTtlT9iIn3bnJMEimUuk7hqA1Fm6DRJCed8PbbQUmhGytWLFqtAaNZd4xBKzRIqbwuE/A0XVkZUPz1qPwwDZkWeGl9Ook=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756783; c=relaxed/simple;
	bh=LkCCxaFUglRYlE0CYNn2yifDP0Uz7IrZjqML7/Q6OzY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Z0Sp/ESoPi6yhRh5c/kxySGqhTqoVMgiX3qGdSX9aFh8IL7Tu2NBLo0WAj02TKmEK3QFghJul7dg8BzGLSLgwm0chLuryC58WQDJq3Wxkmy2gV9NoU21u6DDPjTKNRg5kO0ynlvXQnv4rgLOaGvf6l++QshmVayp5754Uh++FTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Or3kV/+G; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Or3kV/+G"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83A10C2BCB8;
	Thu, 14 May 2026 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778756782;
	bh=LkCCxaFUglRYlE0CYNn2yifDP0Uz7IrZjqML7/Q6OzY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Or3kV/+GrDcWIYzb4MUaLzUXz9xrcmgwO+DMHD0CfVZad637Zt+e0wsC0PP/4ZWyz
	 CUpZQ8qO/z7VfGqVW+ChxwSXTgbuLePGqov1ruJCHNPzvdYZMbERpqGAG+rPuNWaWI
	 LHRVSf+ma90/TUFPagmiWuDFltU9ygT7U3LpQKeVStSMlM9z4/5t4XepjHFh1GS9LM
	 x3ua9rriz6B1pH2Bgroga+fXF40toeOqhcwNGT9zolrbnjYAZxggJ0kx4ICKrkk9Yu
	 GlYYJtDAlmwBbLR9k2yBVFuuU9kL/VvCdtQHppfIuK3x28yNty7AH0cmSDpZHWViFL
	 NZFJveuXzVnFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/1] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Li" <Frank.Li@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260513205949.105444-1-Frank.Li@nxp.com>
References: <20260513205949.105444-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 11:06:22 +0000
Message-Id: <20260514110622.83A10C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Uninitialized `.dt` fields default to 0 (`MIPI_CSI2_DT_FS`), causi=
ng `media_bus_fmt_to_csi2_dt()` to return a valid CSI-2 data type instead o=
f an error.
- [High] Incorrect bit width per pixel (bpp) value for `MEDIA_BUS_FMT_AHSV8=
888_1X32`.
- [Low] Exported helper functions use signed `int` for bus format codes ins=
tead of `u32`.
- [Low] Grammatical errors in constant naming and code comments.
--

commit e06117f0b6bd648be504f0b932d84a4e08205433
Author: Frank Li <Frank.Li@nxp.com>

media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()

This commit adds helper functions media_bus_fmt_to_csi2_bpp() and
media_bus_fmt_to_csi2_dt() to map media bus formats to MIPI CSI-2 data
types and bits-per-pixel.

> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index bceafc4e92c81..438aeb4c8435d 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c

[ ... ]

> @@ -808,3 +809,180 @@ struct clk *__devm_v4l2_sensor_clk_get(struct devic=
e *dev, const char *id,
>  	return clk_hw->clk;
>  }
>  EXPORT_SYMBOL_GPL(__devm_v4l2_sensor_clk_get);
> +
> +/**
> + * struct media_bus_fmt_info - information about a media bus format
> + * @code: media bus format identifier (MEDIA_BUS_FMT_*)
> + * @dt: data type define in MIPI spec (MIPI_CSI2_DT *)
> + * @bpp: bit width per pixel, which is suffix from MEDIA_BUS_FMT_*, no p=
ad. no
> + *	 compressed data.
> + */
> +struct media_bus_fmt_info {
> +	u32 code;
> +	u8 dt;
> +	u8 bpp;
> +};
> +
> +static const struct media_bus_fmt_info media_bus_fmt_info[] =3D {
> +	{ .code =3D MEDIA_BUS_FMT_RGB444_1X12, .bpp =3D 12 },

Since dt is not explicitly initialized here, it will default to 0. In the M=
IPI
CSI-2 specification, 0x00 is a valid Data Type for Frame Start.

When media_bus_fmt_to_csi2_dt() looks up one of these unmapped formats, will
it return 0x00 instead of the expected MIPI_CSI2_DT_INVALIDATE?

If so, does this risk drivers misprogramming the CSI-2 hardware to use
Frame Start as a payload data type instead of failing gracefully?

[ ... ]

> +	{ .code =3D MEDIA_BUS_FMT_JPEG_1X8, .bpp =3D 8 },
> +
> +	{ .code =3D MEDIA_BUS_FMT_S5C_UYVY_JPEG_1X8, .bpp =3D 8 },
> +
> +	{ .code =3D MEDIA_BUS_FMT_AHSV8888_1X32, .bpp =3D 8 },

Is this bpp value correct? AHSV8888 consists of four 8-bit channels, and its
1X32 suffix denotes a 32-bit bus width.

Should this be 32 instead of 8 to prevent miscalculating link frequencies
or allocating undersized DMA buffers?

> +
> +	{ .code =3D MEDIA_BUS_FMT_META_8, .bpp =3D 8 },

[ ... ]

> +static const struct media_bus_fmt_info *media_bus_fmt_info_get(u32 bus_f=
mt)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(media_bus_fmt_info); i++) {
> +		if (media_bus_fmt_info[i].code =3D=3D bus_fmt)
> +			return &media_bus_fmt_info[i];
> +	}
> +
> +	return NULL;
> +}
> +
> +u32 media_bus_fmt_to_csi2_dt(int bus_fmt)

Is it intentional to use a signed int for bus_fmt here?

The V4L2 subsystem typically defines and stores media bus format codes as
unsigned 32-bit integers (u32). The internal media_bus_fmt_info_get() helper
correctly uses u32.

> +{
> +	const struct media_bus_fmt_info *info =3D media_bus_fmt_info_get(bus_fm=
t);
> +
> +	return info ? info->dt : MIPI_CSI2_DT_INVALIDATE;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_dt);
> +
> +u32 media_bus_fmt_to_csi2_bpp(int bus_fmt)

Similar to the function above, could this also take a u32 for bus_fmt
to match the subsystem standard?

> +{
> +	const struct media_bus_fmt_info *info =3D media_bus_fmt_info_get(bus_fm=
t);
> +
> +	return info ? info->bpp : 0;
> +}
> +EXPORT_SYMBOL_GPL(media_bus_fmt_to_csi2_bpp);
> diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> index 40fc0264250d7..bd22d2ae57e81 100644
> --- a/include/media/mipi-csi2.h
> +++ b/include/media/mipi-csi2.h
> @@ -44,4 +44,30 @@
>  #define MIPI_CSI2_DT_RAW20		0x2f
>  #define MIPI_CSI2_DT_USER_DEFINED(n)	(0x30 + (n))	/* 0..7 */
> =20
> +/* Use one undefined value in spec */
> +#define MIPI_CSI2_DT_INVALIDATE		0xff

This isn't a bug, but invalidate is a verb. To follow typical kernel state
naming conventions, this should probably be named MIPI_CSI2_DT_INVALID or
MIPI_CSI2_DT_UNKNOWN.

> +
> +/**
> + * media_bus_fmt_to_csi2_dt - Get MIPI CSI2 data type from media bus for=
mat
> + *
> + * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
> + *
> + * return MIPI CSI2 data type MIPI_CSI2_DT_*, MIPI_CSI2_DT_INVALIDATE me=
ans
> + * can't get data type from bus_fmt.
> + */
> +u32 media_bus_fmt_to_csi2_dt(int bus_fmt);
> +
> +/**
> + * media_bus_fmt_to_csi2_bpp - Get media bus format's bit width per pixel
> + *
> + * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
> + *
> + * returns bit width per pixel, 0 is invalidate width, which can't get f=
rom

This isn't a bug, but there's a grammatical error here. It says invalidate
width instead of invalid width.

> + * bus_fmt.
> + *
> + * Notes: this bpp is suffix from MEDIA_BUS_FMT_*, no pad, not for compr=
essed
> + * data.
> + */
> +u32 media_bus_fmt_to_csi2_bpp(int bus_fmt);
> +
>  #endif /* _MEDIA_MIPI_CSI2_H */

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513205949.1054=
44-1-Frank.Li@nxp.com?part=3D1
