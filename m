Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8837479870;
	Thu, 24 Sep 2026 13:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790255913; cv=none; b=sNyNqYN+/6p9vv91kwfB7BPPRzWFSzg4O981aGZXOGXRxFTF3sC/AA2yy9ED9atZPHCKM2EJcLGuazM1szLPlQQh4QvyOUAv+rs1rR2oUchyckzj/QnnjccAfHZnIn3Ugjxemwqeq94iIr342n2j+nsIRDkux38YW2uzo95x+bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790255913; c=relaxed/simple;
	bh=PB79bD5HvnR3CMgvnuRlCf02ziTnlkj2wccrorK5y58=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WJBUwtWndDJoS7O9XpSI4G3y/rLAHMJNLtO5UiWN+YX5FzFzSanIU7RNQFPiLUHgvJBHKccYHjVyAVgOSXqM+sNd2LaerrXj84C4MOy9B1BQktAE6grK0h8h1jd3vXqzIdgJ8VAgcWiNByCvsZt50YIDxau2u8TqUIwrqWD3Nnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNa8J+sO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNa8J+sO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 064F91F000FF;
	Thu, 24 Sep 2026 13:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790255911;
	bh=oroJjjG/R03G4qE8aZWJ5V7wgkrRtWqF8u7iXA6/02A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lNa8J+sOjMbHx/v8JwRiOqbjT73HSXWooStifF0VGXO1jEM05bqjenopNANzJtXMx
	 HhKhAlCpte3UkS5OYrndjtRQeRC9cjbWab810gichRGWbXYurCPt6phis7lDhlOPZw
	 ZcgHsuzfYXGi7n6r5LkWN1mDmVZmwpcWMjbnNwJTu2IAS6GKk7gwNMtXl23YeKhX/1
	 H03b6IAyOyNtnkTn7+U3dSt7/fa/5C/U0d8wiG9gC414Gg3urKpoy7dUDP6o/0VLik
	 TQpmc5Rxfk4azGC7TX1Qv9+vcLz1156EyxfugxQafjsrUhxY+Y2d0tce2lW1xQYGgo
	 HVeY0gCtqa+CQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/3] media: verisilicon: Remove deprecated variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20260924130453.196299-2-benjamin.gaignard@collabora.com>
References: <20260924130453.196299-1-benjamin.gaignard@collabora.com>
 <20260924130453.196299-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Sep 2026 13:18:30 +0000
Message-Id: <20260924131831.064F91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] media: verisilicon: unused macro definitions left as dead code
- [Low] media: verisilicon: dangling extern declaration of imx8mq_vpu_varia=
nt
--

commit 3830dbe5f9a866bc263edbf7ff8a80a0961e7da2
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>

media: verisilicon: Remove deprecated variant

"nxp,imx8mq-vpu" is tagged as deprecated since commit f3116f2e52e6
merged since v5.17-rc1. This commit removes the variant to clean up
the driver code.

> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/=
media/platform/verisilicon/imx8m_vpu_hw.c
> index fa4224de4b996..b091d807ae4e2 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -25,55 +25,6 @@
>  #define CTRL_G1_PP_FUSE		0x0c
>  #define CTRL_G2_DEC_FUSE	0x10
> =20

[Severity: Low]
Since imx8m_soft_reset() and other functions are being removed, should the
macros they used, such as CTRL_SOFT_RESET, RESET_G1, and RESET_G2 (defined
earlier in this file), also be removed to fully clean up the dead code?

> -static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
> -{

[ ... ]

> @@ -319,30 +235,9 @@ static const struct hantro_irq imx8mq_g2_irqs[] =3D {
>  	{ "g2", hantro_g2_irq },
>  };
> =20
> -static const char * const imx8mq_clk_names[] =3D { "g1", "g2", "bus" };
> -static const char * const imx8mq_reg_names[] =3D { "g1", "g2", "ctrl" };
>  static const char * const imx8mq_g1_clk_names[] =3D { "g1" };
>  static const char * const imx8mq_g2_clk_names[] =3D { "g2" };
> =20
> -const struct hantro_variant imx8mq_vpu_variant =3D {
> -	.dec_fmts =3D imx8m_vpu_dec_fmts,
> -	.num_dec_fmts =3D ARRAY_SIZE(imx8m_vpu_dec_fmts),
> -	.postproc_fmts =3D imx8m_vpu_postproc_fmts,
> -	.num_postproc_fmts =3D ARRAY_SIZE(imx8m_vpu_postproc_fmts),
> -	.postproc_ops =3D &hantro_g1_postproc_ops,
> -	.codec =3D HANTRO_MPEG2_DECODER | HANTRO_VP8_DECODER |
> -		 HANTRO_H264_DECODER,
> -	.codec_ops =3D imx8mq_vpu_codec_ops,
> -	.init =3D imx8mq_vpu_hw_init,
> -	.runtime_resume =3D imx8mq_runtime_resume,
> -	.irqs =3D imx8mq_irqs,
> -	.num_irqs =3D ARRAY_SIZE(imx8mq_irqs),
> -	.clk_names =3D imx8mq_clk_names,
> -	.num_clocks =3D ARRAY_SIZE(imx8mq_clk_names),
> -	.reg_names =3D imx8mq_reg_names,
> -	.num_regs =3D ARRAY_SIZE(imx8mq_reg_names)
> -};
> -

[Severity: Low]
Does this removal leave a dangling extern declaration for imx8mq_vpu_variant
in drivers/media/platform/verisilicon/hantro_hw.h?

>  static const struct of_device_id imx8mq_vpu_shared_resources[] =3D {
>  	{ .compatible =3D "nxp,imx8mq-vpu-g1", },
>  	{ .compatible =3D "nxp,imx8mq-vpu-g2", },

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260924130453.1962=
99-1-benjamin.gaignard@collabora.com?part=3D1
