Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDD0F35677D;
	Thu, 13 Aug 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786605274; cv=none; b=mZhZmYaN5IBNGYgdzIvb9ZBV2twhvbsj2i5bWriBcHu8HH20IyqA4EyQtiXE15AALUGQ8peMNuakDCDAsrgQGAr+/SuFJSjnAvBObFitqW+HORDjG4Y44H5og3f/y/YI7Oez+HF/WVvNrIxdYxPnVU6fZdLmdBkR+tj/DlD/3j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786605274; c=relaxed/simple;
	bh=WFn4/56qD31+Nm2nvIptWxIoRCBxnMNo4Xlp13NIjXU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FvUfruNCsTX1hc5rIAAW500I+JBTBsL3SHKbsT7vOo7yNEtdjQ5D541B3d3mjETzsuNe1ORqr7+REwO6tvGoHQD7Ujz4U4/99bG6TTIdMwiEMoE7A9XuigyGOb7BU11U6Fsu2iFGZNGr1roty8iMKFMYK7EgiHuCBiDc3MLL13s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eActJrwR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eActJrwR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553991F000E9;
	Thu, 13 Aug 2026 07:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786605273;
	bh=szEJWO9bin1FzsdCPw5O7PwHy3mXnjRGfBGCkTiysYc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eActJrwRa7SYnn5lmRhECM782sIK5wbj3F8uX7Tly5e334yaJmncpfJIXVfM0Jpyj
	 aw82IdoPtJvPpEJQIsj33NtJC2JUFSeFiW2tKng4jzrwkrLpKBo8eq2imgB9FcNxbe
	 2M9P4c/Uq8wWL72i7xLp1QJYH8j9yGVImTIGrmnZ2vQPpuXURYC53KkX7RS8Xzu8fv
	 UQtWBoVbh79WC/uaDdcqbbyb6WN3pylzOoTjgQQG1kHqIaUwccwl0AeNZCvDqyag1a
	 ABP2X2Z3ASoWUxTZfGxEGbVACbmY0b//9OA4XLQr2nKUgy/tTfOV4PkUyqiT086TFr
	 vPV5ceyUk9s/g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 4/5] ASoC: fsl_asrc: expose individual DAIs per
 conversion path
Reply-To: sashiko-reviews@lists.linux.dev
To: shengjiu.wang@oss.nxp.com
Cc: robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260813070020.719810-5-shengjiu.wang@oss.nxp.com>
References: <20260813070020.719810-1-shengjiu.wang@oss.nxp.com>
 <20260813070020.719810-5-shengjiu.wang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 13 Aug 2026 07:14:32 +0000
Message-Id: <20260813071433.553991F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] ASoC component is unregistered via devres after hardware clocks ar=
e disabled in remove(), leading to system hangs if an active stream is term=
inated during driver unbind.
--

--- Patch [4]: [PATCH v4 4/5] ASoC: fsl_asrc: expose individual DAIs per co=
nversion path ---
commit c1765b1c3c3716b7c2b1c94ee1d7914bfa585bff
Author: Shengjiu Wang <shengjiu.wang@nxp.com>

ASoC: fsl_asrc: expose individual DAIs per conversion path

This commit replaces the single fsl_asrc_dai instance with an array of
three DAI drivers to allow multiple independent conversion paths to be
used simultaneously. It updates the probe function to register all three
DAIs.

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 2755ee57c6a17..a5d6c4c1e9292 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c

[ ... ]

> @@ -1393,7 +1442,7 @@ static int fsl_asrc_probe(struct platform_device *p=
dev)
>  		goto err_pm_get_sync;
> =20
>  	ret =3D devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
> -					      &fsl_asrc_dai, 1);
> +					      fsl_asrc_dai, ARRAY_SIZE(fsl_asrc_dai));

[Severity: High]
This is a pre-existing issue, but does using devres to register the ASoC
component cause a race condition during driver unbind?

Since the component is registered with devm_snd_soc_register_component(),
it won't be unregistered until the devres release phase, which happens
after fsl_asrc_remove() finishes.

If an ALSA stream is active during unbind, fsl_asrc_remove() gates the
ASRC IPG and MEM clocks:

fsl_asrc_remove() {
	...
	pm_runtime_disable(&pdev->dev);
	if (!pm_runtime_status_suspended(&pdev->dev))
		fsl_asrc_runtime_suspend(&pdev->dev);
}

During the window between fsl_asrc_remove() completing and the devres
release phase unregistering the component, the PCM streams and DMA
channels are still active.

Can the DMA controller attempt to access the clock-gated ASRC FIFOs
during this window, resulting in a synchronous bus fault or asynchronous
external abort?

Would it be safer to use snd_soc_register_component() here instead, and
manually call snd_soc_unregister_component() early in fsl_asrc_remove()
before gating the hardware clocks?

>  	if (ret) {
>  		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
>  		goto err_pm_get_sync;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260813070020.7198=
10-1-shengjiu.wang@oss.nxp.com?part=3D4
