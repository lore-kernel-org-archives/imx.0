Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6870227EB9;
	Fri, 12 Jun 2026 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271246; cv=none; b=JEQ78QsSb2PTom2UchXZZFpnKhCNaHr18TYcR5TMJtSoYUtrwspDy3OSL5GvPbVUCrfKT33x3vOyEme6dREbJx4QwgtL+6VRV9aYCdzTDJTR3b2+SmoK74g5oNKaSZSk3eWSk19pD1ABgiqVoPOtz/2bsf9VAGnKytbqvxRR/+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271246; c=relaxed/simple;
	bh=RPNUxj1GaxD8CB2IpjufuTELUdA6MtI1aZv5yqAmMMM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uLHDVtRkyM6QDTkn0k1BLSk4lk9I0XpZ0cho/4+xqdbWB6uccaYWbG6n/lvPOxeLiOwXX+DdQF8NlwU8cdwsri6VOZmBVBpAO64/KVAW/dU/EmrBCGiLDrc4zrwmu05eo4cy1av9sWsvJnnRiQPFyAVJ9YAct1qvEU137wTz+yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fXBj6Rhr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fXBj6Rhr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A2341F000E9;
	Fri, 12 Jun 2026 13:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271245;
	bh=49jlqhhXCRfMnXGAyjSyohIySAgy5L/GsDjO78YQbL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fXBj6RhrirGAraH/4DA93OIY4JS9I9NEcChRreCVjz7MpgOVOKfwqE3AiZr1Wd+m1
	 ZE+Qf2LK876GioOTmVGNQK9D7syp6f3XnZfgPmT3lwD7Iu9O6KSjZyjjd2Clde36++
	 7AE5twIMpK+w1MPcofZOYwzcYS/f55vrtOJMQp3NWB8IVvlLO+MPf2lQhBj/zCR/gJ
	 HBdbnN5w8NBjvV9DdoqrnVANluzGrncFgg70NickfkZ1ly/IS+Flh2Y1o75LnytuNw
	 uPrYV8bm028jyLHRIG9e1ylap6n2pDFFNV0dwgPv/i+iMf+XIw5Kz2IhrY+NW+qF5t
	 N6+K43BKseDZw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/8] media: uapi: Add NXP NEOISP user interface
 header file
Reply-To: sashiko-reviews@lists.linux.dev
To: "Antoine Bouyer" <antoine.bouyer@nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260612132039.2089051-5-antoine.bouyer@nxp.com>
References: <20260612132039.2089051-5-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 13:34:04 +0000
Message-Id: <20260612133405.0A2341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] UAPI Compilation Failure due to undefined struct `v4l2_isp_block_h=
eader`
- [Medium] Implicit compiler padding (holes) in UAPI structures
--

commit 07ff92ed00f28aef4b4e762772b07f402cd3490d
Author: Antoine Bouyer <antoine.bouyer@nxp.com>

media: uapi: Add NXP NEOISP user interface header file

Add user space api header file for meta data structures definitions.
This header describes parameters buffer for the ISP blocks control by
userspace, and statistics buffer for userspace and IPA handling.

> diff --git a/include/uapi/linux/media/nxp/nxp_neoisp.h b/include/uapi/lin=
ux/media/nxp/nxp_neoisp.h
> new file mode 100644
> index 0000000000000..2dafa19df3242
> --- /dev/null
> +++ b/include/uapi/linux/media/nxp/nxp_neoisp.h

[ ... ]

> +struct neoisp_obwb_cfg_s {
> +	__u8 ctrl_obpp;
> +	__u16 r_ctrl_gain;
> +	__u16 r_ctrl_offset;

[Severity: Medium]
Is there an implicit 1-byte compiler padding hole after ctrl_obpp to align
the __u16 r_ctrl_gain field?

UAPI guidelines generally require explicit reserved fields to fill all
holes. This guarantees a stable ABI and prevents uninitialized kernel memory
from potentially leaking to userspace.

[ ... ]

> +struct neoisp_ir_compress_cfg_s {
> +	__u8 ctrl_obpp;
> +	__u32 knee_point1_kneepoint;

[Severity: Medium]
Does this introduce a 3-byte implicit padding hole after ctrl_obpp to align
the __u32 knee_point1_kneepoint field?

[ ... ]

> +struct neoisp_bnr_cfg_s {
> +	__u8 ctrl_debug;
> +	__u8 ctrl_obpp;
> +	__u8 ctrl_nhood;
> +	__u8 ypeak_peak_outsel;
> +	__u8 ypeak_peak_sel;
> +	__u16 ypeak_peak_low;

[Severity: Medium]
Are there implicit padding holes in this structure, such as a 1-byte hole
after ypeak_peak_sel?

[ ... ]

> +struct neoisp_rgb2yuv_cfg_s {
> +	__u16 gain_ctrl_rgain;
> +	__u16 gain_ctrl_bgain;
> +	__s16 mat_rxcy[NEO_RGB2YUV_MATRIX_SIZE][NEO_RGB2YUV_MATRIX_SIZE];
> +	__s32 csc_offsets[NEO_RGB2YUV_MATRIX_SIZE];
> +};

[Severity: Medium]
Is there a 2-byte implicit padding hole after the 18-byte mat_rxcy array to
align the __s32 csc_offsets field?

[ ... ]

> +struct neoisp_ee_cfg_s {
> +	__u8 ctrl_debug;
> +	__u8 maskgain_gain;
> +	__u32 coring_coring;

[Severity: Medium]
Does this leave a 2-byte implicit padding hole after maskgain_gain?

[ ... ]

> +struct neoisp_pipe_conf_cfg_es {
> +	struct v4l2_isp_block_header header;
> +	struct neoisp_pipe_conf_cfg_s cfg;
> +} __attribute__((aligned(8)));

[Severity: High]
Will embedding struct v4l2_isp_block_header by value cause an incomplete
type compilation error?

The struct v4l2_isp_block_header does not appear to be defined anywhere,
as the generic V4L2 ISP framework defines v4l2_isp_params_block_header
instead. This seems to break compilation for both the driver and any
userspace program including this header.

[ ... ]

> +struct neoisp_ctemp_reg_stats_es {
> +	struct v4l2_isp_block_header header;
> +	struct neoisp_ctemp_reg_stats_s stat;
> +} __attribute__((aligned(8)));

[Severity: Medium]
Does forcing 8-byte alignment here add 4 bytes of implicit trailing padding
to this statistics wrapper structure?

Adding explicit padding fields might be needed to prevent uninitialized
kernel memory from leaking to userspace via the statistics buffer.

[ ... ]

> +struct neoisp_nr_reg_stats_es {
> +	struct v4l2_isp_block_header header;
> +	struct neoisp_nr_reg_stats_s stat;
> +} __attribute__((aligned(8)));

[Severity: Medium]
Does this also contain 4 bytes of implicit trailing padding due to the
explicit 8-byte alignment requirement?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612132039.2089=
051-1-antoine.bouyer@nxp.com?part=3D4
