Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BA63DB62B
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:51:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517113; cv=none; b=hc1lwxgxZQLmacJdEqMgTxwF8fFfEzvcqaKOK7UWZcH15fLfBmJ9xEaHtzyZxi1VmpvStKoq2X/2J7ZXwFCA5rYevhQyd7Q1gahoT7wmAREzq7C9eE3f+niWXmE+kLXr1L24zLKrLUH5dphnX/WRcOr5gIopZj0dTk51AU2fz7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517113; c=relaxed/simple;
	bh=aNDKCz3v3Ect2UToelmo6tp6YeNRCQlRIz8/QOfJoEY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LbvvpXz2JaXbDVQxYes3Ub9oMQyq5epdXsxzzZNGkeej0r+nebWZZAe5CKF3jtRC2XjZy6sicFSmHwNWi6+Hi29IygzlOuFFpLMBiku+X5RaTg5kqErG2yKDb9A9mulAz+kgj9Ih5yfcm9OHNjcKm9EAzScRR/iiqbAzeevQxlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHVKlThw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHVKlThw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD1781F000E9;
	Mon, 15 Jun 2026 09:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781517107;
	bh=GLusAop0pOxTLpX7EuNBRSq7o/4QZN2vh8PWk9F8okE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dHVKlThwsblfdYP31sFWkxCowhWZE4vD8u3vlqq5uNvWEJ7oTm+h1esy1LJUs5D73
	 FFBn6XJnXzCngFisDpAe/nhODWz2ew/tEYqAJryOD+ZgemONt7jN5IlwumQTRKnG/t
	 S9rYGcVJjAo3F4Al/OzMRJMlQr8Otb2JIngYWuv68UtGjsACIVmPsFh+9/ipTiYtNA
	 OqfHv5m2mqOHyU+IjPyZJ2/HTPQmcnRV6Zq99a9pmRyuqXzemPN//ipaOCuiBpTrxS
	 Hg1GKvJpiiKN3Ktqj/8lfeI0MTFlk3gnIMrJzl0+N3vKnMAqQi5raWh36Uz1AYS80h
	 rwCkj7XY+pX3Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/11] ASoC: fsl_asrc: Use guard() for spin locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260615093824.115751-2-phucduc.bui@gmail.com>
References: <20260615093824.115751-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 09:51:45 +0000
Message-Id: <20260615095146.CD1781F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Lockless access to the `asrc->pair` array in `fsl_asrc_isr` can le=
ad to Use-After-Free and reading uninitialized memory.
--

commit 4b6342441bc61476e92408bc85fb134b9ad8e9f7
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_asrc: Use guard() for spin locks

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

> diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> index 5fda9b647c704..0b28bcfa47fed 100644
> --- a/sound/soc/fsl/fsl_asrc.c
> +++ b/sound/soc/fsl/fsl_asrc.c

[ ... ]

> @@ -265,19 +262,16 @@ static void fsl_asrc_release_pair(struct fsl_asrc_p=
air *pair)
>  {
>  	struct fsl_asrc *asrc =3D pair->asrc;
>  	enum asrc_pair_index index =3D pair->index;
> -	unsigned long lock_flags;
> =20
>  	/* Make sure the pair is disabled */
>  	regmap_update_bits(asrc->regmap, REG_ASRCTR,
>  			   ASRCTR_ASRCEi_MASK(index), 0);
> =20
> -	spin_lock_irqsave(&asrc->lock, lock_flags);
> +	guard(spinlock_irqsave)(&asrc->lock);
> =20
>  	asrc->channel_avail +=3D pair->channels;
>  	asrc->pair[index] =3D NULL;

[Severity: High]
This isn't a bug introduced by this patch, but can the lockless access to t=
he
asrc->pair array in fsl_asrc_isr() lead to a use-after-free or reading
uninitialized memory?

In fsl_asrc_release_pair(), the pair is disabled and removed via
asrc->pair[index] =3D NULL under the lock. However, fsl_asrc_isr() iterates
over the asrc->pair array and dereferences its elements locklessly:

sound/soc/fsl/fsl_asrc.c:fsl_asrc_isr() {
    ...
		if (!asrc->pair[index])
			continue;

		if (status & ASRSTR_ATQOL) {
			asrc->pair[index]->error |=3D ASRC_TASK_Q_OVERLOAD;
    ...
}

Because the ISR does not take asrc->lock, an ISR executing on another CPU c=
an
read the pointer just before it is nullified. ALSA subsequently calls
fsl_asrc_dma_shutdown(), which frees the memory:

sound/soc/fsl/fsl_asrc_dma.c:fsl_asrc_dma_shutdown() {
    ...
	kfree(pair);
    ...
}

Since there is no synchronize_irq() or lock-based synchronization, the
concurrent ISR can proceed to write to pair->error after the memory is free=
d,
causing a use-after-free in hardirq context.

Additionally, fsl_asrc_request_pair() publishes the newly allocated pair vi=
a a
plain store:

		asrc->pair[index] =3D pair;

Without a memory barrier (like smp_store_release()), the lockless ISR may s=
ee
the pointer before the initialization of the pair structure is visible to i=
ts
CPU.

>  	pair->error =3D 0;
> -
> -	spin_unlock_irqrestore(&asrc->lock, lock_flags);
>  }
> =20
>  /**

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615093824.1157=
51-1-phucduc.bui@gmail.com?part=3D1
