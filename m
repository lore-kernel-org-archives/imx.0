Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC3F421251
	for <imx@lists.linux.dev>; Wed, 12 Aug 2026 10:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786530580; cv=none; b=kkiXssZkajYE0V+YsQXX9bOzn3RuN7LG0UaEpSAbIJ1YPbKp809REj3UWOPoaYffcaFLGb5geq814DDKUJZwUS61ylZJfQgtEswwF7ydEiHUr0Ljnv8ObK+FQ3jKa8LmDV1n7FZwVnutWsHV6nepAgu9n7yHUkZehCUInY2XLjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786530580; c=relaxed/simple;
	bh=Kl5FuzHjj/Nd73NjFqryXi3Lya7zoCmH2LcQ/GX/fu0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T9+De5BcpUbF2FFbkBZMPIsYJ6VKj9IjZrrOYptdE6861dtdUFqwqAHMqs+nJpmKoycwC8vZLWj+F6aHW8vHpUNQHdNUYrsh0GOTvxUbJdYATtYMegR7Ym6nQ+PgYiwOmpzSv3WyFlfdTynyQUBVj75o9rLKwArc/MOCTrAkO5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KPDgNsMZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KPDgNsMZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4E101F00A3A;
	Wed, 12 Aug 2026 10:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786530579;
	bh=7+3YjvrmFrFtvR55tDJ8yli65eJ61HXDWudOlj9UL6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KPDgNsMZBbkCUopzJ3iPXLhVlUHBIS1kyFETN8Ukbs0COJv0EddDZt39LvF8DJ0k3
	 lFqEj+VkTiGYOLgy2ONL3UmVIbPqarwSP+m0RYp/lzYtp4wj+LoM7CKPD3wLpG8LxO
	 dEbn2dNOycU7nwz1ZVOlNQmDZVkU7kGjj+nXCOf3/lAo8FAwsv6WFslMLlvmfC3qXG
	 JP2Xmq4MeKyAc6ZdxIRgRKACIRqnDVYr3mzwiLJxHp2gYFLaj0PZ9dX4zw10QAird1
	 W0n1XNzp1NBWVeUEBQioEA4noTC4JrWonrN0ZSCcoZqh8SMa55Ee/Ud6D6UrIwyoLT
	 8R71xHaubdxhg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/3] ASoC: mxs-saif: Drop redundant probe error messages
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260812101418.37966-3-phucduc.bui@gmail.com>
References: <20260812101418.37966-1-phucduc.bui@gmail.com>
 <20260812101418.37966-3-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 10:29:38 +0000
Message-Id: <20260812102938.D4E101F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [Low] Removing error logs degrades debugging context, as the underlying f=
unctions do not log their specific failures.

Pre-existing issues:
- [High] Clock divider and OF clock provider leak on probe failure, leading=
 to a kernel panic (use-after-unmap) upon subsequent accesses.
- [High] The global `mxs_saif` array retains a dangling pointer when `mxs_s=
aif_probe` fails or the driver is unbound, leading to a potential Use-After=
-Free.
--

--- Patch [2]: [PATCH 2/3] ASoC: mxs-saif: Drop redundant probe error messa=
ges ---
commit d8455dc02bf0f7c00ea57b01724fbc7b2b394e9d
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: mxs-saif: Drop redundant probe error messages

This commit removes error logging messages from the probe function's failure
paths. The commit message states these are redundant because the underlying
functions log the errors themselves.

> commit d8455dc02bf0f7c00ea57b01724fbc7b2b394e9d
> Author: bui duc phuc <phucduc.bui@gmail.com>
> Date:   Wed Aug 12 10:14:17 2026 +0000
>=20
>     ASoC: mxs-saif: Drop redundant probe error messages
>    =20
>     The functions called here don't log the error themselves, but the
>     error is already reported deeper in the call chain, so the dev_err()
>     calls are redundant and can be removed.

[Severity: Low]
Are we sure the underlying functions actually log these errors?

Looking at devm_request_irq(), devm_snd_soc_register_component(), and
mxs_pcm_platform_register(), they do not appear to print error messages when
they fail, except in very specific edge cases.

While the driver core will log a generic failure code on probe exit, does
removing these specific error logs cause the driver to fail silently at the=
se
initialization steps, making it difficult to debug which step failed?

> diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
> index b877c978a04c6..a77cd516a1bfd 100644
> --- a/sound/soc/mxs/mxs-saif.c
> +++ b/sound/soc/mxs/mxs-saif.c
> @@ -841,10 +841,8 @@ static int mxs_saif_probe(struct platform_device *pd=
ev)
>  	saif->dev =3D &pdev->dev;
>  	ret =3D devm_request_irq(&pdev->dev, irq, mxs_saif_irq, 0,
>  			       dev_name(&pdev->dev), saif);
> -	if (ret) {
> -		dev_err(&pdev->dev, "failed to request irq\n");
> +	if (ret)
>  		return ret;

[Severity: High]
This is a pre-existing issue, but does returning here leave a dangling poin=
ter
in the global mxs_saif array?

Earlier in mxs_saif_probe(), the newly allocated saif context is stored
globally:

mxs_saif_probe()
    mxs_saif[saif->id] =3D saif;

If the probe function fails here, or if the driver is manually unbound via
sysfs, devres will automatically free the saif structure. However, the driv=
er
never clears mxs_saif[saif->id].

If a user is actively playing audio and the driver is unbound, the ALSA core
unregisters the component but keeps the PCM file descriptor open. When the
stream is subsequently closed, the machine driver's hw_free callback invokes
mxs_saif_put_mclk(), which will dereference the freed mxs_saif pointer.

> =20
>  	platform_set_drvdata(pdev, saif);
> =20
> @@ -857,16 +855,12 @@ static int mxs_saif_probe(struct platform_device *p=
dev)
> =20
>  	ret =3D devm_snd_soc_register_component(&pdev->dev, &mxs_saif_component,
>  					      &mxs_saif_dai, 1);
> -	if (ret) {
> -		dev_err(&pdev->dev, "register DAI failed\n");
> +	if (ret)
>  		return ret;

[Severity: High]
This is also a pre-existing issue, but does returning here cause a
use-after-unmap panic if the clock divider was initialized?

When mxs_saif_probe() calls mxs_saif_mclk_init() for saif0, it registers a
clock divider and an OF clock provider. These are not devm-managed and requ=
ire
explicit unregistration.

The registered clock divider is passed a register pointer mapped via devres:

mxs_saif_mclk_init()
    clk =3D clk_register_divider(..., saif->base + SAIF_CTRL, ...);

If devm_snd_soc_register_component() fails and we return directly, devres
will automatically unmap saif->base.

Because the clock framework objects are never unregistered, they remain in =
the
system. Any subsequent access to this clock, such as reading debugfs or a
machine driver interacting with the clock, will dereference the now-unmapped
register pointer and cause a synchronous external abort.

> =20
>  	ret =3D mxs_pcm_platform_register(&pdev->dev);
> -	if (ret) {
> -		dev_err(&pdev->dev, "register PCM failed: %d\n", ret);
> +	if (ret)
>  		return ret;
> -	}
> =20
>  	return 0;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812101418.3796=
6-1-phucduc.bui@gmail.com?part=3D2
