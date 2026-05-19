Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53BB2D5932;
	Tue, 19 May 2026 02:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779158544; cv=none; b=Mbmda8SGbMA+u1Io/Rk0ngMHLYV4cXua+uSgogVZXRyt4ERapqNSBlkrJaqc1mQ2HfH5BA0R2QrS+kVWsFnHYxKeL8YHc3EU8GIoaVargmJfI+f12lLY6svNJLnuvU6z8BPzpH2XdFEUYJIxYcu7QTBukrLMvb6/lDU7mADcxys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779158544; c=relaxed/simple;
	bh=1K3I+qAdALng4cy8421G7GIIKDWaReyylNTdq/gKKqU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZxEXL9VwMzCkqLPsf//Q4JS6eZJr1OljwWy/scCq2yFB1vMgXrKTotvrnTAzLl7Ig5KrYKUIWrqUqax9VrvqKPeCYuMcN1OdJszS1O8YNK9myHaHdzgFgBwxyS3tkBNu3dLmO4Whbk7AwtkUOkh/RBfoFN0XWQkOMNrejwYzYUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pOU8AdLs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pOU8AdLs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45A4C2BCB7;
	Tue, 19 May 2026 02:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779158544;
	bh=1K3I+qAdALng4cy8421G7GIIKDWaReyylNTdq/gKKqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=pOU8AdLsdqIQEriXfpvwbSmgMggMnfSUkRXGmvk0+MTXep7DmEmY3kbNy6Rk3Bf88
	 gUXF4ZvzEg+T1iz8Oq0tBpLahbNxzcvIDZFNdsuwuL+0rwO/S3+hKi0h999tqjfpSe
	 tv95LzDFZUIAZzAEhG76A4oc3/qDDoDNoGLmf/v+KeTTxXGKAB7IG4H9P/8NTEVIg2
	 btaYUR0yB0fFu605ocNIeBVBhIYjLii9jTt/zV7/SPRbnVG4AcwUzzFGSmq/Ye5UNU
	 agH9C0PUotOpvsfCW9QSxFK1aFcLf6WKdop7sug2b047V2K+FUgkhdQywaPBzpAIG2
	 JztfI29TDJvRA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/6] media: synopsys: Fix IPI using hardcoded
 datatype
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org
In-Reply-To: <20260519-csi2_imx95-v4-1-84ea4bb78a88@oss.nxp.com>
References: <20260519-csi2_imx95-v4-1-84ea4bb78a88@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 02:42:23 +0000
Message-Id: <20260519024223.B45A4C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] If userspace starts streaming without explicitly calling `VIDIOC_S=
UBDEV_S_FMT`, the driver will use an incorrect hardware datatype due to a m=
ismatch between the probe-time pointer and the V4L2 default state.
- [High] Caching the active format in a device-global pointer (`csi2->forma=
ts`) during `set_fmt` circumvents the V4L2 subdev state API, causing state =
corruption and hardware misconfiguration when multiple streams are used.
- [Medium] The patch confusingly repurposes an array pointer (`csi2->format=
s`) into a single active state pointer, while retaining its paired array-bo=
unds variable.
--

commit ac0f1e2d8d5a5aefaf04a50efcbfbc4c7693090d
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: synopsys: Fix IPI using hardcoded datatype

This commit updates the set_fmt callback to reflect the negotiated active
format by storing it in csi2->formats. This ensures the IPI configuration
matches the runtime datatype instead of the probe-time default.

> diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/m=
edia/platform/synopsys/dw-mipi-csi2rx.c
> index 02eb4a6cafade..0b80e84983f9e 100644
> --- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> +++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
> @@ -311,7 +311,7 @@ dw_mipi_csi2rx_find_format(struct dw_mipi_csi2rx_devi=
ce *csi2, u32 mbus_code)
>  	WARN_ON(csi2->formats_num =3D=3D 0);
> =20
>  	for (unsigned int i =3D 0; i < csi2->formats_num; i++) {
> -		const struct dw_mipi_csi2rx_format *format =3D &csi2->formats[i];
> +		const struct dw_mipi_csi2rx_format *format =3D &formats[i];

Does this repurpose the csi2->formats array pointer to store a single active
format, while leaving csi2->formats_num as the array length?

This decouples the pointer from its length variable. Iterating over a global
formats array instead of the instance fields might also bypass device
encapsulation and create a semantic mismatch.

[ ... ]

> @@ -470,6 +470,17 @@ static int dw_mipi_csi2rx_set_fmt(struct v4l2_subdev=
 *sd,
> =20
>  	*src =3D *sink;
> =20
> +	/* Store the CSIS format descriptor for active formats. */
> +	if (format->which =3D=3D V4L2_SUBDEV_FORMAT_ACTIVE) {
> +		csi2->formats =3D fmt ? :
> +			dw_mipi_csi2rx_find_format(csi2, default_format.code);

Does caching the active format in a device-global pointer (csi2->formats)
circumvent the V4L2 subdev state API?

If multiple streams are configured via V4L2_SUBDEV_FL_STREAMS, it appears t=
his
single pointer would be repeatedly overwritten, storing only the format of =
the
last configured stream.

Could this create a regression when the streams are enabled? The hardware w=
ould
be programmed with this last format, which could cause issues for any strea=
ms
that negotiated a different format. Would it be better to retrieve the acti=
ve
format dynamically from sd->active_state via v4l2_subdev_state_get_format()
during stream enablement?

Additionally, does this introduce a regression if userspace starts streaming
without explicitly calling VIDIOC_SUBDEV_S_FMT?

During probe, csi2->formats is initialized to the base of the formats array,
pointing to the first element (MEDIA_BUS_FMT_YUYV8_1X16). The V4L2 subdev
active state is initialized to default_format (MEDIA_BUS_FMT_SRGGB10_1X10).

If set_fmt(ACTIVE) is never called, csi2->formats is never updated. The
hardware would then be configured for YUV422_8B instead of the expected RAW=
10,
causing a mismatch between the active V4L2 state and the actual hardware
configuration.

> +		if (!csi2->formats) {
> +			dev_err(csi2->dev, "Failed to find valid format\n");
> +			return -EINVAL;
> +		}
> +	}
> +
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519-csi2_imx95=
-v4-0-84ea4bb78a88@oss.nxp.com?part=3D1
