Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0372B3C7E1E
	for <imx@lists.linux.dev>; Wed, 20 May 2026 09:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271041; cv=none; b=glFY15AB07Z6W8WW/MKLn+cBg71TeUr+hLZV/co1Cghtk3WYjvi6gvnGVFJZzcV+t2xuRo1OudOEWmyOjfBbjvXMXysaj1P9aeBrV7+xD/Qg4Ze7JB88QaYSIcI4IIfUKLstNgE8mo4mHVGnVFK4Dt+wpgDfZlWAGPdLxnRSQ58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271041; c=relaxed/simple;
	bh=U+07EJHtgMKACxE1jCxoTwrE2nK3361Yof1djA+C0w0=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L/injFw38+FhOHJxAwLzFe0pIJ2IMTMPO2PY5xYf1UEpKWN/SJhw3rqruzDKdaY48JDllrUYvhW2NRkQvmR/Xk/BLu/S39CsoEVfZ6YvDCZ/WPFVGKnGaD31bPYuql5kStvcEFq4yx9RoE2D6RnVScuFK1QG7kChnYY6GCdfTVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NjmhvBYn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NjmhvBYn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACEB1F000E9;
	Wed, 20 May 2026 09:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779271039;
	bh=Dzgj94Z7yRTXme6lMfiJQ5XVFwK2m+ucEb85nbrTKlA=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=NjmhvBYnO3sjuNdrcL+MxLotM1GfDI5CZYaQREid4iE30Pm9Hi1jfDdTaz/8sVMm8
	 W19nB03AdUExXIzgIBVQqm/N3vuz/ukbG1bHMApfm8sbvI44hA+hv+AybKoSKD6ce4
	 wsvKCZtMnGTkBfSMkN/RnTQBTq7MWHauC9TdJXIjhY/J5/agXEDsoZA1Dib8dykcve
	 WxKW0xTGBa0QtmAYbmrviq+WrMQPkV6ikshpoL9Q31VVIouF7JggqcqGw1xQIamk/w
	 6Id0q7MLaZcynIvoTJN0sIsdL/QOtpi1bR3sAgzVNCfd2UCj1HGpqLFZadK7xdnHCb
	 GxoM9hgm6HYZA==
From: sashiko-bot@kernel.org
Subject: Re: [PACTH v2] i2c: imx-lpi2c: mark I2C adapter when hardware is
 powered down
Reply-To: sashiko-reviews@lists.linux.dev
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260520090910.2879570-1-carlos.song@oss.nxp.com>
References: <20260520090910.2879570-1-carlos.song@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 09:57:19 +0000
Message-Id: <20260520095719.7ACEB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Error path in `lpi2c_imx_register_target()` leaves a dangling poin=
ter to `i2c_client`.
- [High] Device removal leaves clocks enabled and leaks resources if an aut=
osuspend is pending.
- [High] DMA channels requested during probe are never released upon driver=
 removal, leading to a resource leak.
--

commit ea79dc438d9fcc5d588e727fe52f925907004b57
Author: Carlos Song <carlos.song@nxp.com>

i2c: imx-lpi2c: mark I2C adapter when hardware is powered down

This commit marks the i2c adapter as suspended during system suspend to
block further transfers. It resumes the adapter on system resume to prevent
potential hangs when clients attempt i2c transfers while hardware is powered
down.

Cc: stable@vger.kernel.org

> diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c b/drivers/i2c/busses/i2c-=
imx-lpi2c.c
> index a01c236964819..01ee38131ef2e 100644
> --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> @@ -1635,7 +1635,18 @@ static int __maybe_unused lpi2c_runtime_resume(str=
uct device *dev)

[ ... ]

> @@ -1655,6 +1666,8 @@ static int __maybe_unused lpi2c_resume_noirq(struct=
 device *dev)
>  	if (lpi2c_imx->target)
>  		lpi2c_imx_target_init(lpi2c_imx);

[Severity: High]
This is a pre-existing issue, but does the error path in
lpi2c_imx_register_target() leave a dangling pointer that gets used here?

In lpi2c_imx_register_target(), lpi2c_imx->target is assigned to client
before calling pm_runtime_resume_and_get(). If the pm resume fails, the
function returns an error but fails to clear lpi2c_imx->target.

If the i2c subsystem subsequently frees the client device due to the failed
registration, the dangling pointer remains. Later, during system resume,
this code will unconditionally access lpi2c_imx->target->addr, potentially
leading to a use-after-free and a kernel crash.

> +	i2c_mark_adapter_resumed(&lpi2c_imx->adapter);
> +
>  	return 0;
>  }

While reviewing this, I noticed a couple of pre-existing issues in
lpi2c_imx_remove():

drivers/i2c/busses/i2c-imx-lpi2c.c:lpi2c_imx_remove() {
    ...
	i2c_del_adapter(&lpi2c_imx->adapter);

	pm_runtime_disable(&pdev->dev);
	pm_runtime_dont_use_autosuspend(&pdev->dev);
}

[Severity: High]
This isn't a bug introduced by this patch, but does device removal leave
clocks enabled and leak resources if an autosuspend is pending?

The driver calls pm_runtime_disable() without a prior synchronous put or
explicit hardware disable. If an autosuspend timer is pending (for example,
from a recently completed i2c transfer), pm_runtime_disable() will cancel
the pending async suspend and leave the device in the active state.

Because the driver does not explicitly disable the clocks in the removal
path, the i2c peripheral clocks remain permanently enabled indefinitely,
causing a power and resource leak.

[Severity: High]
This is a pre-existing issue, but are the dma channels requested during
probe ever released upon driver removal?

In lpi2c_dma_init(), the driver requests dma channels using
dma_request_chan(). These channels must be explicitly released with
dma_release_channel() when the driver is unbound.

However, the release logic is completely omitted in lpi2c_imx_remove(), and
there is no devm action registered to handle the cleanup. Will unbinding
the driver permanently leak the tx and rx dma channels?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520090910.2879=
570-1-carlos.song@oss.nxp.com?part=3D1
