Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3DE0369D46
	for <imx@lists.linux.dev>; Tue, 19 May 2026 10:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779188073; cv=none; b=lIRm5fyDZMaNAoXTlPJPKljhUmwO3Bp13TY38Gqg29l5akKxT3z2j2l0qN4Y3R4sZ5tbDcHvskWri3Z9Lc61XSx8HS6+EXR+3JNHrK1znz6sTtD1jvsvfmczCmxBS9a8cCwaxXBZlcQJiDGUIQGllKX7Ps9KRKzBvVgS4n8+hoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779188073; c=relaxed/simple;
	bh=kbsM1BfUqGFTgEGEC/GH+PREgS2XphoPqpl3JbeKltw=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=MaYoRyCcmDQsCajvxKvwhJkM9DVpHQF0eH/t0VFdiyuR/Vh9Dz5hUFa/NUqlO039aCKHUGBAXLNDGQjPx3gAkmH+rNys7vz/LrbVj0+ErTu7VsqEbLIUeEw4Wj81mgjYr8/CsPX2I4QIF3BC6t27uRugqBZve+N1GdrG/YT86Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6c/gKY+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6c/gKY+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26AC1C2BCB3;
	Tue, 19 May 2026 10:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779188073;
	bh=kbsM1BfUqGFTgEGEC/GH+PREgS2XphoPqpl3JbeKltw=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date:From;
	b=b6c/gKY+kaMkWaiC1rYmcvxgkIAgRayvPSTIleTsCLTcNEGSmfnw4ncENizT3btqN
	 Naz8pzC1l9X3Cc28FBXAgman+VaH04H6nYWxkvKbr8oRfqGOWosjzPZDYXTiRzYReF
	 bHWoEq1V08JH8yFn7FLc3xbz2CaIVlAE5A5ZAnpLHOo1pP5gv3YFwI6L7VLNn/JjkG
	 37njIK0lDLCrWRP9al3gvtOQLUPi63k/4Sdvc1QMlbprR6YTCWnSC4HB9/nowozwlD
	 Ymyzy5YcoNQAvER4QBkDO5tB/PEUl/OmAi/4DTSeuCPGEvYdDs9u92DD4NUJBnTAL/
	 6OjmaYtLSGavg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx-lpi2c: fix resource leaks switching to
 devm_dma_request_chan()
Reply-To: sashiko-reviews@lists.linux.dev
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260519104309.2794248-1-carlos.song@oss.nxp.com>
References: <20260519104309.2794248-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 10:54:32 +0000
Message-Id: <20260519105433.26AC1C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Switching to `devm_dma_request_chan()` causes a permanent leak o=
f the TX DMA channel and memory if the driver falls back to PIO mode during=
 probe.
--

commit 729c18e7d89832bc40637fdb4a408f7a43d89956
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx-lpi2c: fix resource leaks switching to devm_dma_request_chan()

This commit switches the DMA channel allocations to use devm_dma_request_ch=
an()
to let the device core manage the DMA channel lifetime and ensure proper
cleanup.

> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c

[ ... ]

> @@ -1407,32 +1396,26 @@ static int lpi2c_dma_init(struct device *dev, dma=
_addr_t phy_addr)
>  	dma->phy_addr =3D phy_addr;
> =20
>  	/* Prepare for TX DMA: */
> -	dma->chan_tx =3D dma_request_chan(dev, "tx");
> +	dma->chan_tx =3D devm_dma_request_chan(dev, "tx");
>  	if (IS_ERR(dma->chan_tx)) {
>  		ret =3D PTR_ERR(dma->chan_tx);
>  		if (ret !=3D -ENODEV && ret !=3D -EPROBE_DEFER)
>  			dev_err(dev, "can't request DMA tx channel (%d)\n", ret);
> -		dma->chan_tx =3D NULL;
> -		goto dma_exit;
> +		return ret;
>  	}
> =20
>  	/* Prepare for RX DMA: */
> -	dma->chan_rx =3D dma_request_chan(dev, "rx");
> +	dma->chan_rx =3D devm_dma_request_chan(dev, "rx");
>  	if (IS_ERR(dma->chan_rx)) {
>  		ret =3D PTR_ERR(dma->chan_rx);
>  		if (ret !=3D -ENODEV && ret !=3D -EPROBE_DEFER)
>  			dev_err(dev, "can't request DMA rx channel (%d)\n", ret);
> -		dma->chan_rx =3D NULL;
> -		goto dma_exit;
> +		return ret;

Does this code leak the TX DMA channel and the allocated dma memory if the
driver falls back to PIO mode?

If devm_dma_request_chan() successfully requests the tx channel but fails
to request the rx channel, this function returns an error without freeing
the tx channel.

In lpi2c_imx_probe(), if lpi2c_dma_init() returns an error other than
-EPROBE_DEFER (such as -ENODEV), the driver logs that it will use PIO mode
and allows the probe to complete successfully.

Because the probe ultimately succeeds, the devres framework will not execute
its cleanup actions. This leaves the TX DMA channel and the memory allocated
for the dma structure via devm_kzalloc() held indefinitely for the lifetime
of the device, even though DMA is completely disabled.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260519104309.2794=
248-1-carlos.song@oss.nxp.com?part=3D1
