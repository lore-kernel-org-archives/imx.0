Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47BC3C8C47
	for <imx@lists.linux.dev>; Tue, 26 May 2026 07:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779780034; cv=none; b=YPiOtekvfYedKVHd0M4b9S7HHBhuMF9y2TmCPJANkTchFKZ1yoa8XjcAXj3d7y6MMS4p+7xCChUz2AGDqhR+/cf8iD8hKzIVrCvjrvc7MDv51UH9Ptm7orOWk1Tiuu5Tny5emPG+wDQe4w26u/TbsTP9FQI1tQSdf/YwRFa8axE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779780034; c=relaxed/simple;
	bh=sencE5htr0w/lyH19zJsItYupPHGY5+wWcTGWX2X3TU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=js0e4naLmcMu+I1ENl0/A5qIXxGu1pRLytj/Eaq+3Qn4AEcd9Qzkvcc5YkgAYPJVOK63zyhrfpHtn0sOBBEJ/Gj1j40NVtvngO7tvDXpEKmrzBZiufB9j4alAGEL6PWJXFrsbJ7/nJNmFyd/my1hIoy5JTwdGox6ojKpdeT7up0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FMa3oLyF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FMa3oLyF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA30B1F000E9;
	Tue, 26 May 2026 07:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779780033;
	bh=9ElnAaOt9P9W2+PZN10FPEUMFRVC3kLZ7fEzAo/n4sg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FMa3oLyFxgxJ4q0A/b5TMIs4pwOgpx9mf5Or/QSNdYBFBU054BoOB6etqjIB8MjGk
	 ZfDBtxMiQunm0SRsKRj46MtVbpw2i55xPuIp7VBajMF50VzmuVU8o5TlCEaLJnV8Ws
	 MVI64JutPcNPyeLw6GEvorN7JeVs9GhCb8LMdH6Pq2si7boU5qzwWxE63SIZlbTymB
	 0nfhYAlbSKTNFFcf9Vcj0QPSqwOC9TJTlYivsS2ghWQF+dS3dSACb1W5sqRJLmpuCX
	 8EDgF/YVguTZa7MqMyJ7R0GdtUrE7NdqFB9L80bdDiazNNiazOGi6tFqps1NFuDpqJ
	 LukhdIN+96HQA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] gpio: mxc: use BIT() macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260526063504.25916-2-alexander.stein@ew.tq-group.com>
References: <20260526063504.25916-2-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 26 May 2026 07:20:31 +0000
Message-Id: <20260526072032.DA30B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `port->wakeup_pads` bitmask is read and modified without holdi=
ng any lock, leading to a potential race condition and lost updates.
--

commit c28b11fd52c7d93b6cd737efcb162c68a3f3afc9
Author: Alexander Stein <alexander.stein@ew.tq-group.com>

gpio: mxc: use BIT() macro

This commit replaces open-coded bit shifts with the BIT() macro in
gpio_set_wake_irq().

> diff --git a/drivers/gpio/gpio-mxc.c b/drivers/gpio/gpio-mxc.c
> index 12f11a6c96653..7e2690d92df6f 100644
> --- a/drivers/gpio/gpio-mxc.c
> +++ b/drivers/gpio/gpio-mxc.c
> @@ -330,13 +330,13 @@ static int gpio_set_wake_irq(struct irq_data *d, u3=
2 enable)
>  			ret =3D enable_irq_wake(port->irq_high);
>  		else
>  			ret =3D enable_irq_wake(port->irq);
> -		port->wakeup_pads |=3D (1 << gpio_idx);
> +		port->wakeup_pads |=3D BIT(gpio_idx);

[Severity: High]
This isn't a bug introduced by this patch, but is it possible for concurrent
calls to cause a lost update here?

While irq_set_irq_wake() acquires the per-IRQ descriptor lock, it does not
serialize concurrent accesses to different IRQs on the same GPIO port. If
two drivers concurrently enable or disable wakeups on different pins of the
same port, they could race on this non-atomic read-modify-write operation.

Other callbacks in this driver, such as gpio_set_irq_type(), appear to
acquire port->gen_gc.lock before modifying shared port state. Should
gpio_set_wake_irq() be doing the same for port->wakeup_pads?

>  	} else {
>  		if (port->irq_high && (gpio_idx >=3D 16))
>  			ret =3D disable_irq_wake(port->irq_high);
>  		else
>  			ret =3D disable_irq_wake(port->irq);
> -		port->wakeup_pads &=3D ~(1 << gpio_idx);
> +		port->wakeup_pads &=3D ~BIT(gpio_idx);
>  	}
> =20
>  	return ret;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260526063504.2591=
6-1-alexander.stein@ew.tq-group.com?part=3D2
