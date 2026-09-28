Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E2349BD96
	for <imx@lists.linux.dev>; Mon, 28 Sep 2026 11:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790596750; cv=none; b=Oic45T2fELBdFOhtKGQrMrca8MMsiSewuaJ+I4bdrQ+6czXEK/ij+wJqMWTWx6kT0tKyAAgG2QvT3ojqW0RJ7/RGbBvgY296ujnisqmqGkgH3SDoegYMWW3l6i/SwS1i1FVXXLIsEx2kNLAOYpVi0Iz1zFjiSDBbmLHIzh9fB5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790596750; c=relaxed/simple;
	bh=GqBcrJjbq6u4je43/m7ICLJqqp4PSffC734DyZd791Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t3kHbWe+TDZEGSxvfJqSaKXKzO1UnPG5pdMjauXo6YLof+jpAIobeS1VADMquIW/N2uv0H4s7DS7wbyUSNiEKeDQiRV2uxg2ugJ/IZLSAOzoF1OBTQ6u88fL/O/uvWcyRM6+Jb4her9iotwz7oF74km6O8ZEhY5KIdvmSM8BEyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=himTQREE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="himTQREE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1D431F000FF;
	Mon, 28 Sep 2026 11:59:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790596748;
	bh=VbnGGAumAwDvYkwRMymhn4pKYEBSUXMdxMHzlQt77Cg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=himTQREEHgFeXBiaRfuRJJ7K8H7ONAq39IMHWpfkmh97osFNP2Jfep8u/hG4jUoDk
	 sDQvmqOPWquOVDxbqTl14R+r80/Hfs50jGBN/C+6DigO6UPBrexqGMxo9jcttdqiRe
	 UJVTowatYXrptJLQpqZDGbGj0fjhJFHqJBemf1cfNbzco5gsd5Q6a6dPTXQZr1rIDb
	 tMhvoqNzjNC0IhoBk6wc3XwalIhjJ4qXn9cZvp6gaYB9N7qiJOKtNdoEBqbyWv15c6
	 6g9XgfD/Jhoudg9qEj/MNk6SnMwfdz4kEWUdECJOVMYVQ0h5TusTJ7XAnmzxrY6aoG
	 kUPFGloKY/2iw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] spi: spi-nxp-fspi: exit stop mode before waiting for
 DLL lock
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260928-fspi-fix-v1-1-a0f9288cd5c8@nxp.com>
References: <20260928-fspi-fix-v1-1-a0f9288cd5c8@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 11:59:07 +0000
Message-Id: <20260928115907.F1D431F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi: nxp-fspi: DLL registers programmed outside stop mode
--

commit 51952120b76fbf34aadd629657697e2fb0e3c938
Author: Haibo Chen <haibo.chen@nxp.com>

spi: spi-nxp-fspi: exit stop mode before waiting for DLL lock

This commit addresses an issue where the DLL lock polling times out because
the serial root clock is gated in stop mode. To fix this, it moves the
exit from stop mode ahead of the DLL calibration step. However, this
causes the DLL control registers to be programmed while the module is activ=
e.

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 67d991dd249d2..66cb58f95fdb1 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
> @@ -898,10 +898,10 @@ static int nxp_fspi_select_mem(struct nxp_fspi *f, =
struct spi_device *spi,
>  	dev_dbg(f->dev, "Target device [CS:%x] selected\n", spi_get_chipselect(=
spi, 0));
> =20
>  	/*
> -	 * Per the FlexSPI reference manual (initialization sequence), MCR0 and
> -	 * the DLL control registers should be configured while the module is in
> -	 * stop mode (MCR0[MDIS] =3D 1). Enter stop mode before reconfiguring t=
he
> -	 * RX sample clock source and the DLL, then exit stop mode afterwards.
> +	 * Per the FlexSPI reference manual (initialization sequence), MCR0
> +	 * should be configured while the module is in stop mode (MCR0[MDIS] =
=3D 1).
> +	 * Enter stop mode before reconfiguring the RX sample clock source, then
> +	 * exit stop mode afterwards.
>  	 */
>  	reg =3D fspi_readl(f, f->iobase + FSPI_MCR0);
>  	fspi_writel(f, reg | FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);

[ ... ]

> @@ -936,6 +936,16 @@ static int nxp_fspi_select_mem(struct nxp_fspi *f, s=
truct spi_device *spi,
>  	if (ret)
>  		return ret;
> =20
> +	/*
> +	 * Exit stop mode before running the DLL calibration. The DLL
> +	 * reference clock is derived from the module clock domain, which is
> +	 * gated while MCR0[MDIS] =3D 1. Calibrating the DLL in stop mode leaves
> +	 * the STS2 lock bits stuck at 0 (the DLL never runs), so clear MDIS
> +	 * first and let the module and reference clock run.
> +	 */
> +	reg =3D fspi_readl(f, f->iobase + FSPI_MCR0);
> +	fspi_writel(f, reg & ~FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);
> +
>  	/*
>  	 * If clock rate > 100MHz, then switch from DLL override mode to
>  	 * DLL calibration mode.
>  	 */
>  	if (rate > 100000000)
>  		nxp_fspi_dll_calibration(f);
>  	else
>  		nxp_fspi_dll_override(f);

[Severity: High]
Since stop mode is exited before calling nxp_fspi_dll_calibration(), does
this result in the DLL registers being programmed while the module and
clocks are active?

Looking at nxp_fspi_dll_calibration(), it writes to the DLL control registe=
rs
(FSPI_DLLACR and FSPI_DLLBCR) before polling for the lock:

static void nxp_fspi_dll_calibration(struct nxp_fspi *f)
{
	...
	/* Reset the DLL, set the DLLRESET to 1 and then set to 0 */
	fspi_writel(f, FSPI_DLLACR_DLLRESET, f->iobase + FSPI_DLLACR);
	...
	/* Enable the DLL calibration mode. */
	fspi_writel(f, FSPI_DLLACR_DLLEN | FSPI_DLLACR_SLVDLY(0xF),
		    f->iobase + FSPI_DLLACR);
	...
}

Will writing to the DLL control registers outside of stop mode violate the
hardware constraints or inject severe jitter into the sampling clock domain?

Should the register configuration part of the DLL calibration remain in
stop mode, with only the STS2 lock polling delayed until after stop mode
is exited?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260928-fspi-fix-v=
1-1-a0f9288cd5c8@nxp.com?part=3D1
