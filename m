Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1632E389115;
	Fri, 25 Sep 2026 09:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790327047; cv=none; b=UAItjnOHE7eKAohfcQV9PK+TU3iQdFrMjkufSbe7ta/igar+KLRU/Un3h0bLq0mQ+RNtUNC/iosfZS5NUYx0RFtJQsL09MXBbzA+xFmEHwHWG+iq5DJZnvypn7rfGVniI5W+u/CYSB0qA8rJnRkW7hE/TfhrBBXZo/If4J4iZnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790327047; c=relaxed/simple;
	bh=0zoYrJvY61Jf4sfg5AoHKn2Mw1YI3FJ30mt7tHWio8M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jewZW2w8iKtQlcMhwIaVTfnOuNjyBiY97vyFt9TT4pVFWulslSTnfe8gMyyidhqFYARvAjA4+xEBy9nBGD1mC6xHGI7amvXI8gYknKDp3UejGZo8SCbDUSEYTRpybIln0/VoqMcIMstYyb5Zid12Nfxts4bKUmDwBFOxKU2FacQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kr0+M6yr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kr0+M6yr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59B321F000FF;
	Fri, 25 Sep 2026 09:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790327045;
	bh=0qzXbekgnK32ewr4NmpJPLE8RuvAHXBx2FDBNogm5dU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kr0+M6yrhj+vIzi5uukgnCUk25afRc01zAXjZAZYgkYF2JHWpPsb2ER/hkqSsmu1S
	 uX/rAChsXWJdIzO7neOtkEap5prbZbnJ4ejkaExcpoN3iBbpM4Brv7b/9sbzeJJil2
	 06HZmladjS4mfrcABiM89TM+Mw7NNLRZR7Qbdb0a+iR8PRjyDNsnYwParlB0Pwzvlt
	 /mFCUovu8d0ExuZYtlwPl6PTTMEN+ELbFOTBWdIcENQt8QiFF5SZXaIHMPsWT9bVkj
	 Nj7Nkxy+PK5uBDBKxBMrqO8yWrBtSZLqvcxVUaMK2bSiNKQaYW6gVZ5v2j5LlRPTBf
	 W5T5XGTJvtxnw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] media: verisilicon: Remove deprecated variant
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Gaignard" <benjamin.gaignard@collabora.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org, robh@kernel.org
In-Reply-To: <20260925085152.41852-2-benjamin.gaignard@collabora.com>
References: <20260925085152.41852-1-benjamin.gaignard@collabora.com>
 <20260925085152.41852-2-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 25 Sep 2026 09:04:04 +0000
Message-Id: <20260925090405.59B321F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] media: verisilicon: ABI breakage by removing deprecated DT binding
- [Low] media: verisilicon: orphaned code and macros left after variant rem=
oval
--

commit 16a43be32673e02fd74593fb19bc27c444f75881
Author: Benjamin Gaignard <benjamin.gaignard@collabora.com>

media: verisilicon: Remove deprecated variant

The "nxp,imx8mq-vpu" compatible string has been deprecated since commit
f3116f2e52e6 split the G1 and G2 nodes. This patch removes the driver
reference to this old binding to clean up the code.

> diff --git a/drivers/media/platform/verisilicon/hantro_drv.c b/drivers/me=
dia/platform/verisilicon/hantro_drv.c
> index ad71c0402ef3b..12c804dcc6694 100644
> --- a/drivers/media/platform/verisilicon/hantro_drv.c
> +++ b/drivers/media/platform/verisilicon/hantro_drv.c
> @@ -725,7 +725,6 @@ static const struct of_device_id of_hantro_match[] =
=3D {
>  #endif
>  #ifdef CONFIG_VIDEO_HANTRO_IMX8M
>  	{ .compatible =3D "nxp,imx8mm-vpu-g1", .data =3D &imx8mm_vpu_g1_variant=
, },
> -	{ .compatible =3D "nxp,imx8mq-vpu", .data =3D &imx8mq_vpu_variant, },

[Severity: High]
Does removing this binding break backward compatibility with older Device T=
ree
Blobs (DTBs)? Device trees typically act as a stable ABI in Linux. Removing
this entry prevents the driver from binding to older DTBs that have not spl=
it
the G1 and G2 nodes, resulting in a loss of hardware video acceleration on
those systems. Even if deprecated, should the binding remain supported to e=
nsure
older firmware continues to boot successfully?

>  	{ .compatible =3D "nxp,imx8mq-vpu-g1", .data =3D &imx8mq_vpu_g1_variant=
 },
>  	{ .compatible =3D "nxp,imx8mq-vpu-g2", .data =3D &imx8mq_vpu_g2_variant=
 },
>  #endif

[ ... ]

> diff --git a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c b/drivers/=
media/platform/verisilicon/imx8m_vpu_hw.c
> index fa4224de4b996..b091d807ae4e2 100644
> --- a/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> +++ b/drivers/media/platform/verisilicon/imx8m_vpu_hw.c
> @@ -25,55 +25,6 @@
>  #define CTRL_G1_PP_FUSE		0x0c
>  #define CTRL_G2_DEC_FUSE	0x10
> =20
> -static void imx8m_soft_reset(struct hantro_dev *vpu, u32 reset_bits)
> -{

[Severity: Low]
With the removal of imx8mq_runtime_resume() and imx8m_soft_reset() in this
patch, several hardware control macros are left completely unused.

Could these unused macros also be removed from the top of the file?
- CTRL_SOFT_RESET, RESET_G1, RESET_G2
- CTRL_CLOCK_ENABLE, CLOCK_G1, CLOCK_G2
- CTRL_G1_DEC_FUSE, CTRL_G1_PP_FUSE, CTRL_G2_DEC_FUSE

Additionally, since imx8mq_vpu_variant was the only variant using
the runtime_resume function pointer in struct hantro_variant, should
runtime_resume be removed from the struct entirely in hantro.h?
hantro_runtime_resume() in hantro_drv.c is now effectively a no-op for all
platforms.

Finally, could the dangling extern const struct hantro_variant
imx8mq_vpu_variant declaration in hantro_hw.h be dropped too?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260925085152.4185=
2-1-benjamin.gaignard@collabora.com?part=3D1
