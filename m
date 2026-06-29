Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9003715746F
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782726391; cv=none; b=BsSKBZmg7i8oaGJzqYPozLWnW3LXLE7+scf+1klkUgcTCiwTccnnnMpztIsqcrkZT0HufOxylHGuyjtFLhkwUfBR3wrSoAapUnyWEiZ87BamXDWTs5QXgWU2TkQ8QQpUvW2rM82LDFCQNv3uATU5+N7IBig1hZ9oA3rGee+RmcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782726391; c=relaxed/simple;
	bh=bGFXtQBM0dMwYCFxjoC5ypZWZ9+B3JCrSGqEQs1lzJc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fDONDppX/NSyuvgB9le7AdL9e9nn9x6B6Mba9XAN72GrkSxIWcGulqMFlKXA6dtV2RyU/DooPNH44Rh4KzjzRLljZh2UGv3P5+xefx/R75/iVcFG78/MfGId13+hIHuy4xmSso7iYzWJ/4x/YOQ8LNyvxNkoWMd0kNDELLRD8M0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L1Llw8ZH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L1Llw8ZH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E92421F00A3D;
	Mon, 29 Jun 2026 09:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782726390;
	bh=Tj8KbTUg/kh390l0esHY7ksOLwVX0nt4f+Ykquu6708=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=L1Llw8ZHIKcRaZ/bQOYcu+/2uroiweAdPvJ+uAODScgGRHbgRtccuIAFJbdQqA8ty
	 6CYwdVdWozoI8w3Pmni7XEgpFaUm1vpuf2q1+F2vzpceMPq19fGtOX3mRl/sVDo6uC
	 wtX3Wi2kafFKSvHAILzCryxlYSQnazIjmTOvQCdg/S054S+T39W+nTqNxDb8ldS9U8
	 Y2G7f30jgGYjScltNQPnjZc28L+pwJ6/EjeI54UcOsTlJSxnB9W9RB8z7dZAQZ4Xbx
	 LiDdC7zZ/0Bno8D6ppP+mTJq4Aai1i5vmSFVAvVmA+LB4BujcRnUey8VTa4RMxvzRk
	 jitzwHVSxY3lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/7] mmc: sdhci-esdhc-imx: use
 pm_runtime_resume_and_get() in suspend
Reply-To: sashiko-reviews@lists.linux.dev
To: ziniu.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260629091954.3227151-6-ziniu.wang_1@oss.nxp.com>
References: <20260629091954.3227151-1-ziniu.wang_1@oss.nxp.com>
 <20260629091954.3227151-6-ziniu.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 09:46:29 +0000
Message-Id: <20260629094629.E92421F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware access without clock via ignored `pm_runtime_get_sync` fa=
ilure in device removal path.
--

commit b5b21e6ae0c622ef650a850bcbdfcac65a5d5ddd
Author: Luke Wang <ziniu.wang_1@nxp.com>

mmc: sdhci-esdhc-imx: use pm_runtime_resume_and_get() in suspend

Replace pm_runtime_get_sync() with pm_runtime_resume_and_get() to
simplify error handling. pm_runtime_resume_and_get() automatically
drops the usage counter on failure, avoiding the need for a separate
pm_runtime_put_noidle() call. If it fails, the device is unclocked and
accessing hardware registers would cause a kernel panic, so return the
error immediately.

> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-=
esdhc-imx.c
> index c4a22e42628e4..97ee3f933bda7 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2060,7 +2060,9 @@ static int sdhci_esdhc_suspend(struct device *dev)
>  	 * 2, make sure the pm_runtime_force_resume() in sdhci_esdhc_resume() r=
eally
>  	 *    invoke its ->runtime_resume callback (needs_force_resume =3D 1).
>  	 */
> -	pm_runtime_get_sync(dev);
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret)
> +		return ret;

[Severity: High]
This is a pre-existing issue, but it shares the exact same root cause as the
issue fixed here in sdhci_esdhc_suspend().

In sdhci_esdhc_imx_remove(), the return value of pm_runtime_get_sync() is
ignored and followed immediately by a hardware read:

drivers/mmc/host/sdhci-esdhc-imx.c:sdhci_esdhc_imx_remove() {
	...
	pm_runtime_get_sync(&pdev->dev);
	dead =3D (readl(host->ioaddr + SDHCI_INT_STATUS) =3D=3D 0xffffffff);
	...
}

As mentioned in the commit message for the suspend path, if the device fails
to resume (e.g., due to a clock enable failure), the hardware remains
unclocked, and accessing hardware registers could cause a kernel panic.

Should pm_runtime_resume_and_get() be used in sdhci_esdhc_imx_remove() as w=
ell
to avoid a potential kernel panic during driver removal if the resume fails?

> =20
>  	if ((imx_data->socdata->flags & ESDHC_FLAG_STATE_LOST_IN_LPMODE) &&
>  		(host->tuning_mode !=3D SDHCI_TUNING_MODE_1)) {

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629091954.3227=
151-1-ziniu.wang_1@oss.nxp.com?part=3D5
