Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718C22A817
	for <imx@lists.linux.dev>; Thu, 21 May 2026 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779357993; cv=none; b=ZDKHLWL3sRvrykIIyiG3/nMeCujGl3CqWUX4C5o7TbIgmtdQK+8pePhV0LE4W6WMlq5fWKPSDH5LcUPYm0TW2rHIM1tGiQll1hl505jqiYIdUrICvFFbuH1LNayx0WMVcFf3Yh/shN2NAxV5xUw8T44L1EVjWeYadNz6biMSKTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779357993; c=relaxed/simple;
	bh=n6MUo44OKLnYGukIgrDbiypKIfEs28ZyYkkJEVI2fKE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MKrFHNNRvHkavsfa13zFNY/3VkzOTjXBfCoulhXNzHpGS7vyRHOIogTc9RPuTC7exkey9tVs0XL9pwqaY+1LJRUCuYj473DrFPiOHgLrEHu4cJphRqcXTyVp8/pqYP7hb9p8EBfd/Nd7or/lHkjyn9B0mfY6QJQd9vJwfqdy9K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S4PYI2zr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S4PYI2zr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF5E1F000E9;
	Thu, 21 May 2026 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779357991;
	bh=WiDs6gMI9bVOMAg/t4aiiQEdblHUBeqN0psyKLz8mF8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S4PYI2zrk7cIUa9z8sVRkh9qM/ZPBkv6FGt3Jh38VZrdMawoyJRWlHgHjo8EOndlt
	 92V/c++lG3Pyaayp/rzXein+2ZdX1h+QUi7ruVyx2H9B6XY2VW+KAexyyz+FMxdijH
	 PNVli2b1d1kHEZKD2pkUDLtS2TLrIB2+pD7Bmr6y8DFcI6wOESsnSb3PpCkRilMTmP
	 5y+4yi7CWbMNTQhBDzO8DK20Y//lOdeU3K4UDW5TaQFPmC7rjjOC0ZOFTwXt9LeVCV
	 h779EV5KK+rQbxayk6hbfBu+UwBCNVd30h6JUspRHpGTxJza9xFMUVc8CGLqMtVv77
	 2FzvOhMjdO3pA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 2/2] media: nxp: imx8-isi: Add virtual channel
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260521-isi_vc-v5-2-a38eb4fcd58e@oss.nxp.com>
References: <20260521-isi_vc-v5-2-a38eb4fcd58e@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 21 May 2026 10:06:31 +0000
Message-Id: <20260521100631.7CF5E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Pipeline enablement unconditionally fails if the upstream subdevic=
e does not implement the `get_frame_desc` operation.
- [Medium] The driver unconditionally accesses CSI-2 specific fields in the=
 frame descriptor without validating the frame descriptor type.
--

commit 4d8a62dc345af085b3b0a217c07143648e85fd35
Author: Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: media: nxp: imx8-isi: Add virtual channel support

This commit introduces virtual channel (VC) support to the i.MX8 ISI driver.
It retrieves the VC from the remote upstream subdevice's frame descriptor a=
nd
applies the required register configurations based on the platform's maximum
supported VCs.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c b/driver=
s/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> index a41c51dd9ce0f..03e0115b5b5a8 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-pipe.c

[ ... ]

> +static int mxc_isi_get_vc(struct mxc_isi_pipe *pipe)
> +{
> +	struct mxc_isi_crossbar *xbar =3D &pipe->isi->crossbar;
> +	struct device *dev =3D pipe->isi->dev;
> +	struct v4l2_mbus_frame_desc fd =3D { };
> +	unsigned int source_pad =3D xbar->num_sinks + pipe->id;
> +	unsigned int max_vc;
> +	unsigned int i;
> +	int ret;
> +
> +	ret =3D v4l2_subdev_call(&xbar->sd, pad, get_frame_desc,
> +			       source_pad, &fd);
> +	if (ret < 0) {
> +		dev_err(dev, "Failed to get source frame desc from pad %u\n",
> +			source_pad);
> +		return ret;
> +	}

[Severity: High]
If the remote upstream subdevice does not implement the optional
get_frame_desc operation, v4l2_subdev_call() will return -ENOIOCTLCMD.

Does this mean pipeline enablement will now unconditionally fail for any
sensor lacking get_frame_desc support?

Prior to this patch, the VC was implicitly hardcoded to 0, which worked
seamlessly for parallel and legacy CSI-2 sensors. Would it be better to
explicitly check for -ENOIOCTLCMD (and potentially -EOPNOTSUPP) here and
gracefully fallback to a default VC of 0 to prevent this regression?

> +
> +	/* Find stream 0 in the frame descriptor */
> +	for (i =3D 0; i < fd.num_entries; i++) {
> +		if (fd.entry[i].stream =3D=3D 0)
> +			break;
> +	}
> +
> +	if (i =3D=3D fd.num_entries) {
> +		dev_err(dev, "Failed to find stream from source frame desc\n");
> +		return -EPIPE;
> +	}
> +
> +	max_vc =3D pipe->isi->pdata->num_vc ? : 1;
> +
> +	/* Check virtual channel range */
> +	if (fd.entry[i].bus.csi2.vc >=3D max_vc) {

[Severity: Medium]
This code directly accesses fd.entry[i].bus.csi2.vc, but is it guaranteed
that the frame descriptor type is V4L2_MBUS_FRAME_DESC_TYPE_CSI2?

Since the i.MX8 ISI also supports parallel cameras, fd.type could be
V4L2_MBUS_FRAME_DESC_TYPE_PARALLEL, making the access to bus.csi2
semantically invalid.=20

Should there be a check to validate fd.type before accessing the CSI-2
specific union members to avoid potential undefined behavior?

> +		dev_err(dev, "Virtual channel %u exceeds maximum %u\n",
> +			fd.entry[i].bus.csi2.vc, max_vc - 1);
> +		return -EPIPE;
> +	}
> +
> +	return fd.entry[i].bus.csi2.vc;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260521-isi_vc-v5-=
0-a38eb4fcd58e@oss.nxp.com?part=3D2
