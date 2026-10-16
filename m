Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FDB444725A;
	Fri, 16 Oct 2026 20:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792182082; cv=none; b=sMFpg2YnT8u6uTLBTPU58psbJwQzUMZaHYauj+l7WM8wU75k/DgYgMecLsgXIQb6+Btc0lcExFM7YXVuPhHp1FFVrOW2IpjTsVVLXHObShV5tRFmTE6SHF4LT3U6i/Sct640s0Y7dBkKMvjn5NHFiRbJvCnjJXMVD0HohOv4PwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792182082; c=relaxed/simple;
	bh=XaCnz6fQ9p84ULQ1TfD9GecokZrdf5vkl40KfIWQYTY=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=jrkc946i5KmKQfn1TCnXImgApXgeGbE5quTP2ktG/MvNKs9Kp9MgKWo5/8dpbhv5fHpG7l0bswm+Ci3a6W/9FXg0axO5nuEbLuL/vBjSrJ2D51GA24FxaYFcmn2ehE9XAHoTWqYiHdhFVGEpngmFQUOT3SQ6MqrgVttugJ7eWOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jJKFEmOV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jJKFEmOV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2693C1F000C5;
	Fri, 16 Oct 2026 20:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792182077;
	bh=3I7EpaKT4qrAZGcQkYQmerKp262D18wn1f7f8r/v6PU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jJKFEmOV/pvQpUdfmXuzXLI1l6bZSlwt9sEc/a9Pwk9yGEiUTjbBDL9mgxARv8mGF
	 XwfzMfzL8yDhseCWCGznRM1lkR+meAcIVjgBpgyUVDhvhlOl63kJpYZYQBiBw82L/A
	 iQvhpHy/wZXf4i0CYoVlOhmcasAtsXhr+Ns+AQK8Onh7hgvOVvflTOHQl6BsTy2bjm
	 b8114RakKQtW9c29FFhCKIOqQoOCe5klXzDhRymBU/ZhI1Phc4OfJFn/IwWlLlugxW
	 430bY5AQ90JmtJbWldJnMJiShZbGd4LxSvGjo9lQ7jWyniNtY2nfbkn+/4OLufUOcn
	 JFAPDafMNmRGw==
Message-ID: <sashiko-outbox-174911@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/14] ARM: dts: imx6dl-b155v2: add touchscreen size
 properties
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261016-arm_dts_cleanup2-v1-3-3a0cab9fd784@nxp.com>
References: <20261016-arm_dts_cleanup2-v1-0-3a0cab9fd784@nxp.com>
 <20261016-arm_dts_cleanup2-v1-3-3a0cab9fd784@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 20:21:16 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ARM: dts: imx6dl-b155v2: panel size in touchscreen-size-x/y breaks=
 touch
--

commit a32e64e0ae8dfc5c902cc7abdcc408b2bb7583c9
Author: Frank Li <Frank.Li@nxp.com>

ARM: dts: imx6dl-b155v2: add touchscreen size properties

This commit adds touchscreen-size-x and touchscreen-size-y properties to the
eeti,exc80h84 touchscreen node in imx6dl-b155v2.dts to satisfy the
eeti,exc3000 devicetree schema requirements.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts b/arch/arm/boot/=
dts/nxp/imx/imx6dl-b155v2.dts
> index 7edc788bcb8f3..54db44613df66 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-b155v2.dts
> @@ -25,6 +25,8 @@ touchscreen@2a {
>  		pinctrl-0 =3D <&pinctrl_q7_gpio0>;
>  		interrupt-parent =3D <&gpio5>;
>  		interrupts =3D <2 IRQ_TYPE_LEVEL_LOW>;
> +		touchscreen-size-x =3D <1366>;
> +		touchscreen-size-y =3D <768>;
>  		touchscreen-inverted-x;
>  		touchscreen-inverted-y;
>  		reset-gpios =3D <&tca6424a 21 GPIO_ACTIVE_HIGH>;

[Severity: High]
Does setting touchscreen-size-x and touchscreen-size-y to the display panel=
's
1366x768 pixel resolution introduce a regression in touch coordinate report=
ing
for this controller?

Per Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml,
touchscreen-size-x and touchscreen-size-y describe the coordinate space of =
the
touchscreen controller itself (maximum coordinate reported + 1), rather than
the LCD panel dimensions.

In drivers/input/touchscreen/exc3000.c, exc3000_info defines the native 14-=
bit
coordinate maximum for the EXC80H84 controller:

	[EETI_EXC80H84] =3D {
		.name =3D "EETI EXC80H84 Touch Screen",
		.max_xy =3D SZ_16K - 1,
	},

During probe, exc3000_probe() initializes the axes to [0, 16383], and then
calls touchscreen_parse_properties():

	max_xy =3D data->info->max_xy;
	input_set_abs_params(input, ABS_MT_POSITION_X, 0, max_xy, 0, 0);
	input_set_abs_params(input, ABS_MT_POSITION_Y, 0, max_xy, 0, 0);

	touchscreen_parse_properties(input, true, &data->prop);

With touchscreen-size-x =3D <1366> and touchscreen-size-y =3D <768>,
touchscreen_parse_properties() overwrites the axis maximums and
data->prop.max_x / max_y to 1365 and 767.

However, the exc3000 driver does not program these dimensions into the
hardware or scale the raw coordinates in software. When a touch interrupt
occurs, exc3000_interrupt() -> exc3000_handle_mt_event() ->
exc3000_report_slots() passes unscaled 14-bit coordinates (0..16383) direct=
ly
to touchscreen_report_pos():

	touchscreen_report_pos(input, prop,
			       get_unaligned_le16(buf + 2),
			       get_unaligned_le16(buf + 4),
			       true);

Because touchscreen-inverted-x and touchscreen-inverted-y are also set on
touchscreen@2a, touchscreen_report_pos() -> touchscreen_apply_prop_to_x_y()
inverts the raw coordinates against the overridden maximums:

	if (prop->invert_x)
		*x =3D prop->max_x - *x;

	if (prop->invert_y)
		*y =3D prop->max_y - *y;

Whenever the controller reports raw X > 1365 or raw Y > 767, this unsigned
subtraction wraps around and reports negative coordinates to input_report_a=
bs(),
while also advertising the wrong axis range to userspace.

Should touchscreen-size-x and touchscreen-size-y be set to <16384> to match
the EETI EXC80H84 controller's 16384x16384 coordinate space?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261016-arm_dts_cl=
eanup2-v1-0-3a0cab9fd784@nxp.com?part=3D3
