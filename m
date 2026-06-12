Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7003835E93C
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271862; cv=none; b=c10ZeRmKEBs9290FjBnkcRBvBJrzhvssgOdPdF3Y1p0Zf6hEGTLp7ZY0KOT9kResiZ7g1jJ5YmAi7Hdolk1mZi7zAI/JxyBWn5W1bjSUZcLwchjZ0fknoUvqINVp5x/BJHzx4yUG8bWxHSMn1L1HuKQu48K5qZWnmAvOfpEjTnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271862; c=relaxed/simple;
	bh=CAHPh7QXL/YKA2TmXasOFn37f8PxI4cs+3n/FPcMuS0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ft8oU5Y98UcouGlPMioXZFTSuvZNcWTBf293oQ4SFNXTZ73iq9stYgC5NLnjZXPY/JZUPC6CVpaT/XgUjVR9cgbj6erPTbtzyGKH7j2heQYSqrJZMRnFjKDsUeeMF/rv92BaGRo0kuFbKjDh3h7a81tqr+mYL7DPHW6Xj/7YZxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fenWE8Po; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fenWE8Po"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E36631F000E9;
	Fri, 12 Jun 2026 13:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271861;
	bh=x16lnFSvO6FRGq8AO5nbxb1m4HZc7zakmNYlmUOTdvY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fenWE8Poqfi9ruFYlMOG2EXDk0d73H9Ouh9/tffj/uDCdpEZmLlf3gvEf7IHPokqi
	 6IKhmzIxHusKJjDmcQrjARlh6kUk7SrKv6YwrckxjbngmX2qZHh7q9iukE3G0c9Who
	 Dw9zDNPl3recW2X2Myk1ZnpuSgM++zTEF7y4epmF4e0w111NKmnvqhgJ41ihml8zO4
	 88Mv2yJyWdDvB0Li8So92qCOvyMdrfKc9E/MxJHIXVnsHJFSHsbpk4osm40evvm5Qq
	 o6xk6QnYslo5f4tHu6rPgb6eK5vEYJxzY0X2KbSVj9w2Q5PopO5adEXXgUtUB2mWRO
	 1whNsgJ0/UBhA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 10/11] ASoC: fsl: mpc5200_dma: Use guard() for spin
 locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260612132639.78086-11-phucduc.bui@gmail.com>
References: <20260612132639.78086-11-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 13:44:19 +0000
Message-Id: <20260612134420.E36631F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Concurrent ALSA triggers for playback and capture substreams can r=
ace when updating the shared `regs->isr_imr.imr` hardware register, potenti=
ally dropping interrupt enable bits.
--

commit 41f1f50873252390b25ba84ac77438b563c3e7ea
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl: mpc5200_dma: Use guard() for spin locks

This commit cleans up the mpc5200_dma code by using scoped_guard() for spin
locks. This is intended to be purely a code refactoring with no behavior
change.

> diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
> index 56e2cf2f727ba..bfedb2dea0b32 100644
> --- a/sound/soc/fsl/mpc5200_dma.c
> +++ b/sound/soc/fsl/mpc5200_dma.c

[ ... ]

> @@ -158,13 +158,13 @@ static int psc_dma_trigger(struct snd_soc_component=
 *component,
>  			substream->pstr->stream, s->period_count);
>  		s->active =3D 0;
> =20
> -		spin_lock_irqsave(&psc_dma->lock, flags);
> -		bcom_disable(s->bcom_task);
> -		if (substream->pstr->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
> -			bcom_gen_bd_rx_reset(s->bcom_task);
> -		else
> -			bcom_gen_bd_tx_reset(s->bcom_task);
> -		spin_unlock_irqrestore(&psc_dma->lock, flags);
> +		scoped_guard(spinlock_irqsave, &psc_dma->lock) {
> +			bcom_disable(s->bcom_task);
> +			if (substream->pstr->stream =3D=3D SNDRV_PCM_STREAM_CAPTURE)
> +				bcom_gen_bd_rx_reset(s->bcom_task);
> +			else
> +				bcom_gen_bd_tx_reset(s->bcom_task);
> +		}
> =20
>  		break;
> =20

[Severity: High]
This is a pre-existing issue, but can concurrent ALSA triggers for playback
and capture substreams race when updating the shared regs->isr_imr.imr hard=
ware
register?

Looking down at the end of psc_dma_trigger(), the interrupt mask is updated
entirely outside of the psc_dma->lock:

    /* Update interrupt enable settings */
    imr =3D 0;
    if (psc_dma->playback.active)
        imr |=3D MPC52xx_PSC_IMR_TXEMP;
    if (psc_dma->capture.active)
        imr |=3D MPC52xx_PSC_IMR_ORERR;
    out_be16(&regs->isr_imr.imr, psc_dma->imr | imr);

If CPU1 triggers playback and CPU2 triggers capture simultaneously, could
they both read stale values for the other stream's active flag?

If so, one of the concurrent writes to regs->isr_imr.imr would overwrite
the other, potentially dropping either the MPC52xx_PSC_IMR_TXEMP or
MPC52xx_PSC_IMR_ORERR bit. This could leave the corresponding stream without
interrupts and stall the audio stream indefinitely.

Since this patch is refactoring the locking in this function, would it make
sense to expand the scope of the new scoped_guard to cover the s->active
updates and this hardware register write?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612132639.7808=
6-1-phucduc.bui@gmail.com?part=3D10
