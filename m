Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEFF2D3ED1
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 15:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786549803; cv=none; b=jHjq8zmcoRSk2pBilhTg7CyrcDYVLOfsoySYG3h+95mIKTlw40CSNeufP9jz/EXxsCSlUBirWhT1zFMLQoSBR9d/TmIzK7IKPCjy1tSns7OH55eYonnuSvlr7rTpE9WjSNbeNLnFlprjbGkW1TpaiAieA8DbWYeptFaxDXmT0Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786549803; c=relaxed/simple;
	bh=Kyg8yMlnf7v1crki+dd+2qRxThdEd9Yvl1zYpsW5R84=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PS3EzAU4+bjLybX5U/XFvv0S2LyM+HnjNRAUOwcQ5OSeapPKyR02nqvV12qkrWT/gjWCIN3yeCr6WY2WYf70qfTmodHwWIpY6E9K/rWfrl9Ftza/SoadO0f2SphUSGC88GojD0sVB/dxRyDUpgHxRd1YFjTxnzeqhrV0Chb9i/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iPjCvcjQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iPjCvcjQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A2D51F00A3A;
	Wed, 12 Aug 2026 15:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786549801;
	bh=O+989S8dJLeBwMdn8IUOSlf7R/JsNR5VgZFco37MRr4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iPjCvcjQRWBe5swXNQI6W3NF7ZIv38qjwgoERVt9OJ5c88Q6sLjjGl8+mbXFpqaJ7
	 x7/JiIZv/Wk8zp9LEm0svQ1audMUI9Vq5xAni/xWSKn14hExNgRy3jcQ9gtvFYlqBr
	 GF50u+OGI500HcOQ8NQIceoll4VHQ1WAGhN0gSPNAMMzSx4UqdknOzCgavkytCRO1Z
	 P/kajilr8bkzfvSeKq6pZlcz/spIeKYHg4JyiUwyxuWR5ltokboAV3Yr6Oif5PWkR5
	 x9gSA7Dfn6536oyDXd3E1v2VvTFDE01VfkZ2ArzBBQt6mJ2wseCGmCTfrd6Yp19hjJ
	 Ijj/U4hDYNY+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/3] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Baluta" <daniel.baluta@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260812151934.709198-2-daniel.baluta@nxp.com>
References: <20260812151934.709198-1-daniel.baluta@nxp.com>
 <20260812151934.709198-2-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:50:00 +0000
Message-Id: <20260812155001.6A2D51F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch adds `depends on QCOM_SMEM` to `QCOM_UBWC_CONFIG` but mi=
sses that `VIDEO_QCOM_IRIS` unconditionally selects it, causing an unmet de=
pendency warning and leaving the original linker error unfixed.
- [High] The conditional select in `DRM_MSM` creates a configuration where =
a built-in driver calls a function from a module, resulting in a linker err=
or.
--

--- Patch [1]: [PATCH v4 1/3] soc: qcom: ubwc: Fix link error when QCOM_SME=
M=3Dn ---
commit a54f8c4ddffc0b9c1fbde97cc8f98242588a42bf
Author: Daniel Baluta <daniel.baluta@nxp.com>

soc: qcom: ubwc: Fix link error when QCOM_SMEM=3Dn

DRM_MSM unconditionally selects QCOM_UBWC_CONFIG, which calls SMEM APIs,
causing a link error on non-Qcom platforms (e.g. SOC_IMX5). Make
QCOM_UBWC_CONFIG depend on QCOM_SMEM to make the requirement explicit, and
guard the select in DRM_MSM with ARCH_QCOM && QCOM_SMEM.

> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 09469d56513b0..1670dbc9464c6 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -22,7 +22,7 @@ config DRM_MSM
>  	select TMPFS
>  	select QCOM_SCM
>  	select QCOM_PAS
> -	select QCOM_UBWC_CONFIG
> +	select QCOM_UBWC_CONFIG if ARCH_QCOM && QCOM_SMEM

[Severity: High]
Can this conditional select create a new configuration where a built-in dri=
ver
fails to link against a module?

If we compile with CONFIG_DRM_MSM=3Dy, CONFIG_ARCH_QCOM=3Dy, and
CONFIG_QCOM_SMEM=3Dm, the select evaluates to 'm', forcing
CONFIG_QCOM_UBWC_CONFIG=3Dm.

Because IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG) evaluates to true for both 'y'
and 'm', built-in code like msm_mdss_init() in drivers/gpu/drm/msm/msm_mdss=
.c
will attempt to call the external qcom_ubwc_config_get_data() function:

include/linux/soc/qcom/ubwc.h:
#if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
...

At link time, vmlinux will fail to resolve this function because it resides
in the ubwc_config module.

>  	select WANT_DEV_COREDUMP
>  	select SND_SOC_HDMI_CODEC if SND_SOC
>  	select SYNC_FILE

[ ... ]

> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index fd4d4ecd2df0f..e0629e9328c87 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
> @@ -321,6 +321,7 @@ config QCOM_QMI_HELPERS
> =20
>  config QCOM_UBWC_CONFIG
>  	tristate
> +	depends on QCOM_SMEM

[Severity: High]
Does this leave the linker error unfixed when CONFIG_VIDEO_QCOM_IRIS=3Dy?

Looking at drivers/media/platform/qcom/iris/Kconfig, it unconditionally
selects QCOM_UBWC_CONFIG:

config VIDEO_QCOM_IRIS
    ...
    select QCOM_UBWC_CONFIG

If we compile with CONFIG_COMPILE_TEST=3Dy, CONFIG_VIDEO_QCOM_IRIS=3Dy, and
CONFIG_QCOM_SMEM=3Dn, the unconditional select will force QCOM_UBWC_CONFIG =
to y
despite the new dependency.

This produces an unmet dependency warning and attempts to link ubwc_config.=
c,
which fails with the exact undefined reference to 'qcom_smem_*' APIs that
this patch intended to fix.

>  	help
>  	  Most Qualcomm SoCs feature a number of Universal Bandwidth Compression
>  	  (UBWC) engines across various IP blocks, which need to be initialized

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812151934.7091=
98-1-daniel.baluta@nxp.com?part=3D1
