Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2E7468C1F
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 15:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786548733; cv=none; b=JQlOPqHmtnLnBu7hAxSKjokS7HJC7Mjf0NIu6CfaMSRCRrLR4Ik/BfrmPsxmgpIL0tzvJgNaE9n5gB0KjsN0tIJVkqPsGMzLi4QfmZaCu+/SkCujfeIMdwtqgsU3BEm7S1BwqlA6ntJHRS4SKdsUO+zSoTvjQw/xsYNZSdNGCRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786548733; c=relaxed/simple;
	bh=SgNzn8CdE7aNKhlk9CgKeRa9sq9xZggftgxAw0+hOj8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ndrjxx0jYA0IPWYFHcr6M7/AYuutlzCQuG0RcdOlW5V9qfFh2mGb2Pv6KkULzYItH5Zhxhi8jfJwjisbH0PM3xkFuKl5V0l9zLjx6rhPZ9nVllwxC5DlD7SxLsFkBsUKK3sBQouxwvVm+voCe7cE9WeYafmFkl9tEjblOwKWrAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UnBOQy5h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UnBOQy5h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967531F000E9;
	Wed, 12 Aug 2026 15:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786548723;
	bh=arVCGoZVCCJfHrdtHnRLbL8qnrD89BDupvfEJkdpPPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UnBOQy5hvW7lPfJJqKTe0GzFp5YNHUADCYMhb2pvl20BY1/20MZlJxXExoUhWCB8t
	 aVWAG+FW1iOKO44mNcqdryeLQtM89KQavnSbC4Re78wKe6EVbUIiYfcGx1NhVnC5RL
	 OI6qMQHPs3iq9K5LLSqCP91lJpfsL97F64FqEXbDGvx7N+gTC8o2XhzX7EfsGhvIYH
	 RzJ3MRJEJ+LM1LjQkPtxAQmrnp8zqqdVT5mlQdBKfzd8VacDfogqpQrkk3qondTWk8
	 0ypgT1FXbuM3FONCx8fhq5F+5sEQ/hctXqEgL1zdCEaCfLxpJmH8E31S90z3maNwbL
	 5HgUyuH9fLrFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] soc: qcom: ubwc: Use IS_REACHABLE() instead of
 IS_ENABLED()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Baluta" <daniel.baluta@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260812151934.709198-4-daniel.baluta@nxp.com>
References: <20260812151934.709198-1-daniel.baluta@nxp.com>
 <20260812151934.709198-4-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 15:32:03 +0000
Message-Id: <20260812153203.967531F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] Using IS_REACHABLE() masks a Kconfig dependency mismatch, causing =
guaranteed runtime probe failures for built-in drivers when the dependency =
is built as a module.

Pre-existing issues:
- [Medium] Missing resource cleanup in a5xx_gpu_init() when qcom_ubwc_confi=
g_get_data() fails.
--

--- Patch [3]: [PATCH v4 3/3] soc: qcom: ubwc: Use IS_REACHABLE() instead o=
f IS_ENABLED() ---
commit 27da698f8aa42c85fe3250533a0ac637d13515f3
Author: Daniel Baluta <daniel.baluta@nxp.com>

soc: qcom: ubwc: Use IS_REACHABLE() instead of IS_ENABLED()

This commit changes the conditional check for QCOM_UBWC_CONFIG from
IS_ENABLED to IS_REACHABLE. This aims to resolve a link error when
built-in callers try to use the function while the dependency is built
as a module.

> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index a7372d9c25fbc..1a61238f6d4d5 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
[ ... ]
> @@ -36,7 +36,7 @@ struct qcom_ubwc_cfg_data {
>  #define UBWC_5_0 0x50000000
>  #define UBWC_6_0 0x60000000
> =20
> -#if IS_ENABLED(CONFIG_QCOM_UBWC_CONFIG)
> +#if IS_REACHABLE(CONFIG_QCOM_UBWC_CONFIG)

[Severity: High]
Does using IS_REACHABLE() here mask a Kconfig dependency mismatch?

If a user configures DRM_MSM=3Dy and QCOM_SMEM=3Dm, IS_REACHABLE() evaluates
to false and provides the inline stub to the built-in driver. Since the
callers abort on error rather than treating the configuration as optional,
won't this cause guaranteed runtime probe failures for built-in drivers
instead of catching the unmet dependency at build time?

>  const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void);
>  #else
>  static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data=
(void)

[Severity: Medium]
This is a pre-existing issue, but does falling back to this stub cause
a resource leak during device probe?

Looking at a5xx_gpu_init(), if the stub is used and returns an error pointe=
r,
the function returns early without cleaning up resources allocated by
adreno_gpu_init():

drivers/gpu/drm/msm/adreno/a5xx_gpu.c:a5xx_gpu_init() {
    ...
    adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
    ...
    adreno_gpu->ubwc_config =3D qcom_ubwc_config_get_data();
    if (IS_ERR(adreno_gpu->ubwc_config))
        return ERR_CAST(adreno_gpu->ubwc_config);
    ...
}

Will this leak memory and GPU resources like ringbuffers and the a5xx_gpu
structure itself if it fails to call a5xx_destroy() on the error path?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812151934.7091=
98-1-daniel.baluta@nxp.com?part=3D3
