Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64751E2606
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 13:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781271538; cv=none; b=XfCdsKxg0e8YgSJG/PmnMI3RXH3qZrNXJVcHikadyfMI2mifw0750Z60jwCP9peP6JYcy4mttlx+kktTYwDPMVeK42AEAJAOyXB88zfh6zkZx8I75GLbRcVXisKpc6edIdR2QoBJObAkIZ8yLVbrI2SPvwWeMNOQuOBcbAn/scE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781271538; c=relaxed/simple;
	bh=6S4mCJf/T7NvUUY58Rj/2sghSYp3R+6G/DOX/ZytByU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=B0j72V5xv6Mk+u5PLadzFqnKgribip0W8WPzTgxyb/fkVxJdmIlyM8JEPIaR/op/GeEY29srhQ+asChrbsHh2um69cIoJ9wWbt3tSpBmGmZCBFryMskvv0fXaElA5bjUpljesxBdJ+5hrJaSHGlj9cjTd5p7zVuiJI49l0fWwYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R6gVAsr6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R6gVAsr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60AB91F000E9;
	Fri, 12 Jun 2026 13:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781271537;
	bh=LiiyVGfl9h8+L7E/HTYOqfzUB5CP81+Acj25Rk0BfAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R6gVAsr6QkUsTYJ7JmBjG7GiVmWVQglYjQUzw1Lt5j9fiEOWb/RRca+MzynjwIBQy
	 8H2uatLbKSOzufzpJJKYDQA+0juAJeBCUWg+xN9jbMho1geN2gxlHQHS/NWxcFtqXK
	 hGD6L30RjD14Z2JpN2Oyy3w4b2YdxEdB53YD6Dp5JX31vs1EQy27LlJlTUz5fYB9Y+
	 CAV2RZ9dRTcuPYvtZp11GPvO67cH0BYkfQ9fcxuFXdiTowu80xEjPyXSbtSo3plAj8
	 KTfEas5DSKI3FNTb9Q+JiNCf/m7kS0vqVSNDZet2FDym/O1U/IeGX/r6yQ+WUhycKK
	 kbwR6q2rGdg4Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 01/11] ASoC: fsl_asrc: Use guard() for spin locks
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260612132639.78086-2-phucduc.bui@gmail.com>
References: <20260612132639.78086-2-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 13:38:56 +0000
Message-Id: <20260612133857.60AB91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unvalidated cleanup in fsl_asrc_release_pair() unconditionally rel=
eases a pair without an ownership check, causing hardware state corruption =
and channel count tracking errors if fsl_asrc_request_pair() fails.
--

commit f44cdf6b851bca6e946cdc01dc94cd1b9c6b9570
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: fsl_asrc: Use guard() for spin locks

Clean up the code using guard() for spin locks. Merely code refactoring,=20
and no behavior change.

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

[Severity: High]
This is a pre-existing issue, but does fsl_asrc_release_pair() unconditiona=
lly=20
trust the pair's index without verifying ownership?

If fsl_asrc_request_pair() fails (for example, due to insufficient channels=
),=20
it returns an error but leaves pair->index and pair->channels unmodified.=20

The ALSA core handles this configuration failure by invoking the hw_free=20
callback on the error path:

sound/soc/fsl/fsl_asrc.c:fsl_asrc_dai_hw_free() {
    ...
	if (pair)
		fsl_asrc_release_pair(pair);
    ...
}

Since ownership isn't verified here, fsl_asrc_release_pair() blindly uses t=
he=20
stale pair->index, forcefully disables the hardware register for that pair,=
 and=20
adds the stale pair->channels back to asrc->channel_avail.

Could this abruptly destroy the active audio session of another process tha=
t=20
owns the pair, and artificially inflate the available channel count?

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
>  	pair->error =3D 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612132639.7808=
6-1-phucduc.bui@gmail.com?part=3D1
