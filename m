Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE1A218ADD
	for <imx@lists.linux.dev>; Wed, 27 May 2026 08:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779871636; cv=none; b=bIWIG4XWoy2mg/tmUZcDctpzU8z6VQ3qAIqD1A3Tr0ej5I8khQUyVyIJMs+Aa5jQtzFu6m6VsUU9nBPaI3r/293euk6YeT9YFLz0soLmjnom/eFYlsjomqFvq/AWU2wnuZpUYXBvQJVQS7EIcrtMrSFsLyCfSeexHQ1VHj7QgcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779871636; c=relaxed/simple;
	bh=8qFKuGl7HzlRDiAfQxdX2hqc36FDtA05upJ3EB77ydM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AHD7RKRLt/gvFJn1zxxOR/hUovSn6T5TFISwnNlE5/7dzBThSG4sctS6fzraJF7RluYqwqgrLFdjyRDSaJXRdOioefJfA5RLKJEkMnDmb2RyF2HVcVEIgudc55gJkmW6R44hO6BFYWMtnEmJCB5LP8Nz7FDASR0K8RhQ9aipEAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E9muitEz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E9muitEz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04E571F000E9;
	Wed, 27 May 2026 08:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779871635;
	bh=j5+4ZfTRFtXaLWkvco/oLi35R/MgvATxYogz6fgqFsE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E9muitEz9VsWpO/LANiHXdARTT1+HfmrhXCBgb5qb/eCuQe5B0nsy/bxaS2Qv2jBR
	 UMuYo25G7u10JJiM2iNpbZ/3JFZL+ldElXXhRN3v+tUKlxIGlfnDkZWRF+QT6Uu0ch
	 A2ANAKZPanZVAW1uPGrFQXLa2VoA3pVUj4G5DzBmqbE4keNNwQbyqYUj3sZ7/7HELe
	 bRXvPjePE54Asw23ApQ3ZF4p9GywVkFmpHGhshKn8/Cf67b0wAxXYylnxqBlbXp0Fz
	 3Zj0k36HoihishYQrHL6L5w0KhafOzM/C1IZZCsT1dEIAv8u1mEN5+fHbDeREELtOv
	 9AJtXUZWNkAGg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: imx8mq-mipi-csi2: fix memory leak in
 imx8mq_mipi_csi_probe()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dawei Feng" <dawei.feng@seu.edu.cn>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260527080624.1717938-1-dawei.feng@seu.edu.cn>
References: <20260527080624.1717938-1-dawei.feng@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 May 2026 08:47:14 +0000
Message-Id: <20260527084715.04E571F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing error check for `clk_bulk_prepare_enable()` in `imx8mq_mip=
i_csi_pm_resume()` leads to system crash or unbalanced clock disables.
--

commit 935fcca957b385ca79350304bd28e2f2dc8609da
Author: Dawei Feng <dawei.feng@seu.edu.cn>

media: imx8mq-mipi-csi2: fix memory leak in imx8mq_mipi_csi_probe()

This commit introduces a dedicated subdev cleanup label in the probe functi=
on.
It ensures that subdev resources are correctly released if errors occur dur=
ing
interconnect initialization or runtime resume, preventing a memory leak.

> diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c b/drivers/medi=
a/platform/nxp/imx8mq-mipi-csi2.c
> index 04ebed8a0493e..e5a062cc07886 100644
> --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> @@ -1016,7 +1016,7 @@ static int imx8mq_mipi_csi_probe(struct platform_de=
vice *pdev)
> =20
>  	ret =3D imx8mq_mipi_csi_init_icc(pdev);
>  	if (ret)
> -		goto mutex;
> +		goto subdev;
> =20
>  	/* Enable runtime PM. */
>  	pm_runtime_enable(dev);

[Severity: High]
This isn't a bug introduced by this patch, but does imx8mq_mipi_csi_pm_resu=
me()
handle clock enablement failures correctly?

If clk_bulk_prepare_enable() fails inside imx8mq_mipi_csi_pm_resume(), the
return value is assigned to ret but not evaluated before the function proce=
eds:

imx8mq_mipi_csi_pm_resume() {
...
	if (!(state->state & ST_POWERED)) {
		state->state |=3D ST_POWERED;
		ret =3D clk_bulk_prepare_enable(state->num_clks, state->clks);
	}
	if (state->state & ST_STREAMING) {
...
}

If the device was streaming before suspend, it seems it will attempt to res=
tart
the stream via imx8mq_mipi_csi_start_stream(). Since that function writes to
hardware MMIO registers while the clocks are not running, could this trigger
a bus exception and crash the system?

Additionally, since ST_POWERED is unconditionally set, could a subsequent
suspend operation invoke clk_bulk_disable_unprepare() on unenabled clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527080624.1717=
938-1-dawei.feng@seu.edu.cn?part=3D1
