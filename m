Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8518A3DA5AD
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517434; cv=none; b=hIkK5cGcu4dRc2FUPBOSehOvk9boGVAnDRxXWABL3cJeJBpbnOllRaFj+Bg6TiIo3NmJWAQ5CibDva0YBm4qh+p9qbQuF16UtwWhoRvu1Zkk0zbnHDAfFY0HYDuaCAAALN27hPZy8Ydtv1IL+XKrabL0IYTNLXBrSRpWYH/tm14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517434; c=relaxed/simple;
	bh=nasQA958y5JCBUjTpn7E3bLFMUJgrf4SrzJsYvMqNZg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=bGc+sZZ3YbzOpE6kXi/GjR6CIs9EpG39MWxFtxrLAX5PAeCfj/j7mOUw6ZAAazpfaP3FRceIVWECYmqLqQ87RFMSknykSvP/g7NhIK0b7jTQ2J0Q7/rfHDzSi0B2SGtj4uDca/ugjPBeJYkQRPu5xeS6gI+Nx2niclzkohWskV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H1in776c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H1in776c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F266F1F000E9;
	Mon, 15 Jun 2026 09:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781517433;
	bh=w5ofyY9rKWI9sl9NMgiSLZS7+EL4l7jK2Qusz7lsLuE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H1in776cshsUaglaSXvh2xUqQgRZxPOhRRCJUiSZ0CQz74sma/dVBIRZRG6+Iz7P5
	 mcAIdlHxRtLFnRwbRXy1OOABGckScYAqSBkctcOtCGO3YVNiQ1jLMKKfk14q3zCqdo
	 RFVFQMXSWBPAA+kx04IEkKvnjIS/PZ/1WJvH8Aduw0H8dkwGekN97IwiJX4zoNFlaa
	 3PYpQaZj2Zkm+2P9+6GUTgyVftQ6KQMszzQWbQRnAYGvu42TFYJJYlE85owZJWaWDc
	 04KtIfu+XfsZemmyL/HsqASMI3Yz782XZSh+w+FFNtSAca3Td9rjlNF5c/b2SrAScT
	 bDBz9zWLgToOQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/11] ASoC: fsl: mpc5200_dma: Use guard() for spin
 locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260615093824.115751-11-phucduc.bui@gmail.com>
References: <20260615093824.115751-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 09:57:12 +0000
Message-Id: <20260615095712.F266F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `psc_dma` structure is freed in `mpc5200_audio_dma_destroy()` =
before the ALSA components are unregistered, leading to a use-after-free an=
d locking of freed memory if userspace invokes component operations during =
module unbind.
--

commit d1f00eba902c807bb72ff7810e5332f8b08165b6
Author: bui duc phuc <phucduc.bui@gmail.com>

    ASoC: fsl: mpc5200_dma: Use guard() for spin locks

This commit cleans up the spin lock usage in the mpc5200_dma driver by
converting it to use the scoped_guard() macro.

> diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
> index 56e2cf2f727ba..bfedb2dea0b32 100644
> --- a/sound/soc/fsl/mpc5200_dma.c
> +++ b/sound/soc/fsl/mpc5200_dma.c
[ ... ]
> @@ -135,19 +136,18 @@ static int psc_dma_trigger(struct snd_soc_component=
 *component,
>  		/* Fill up the bestcomm bd queue and enable DMA.
>  		 * This will begin filling the PSC's fifo.
>  		 */
> -		spin_lock_irqsave(&psc_dma->lock, flags);
> -
> -		if (substream->pstr->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
> -			bcom_gen_bd_rx_reset(s->bcom_task);
> -		else
> -			bcom_gen_bd_tx_reset(s->bcom_task);
> +		scoped_guard(spinlock_irqsave, &psc_dma->lock) {

[Severity: High]
This isn't a bug introduced by this patch, but could this code race with
module unbind and dereference a freed psc_dma pointer?

During driver removal, the callbacks (like psc_i2s_of_remove) manually call
mpc5200_audio_dma_destroy(), which frees the psc_dma object and clears the
driver data:

sound/soc/fsl/mpc5200_dma.c:mpc5200_audio_dma_destroy() {
    ...
	kfree(psc_dma);
	dev_set_drvdata(&op->dev, NULL);
}

However, the ALSA component is registered via devm_snd_soc_register_compone=
nt(),
meaning it remains registered and accessible to userspace until the devres
teardown runs after the remove callback returns.

If userspace invokes a PCM operation during this window, ALSA could call
psc_dma_trigger(), which fetches the driver data (now NULL or pointing
to freed memory) and attempts to acquire the lock here using scoped_guard(),
leading to a use-after-free or NULL pointer dereference crash.

> +			if (substream->pstr->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
> +				bcom_gen_bd_rx_reset(s->bcom_task);
> +			else
> +				bcom_gen_bd_tx_reset(s->bcom_task);
> =20
> -		for (i =3D 0; i < runtime->periods; i++)
> -			if (!bcom_queue_full(s->bcom_task))
> -				psc_dma_bcom_enqueue_next_buffer(s);
> +			for (i =3D 0; i < runtime->periods; i++)
> +				if (!bcom_queue_full(s->bcom_task))
> +					psc_dma_bcom_enqueue_next_buffer(s);
> =20
> -		bcom_enable(s->bcom_task);
> -		spin_unlock_irqrestore(&psc_dma->lock, flags);
> +			bcom_enable(s->bcom_task);
> +		}
> =20
>  		out_8(&regs->command, MPC52xx_PSC_RST_ERR_STAT);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615093824.1157=
51-1-phucduc.bui@gmail.com?part=3D10
