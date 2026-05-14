Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A309A31F999
	for <imx@lists.linux.dev>; Thu, 14 May 2026 21:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778793007; cv=none; b=QPHdiIVqEVJQLn7qli7S00EhRUwj8rTdeNSYFQOvxfQkrD3E2EPFKS6garpsIBO3WPq3X+9ScO7BE6XbwP6WQs2PLhjapNKuNHhFDWGA0ZoK47e3iLwUfmURRtsHqag++416YhkKVFpR2hhqbp6qlPJIFQILfKtDBKLnCXFqVIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778793007; c=relaxed/simple;
	bh=YNty6WllGMDBDmB/CvjQ9Q+/kUfzBD/Wi1XNuJ54Mfo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RkseZ4vQkVF6hB1+ksMptZ0Idn4vgtfdXJw1tMNdWkBcunFNo9KYJgia8nIkjSyDQPdDJMVod7CtQyiuabpKKZjczFvX1AdIcvfmKjnoUWOyNdBNZQ1/PRZeD4x3m785LVgT53a8KpaesEMoFHgaN4b/I7YrHstyWkA8B0dEAPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UYLDoXYp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UYLDoXYp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 570A0C2BCB3;
	Thu, 14 May 2026 21:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778793007;
	bh=YNty6WllGMDBDmB/CvjQ9Q+/kUfzBD/Wi1XNuJ54Mfo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=UYLDoXYpTm5n/Dur3mWyHHL9SeOqZq7w9nspFnjfqCT/0QqbOOwmL6ku0EhUMJgPq
	 5FzOTr5ybPQ4AFHgQXJAnWoCJcAXUEUDMbBVhbWO40NbQDWBlnYTzJfiwDdt+lG9/e
	 MFvMVDZq3dGtEL/zZAVZ/czBI6aiNmRfdFq4op9sVy6PKhLvmSf8s7bKZRrgBu30SD
	 FzhT9ln9/APHT6IxgWn6jVaOeld543L7SNKmbE7v5eCXYa1SwvG1adhWFFo5IKqHiM
	 LqOyJzPMJKql+zyjaasPr0i6HSljzx+9aGtdS69qZSVZitxpISDm5rvAImjywheEFA
	 99hybLVIvx8bA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/1] media: v4l2-common: Add helper function
 media_bus_fmt_to_csi2_(bpp|dt)()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Li" <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260514183357.3088564-1-Frank.Li@nxp.com>
References: <20260514183357.3088564-1-Frank.Li@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 21:10:06 +0000
Message-Id: <20260514211007.570A0C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media_bus_fmt_to_csi2_dt() incorrectly returns 0 (MIPI_CSI2_DT_FS)=
 instead of MIPI_CSI2_DT_INVALID for formats without a mapped CSI-2 data ty=
pe.
- [Low] Mismatch between kernel-doc comment and macro definition for the in=
valid data type indicator.
--

commit dd2f0971f75dadcf691d8ed964c49386a1fc2170
Author: Frank Li <Frank.Li@nxp.com>

media: v4l2-common: Add helper function media_bus_fmt_to_csi2_(bpp|dt)()

This commit adds helper functions media_bus_fmt_to_csi2_bpp() and
media_bus_fmt_to_csi2_dt() to convert media bus formats to MIPI CSI-2 bit
depths and data types. This aims to reduce duplicate static mapping arrays
across different CSI-2 drivers.

> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index bceafc4e92c81..6c8afb96e60fe 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c

[ ... ]

> +static const struct media_bus_fmt_info media_bus_fmt_info[] =3D {
> +	{ .code =3D MEDIA_BUS_FMT_RGB444_1X12, .bpp =3D 12 },
> +	{ .code =3D MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE, .bpp =3D 16 },

[ ... ]

> +u32 media_bus_fmt_to_csi2_dt(u32 bus_fmt)
> +{
> +	const struct media_bus_fmt_info *info =3D media_bus_fmt_info_get(bus_fm=
t);
> +
> +	if (!info)
> +		return MIPI_CSI2_DT_INVALID;
> +
> +	/* Check bpp because 0 (MIPI_CSI2_DT_FS) is a valid data type code */
> +	return info->bpp ? info->dt : MIPI_CSI2_DT_INVALID;
> +}

Since uninitialized fields in a struct array are zero-initialized in C, any
entry in media_bus_fmt_info without an explicit .dt value will have .dt =3D=
 0.

Because every entry in the array defines a non-zero .bpp, info->bpp is alwa=
ys
true for matched formats. Doesn't this mean the function will return 0 for
unmapped formats rather than MIPI_CSI2_DT_INVALID?

If 0 is returned, this maps to MIPI_CSI2_DT_FS (Frame Start). Could this
cause drivers to silently program the camera hardware with a short-packet
Frame Start data type for pixel data instead of rejecting the unsupported
format?

> diff --git a/include/media/mipi-csi2.h b/include/media/mipi-csi2.h
> index 40fc0264250d7..bb5054f0cf310 100644
> --- a/include/media/mipi-csi2.h
> +++ b/include/media/mipi-csi2.h

[ ... ]

> +/* Use one undefined value in spec */
> +#define MIPI_CSI2_DT_INVALID		0xff
> +
> +/**
> + * media_bus_fmt_to_csi2_dt - Get MIPI CSI2 data type from media bus for=
mat
> + *
> + * @bus_fmt: media bus format identifier (MEDIA_BUS_FMT_*)
> + *
> + * Return: MIPI CSI2 data type MIPI_CSI2_DT_*, MIPI_CSI2_DT_INVALIDATE m=
eans
> + * can't get data type from bus_fmt.
> + */

This isn't a bug, but there is a typo in the documentation. The macro defin=
ed
above is MIPI_CSI2_DT_INVALID, but the kernel-doc references
MIPI_CSI2_DT_INVALIDATE.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514183357.3088=
564-1-Frank.Li@nxp.com?part=3D1
