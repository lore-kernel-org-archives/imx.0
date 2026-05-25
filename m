Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C763A874B
	for <imx@lists.linux.dev>; Mon, 25 May 2026 06:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779692239; cv=none; b=N/3xsZKSkuyqWd6xMQcRTDIYWBj4VyfKf3tgAfsMys/dIUVLcQsnT8DVzZ1y1lGId1J5Il+EpRy5zcS90zYvHy7CaS5ZcrvAO+Ub5YE3UmhjGwpCMhCl/OHEHdu/+feZoHUWdmz1nQgUZQcf5oopZXa0Z6+sA+/qAlQx5QIJpTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779692239; c=relaxed/simple;
	bh=iAB5mpB6eez9XE21ZPVaQ9IxcfnIgbWiX0RNBGlqTC8=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G0+2KsQSjPudprCjmt7GGFbId/gK6I8fGz8oeHIuVnJE/NOAoXqYaIc7TOkhpLtqk5D1eWIHHnXTnFpehUucWWlWYwiQ4dRG/FX3giunDXjrQs/V073yopRVYF35+Zj0tIi0q3ILmSg5a+TBV9X5uTSJmGkPhbLt47ZC3F2EU1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MI/HCDIQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MI/HCDIQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229011F000E9;
	Mon, 25 May 2026 06:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779692236;
	bh=AGfC8DgIlsE/OTic9V6mznFl3vl8tQ/OONZc+9q3pco=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=MI/HCDIQLcX/POiY/I1V0yqXons2n1HXRb7LGvIHpVnHlWV5BXB6eD4SKU7AuvP3t
	 Ag0taHTE5ySRdO1kOgjr71YJII+dyp+Z4ai9Ww4qde9CNqKN395iVT/IP1UId6XeR+
	 YY+Xe3TUnrNQFKavs5025rN+IKv96Bykt6Mpe2MSrmveQQKOJzacOcXYqgAfSsNfDZ
	 DvwStU7lPknt1cnnrQRXXOFqHSv8ReFYPbSRSC3QndbYny9e8AuBB6aRdodTeOIzRD
	 v7HDEc5D8GI2ilYAZxlXRQ+cMWwfV2hqT7132rGYWKS9LTLNb6qE9x7E+b2V+/T9Uv
	 dyhrRmgt+dbsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] spi: fsl-lpspi: replace
 dmaengine_terminate_all() with dmaengine_terminate_sync()
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525062357.3191349-2-carlos.song@oss.nxp.com>
References: <20260525062357.3191349-2-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 06:57:15 +0000
Message-Id: <20260525065716.229011F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `target_aborted` flag is cleared after starting the DMA transf=
ers, creating a race condition where a legitimate abort is ignored.
--

commit b7181deaf26f6bdf80d577aec5e2815b881a3f55
Author: Carlos Song <carlos.song@nxp.com>

spi: fsl-lpspi: replace dmaengine_terminate_all() with dmaengine_terminate_=
sync()

This commit updates the fsl-lpspi driver by replacing deprecated calls
to dmaengine_terminate_all with the newer dmaengine_terminate_sync API.
This ensures that any ongoing dma transfers are fully synchronized and
terminated before proceeding.

> diff --git a/drivers/spi/spi-fsl-lpspi.c b/drivers/spi/spi-fsl-lpspi.c
> index e201309f8aae3..1a94a42fac319 100644
> --- a/drivers/spi/spi-fsl-lpspi.c
> +++ b/drivers/spi/spi-fsl-lpspi.c
[ ... ]
> @@ -688,8 +688,8 @@ static int fsl_lpspi_dma_transfer(struct spi_controll=
er *controller,
>  			fsl_lpspi->target_aborted) {
>  			dev_dbg(fsl_lpspi->dev,
>  				"I/O Error in DMA TX interrupted\n");
> -			dmaengine_terminate_all(controller->dma_tx);
> -			dmaengine_terminate_all(controller->dma_rx);
> +			dmaengine_terminate_sync(controller->dma_tx);
> +			dmaengine_terminate_sync(controller->dma_rx);
>  			fsl_lpspi_reset(fsl_lpspi);
>  			return -EINTR;
>  		}

[Severity: High]
This is a pre-existing issue, but could this code miss a target abort due
to a race condition with the target_aborted flag?

Looking at fsl_lpspi_dma_transfer(), fsl_lpspi->target_aborted is
unconditionally set to false after issuing the tx and rx dma channels:

    dma_async_issue_pending(controller->dma_tx);
    fsl_lpspi->target_aborted =3D false;

If a target abort occurs concurrently immediately after the dma channels
are issued, fsl_lpspi_target_abort() will execute, set target_aborted
to true, and complete both dma completions.

The main thread will then overwrite target_aborted with false.

When it reaches wait_for_completion_interruptible(), it would return 0 due
to the early completion, and evaluate the target_aborted condition as false.

Would this cause the driver to incorrectly assume the transfer was successf=
ul
and return 0 without calling dmaengine_terminate_sync()?

If so, it appears the spi core could unmap and free the buffers while
the dma channels are still actively running, potentially leading to
memory corruption or iommu faults during a subsequent transfer.

Is this sequence possible, and should target_aborted be cleared before
starting the dma transfers instead?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525062357.3191=
349-1-carlos.song@oss.nxp.com?part=3D1
