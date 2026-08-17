Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFCC41D131
	for <imx@lists.linux.dev>; Mon, 17 Aug 2026 12:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786970553; cv=none; b=tkWJ0OcUC1N1I4qK54Rkcwaq0JjMCXJqSjWkDUQAOPR3bjFrGeEAl5eK8fAjwKUeP49EATzrawR0lSB2UfJ+58RASkDskGagC60orF112d/xOr6E0NSw3K2mOJVyZIY3wIsmXtDED1CvNM/uBtTZ7w03X9MBAsFXt1mMNB+WUk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786970553; c=relaxed/simple;
	bh=FgJxv1xoLxhOFAQJAd5iiEi/J+8zYls9z5xXdN+cd3g=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bEIVH12K3G/44Sq3G4BfN1HWHiHDznVAD9PGzIkgfXUgl2xl/bfSS/ykp/5h4jTYJOWAx7v1Va5rS1OZE/qKpxhE5/Y9w7p9zQ/xUcYiaFlMoqU9xB5bvcrxyvlgGvv+Ws5nVzK3wzJbckLinRDYXXNfArsWAt9BceJTlT1ELqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gfdMkZ1r; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gfdMkZ1r"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAB8B1F000E9;
	Mon, 17 Aug 2026 12:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786970552;
	bh=ILCXmfmhhs4AqV9kDy+3QtcCTLzE7gQJ/JPuBfWmLDE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gfdMkZ1rFzyk7pjs4DNoAKNh0RaCMO882ZmSSS/at62EhE6QN6H8MsopIf5gXX1C8
	 6xDZ847f50itvDWg4FHWqU+uplhW0cPgkT/N6BAXrsWFpFtx3djFbLE0YbFO++IO9Z
	 MSDq0QLV1FPG1sz3VJ68NiAmYaGMucC6U0EiHLxps81z+dM3txPD42c0PYfCsaYPmu
	 SJtvsShjMreet7D1Jnxp9MisEPPZdWhtGk+oM4SfqUzogBzu5v4m/wcHUkdGVQXpEA
	 Zsb/bL2TzEeT3hLwEXw0xxGpIh0kXK1cz1lPeb4F2C/6Ye71vStouybWyvlZN+6AvL
	 bmgMhSiuaaYCg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 4/4] soc: qcom: ubwc: Fix missing include
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Baluta" <daniel.baluta@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260817123542.48475-5-daniel.baluta@nxp.com>
References: <20260817123542.48475-1-daniel.baluta@nxp.com>
 <20260817123542.48475-5-daniel.baluta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 17 Aug 2026 12:42:31 +0000
Message-Id: <20260817124231.DAB8B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing cleanup in `a5xx_gpu_init()` when `qcom_ubwc_config_get_da=
ta()` returns an error, leading to a memory and resource leak.
--

--- Patch [4]: [PATCH v6 4/4] soc: qcom: ubwc: Fix missing include ---
commit 8a6d2fb79b4edaad79d216dc3cc985d7cf39e314
Author: Daniel Baluta <daniel.baluta@nxp.com>

soc: qcom: ubwc: Fix missing include

This commit adds the <linux/err.h> include to ubwc.h to resolve a compilati=
on
error regarding the implicit declaration of ERR_PTR when
CONFIG_QCOM_UBWC_CONFIG=3Dn.

Fixes: 1924272b9ce1 ("soc: qcom: Add UBWC config provider")

> diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
> index a7372d9c25fbc..f3a70360b177b 100644
> --- a/include/linux/soc/qcom/ubwc.h
> +++ b/include/linux/soc/qcom/ubwc.h
> @@ -8,6 +8,7 @@
>  #define __QCOM_UBWC_H__
> =20
>  #include <linux/bits.h>
> +#include <linux/err.h>

[Severity: High]
This isn't a bug introduced by this patch, but it brings attention to a
potential memory and resource leak in a5xx_gpu_init() when it calls
qcom_ubwc_config_get_data().

If qcom_ubwc_config_get_data() returns -EPROBE_DEFER (when SMEM is unavaila=
ble)
or -EOPNOTSUPP (when CONFIG_QCOM_UBWC_CONFIG=3Dn), the function returns the=
 error
directly without tearing down the initialized GPU resources via a5xx_destro=
y():

drivers/gpu/drm/msm/adreno/a5xx_gpu.c:a5xx_gpu_init() {
    ...
	/* Inherit the common config and make some necessary fixups */
	adreno_gpu->ubwc_config =3D qcom_ubwc_config_get_data();
	if (IS_ERR(adreno_gpu->ubwc_config))
		return ERR_CAST(adreno_gpu->ubwc_config);
    ...
}

Because qcom_ubwc_config_get_data() actively returns -EPROBE_DEFER when SMEM
isn't ready, this error path will be taken during standard boot sequences w=
here
SMEM probes after the GPU.

Does this code leak the a5xx_gpu structure and ringbuffers initialized by
adreno_gpu_init() on each deferral?

>  #include <linux/printk.h>
>  #include <linux/types.h>
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260817123542.4847=
5-1-daniel.baluta@nxp.com?part=3D4
