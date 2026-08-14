Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83AD49463
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 14:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786717446; cv=none; b=HoQwxUJxJb+w2SnT/13IFt6O6p3BoEGgzYB3SQfsHnn9rQNCKEZMQNznfTYkQd28ZkalpPPE7RVK9MEEY+TeKQZ3WiZT++yJBLQ2Q/GuONMDbgFYcbTDnG36RJ4tzRr4lFkqEfqevbht91BAW4pOwd4VEwrE3C45LQ29VDkSRnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786717446; c=relaxed/simple;
	bh=DLtpTV83zyKf92GtNcI3rJ8JG5ZhMNae+Ta9BFoWlbw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YheBX31IMG017tOkHP2PpVMbVxQWpfmu2sX9j4QMtw25FnN1VSuQbelE6YAyFCe6TgNVXncWoZC17ytziUZrb3oqa9XDVYBL//rvhaO+uT7zvkNHMVyaFZKd4WRZZsJrTKcxuhUf312axDeMS7sBi/xTt4aMM5rHHIsw3KBBe/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FnemgmbZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FnemgmbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58FF11F00A3A;
	Fri, 14 Aug 2026 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786717440;
	bh=sBu8zrcbrEnYZOMrT8Psw8BATgUoYyKkM9R0zlN1U8I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FnemgmbZ5qFyhl14HBrof4ix7X1jJm3ccobkKWoVuaUyO+0byfCfxWAQNw+Fggws6
	 IISz3nrY/e0vyPlShqe0I222IhPtfToewJ6v4EUoRRskZYiuBYt0WKmhshSPwMCIKL
	 pGxPVWuckVpanTNHTt4VE7eLRM4seZ5eV5340JWQscWZ/0PX8aLmqX+30Q80e3OPKU
	 DFXJjcyHV4p+XLdHrj5i6vJ5lWEK32ToPIv2QJvLBCojILwcPiz3FieUjT1ue9X2tj
	 IgThxxMCrcXxe/uA6UKcnLkfZ5pPu/taH6DkFgz952sU42Z2Yugm9cAQBFy5C6gyxD
	 a+Ny8dapvj2nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 1/3] drm/msm: Guard the QCOM_UBWC_CONFIG select with
 QCOM_SMEM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Baluta" <daniel.baluta@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260814141724.1006382-2-daniel.baluta@nxp.com>
References: <20260814141724.1006382-1-daniel.baluta@nxp.com>
 <20260814141724.1006382-2-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 14:23:59 +0000
Message-Id: <20260814142400.58FF11F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Incomplete Kconfig dependency preparation: VIDEO_QCOM_IRIS also sel=
ects QCOM_UBWC_CONFIG without a QCOM_SMEM guard.
--

--- Patch [1]: [PATCH v5 1/3] drm/msm: Guard the QCOM_UBWC_CONFIG select wi=
th QCOM_SMEM ---
commit 720508af65c7d5604eab7fac5015d0cc98c646e0
Author: Daniel Baluta <daniel.baluta@nxp.com>

drm/msm: Guard the QCOM_UBWC_CONFIG select with QCOM_SMEM

This commit prepares DRM_MSM for an upcoming change where QCOM_UBWC_CONFIG
will depend on QCOM_SMEM. It guards the select statement and adds a depende=
ncy
to prevent a built-in DRM_MSM from selecting against a modular SMEM.

Fixes: 1b445022d1d0 ("soc: qcom: ubwc: Get HBB from SMEM")

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
Will the upcoming change to make QCOM_UBWC_CONFIG depend on QCOM_SMEM
trigger Kconfig unmet direct dependency warnings elsewhere?

It looks like VIDEO_QCOM_IRIS also unconditionally selects QCOM_UBWC_CONFIG:

drivers/media/platform/qcom/iris/Kconfig:
config VIDEO_QCOM_IRIS
	...
	select QCOM_UBWC_CONFIG

If the SMEM dependency lands before the iris driver is updated, could this
cause a build breakage when compiling with VIDEO_QCOM_IRIS=3Dy and QCOM_SME=
M=3Dn?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814141724.1006=
382-1-daniel.baluta@nxp.com?part=3D1
