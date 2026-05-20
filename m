Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043913955C4
	for <imx@lists.linux.dev>; Wed, 20 May 2026 10:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271236; cv=none; b=cfP3PGeaLUM8HSOml60m+EwpKt0N6mkTSvzurq+4x9eiLZvUhOU+lSpYf+tNXEAzuPfHgsxLKP9U23ewJQdu+5OvTXvKGKMA141awk5h6MqJzIB0JGXIlyCi7KLXKAkn31LECWmceBInNKFjmR1DNGTg6argWIeqtt4vWI8AQro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271236; c=relaxed/simple;
	bh=0YYj2Amngi2rUPkMp7bZftJygSU9wxR54Afde9Qwn+U=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=R4vtmC9aWWkinX+W34EvYIqIBtZc60+CeCGvujnOh1zJW+WtkslykJdmqkbUGd0rmZAyE6SrrrimjtezMg9G1h9W8BkYTdwuyMZDMaLZ3FWQykDDNwPEYGOVpY2mifOLY8xK4ug772DakO3uZ60BMipk9DtBdbcfzI07W1meES0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c6JIAbJB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c6JIAbJB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F4D1F000E9;
	Wed, 20 May 2026 10:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271234;
	bh=cvubTdTbBCi6A/+OcCEUEdo4NTFyJFaBg9uty87oAqg=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=c6JIAbJBr6kB0jsQPBb3/AdyccLzgo78SqOWU7VlGQITcRmNqItbLUnzbqG8mw/TE
	 mXu9l2YmYfS1qljjOUVY0uJ03rEmZfaZZeZ14l1w7WfMAbBCYj1jjUF9Q00WOjB4fn
	 3S4ryRaoIFqzYfG7PLNzZSOFWVw3MGwdfgt2eNFwNBkOS/uQwpBvqSzQqKe52NSK4O
	 tb12gXENdtHlDnq5E4mbac+OjJqs0ETpiQ+hIWuvL/xQSC5IN8hhpWOKGawWUNqtP/
	 Yl2n5jg+8zQB6+FG1mZ9qoMxvBG2qOag5wVqq6j2vTUPOSVANf241y/qZEWjY3Vm9/
	 Eg/LU993etazQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] spi: fsl-lpspi: replace dmaengine_terminate_all
 with dmaengine_terminate_sync
Reply-To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260520094308.2882892-2-carlos.song@oss.nxp.com>
References: <20260520094308.2882892-2-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 10:00:34 +0000
Message-Id: <20260520100034.A4F4D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless initialization of `target_aborted` after `reinit_completi=
on` overwrites concurrent aborts, causing missed DMA termination and memory=
 corruption.
--

commit ad3a6e81718f2fdf6938f3f573651fd3ac718677
Author: Carlos Song <carlos.song@nxp.com>

spi: fsl-lpspi: replace dmaengine_terminate_all with dmaengine_terminate_sy=
nc

This commit replaces the deprecated dmaengine_terminate_all API with
dmaengine_terminate_sync to improve the fsl-lpspi driver.

> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
> index e201309f8aae3..1a94a42fac319 100644
> --- a/drivers/spi/spi-fsl-lpspi.c
> +++ b/drivers/spi/spi-fsl-lpspi.c
[ ... ]
> @@ -688,8 +688,8 @@ static int fsl_lpspi_dma_transfer(struct spi_controll=
er *controller,
>  			fsl_lpspi->target_aborted) {

[Severity: High]
This isn't a bug introduced by this patch, but could this target_aborted ch=
eck
miss concurrent aborts due to a race condition earlier in the function?

In fsl_lpspi_dma_transfer(), the driver locklessly sets
fsl_lpspi->target_aborted =3D false after reinitializing the completions and
issuing pending DMA transfers.=20

If the SPI core or a slave protocol driver calls spi_target_abort()
concurrently, the abort handler will set target_aborted =3D true and signal=
 the
completions.

Thread execution ordering could cause the fsl_lpspi->target_aborted =3D fal=
se
assignment to immediately overwrite the true abort state. When the driver
subsequently waits on the completions here, it consumes the abort signal but
fails this check because the flag evaluates to false.=20

Since the driver falsely assumes the transfer completed successfully,
it skips calling the dmaengine_terminate_sync() added in this block. The
SPI core would then proceed to unmap the scatterlist buffers while the DMA
is still actively transferring data, which leads to writing into unmapped
or freed memory.

>  			dev_dbg(fsl_lpspi->dev,
>  				"I/O Error in DMA TX interrupted\n");
> -			dmaengine_terminate_all(controller->dma_tx);
> -			dmaengine_terminate_all(controller->dma_rx);
> +			dmaengine_terminate_sync(controller->dma_tx);
> +			dmaengine_terminate_sync(controller->dma_rx);
>  			fsl_lpspi_reset(fsl_lpspi);
>  			return -EINTR;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520094308.2882=
892-1-carlos.song@oss.nxp.com?part=3D1
