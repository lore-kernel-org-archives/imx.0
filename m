Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F0D41D131
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 12:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970517; cv=none; b=knwP5bHBK/Zb34qjdNKNrEZNvHcz4cMmozh1zffBp4oSt6wzBsQs1ZjLFAjdr2F0bY5V9KFSEsNvqp4bOMvwAuYlZTX5KtwDaINDJfwWhWPv7Nmovd88JsL/b9KlsffAwiv4La39r7Hd007C2wDTEvKVnkwbW1b3xY1qsg1zc2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970517; c=relaxed/simple;
	bh=Mc7ROsX0NXh5y7JzuzD7awT1j/Z7TCf6SFN/pgIe+OI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tQpiztUGEF3h4ri81v73NBEuAkD69CQPNHY/+nx+DtBjLVJoGLd42mJ3DRyZLPPo/P/34I75I9uNf5nCGYt01C0DEESHd816EZ90g/zB6mIv0ksNpUnfG5tV3j5yK5PxeaFVl1HQ1gxbjCKMA5XCNyzvS0NxT5OrljZ+GgYIZDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GoaH8Ft7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GoaH8Ft7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C90241F00A3A;
	Mon, 17 Aug 2026 12:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970516;
	bh=U6HXzpK3wjyzEk0sxQWIX6PpLyMhxuRIO37WY+0dY4o=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GoaH8Ft7UspcEO6UqZEmUS6Mgry5f2JwAveq0gOws2g3Md/S2lm0b5pnQrcdpjbhL
	 FND7YDxqPvAC277MSONZTqsLQEroGbL4LdD3SIAS9H+h4VcJP387AkUK6BDvVY3HUZ
	 JwtnKlnR4/6BTJmDYpdTgCrP8qiOa7owy8ASpObcawAxcGUCa7wK5yDE4WzG3b8712
	 tlKr8509UrB+n32fJq1h8TxgpuDivBTJMXF38+omBoBE5FrxDobxsM7WgYFruSCCVu
	 b/0sVCBPwi0lIUOciEpBGq0CQrDcTUk0nU/QTfImmREd0mzaGSn/2XoRsfF+cTnscu
	 +OMJOBKN4rFew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/4] drm/msm: Guard the QCOM_UBWC_CONFIG select with
 QCOM_SMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Baluta" <daniel.baluta@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260817123542.48475-2-daniel.baluta@nxp.com>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
 <20260817123542.48475-2-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 12:41:55 +0000
Message-Id: <20260817124155.C90241F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Conditionally selecting QCOM_UBWC_CONFIG without adding `depends on=
 QCOM_UBWC_CONFIG || QCOM_UBWC_CONFIG=3Dn` causes an undefined reference li=
nker error when DRM_MSM is built-in (=3Dy) and QCOM_UBWC_CONFIG is a module=
 (=3Dm).
--

--- Patch [1]: [PATCH v6 1/4] drm/msm: Guard the QCOM_UBWC_CONFIG select wi=
th QCOM_SMEM ---
commit 353149f56be7035f090eb09914820d684b1f59f4
Author: Daniel Baluta <daniel.baluta@nxp.com>

drm/msm: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM

This commit guards the DRM_MSM select of QCOM_UBWC_CONFIG with an
architecture and SMEM check. It also adds a dependency to ensure a
built-in driver is never selected against a modular SMEM.

> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 09469d56513b0..ed1c4775d1e92 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
[ ... ]
> @@ -22,7 +23,7 @@ config DRM_MSM
>  	select TMPFS
>  	select QCOM_SCM
>  	select QCOM_PAS
> -	select QCOM_UBWC_CONFIG
> +	select QCOM_UBWC_CONFIG if ARCH_QCOM && QCOM_SMEM

[Severity: Low]
Does this conditional select cause an undefined reference linker error when
DRM_MSM is built-in (=3Dy) and QCOM_UBWC_CONFIG is built as a module (=3Dm)?

If the kernel is configured with CONFIG_DRM_MSM=3Dy, CONFIG_COMPILE_TEST=3D=
y,
and CONFIG_ARCH_QCOM=3Dn, this conditional select is bypassed.=20

If another driver (such as VIDEO_QCOM_IRIS) then selects QCOM_UBWC_CONFIG
as a module, the built-in DRM_MSM driver will fail to link. This happens
because include/linux/soc/qcom/ubwc.h uses IS_ENABLED(CONFIG_QCOM_UBWC_CONF=
IG)
instead of IS_REACHABLE(), so the header provides an external declaration
rather than a static inline stub.

Should this config also include "depends on QCOM_UBWC_CONFIG ||
QCOM_UBWC_CONFIG=3Dn" to prevent the built-in driver from being selected
against a missing or modular UBWC dependency?

>  	select WANT_DEV_COREDUMP
>  	select SND_SOC_HDMI_CODEC if SND_SOC
>  	select SYNC_FILE

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817123542.4847=
5-1-daniel.baluta@nxp.com?part=3D1
