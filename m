Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A3738DD3
	for <imx@lists.linux.dev>; Fri, 16 Oct 2026 04:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792124172; cv=none; b=mV+T3XUVIIrA6g+4HvhB2E6wDG640uiHqdBmH7bSDhYo108tOfHY9byK8gpWRFi+BOodmKgyRRYOCUWNQVZCAaPhky4lDExuKFFR5IX5TwRKtQN5OPmehPxojPdWIDKQhQpHw8ut9ZeONcKjWWCcuM149YIUp0QXzz9mMEqCSLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792124172; c=relaxed/simple;
	bh=mSput05j82kmJpb7IUc5xresK8aJ5f1dz51zkJ33N5s=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=u1w0wRIsC/7LpdXsavOq54/1dHc5ZRXAkaBv8Anv+AXD3kRguNMbgBrC6MpiGDbNmZYQ9bO9IwMKpjUW+Byz5NOiksS1/Cna1gNCLvrkAfbT7YREdWDP/mePuuQL0mYAc8AqO1b0gLSpIsMILWDvjyjL+QsvLBp4fPNXPBDD650=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aqA1QBNw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aqA1QBNw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 534C91F000C5;
	Fri, 16 Oct 2026 04:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792124170;
	bh=7s/7o3gtr+3dMPcD3YCyJGIX2K/g7DpRH0pEX+ukyNo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aqA1QBNw9kbujYJpbbYdHeCpC6rcEvcLTCMO3SfXmx1CbONqNGWjs6XU6ADQvZuW6
	 Gb2khDm64baWMQZfKz4vBadFgL5RKICZx6aTTKZ0gfkTYnkophvjMQi1RUeybj2NbP
	 XJPcdGB2I0nRQ7vFxq+4F8emCL9usissmu/gAeodpJAvJLAINDFQitdm62nHWiZyu/
	 prQ0v3NPI2qQw9RXeKc+v0M7veGyv8VVnYg5WIGek0rlhE/5AppNKqSCqnbi38pVad
	 NApY9+/uXHkS/WHejaBCzIkqbuEwMzoW1gE/NyE0TjyfKJKsao+cxCps6U9ZARxJvP
	 expGT0dOx08Hw==
Message-ID: <sashiko-outbox-173754@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 09/25] ASoC: atmel: atmel-pcm-pdc: Fix
 atmel_pcm_close() being skipped on rollback
Reply-To: sashiko-reviews@lists.linux.dev
To: phucduc.bui@gmail.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261015014324.5569-10-phucduc.bui@gmail.com>
References: <20261015014324.5569-1-phucduc.bui@gmail.com>
 <20261015014324.5569-10-phucduc.bui@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 04:16:09 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] sound: atmel: Use-after-free and NULL deref in atmel_pcm_hw_free r=
ace
--

commit 04962f72fa0bbcac4e1c99626f3cc0f25a8a7762
Author: bui duc phuc <phucduc.bui@gmail.com>

ASoC: atmel: atmel-pcm-pdc: Fix atmel_pcm_close() being skipped on rollback

This commit fixes an issue where atmel_pcm_close() might be skipped on
rollback. It forces atmel_pcm_open() to explicitly return 0 on success,
as snd_pcm_hw_constraint_integer() can return 1, which causes ASoC to skip
marking the component as opened.

> diff --git a/sound/soc/atmel/atmel-pcm-pdc.c b/sound/soc/atmel/atmel-pcm-=
pdc.c
> index 374f93fa6e0b0..4cedf2ad934d6 100644
> --- a/sound/soc/atmel/atmel-pcm-pdc.c
> +++ b/sound/soc/atmel/atmel-pcm-pdc.c
> @@ -295,6 +295,13 @@ static int atmel_pcm_open(struct snd_soc_component *=
component,
>  	}
>  	runtime->private_data =3D prtd;
> =20
> +	/*
> +	 * ASoC only marks the component as opened when .open() returns 0.
> +	 * Since snd_pcm_hw_constraint_integer() may return 1, explicitly
> +	 * return 0 to ensure .close() is not skipped on rollback.
> +	 */
> +	return 0;

[Severity: High]
Could this change expose a race condition during teardown? By ensuring
atmel_pcm_close() executes, it seems we can now hit a use-after-free or
NULL pointer dereference.

When an audio stream is closed, ALSA triggers snd_pcm_drop() followed by
trigger(STOP), which disables the PDC but does not disable SSC interrupts
globally. This is followed by atmel_pcm_hw_free(), which clears the
interrupt handler:

sound/soc/atmel/atmel-pcm-pdc.c:atmel_pcm_hw_free() {
    ...
    prtd->params->dma_intr_handler =3D NULL;
    ...
}

And finally atmel_pcm_close() is called, which frees the prtd structure:

sound/soc/atmel/atmel-pcm-pdc.c:atmel_pcm_close() {
    ...
    kfree(prtd);
    ...
}

Meanwhile, an interrupt can still fire, and atmel_ssc_interrupt() calls the
handler without synchronization:

sound/soc/atmel/atmel_ssc_dai.c:atmel_ssc_interrupt() {
    ...
    dma_params->dma_intr_handler(ssc_sr, dma_params->substream);
    ...
}

Since there is no synchronize_irq() in the PCM teardown path,
atmel_ssc_interrupt() can race with atmel_pcm_hw_free() and
atmel_pcm_close(). This could lead to a NULL pointer dereference if
dma_intr_handler is evaluated after being cleared, or a use-after-free of
prtd if kfree(prtd) executes while atmel_pcm_dma_irq() is still actively
processing the stream on another CPU.

> +
>   out:
>  	return ret;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015014324.5569=
-1-phucduc.bui@gmail.com?part=3D9
