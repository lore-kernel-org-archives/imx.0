Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F481475331;
	Fri, 25 Sep 2026 08:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790326701; cv=none; b=hwNmCvsJd0NbGOilZibADChCDIofhXYfQwZ33uOaxuGbtipdU2KcgcNTcnn0as7SEbh9dT3BLIXukpdsh59q0R2YqxjqDIru1k08JCP4XKQnW1UGct3CV3Szm8k+YWY9seZW7G6MaVIZQNwzpHrPZ6IWH9aqxpFaO7IqaWY9X24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790326701; c=relaxed/simple;
	bh=JiBiCas9IslIGBAXqeVFhXKfTrm4UlYca+3nmeABpwQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DSxCEkp4VDK/qDEfrTYGhj/X+52GAYN5Rg3fFxrgUvbX6N6MnXmLorCMu+vnpTCeiMiDiNodg+cgxIcNO/GG+RBXLRLrXibMTHLaSoiXXgrbWu7UzrIVIMPDuxhlYRTMdWFNr4WEKCyhWTb2PJUVmr2iOITNXQ6hQP8xJ1v/yfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BoiiaSZ2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BoiiaSZ2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0CF41F000FF;
	Fri, 25 Sep 2026 08:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790326700;
	bh=qLQucxAnUBpudSsnGk5AjME4Fcal+x+3tsaYySQJDys=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BoiiaSZ2sTnpt6XGj/WZ8SOilNvSK/2czepxTaa1sCwElkdJ8ahHa+p7uSRPB5Wah
	 cwDN4jo0hfDlFBHkwPdQMlV4UfvhrPUaF+KRku3uazNv2Fc6VI0rHKhkSpNhqCMlGL
	 xVw+2kq8UoJvLFmLYylV1n3n96MshtMy/KdznMZU4dvXbZzkmmnq9qmZh6rdlegJQC
	 +LArzQqQX1+foZOZWQ7NznQ3Olnachtjo/YCr54ueWRMtkRYIbdMU+Bbt2p4Rss2Nl
	 siVDYvbx/OgVd3kJd8q/IopJMIqfhB8yPnhahQ6vxAcVYoyVzepAVU3BxvxbBiRP5j
	 cQhsQkm43UdAw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] media: verisilicon: Remove useless internal
 fields
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: media-ci@linuxtv.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260925085152.41852-4-benjamin.gaignard@collabora.com>
References: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
 <20260925085152.41852-4-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 08:58:19 +0000
Message-Id: <20260925085819.A0CF41F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] doc: orphaned kernel-doc parameter for removed struct member ctrl_b=
ase
--

commit 5392510f52daeba396b90c138e1c5e648a91c573
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>

media: verisilicon: Remove useless internal fields

This commit simplifies the driver by removing multiple register regions
and useless internal fields. It renames reg_bases to reg_base and removes
unused members like ctrl_base from struct hantro_dev.

> diff --git a/drivers/media/platform/verisilicon/hantro.h b/drivers/media/=
platform/verisilicon/hantro.h
> index 0353de154a1ec..ca03bc690fbf8 100644
> --- a/drivers/media/platform/verisilicon/hantro.h
> +++ b/drivers/media/platform/verisilicon/hantro.h
[ ... ]
> @@ -184,7 +180,7 @@ hantro_vdev_to_func(struct video_device *vdev)
>   *			dev_ macros.
>   * @clocks:		Array of clock handles.
>   * @resets:		Array of reset handles.
> - * @reg_bases:		Mapped addresses of VPU registers.
> + * @reg_base:		Mapped address of VPU registers.
>   * @enc_base:		Mapped address of VPU encoder register for convenience.
>   * @dec_base:		Mapped address of VPU decoder register for convenience.
>   * @ctrl_base:		Mapped address of VPU control block.

[Severity: Low]
Does this leave an orphaned kernel-doc entry? The patch removes the ctrl_ba=
se
member from struct hantro_dev below, but leaves its documentation parameter=
=20
here, which might trigger a kernel-doc script warning.

> @@ -204,10 +200,9 @@ struct hantro_dev {
>  	struct device *dev;
>  	struct clk_bulk_data *clocks;
>  	struct reset_control *resets;
> -	void __iomem **reg_bases;
> +	void __iomem *reg_base;
>  	void __iomem *enc_base;
>  	void __iomem *dec_base;
> -	void __iomem *ctrl_base;
> =20
>  	struct mutex vpu_mutex;	/* video_device lock */
>  	spinlock_t irqlock;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925085152.4185=
2-1-benjamin.gaignard@collabora.com?part=3D3
