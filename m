Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E696E17A2E8;
	Tue, 12 May 2026 04:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778561279; cv=none; b=bxoEHqao7DQTfqhSN6HI8qOPVEWEA9MTP1UHvQNP06GQTUiEEDrfnMTAmXdcsFJcUVjirbn6aMv2sVzKwVJQIzkrG1Kg2K0GeRicQx0756MGY28pOIRHhYAIXIjRMWbRzngZGZC27rpr3US+rXBWuLX/vyyra5E8EpBJ0iNM5TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778561279; c=relaxed/simple;
	bh=FgS44Lh+0rf5j3GFTSw+xHx4/4563Z4trFEJGBEWnTs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=rSNJ+Xetz1ib+LA5rpEYpAZc7Vaysk+ZSz07o7JzsmzVnfs+LuYqc4pFtKt6LoF3CHB4uNdiVphnNQY0KEg9R+J28SViSK9odh4NpSTD9lZxDz4LOTe1qRDepMRZHsNH/6JaMRAXNcVv18B2Qr+YQMRRVVuzcaC9JlPGtA1aVxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4zp/30b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4zp/30b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37303C2BCB0;
	Tue, 12 May 2026 04:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778561278;
	bh=FgS44Lh+0rf5j3GFTSw+xHx4/4563Z4trFEJGBEWnTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=L4zp/30b1QnS8Wno5N4t2QIfgMhZWVZgO7dOKEY+xfKh9w1/mBYoSC9gSXJ1uy8dX
	 vtTINb+ZVzPXzQeBTkuyAciAOXlYhVlDT61OCWBWOJHnoMuX1YHJMWqtc8N9tODMGl
	 t727ddChkekQe395Hu7JL4W0yV++s203whqvoP47obk9agCtPiryB36E2QyD6QT+DO
	 E0GeQGLw+nwzQ2nJnZw+fKiXqBSV3ngbsyfx5SQpf/p7F7ITWagLnkeggfd+PP1Ab6
	 Xu3PBtMHaQKYwn4RFCqBzD1wao8eHUmYW2BwutkyhZG143g3ENN//odvd2zqRhZoEM
	 jTn01F+8pot0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/8] media: uapi: Add NXP NEOISP user interface
 header file
Reply-To: sashiko@lists.linux.dev
To: "Antoine Bouyer" <antoine.bouyer@nxp.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev, krzk+dt@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260511132629.1300868-5-antoine.bouyer@nxp.com>
References: <20260511132629.1300868-5-antoine.bouyer@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 04:47:57 +0000
Message-Id: <20260512044758.37303C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] Use of C bitfields in UAPI structure `struct neoisp_feat_ctrl_s`.
- [High] Implicit compiler padding in multiple UAPI structures.
- [Medium] Implicit values in UAPI enumerations.
--

commit 2b5be44f637f9fcc9f428d67d7cc83c131656a93
Author: Antoine Bouyer <antoine.bouyer@nxp.com>

media: uapi: Add NXP NEOISP user interface header file

This commit introduces the user space API header file for the NXP NEOISP
meta data structures. It provides definitions for parameters and statistics
buffers used to control ISP blocks from userspace.

> diff --git a/include/uapi/linux/media/nxp/nxp_neoisp.h b/include/uapi/lin=
ux/media/nxp/nxp_neoisp.h
> new file mode 100644
> index 0000000000000..d9ccf3b285932
> --- /dev/null
> +++ b/include/uapi/linux/media/nxp/nxp_neoisp.h

[ ... ]

> +struct neoisp_feat_ctrl_s {
> +	__u32 pipe_conf_cfg : 1;
> +	__u32 head_color_cfg : 1;
> +	__u32 hdr_decompress_input0_cfg : 1;
> +	__u32 hdr_decompress_input1_cfg : 1;
> +	__u32 obwb0_cfg : 1;
> +	__u32 obwb1_cfg : 1;
> +	__u32 obwb2_cfg : 1;
> +	__u32 hdr_merge_cfg : 1;
> +	__u32 rgbir_cfg : 1;
> +	__u32 stat_cfg : 1;
> +	__u32 ir_compress_cfg : 1;
> +	__u32 bnr_cfg : 1;
> +	__u32 vignetting_ctrl_cfg : 1;
> +	__u32 ctemp_cfg : 1;
> +	__u32 demosaic_cfg : 1;
> +	__u32 rgb2yuv_cfg : 1;
> +	__u32 dr_comp_cfg : 1;
> +	__u32 nr_cfg : 1;
> +	__u32 af_cfg : 1;
> +	__u32 ee_cfg : 1;
> +	__u32 df_cfg : 1;
> +	__u32 convmed_cfg : 1;
> +	__u32 cas_cfg : 1;
> +	__u32 gcm_cfg : 1;
> +	__u32 vignetting_table_cfg : 1;
> +	__u32 drc_global_tonemap_cfg : 1;
> +	__u32 drc_local_tonemap_cfg : 1;
> +};

Is it safe to use C bitfields in a UAPI structure?

