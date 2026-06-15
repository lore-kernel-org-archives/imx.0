Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0344C30C17B
	for <imx@lists.linux.dev>; Mon, 15 Jun 2026 09:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781517135; cv=none; b=C+Br/Oqq9K5uaGf60N8mFHQsNbb7Pi5cgIUgE8bIy6eqLRVy2tsQggahR4uTGX9s9lhgJwbm9DH3ErrZr+re7QJcjIVRqcEnNdAcjW++SxFJQQE0oBT7jLU4co5/mgVI4ITUE6ln7ZI5idpyTeZ+9t7jT5rZwNawo3MxO623d70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781517135; c=relaxed/simple;
	bh=z9FOMUR0VgX8Xz+518CsUpfZ6Danz1vbLzO3I81mwB4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HMWT/0YEvm4jLXvY/MbdkTNFFYapxe3zdftdfofpdDAvgrYEl8lUWqhhcApBTQ0lt+cqx9KISTa1GovrTLg+jNsAKv5hiAOPQEiNPxSW/m7mK9ARLHkvmHoq6xSfs+7APaIRwHajMIbXieE7KYWDfNo8N3/Xj0f0dFbIuU5g8P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLDNgyo1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLDNgyo1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5851F000E9;
	Mon, 15 Jun 2026 09:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781517133;
	bh=SFpgWAPg6hidymFSY6GGRhwNudjACp7H7SwEs7cHBXY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PLDNgyo1owYsgZwmtHOStQLYkvEwx32ylqtKXe7kW8VSZbxuVw0SPTjdems5G0eQC
	 GONrU3JETT6x/VQ2aGuVQ9yR3sNcPW+zqHxcm+Q8xwmbLsIokMna4QgsN4vZ4pnRp5
	 8P1ArO86Iu/prCipHP+AnE9c8tkobwlQwMKBIRgJFfbgU8wEaKAlO1Ag+bukXgKAwl
	 /cNEoxSNet+nX/Rl+0akgRk/aqEgQTHF1+EMscAxIHNz/yfBm0QSRpPkxTEkatY/oO
	 lmmeJN9xf01oofPPaULKC1curYHgJhbXJsdVh/gOsxIeIoVY8/CYxjsqq+s6tjg+6q
	 CiQDvfAbN3aPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 05/11] ASoC: fsl_spdif: Use guard() for spin locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260615093824.115751-6-phucduc.bui@gmail.com>
References: <20260615093824.115751-6-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 15 Jun 2026 09:52:13 +0000
Message-Id: <20260615095213.7E5851F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] A TOCTOU double-fetch vulnerability on `ctrl->ready_buf` allows an=
 out-of-bounds slab read, potentially leaking sensitive kernel heap memory =
to user-space.
--

commit 77e81df6d58ee7403495ad362c8b579033ed04a6
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_spdif: Use guard() for spin locks

This patch converts the spin lock handling in fsl_spdif_subcode_get() and
fsl_spdif_qget() to use the guard() macro. It refactors the code without
changing its intended behavior.

> diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
> index 1b9be85b34c24..ad1206ed98828 100644
> --- a/sound/soc/fsl/fsl_spdif.c
> +++ b/sound/soc/fsl/fsl_spdif.c
> @@ -853,17 +853,15 @@ static int fsl_spdif_subcode_get(struct snd_kcontro=
l *kcontrol,
[ ... ]
>  	int ret =3D -EAGAIN;
> =20
> -	spin_lock_irqsave(&ctrl->ctl_lock, flags);
> +	guard(spinlock_irqsave)(&ctrl->ctl_lock);
>  	if (ctrl->ready_buf) {
>  		int idx =3D (ctrl->ready_buf - 1) * SPDIF_UBITS_SIZE;

[Severity: High]
This is a pre-existing issue, but since the compiler can fetch ctrl->ready_=
buf
twice (once for the if check, and once for the idx calculation), could this
lead to a Time-of-Check to Time-of-Use (TOCTOU) race?

While this code holds ctl_lock to disable local interrupts, it appears
spdif_irq_uq_err() can run on another CPU and zero ready_buf without taking
ctl_lock:

spdif_irq_uq_err() {
    ...
    /* Drop this U/Q buffer */
    ctrl->ready_buf =3D 0;
}

If ready_buf becomes 0 between the check and the calculation, idx would
evaluate to a negative index. This would cause the subsequent memcpy to read
out of bounds and potentially leak adjacent slab memory to user-space.

Would caching ready_buf in a local variable using READ_ONCE() prevent this?

>  		memcpy(&ucontrol->value.iec958.subcode[0],
>  				&ctrl->subcode[idx], SPDIF_UBITS_SIZE);
>  		ret =3D 0;
>  	}
[ ... ]
> @@ -885,17 +883,15 @@ static int fsl_spdif_qget(struct snd_kcontrol *kcon=
trol,
[ ... ]
>  	int ret =3D -EAGAIN;
> =20
> -	spin_lock_irqsave(&ctrl->ctl_lock, flags);
> +	guard(spinlock_irqsave)(&ctrl->ctl_lock);
>  	if (ctrl->ready_buf) {
>  		int idx =3D (ctrl->ready_buf - 1) * SPDIF_QSUB_SIZE;

[Severity: High]
This is also a pre-existing issue, but does the same double-fetch
vulnerability exist here?

Like the subcode getter above, if ctrl->ready_buf is zeroed by the interrupt
handler after the check, idx becomes a negative offset. This would result in
memcpy reading from the adjacent memory within the struct instead of the
intended qsub array.

>  		memcpy(&ucontrol->value.bytes.data[0],
>  				&ctrl->qsub[idx], SPDIF_QSUB_SIZE);
>  		ret =3D 0;
>  	}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260615093824.1157=
51-1-phucduc.bui@gmail.com?part=3D5
