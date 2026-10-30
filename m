Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793373633;
	b=1P7Nuz0XcJZAXeuD3mFBaiaGZcu/zgk4Lhfd74ENK4PXB7CacmQuJr+7T422e9rT0zfZ
	 yrPRNYK7dNugqMapAEsygWaNscCRg80lyJt9ztsBVyO2q9FuQMjPZYP/Cd2bt3rkFxhJz
	 TAYBLADdL2krqHkypHlKWhyf6OLYxETvDI3mU/faijoufrtdyvpq3XvEqMldUma9tsWlv
	 4DgfHdjIuxApOOU9N+nTIwc5JkuBK5t7VAttUNQHKjqV4vwVxN2Q/9Kin2rdmTVAQwDsj
	 IiZcA5nlcLHbcYFYXBbE41oz0uSAX3IWJMzrF+uKw1d6DFBLfIxk/pozIlE+jG/fbtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793373633;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=Va0qgRoJC+I6P43e2l3958jRXn40zSbCj1URiH+FBbA=;
	b=2QZ1c72ky1sXD2iUj02I5XS0AO3Pe0ZNm2737v/APAbZ1d6n2+XAE3QjdE4LWLifBvCt
	 kYE1pArvoDka0tjL/uxYEsnPKqbUd5S31AbfC2bjIfjUaqgppH3UZ5pApoCFm2L7fmNV7
	 JGFppNw4cY2E9iAaqd3NmObfufqoCSs9B78e6072dE9tI93CJjjol3IPjlb66Ce1k1icb
	 r/nO+DcD/7y6vBiuowYHVlA89FWb6mjrliWSxdY5lPflmuBajHijuS/tTgED3Bb/4SrWE
	 ow7Nz1DGjE7vOrTfiPf4qdAdKXslWXDSBKM1MlE8W+wt6PmliJ8P3tP3mlA7W6yQkMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0KeBoD5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF2606A323
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 15:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y0KeBoD5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E9901F000C1;
	Fri, 30 Oct 2026 15:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793373632;
	bh=Va0qgRoJC+I6P43e2l3958jRXn40zSbCj1URiH+FBbA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y0KeBoD53Ydllwz2in3UhuiHG2bujYRXt3cOrbJS8W98PxnrG4HJx+ZCFZJSpSkzp
	 /uoT2guTiI9ng75XMKcPVvCbunXgpcgvHXqe+3xNw/xy7Y3dfvDFb27vv6Oaen00na
	 ylaNBfo4HIDyDxW4I8FfCuifAlMJYzS3PpRi+bokcbLio4PEU5IisVvpIhAHOIuXCX
	 2dFDkKGbLe9Gkff3SS1Ph7CadEluB0igIPFOeTzY/sSBDZ+cKETNLXLPCJV4JHFASJ
	 lOOOZ52kWpSlQwrWe2/COaCCzcBcieuMEy04uHSMHj59MK6P7cFhwBF7kbbZMMlpM8
	 2F6ZYEpz7I01A==
Message-ID: <sashiko-outbox-191156@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] mtd: rawnand: gpmi: terminate the DMA chain on
 completion timeout
Reply-To: sashiko-reviews@lists.linux.dev
To: "Samarth Narang" <samarth.colleges@gmail.com>, "Han Xu" <han.xu@nxp.com>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Richard Weinberger" <richard@nod.at>, imx@lists.linux.dev, linux-mtd@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20261030150929.2944717-1-samarth.colleges@gmail.com>
References: <20261030150929.2944717-1-samarth.colleges@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 30 Oct 2026 15:20:32 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] mtd: rawnand: gpmi: unsynchronized DMA termination in gpmi_nfc_e=
xec_op()
--

commit f9aac792f98d50292f01d08b01dd1b06dcf84ac0
Author: Samarth Narang <samarth.colleges@gmail.com>

mtd: rawnand: gpmi: terminate the DMA chain on completion timeout

This commit calls dmaengine_terminate_sync() before unmapping DMA buffers
when a DMA completion timeout occurs in gpmi_nfc_exec_op(), intending to
stop the APBH DMA channel and prevent stale descriptors from running against
unmapped buffers.

> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nan=
d/raw/gpmi-nand/gpmi-nand.c
> index 527165ccc839d..86163a552aad8 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -2659,6 +2659,7 @@ static int gpmi_nfc_exec_op(struct nand_chip *chip,
>  	if (!to) {
>  		dev_err(this->dev, "DMA timeout, last DMA\n");
>  		gpmi_dump_info(this);
> +		dmaengine_terminate_sync(get_dma_chan(this));

[Severity: Medium]
Does dmaengine_terminate_sync() actually synchronize with the channel IRQ
and completion tasklet on mxs-dma?

In drivers/dma/mxs-dma.c, mxs_dma_probe() does not implement
device_synchronize, so dmaengine_synchronize() is a no-op, and
mxs_dma_terminate_all() resets the channel without killing mxs_chan->tasklet
or clearing mxs_chan->desc.callback:

drivers/dma/mxs-dma.c:mxs_dma_terminate_all() {
	mxs_dma_reset_chan(chan);
	mxs_dma_disable_chan(chan);

	return 0;
}

Furthermore, when mxs_dma_reset_chan() resets an active APBH channel (or if
a late completion interrupt races with the timeout), mxs_dma_int_handler()
fires for the termination error (err =3D=3D 0x01) or completion and schedul=
es
mxs_chan->tasklet:

drivers/dma/mxs-dma.c:mxs_dma_int_handler() {
	...
	if (err) {
		dev_dbg(mxs_dma->dma_device.dev,
			"%s: error in channel %d\n", __func__,
			chan);
		mxs_chan->status =3D DMA_ERROR;
		mxs_dma_reset_chan(&mxs_chan->chan);
	}
	...
	/* schedule tasklet on this channel */
	tasklet_schedule(&mxs_chan->tasklet);
}

Because mxs_chan->tasklet is not synchronized before
dmaengine_terminate_sync() returns, could mxs_dma_tasklet() run
dma_irq_callback(this) and complete this->dma_done after a subsequent
gpmi_nfc_exec_op() call has already reinitialized this->dma_done and
submitted a new transfer, causing the new operation to complete prematurely
and unmap its buffers while DMA is still active?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261030150929.2944=
717-1-samarth.colleges@gmail.com?part=3D1
