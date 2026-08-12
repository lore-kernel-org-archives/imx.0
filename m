Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50CA44CAD7
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 13:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786540627; cv=none; b=gCxisdfraPuRfBdfsj+a0b9gS/ZgEkT4c5+IDlBeO5HvwcLo1zWDwXxVHGimF0fA8JSjyaGzGwknWHkXrzYfFKa2/3OPg6LERwXogp9E53fAFMtZFiMYM6uKLqpea1N4GDwqRcyzQylsHgfcZ++hSE9pKPlCn2NFT2D9gG4vtY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786540627; c=relaxed/simple;
	bh=3OnF+VydQqpfTFZYTYiiGfkM4pJxAywrZxOSVKv1G5Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YLNvEMZqPdHbG5XP9ijKnrpXIdRVDmaRDkYhcSFW6Zfs6cYl8pd2qFnAUKSXsO9Y6+GysNwwPiSTr0r6nA8iFnYUO+bPrD5CkVeH3WfIwIbaDIg3gyvpR+B5Csl4yngsBigXY/TbLjfWh08YtbnypxdM3LjVcRug4WhEzUSsL54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F+vIbMZ/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+vIbMZ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FA3E1F000E9;
	Wed, 12 Aug 2026 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786540624;
	bh=5aHRnEVgIzhuMKxMCpNYA69d4HOXLIlV131vdBQYvz8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F+vIbMZ/p1gZ0Aafd8D41aDGGZtcwuTN6mWM3BnWjMxEdqDawa6fgMPKBfW6fGQkT
	 DMJO9i9QXKRMYDX7V32CzaMtZNVkABkcLvonfNe3bqtLgf+gIGQnRJsoXkPdltyIvC
	 IrXH8aOLrDNE9/9tncTxouJqJZrHbwAibaU7wa7cJz+CzQ9nzrBsObEtIy9f3bxUtI
	 yv7xTF2cMxbmqRtiX7IPSGRRe7tI+nQ/4fFi7bApVlP9IEjINMiVwA6bCikmO56PN7
	 CJ+C60fVB8DguSibNU2cFXM8i2SvpwifU1nVULD2RKtk4pmRM3R/eiBOUh70BKCjtQ
	 GAWcorYmnm9wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3] soc: qcom: ubwc: Fix link error when QCOM_SMEM=n
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Baluta" <daniel.baluta@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260812130421.670527-1-daniel.baluta@nxp.com>
References: <20260812130421.670527-1-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 13:17:03 +0000
Message-Id: <20260812131704.6FA3E1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The patch adds `depends on QCOM_SMEM` to `QCOM_UBWC_CONFIG` but fa=
ils to update `VIDEO_QCOM_IRIS` which unconditionally selects it, leading t=
o a Kconfig unmet dependency warning and a link error when `QCOM_SMEM=3Dn`.
- [High] When `DRM_MSM` is built-in (`y`) and `QCOM_SMEM` is a module (`m`)=
, the new conditional select forces `QCOM_UBWC_CONFIG` to `m`, resulting in=
 undefined references to `qcom_ubwc_config_get_data` during vmlinux linkage.
--

--- Patch [1]: [PATCH v3] soc: qcom: ubwc: Fix link error when QCOM_SMEM=3D=
n ---
commit dd72552ce5111faee423365870490e3e7c98c8db
Author: Daniel Baluta <daniel.baluta@nxp.com>

soc: qcom: ubwc: Fix link error when QCOM_SMEM=3Dn

DRM_MSM unconditionally selects QCOM_UBWC_CONFIG, which calls SMEM APIs,
causing a link error on non-Qcom platforms. Make QCOM_UBWC_CONFIG depend
on QCOM_SMEM to make the requirement explicit, and guard the select in
DRM_MSM with ARCH_QCOM && QCOM_SMEM.

Link: https://lore.kernel.org/imx/20260811223622.GA934543@ax162/T/#t
Link: https://lore.kernel.org/imx/sy2ulk536ryakhy6fdnqr4asvzvufqk3dlo2awdrf=
omulyf4n4@qtp4qoazqmhj/T/#t

> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 09469d56513b0..1670dbc9464c6 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
[ ... ]
> @@ -22,7 +22,7 @@ config DRM_MSM
>  	select TMPFS
>  	select QCOM_SCM
>  	select QCOM_PAS
> -	select QCOM_UBWC_CONFIG
> +	select QCOM_UBWC_CONFIG if ARCH_QCOM && QCOM_SMEM

[Severity: High]
If DRM_MSM is built-in (=3Dy) and QCOM_SMEM is a module (=3Dm), this condit=
ional
select expression evaluates to 'm'. This leaves QCOM_UBWC_CONFIG configured=
 as
a module (=3Dm) while DRM_MSM is built-in.

Because include/linux/soc/qcom/ubwc.h uses IS_ENABLED(CONFIG_QCOM_UBWC_CONF=
IG),
which evaluates to true for both built-in and modules:

#if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
#else
static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(vo=
id)
...

Doesn't this result in an undefined reference to qcom_ubwc_config_get_data
when linking vmlinux, since the static inline stub is not provided? Should
IS_REACHABLE() be used in the header instead, or should the dependency be
adjusted?

>  	select WANT_DEV_COREDUMP
>  	select SND_SOC_HDMI_CODEC if SND_SOC
>  	select SYNC_FILE
> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
> index fd4d4ecd2df0f..e0629e9328c87 100644
> --- a/drivers/soc/qcom/Kconfig
> +++ b/drivers/soc/qcom/Kconfig
[ ... ]
> @@ -321,6 +321,7 @@ config QCOM_QMI_HELPERS
> =20
>  config QCOM_UBWC_CONFIG
>  	tristate
> +	depends on QCOM_SMEM

[Severity: High]
By adding this dependency, doesn't this create an unmet dependency for
VIDEO_QCOM_IRIS which also selects QCOM_UBWC_CONFIG?

In drivers/media/platform/qcom/iris/Kconfig:

config VIDEO_QCOM_IRIS
    ...
    select QCOM_UBWC_CONFIG

When a config symbol uses select, it must have dependencies at least as
restrictive as the selected symbol. Since VIDEO_QCOM_IRIS unconditionally
selects QCOM_UBWC_CONFIG, if it is enabled while QCOM_SMEM=3Dn, it bypasses
this new dependency.

Will this cause Kconfig to force QCOM_UBWC_CONFIG to be built, generating
an unmet dependency warning, and failing with the exact same undefined
reference to qcom_smem_is_available that this patch intends to fix?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812130421.6705=
27-1-daniel.baluta@nxp.com?part=3D1
