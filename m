Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57A138AC65
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271523; cv=none; b=k85Nl/X2hEtQNgRl0bWh3aA8rKyccA523i9GpjO5N+G7KmJkGPzkeJJyz3wppePYHZqQBOoyblxRXE9K8eIPtIT4e1XM6p5H5JCzH1CH7lvTLkjksdc6ZnN803bW4IPjEmSU0XE+Ej6OdbppgO5wUbLbxUH2TbKsJR7mUDYrl3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271523; c=relaxed/simple;
	bh=/pwq/vUMjV+N34PlwzqF2rlrnSaXF0xmuufya8KrXRs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EdDOP4E7h3WCE5YencBJsB8/x2byxbqyFbMGVKp+bABBwr2A3E4BSzSZOqR2d0jmwSKrfTWVBJ6Z9cML6xpCnyuOOXHS91AG0sBPWUQD3gB+PYcCTTX2orItvmpvhsuPg9cWMwUO9el5iphINDJlhpsENP32KMngZ5sa2wkejds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VsCWGS9u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VsCWGS9u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FB4A1F000E9;
	Fri, 12 Jun 2026 13:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271521;
	bh=TuG7wEZDi9HQjIqZ//KJrBkmZm7OzD/uIbLtLtj5bsg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VsCWGS9uh9VfYEFq4NoqRPaySLYiMsM6+wRaLgsFCf4Eb/ZfdGmLUf82gHa1aZ/cj
	 dFXQk23fTa4M4xigvjKcJ9dyaH6KjJyDjPztOmxtQTGdYDUmxw0swR2+EtGsZTIZh/
	 9MCi9GucieW9TggCZmznkecJ7gnar3eiUQECapIYibsOEctvqk29LiHE66QMU9PVyM
	 9q1KbhpzPMzKs0WlyEqR7S5+0lXOaCF4zVrSIRaiZLBLk6mee+qiHLrnwjBWxOzebe
	 2iGeXu9tObCSfW7JAZFOHgefDzrXzzz6WffO7ZBR+wPSmgclsPbi0O44H3piC0LT6j
	 LS5HMUB0nuPsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/11] ASoC: fsl_spdif: Use guard() for spin locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260612132639.78086-6-phucduc.bui@gmail.com>
References: <20260612132639.78086-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 13:38:40 +0000
Message-Id: <20260612133841.3FB4A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The Q-subcode interrupt handler incorrectly writes its data into t=
he `subcode` (U-subcode) array, leaving `qsub` empty and corrupting U-subco=
de data.
- [High] The `ctl_lock` spinlock does not protect against concurrent modifi=
cation by the interrupt handler on SMP systems, leading to a critical data =
race and severe out-of-bounds read.
--

commit 9c302e33fc7af448093d631b3d2663e0de990905
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_spdif: Use guard() for spin locks

Clean up the code using guard() for spin locks.
Merely code refactoring, and no behavior change.

> diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
> index 1b9be85b34c24..ad1206ed98828 100644
> --- a/sound/soc/fsl/fsl_spdif.c
> +++ b/sound/soc/fsl/fsl_spdif.c
> @@ -853,17 +853,15 @@ static int fsl_spdif_subcode_get(struct snd_kcontro=
l *kcontrol,
>  	struct snd_soc_dai *cpu_dai =3D snd_kcontrol_chip(kcontrol);
>  	struct fsl_spdif_priv *spdif_priv =3D snd_soc_dai_get_drvdata(cpu_dai);
>  	struct spdif_mixer_control *ctrl =3D &spdif_priv->fsl_spdif_control;
> -	unsigned long flags;
>  	int ret =3D -EAGAIN;
> =20
> -	spin_lock_irqsave(&ctrl->ctl_lock, flags);
> +	guard(spinlock_irqsave)(&ctrl->ctl_lock);
>  	if (ctrl->ready_buf) {
>  		int idx =3D (ctrl->ready_buf - 1) * SPDIF_UBITS_SIZE;
>  		memcpy(&ucontrol->value.iec958.subcode[0],
>  				&ctrl->subcode[idx], SPDIF_UBITS_SIZE);
>  		ret =3D 0;
>  	}

[Severity: High]
This is a pre-existing issue, but does ctl_lock actually protect against
concurrent modification by the interrupt handler on SMP systems?

The ctl_lock is acquired here by readers in fsl_spdif_subcode_get() and
fsl_spdif_qget(). While this disables local interrupts, the interrupt
handler (spdif_isr and helpers like spdif_irq_uq_err) can execute
concurrently on another CPU in an SMP system because it does not acquire
ctl_lock.

If the ISR clears ctrl->ready_buf to 0 between the if (ctrl->ready_buf)
check and the calculation of idx, the compiler re-evaluation of
ready_buf could cause idx to evaluate to -96. This would trigger an
out-of-bounds read in memcpy, leaking arbitrary kernel heap memory to
userspace:

sound/soc/fsl/fsl_spdif.c:spdif_irq_uq_err() {
    ...
	/* Drop this U/Q buffer */
	ctrl->ready_buf =3D 0;
	ctrl->upos =3D 0;
	ctrl->qpos =3D 0;
    ...
}

[ ... ]

> @@ -885,17 +883,15 @@ static int fsl_spdif_qget(struct snd_kcontrol *kcon=
trol,
>  	struct snd_soc_dai *cpu_dai =3D snd_kcontrol_chip(kcontrol);
>  	struct fsl_spdif_priv *spdif_priv =3D snd_soc_dai_get_drvdata(cpu_dai);
>  	struct spdif_mixer_control *ctrl =3D &spdif_priv->fsl_spdif_control;
> -	unsigned long flags;
>  	int ret =3D -EAGAIN;
> =20
> -	spin_lock_irqsave(&ctrl->ctl_lock, flags);
> +	guard(spinlock_irqsave)(&ctrl->ctl_lock);
>  	if (ctrl->ready_buf) {
>  		int idx =3D (ctrl->ready_buf - 1) * SPDIF_QSUB_SIZE;
>  		memcpy(&ucontrol->value.bytes.data[0],
>  				&ctrl->qsub[idx], SPDIF_QSUB_SIZE);

[Severity: High]
This isn't a bug introduced by this patch, but does the Q-subcode array
actually contain valid data here?

Looking at the Q-subcode interrupt handler spdif_irq_uqrx_full(), it
unconditionally writes its data into the subcode (U-subcode) array, even
when processing a Q-subcode interrupt:

sound/soc/fsl/fsl_spdif.c:spdif_irq_uqrx_full() {
    ...
	ctrl->subcode[*pos++] =3D val >> 16;
	ctrl->subcode[*pos++] =3D val >> 8;
	ctrl->subcode[*pos++] =3D val;
    ...
}

Because qpos increments up to 24 independently of upos, this overwrites
the first 24 bytes of the U-channel buffer (ctrl->subcode) and leaves
qsub empty. As a result, fsl_spdif_qget() will return uninitialized or
zeroed memory from ctrl->qsub, and the U-subcode data returned to
userspace is corrupted.

>  		ret =3D 0;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612132639.7808=
6-1-phucduc.bui@gmail.com?part=3D5