Compiler implementations and architecture endianness can change the bit
ordering and packing, which might break ABI compatibility. Could this be
replaced with a standard fixed-width integer (like __u32 flags) and explicit
bitmask macros?

[ ... ]

> +struct neoisp_obwb_cfg_s {
> +	__u8 ctrl_obpp;
> +	__u16 r_ctrl_gain;
> +	__u16 r_ctrl_offset;
> +	__u16 gr_ctrl_gain;
> +	__u16 gr_ctrl_offset;
> +	__u16 gb_ctrl_gain;
> +	__u16 gb_ctrl_offset;
> +	__u16 b_ctrl_gain;
> +	__u16 b_ctrl_offset;
> +};

Will this leave a 1-byte gap after ctrl_obpp?

Implicit padding can cause architecture-dependent ABI differences and leak
uninitialized kernel memory to userspace when copied. Should we add an
explicit reserved field to pad it properly?

[ ... ]

> +struct neoisp_stat_hist_cfg_s {
> +	__u16 hist_ctrl_offset;
> +	__u8 hist_ctrl_channel;
> +	__u8 hist_ctrl_pattern;
> +	__u8 hist_ctrl_dir_input1_dif;
> +	__u8 hist_ctrl_lin_input1_log;
> +	__u32 hist_scale_scale;
> +};

Does this structure have a 2-byte hole before hist_scale_scale?

[ ... ]

> +struct neoisp_ir_compress_cfg_s {
> +	__u8 ctrl_obpp;
> +	__u32 knee_point1_kneepoint;
> +	__u32 knee_point2_kneepoint;

It looks like there is a 3-byte gap after ctrl_obpp. Could we make this
padding explicit as well?

[ ... ]

> +enum neoisp_param_block_type_e {
> +	NEOISP_PARAM_BLK_PIPE_CONF,
> +	NEOISP_PARAM_BLK_HEAD_COLOR,
> +	NEOISP_PARAM_BLK_HDR_DECOMPRESS0,
> +	NEOISP_PARAM_BLK_HDR_DECOMPRESS1,
> +	NEOISP_PARAM_BLK_OBWB0,
> +	NEOISP_PARAM_BLK_OBWB1,
> +	NEOISP_PARAM_BLK_OBWB2,
> +	NEOISP_PARAM_BLK_HDR_MERGE,
> +	NEOISP_PARAM_BLK_RGBIR,
> +	NEOISP_PARAM_BLK_STAT,
> +	NEOISP_PARAM_BLK_CTEMP,
> +	NEOISP_PARAM_BLK_IR_COMPRESS,
> +	NEOISP_PARAM_BLK_BNR,
> +	NEOISP_PARAM_BLK_VIGNETTING_CTRL,
> +	NEOISP_PARAM_BLK_DEMOSAIC,
> +	NEOISP_PARAM_BLK_RGB2YUV,
> +	NEOISP_PARAM_BLK_DR_COMP,
> +	NEOISP_PARAM_BLK_NR,
> +	NEOISP_PARAM_BLK_AF,
> +	NEOISP_PARAM_BLK_EE,
> +	NEOISP_PARAM_BLK_DF,
> +	NEOISP_PARAM_BLK_CONVMED,
> +	NEOISP_PARAM_BLK_CAS,
> +	NEOISP_PARAM_BLK_GCM,
> +	NEOISP_PARAM_BLK_VIGNETTING_TABLE,
> +	NEOISP_PARAM_BLK_DRC_GLOBAL_TONEMAP,
> +	NEOISP_PARAM_BLK_DRC_LOCAL_TONEMAP,
> +};

These enumeration members don't have explicitly assigned integer values.

If someone inserts a new value into the middle of the list later, would it
implicitly shift the values of all subsequent entries and silently break
userspace ABI compatibility?

Might it be safer to explicitly assign values (e.g. =3D 0, =3D 1) for UAPI
enumerations?

[ ... ]

> +struct neoisp_pipe_conf_cfg_es {
> +	struct v4l2_isp_block_header header;
> +	struct neoisp_pipe_conf_cfg_s cfg;
> +} __attribute__((aligned(8)));

The inner struct neoisp_pipe_conf_cfg_s is 4 bytes long, but the aligned(8)
attribute enforces an 8-byte alignment for this wrapper. Does this cause
implicit trailing padding here?

[ ... ]

> +enum neoisp_stats_block_type_e {
> +	NEOISP_STATS_BLK_RCTEMP,
> +	NEOISP_STATS_BLK_RDRC,
> +	NEOISP_STATS_BLK_RAF,
> +	NEOISP_STATS_BLK_RBNR,
> +	NEOISP_STATS_BLK_RNR,
> +	NEOISP_STATS_BLK_REE,
> +	NEOISP_STATS_BLK_RDF,
> +	NEOISP_STATS_BLK_MCTEMP,
> +	NEOISP_STATS_BLK_MRGBIR,
> +	NEOISP_STATS_BLK_MHIST,
> +	NEOISP_STATS_BLK_MDRC,
> +};

Similar to neoisp_param_block_type_e, could these members explicitly
declare their values to prevent future ABI breakage?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511132629.1300=
868-1-antoine.bouyer@nxp.com?part=3D4
