Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17D9F43846B
	for <imx@lists.linux.dev>; Thu,  8 Oct 2026 10:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791456851; cv=none; b=NhHaM5OCwR8i9BT/s3LQenECf4rakoDAryT18krL7pSV3qyzRmmFaLO18juCC1QBFc/KWv0q0N4Nkn7wHT/ZRWFN/ARNDtHOypdGEUB9cV40HZqKLHhikIYt8x8IcUDfkrLamCFlamTkX+IZe7dTw0rc+wL0iBEZBPIqkZzL2fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791456851; c=relaxed/simple;
	bh=pkdJNnt7xktewctTpcFSlLWY5BlAbfY0C4+LPGOKSvU=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SJ7gD7DnQ5bU8S6koMrm7J6s81BgTWQ26udQVKhQz8Vo3KTnEjmN2Qi0vXMn0/Xl5NiiMl66kMR/Wyawls+sYrio5sx1D2nchx5RgL6oNi4vYGUQluKtPUCmeqP8vNef60CLYziZ3ZrP5sojB2JRIGuQswJfXnsxKV+yy+JDz8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j1qdmjBK; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j1qdmjBK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764441F000FF;
	Thu,  8 Oct 2026 10:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791456849;
	bh=OWaSxHHkaFY5F2pk6cwtSdwyHmLQBeITO76k+NCVqm4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j1qdmjBK4Un1cMFn2KN+Rad+FlMsN7mhm9rS84+tkImSmemKWSSnnPMRAWGxsqvTP
	 oQ0vnvnqd2sZplT+Ve/A37oOO5A+gzyZbBK/XTYZj+7QERppOAF/yjk+RVtXpxipPr
	 T8vqBlbTt4mim/TPayIjlsqYmUPC8+ynPBXCvyNIUTIxWKOLGdRIqDdWga+JNmXDXg
	 n8YrrcZ78IXo/V8jySoqlHjL7rspgvnAvoUc/4TZmNgm6oCioSr08OszI/DkjCW7Oa
	 uk6jLP5j3BuKoaWLs6NUX0NYVlzsgMmHDgUZMzgw/zvTWh4wCZWNsyrg0MZSqzkSBt
	 We7ACgNIUIw7g==
Message-ID: <sashiko-outbox-164055@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 06/24] ASoC: amd: vangogh: Fix acp5x_dma_close() being
 skipped on rollback
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261008103831.542533-7-phucduc.bui@gmail.com>
References: <20261008103831.542533-1-phucduc.bui@gmail.com>
 <20261008103831.542533-7-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 08 Oct 2026 10:54:09 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] ASoC: amd: vangogh: Uninitialized i2s_instance in acp5x_dma_cl=
ose() corrupts concurrent streams
--

commit 0fa96f07228732634c84e9e1736847a1c270fb29
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: amd: vangogh: Fix acp5x_dma_close() being skipped on rollback

This commit explicitly returns 0 on success in acp5x_dma_open() to ensure
ASoC correctly marks the component as opened. This prevents .close() from
being skipped during a rollback if .open() initially returned 1 from
snd_pcm_hw_constraint_integer().

> diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangog=
h/acp5x-pcm-dma.c
> index 831e30e9b0426..33d59d992ee0c 100644
> --- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
> +++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
> @@ -231,7 +231,7 @@ static int acp5x_dma_open(struct snd_soc_component *c=
omponent,
>  	}
>  	i2s_data->acp5x_base =3D adata->acp5x_base;
>  	runtime->private_data =3D i2s_data;
> -	return ret;
> +	return 0;

[Severity: Critical]
By ensuring acp5x_dma_open() returns 0, ALSA SoC will now call
acp5x_dma_close() on rollback if a stream is aborted before hw_params()
is called.

Can this regression corrupt the state of concurrent streams?

When acp5x_dma_open() allocates i2s_data via kzalloc(), the i2s_instance
field is initialized to 0. It is only set to its correct value later in
acp5x_dma_hw_params().

If acp5x_dma_close() runs on rollback before hw_params() is called:

sound/soc/amd/vangogh/acp5x-pcm-dma.c:acp5x_dma_close() {
    ...
	if (substream->stream =3D=3D SNDRV_PCM_STREAM_PLAYBACK) {
		switch (ins->i2s_instance) {
		case I2S_HS_INSTANCE:
			adata->play_stream =3D NULL;
			break;
		case I2S_SP_INSTANCE:
		default:
			adata->i2ssp_play_stream =3D NULL;
		}
    ...
}

Because ins->i2s_instance is 0, it falls through to the default case
and sets adata->i2ssp_play_stream =3D NULL.

Since adata is shared per-device data, this incorrectly clears the stream
tracking pointer for a completely separate, concurrently running stream.

When the hardware fires a threshold interrupt for the active stream,
the handler will fail to clear it:

sound/soc/amd/vangogh/acp5x-pcm-dma.c:i2s_irq_handler() {
    ...
	if ((val & BIT(I2S_TX_THRESHOLD)) && vg_i2s_data->i2ssp_play_stream) {
		acp_writel(BIT(I2S_TX_THRESHOLD),
			   vg_i2s_data->acp5x_base + ACP_EXTERNAL_INTR_STAT);
		snd_pcm_period_elapsed(vg_i2s_data->i2ssp_play_stream);
		irq_flag =3D 1;
	}
    ...
}

Because the pointer was nullified, the interrupt remains asserted and the
handler returns IRQ_NONE, causing an infinite hardirq loop.

>  }
> =20
>  static int acp5x_dma_hw_params(struct snd_soc_component *component,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008103831.5425=
33-1-phucduc.bui@gmail.com?part=3D6
