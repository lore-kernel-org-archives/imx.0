Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6279E488214;
	Tue, 15 Sep 2026 10:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469956; cv=none; b=ADYr5qnUdSkyIS9naknpakdR8hnN04ZcNs/7tINx181MUI4thPMrJkgKu0ss/dC5Xfo8rjDn88IvrQ5/PW8h7cjZPZ+9Ps6fzxOz4cvUmRLVgA0Dy0dvOsWSvLR2kTaE+D1G0xQQMGavz7LRLvjiApzpDLi2lh17LsLy8Q4ynPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469956; c=relaxed/simple;
	bh=jkHd/+kXnloKIZbvaKAZQT8K+rqModjcKtRFsI/VHcc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EGTxFZvcBVVFg3CprcxF0YlmUJzyp/e1cutKIMAEAyb2ysMpZAq/tYvD9Xg3F0o21D8NbypRxN0166jXY0zuG8DfWPHm46Ucgj64lDSp7QJBLKep8sVjKBKjRbacvBtN8RlTKi2NXhJKQir3fQR52JQWw5AMZycojQLuh53Boc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZ5Dj0xn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZ5Dj0xn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F2EA1F000FF;
	Tue, 15 Sep 2026 10:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789469955;
	bh=sxI8bFXV+UHdLagTpnyMcDcyyC1hidkJMSQa/EzkTtM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KZ5Dj0xnwDsG9kMXC9tyvvsr16kadAJprAMS4xVKi+SRNQZRukcmkzgP9BjELmoxp
	 fAaTyzVCf+kLCAvR6EgmCpazuUCuzhDHsz8fV78NnoCdZhSa5496Esu9fZjosNotNk
	 LHhHyT37ej9yCvDuux4F0CvMrHuyffkPayh2xP2eCeRTHKfHi9zq1AowDTZJJShZh2
	 3iPE7jE3hwfVIxC592Zry3bVC2R7wqLsfZtASxRuIOA7AEp4WP/Xd0SuSY27RYdnU0
	 BbJrEAakBoSnHctw3iLK9JPSPMuCMvc3M5k9YDwENPEffw+QMDU7ru9cUj2gRbuenz
	 1jOrN4xmtlDHw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] media: imx8-isi: Enable ISI RAW10/12/14 output
 LSB alignment
Reply-To: sashiko-reviews@lists.linux.dev
To: "Guoniu Zhou" <guoniu.zhou@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, media-ci@linuxtv.org, conor+dt@kernel.org
In-Reply-To: <20260915-isi_imx952-v3-5-3d8ff1363dda@oss.nxp.com>
References: <20260915-isi_imx952-v3-0-3d8ff1363dda@oss.nxp.com>
 <20260915-isi_imx952-v3-5-3d8ff1363dda@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 10:59:14 +0000
Message-Id: <20260915105914.9F2EA1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] media: imx8-isi: Unconditional setting of RAW alignment bits may=
 corrupt non-RAW streams
--

commit 24f35e10010e44cf9f1ebb2452592fd2a6c1b167
Author: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

media: imx8-isi: Enable ISI RAW10/12/14 output LSB alignment

This commit updates the i.MX8 ISI driver to use the hardware LSB alignment
capability introduced in i.MX952 for RAW10/12/14 formats. It drops the older
RAW16 workaround for these newer platforms and updates the alignment bits
during channel setup.

> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c b/drivers/=
media/platform/nxp/imx8-isi/imx8-isi-hw.c
> index 6aa760ce36053..0832b4a110ed2 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-hw.c

[ ... ]

> @@ -357,6 +368,20 @@ static void mxc_isi_channel_set_control(struct mxc_i=
si_pipe *pipe,
>  			val |=3D CHNL_CTRL_VC_ID_1(vc >> 2);
>  	}
> =20
> +	if (isi_raw_out_lsb(pdata)) {
> +		/*
> +		 * Enable RAW10/12/14 output LSB alignment to match the
> +		 * V4L2 requirement that RAW formats are LSB-aligned.
> +		 */
> +		val |=3D CHNL_CTRL_RAW_OUT_LSB_ALIGN;
> +
> +		/*
> +		 * Align the data selection from pixel link to MSB to
> +		 * avoid data shift since the data from PL is MSB.
> +		 */
> +		val |=3D CHNL_CTRL_RAW_IN_MSB_ALIGN;
> +	}
> +

[Severity: Medium]
When starting a non-RAW stream (such as YUV or RGB) on an i.MX952 platform,
could setting these alignment bits unconditionally cause data shift or
corruption for the non-RAW video streams?

It looks like mxc_isi_channel_set_control() applies these bits without
checking if the currently active format is actually a RAW format. Would it
make sense to verify the active stream format before enabling these bits?

>  	mxc_isi_write(pipe, CHNL_CTRL, val);
> =20
>  	mutex_unlock(&pipe->lock);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-isi_imx952=
-v3-0-3d8ff1363dda@oss.nxp.com?part=3D5
