Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF40A35200A
	for <imx@lists.linux.dev>; Tue, 19 May 2026 11:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779189385; cv=none; b=bu9etS7XBN5t2LIFGMp6vZpOC+08vIdjd1yPG6t4wGnaehLpZLKbepJTB+n/P269mhaB8PluzhbFyUlDyr4qlkQ0zzX3R5uInl7C/9OTry1zlCvQHIaoGwo/a6rKs+yRmWvW5kT+cOXRxhKWvCDktgl0Vjnaay9+0UFuwjW0xI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779189385; c=relaxed/simple;
	bh=3OyZagvs/c/AZ3thfNtj/zpz0ROajpZkPUCJZ6VG7r4=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f9bEp/ASN/neL9196pALeK/+OntRxRlf+qZAIro3D1sAhaXpPoJ0RHdxkco1NZbYhD20xo6d1yoePQnqQk0uXf9rNyIz4WcO/9UflEjDDC5XJvKyGUfTPakizWBYb7tnBuOUbbXuJq66UfrYQiS5H6rmxgXBuIJvTVgJ1tKwFeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B11IrVm+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B11IrVm+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8328C2BCB3;
	Tue, 19 May 2026 11:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779189384;
	bh=3OyZagvs/c/AZ3thfNtj/zpz0ROajpZkPUCJZ6VG7r4=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date:From;
	b=B11IrVm+WSrFjKS3eV6UPHyVXvsRx6XbMMMvW0g4GuTOh9Q22yBZSi3Avde4k3oh6
	 u1J09PCFioThFQvL5kV3lfjc4a+oA22aF7Qvx2RPbtF7BHPcEkH2RbRq7C7AG6vN8K
	 jXqfCv9vWSUyED9Xk13oQNIaOqbsg5s6OOy+Mqaon5tpHPgXe0D9czFyz+CYK6EiiM
	 34psKkMW3ITDZLOa7eVT43ldm6sEDEXOOE9RD/kiSpTkxhvDbluHGS+M8dqvfsGxSv
	 CLAiE1lyexnJvgF88C8Ntw0Bk2w0Y1cq4DQLWy/o8cvXQ8gqK4Enu1z0oYXWNrLDaf
	 l1wQVt8cmKLEQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] spi: imx: replace dmaengine_terminate_all with
 dmaengine_terminate_sync
Reply-To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260519104659.2794476-1-carlos.song@oss.nxp.com>
References: <20260519104659.2794476-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 11:16:17 +0000
Message-Id: <20260519111624.B8328C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] In target mode, a target abort will not wake up DMA transfers, lea=
ding to a permanent hang of the SPI worker thread.
--

commit 573a78e09f9746dd840d3530cc2836c91d1a815b
Author: Carlos Song <carlos.song@nxp.com>

spi: imx: replace dmaengine_terminate_all with dmaengine_terminate_sync

This commit updates the driver to use dmaengine_terminate_sync() instead of
the deprecated dmaengine_terminate_all() API.

> diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
> index 480d1e8b281f1..ae9912905c67a 100644
> --- a/drivers/spi/spi-imx.c
> +++ b/drivers/spi/spi-imx.c
[ ... ]
> @@ -1793,15 +1793,15 @@ static int spi_imx_dma_submit(struct spi_imx_data=
 *spi_imx,
>  		if (wait_for_completion_interruptible(&spi_imx->dma_tx_completion) ||
>  		    READ_ONCE(spi_imx->target_aborted)) {

This is not a bug introduced by this commit, but looking at this target mode
wait logic, will a target abort actually wake up the DMA transfers?

Because wait_for_completion_interruptible() blocks until the completion is
signaled or a task signal is received, it appears the worker thread will not
wake up to evaluate READ_ONCE(spi_imx->target_aborted).

If the host aborts the transfer and stops providing the clock, the DMA
completion might never arrive. Could this cause the SPI worker thread to
hang indefinitely waiting for a DMA completion?

It looks like spi_imx_target_abort() sets spi_imx->target_aborted to true
and signals spi_imx->xfer_done, but doesn't signal the DMA completions.
Would it make sense to also complete the DMA completions during an abort to
prevent this potential hang?

>  			dev_dbg(spi_imx->dev, "I/O Error in DMA TX interrupted\n");
> -			dmaengine_terminate_all(controller->dma_tx);
> -			dmaengine_terminate_all(controller->dma_rx);
> +			dmaengine_terminate_sync(controller->dma_tx);
> +			dmaengine_terminate_sync(controller->dma_rx);
>  			return -EINTR;
>  		}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519104659.2794=
476-1-carlos.song@oss.nxp.com?part=3D1
