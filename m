Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC7EF4322FC
	for <imx@lists.linux.dev>; Wed, 19 Aug 2026 09:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787131142; cv=none; b=P9VnFFI5PnmmnRWIATGqpyUAbGLrJk/j7UGUvIaDtUWv8ZmEYFrzvfJ3nhEtGWbwN8ZuldpHo57beNqfmtVQDdoOdPVsHEsLdyqPN6UOEkVnDMCrPqc0vKTvBG6k+jgVfcfJzuTInhbGslIRcSBwZEj73bwhZjadUjdp7aTGfbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787131142; c=relaxed/simple;
	bh=fb0LfjWgqGSJj5lXIzer9wFqpdK54y9Vz4o61jyl4RA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aJTRtdKj0ayxwFstAFYDvCst0utYVv2xM/9pxwF/zxYux9CMQiPEZ6kM/7La2OQ3sM2bzBRj7pcHn6XA5zMKu4sIL+xRBaAdbc6w/tBrazMhTSTfrPXdSHXJ2a6flB23RR6EELbWUv1R1AwDLbrdmKoup3Ws0QIWZaSyDmzsO30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IxpimyLo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IxpimyLo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7ACD71F000E9;
	Wed, 19 Aug 2026 09:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787131132;
	bh=ZvGj1mxGxEL9O8l599UgH5gqGRR5FrIlt2eySoF9fiw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IxpimyLoDfNdYRthtzH2jCiQ0iB6p/hpYvzxZRYJDoQyMsH0qk9d0MS/9W/K3yU7k
	 0d32IzCHe7PDRasGqXRKGYiY9+T4x/oQvS97fY3EIn6tI6lR2qITIgWQBzMYwELccF
	 tkFh8HmlqUblQwV9aP+mLyX2gO2QVg/BGH+PUZ7v1vMXBRFAk5u0zJWaYaJ9k4+eTT
	 GFz8TNj2dhQc+u/hU42nUchmE/BLiCJihfOh2BfWCWSqLBaLTCcUlLxCIwacVF79QZ
	 xGUC769/29pV+1rAZ8TDjL9WpdS8AtHBfp+Wrh2xS7vdOHkrx0WF8K6dUuP02RgNZ3
	 NZzg7jN1GH+BQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/5] irqchip/imx-irqsteer: Dispose of parent IRQ
 mappings in remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260819090543.585131-4-Zhipeng.wang_1@oss.nxp.com>
References: <20260819090543.585131-1-Zhipeng.wang_1@oss.nxp.com>
 <20260819090543.585131-4-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 19 Aug 2026 09:18:52 +0000
Message-Id: <20260819091852.7ACD71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unbalanced PM runtime teardown leads to clock underflow on driver =
unbind.
--

--- Patch [3]: [PATCH v4 3/5] irqchip/imx-irqsteer: Dispose of parent IRQ m=
appings in remove() ---
commit 58fbfcc1ec63bf5165fed17c40b2a3a04a6235ef
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irqchip/imx-irqsteer: Dispose of parent IRQ mappings in remove()

This commit fixes a resource leak in the imx-irqsteer driver by properly
disposing of parent output interrupt mappings during the remove callback.
It ensures that the mappings created in probe are torn down when the
driver unbinds.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
> @@ -283,6 +283,7 @@ static void imx_irqsteer_remove(struct platform_devic=
e *pdev)
> =20
>  		irq_set_chained_handler_and_data(irqsteer_data->irq[i],
>  						 NULL, NULL);
> +		irq_dispose_mapping(irqsteer_data->irq[i]);
>  	}
> =20
>  	clk_disable_unprepare(irqsteer_data->ipg_clk);

[Severity: High]
This is a pre-existing issue, but does this clock disable cause an underflow
when unbinding the driver?

When the driver unbinds, the driver core calls pm_runtime_put_sync(), which
suspends the device and calls imx_irqsteer_suspend(). That suspend function
already calls clk_disable_unprepare(ipg_clk).

Immediately after, imx_irqsteer_remove() executes and unconditionally calls
clk_disable_unprepare() again on the already suspended device. Can this
double disable lead to a clock count underflow WARN and potentially disable
a shared clock?

Additionally, since imx_irqsteer_remove() lacks a pm_runtime_disable()
call, will leaving the PM runtime disable depth unbalanced cause an
unbalanced pm_runtime_enable warning if the driver is later rebound?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260819090543.5851=
31-1-Zhipeng.wang_1@oss.nxp.com?part=3D3
