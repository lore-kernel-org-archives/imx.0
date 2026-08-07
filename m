Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB76B46AEF0
	for <imx@lists.linux.dev>; Fri,  7 Aug 2026 08:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786090377; cv=none; b=ar45hk6ZYYUQUbJgGtFz5GuZKt05zvgUbbTuLC1YWNZXf2mPXhx8zmtS496fbA6rUl0VeOVTuYM95Zv9yUMZp3FYNUUj4GemXlbZE7UQkAcZQhF0kdJezR4bf6NxiqUv328qc5d63os17PW6PivounxIwhp/3t6zKbaOrGuEKFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786090377; c=relaxed/simple;
	bh=XC+t8/WBSQSbFpjUjgx9KjzHd/9SSdEtgR4b2xp3A8Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tY9H3JA1uaQ7PtSvrhy3xQjkv2D8WTIRb/aLeWycDYf0398G3Cg4T5SJZE5hvHyyDLKRINYdCq6h8cV7cvdaiwJO6xSyakh1rIqrS33gMPU5lD1SQXTSbg8gWhkzG7aTdEMj4CSmDGxkI3LDCPtKrWn+BWfNXdwRRXIBzIROxgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m+2sGBAk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m+2sGBAk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15EA1F000E9;
	Fri,  7 Aug 2026 08:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786090366;
	bh=mCxmK2vhxvDS8ZvzzeRDBJvzFzA8XvTNXcM6fl6b6qo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m+2sGBAk0Uft9//4n3mG7vyizgRYgHfLIavOombXwSPoIw1evF3oqLw8vcpCCj7Tn
	 uGCvlnCchf+2qQ1Xl5oWSJRwvJRb+CnqzhDHRXPee5W2BY9TtFdvH2ZoyK/s4t8tLT
	 8JtWc/Dccs/Zi3P7JUeLsac2s4/MHUXu/mijbFsgHYDItCculP6tbMH/B8x5Ai0h4b
	 12oVSTCl8fjCmgWUzjmhUzqKw/LhEkRmiM2Olw614tZu7YNrGeGFfKfn5y5UAHFj4M
	 MkoeelkqEFYVc8HDbUpGq/xvqF/BlAq0Ht8iP2f+tBY36VGgN0NHW/5LEBxaKBm17C
	 CsHTf+gpE1YsQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/4] irqchip/imx-irqsteer: Mask all interrupts in
 probe() and remove()
Reply-To: sashiko-reviews@lists.linux.dev
To: Zhipeng.wang_1@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260807072346.1222389-4-Zhipeng.wang_1@oss.nxp.com>
References: <20260807072346.1222389-1-Zhipeng.wang_1@oss.nxp.com>
 <20260807072346.1222389-4-Zhipeng.wang_1@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 07 Aug 2026 08:12:45 +0000
Message-Id: <20260807081245.D15EA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Missing `pm_runtime_get_sync()` in `imx_irqsteer_remove()` causes =
a fatal bus error on device unbind.
--

--- Patch [3]: [PATCH v3 3/4] irqchip/imx-irqsteer: Mask all interrupts in =
probe() and remove() ---
commit cdd5c75cd302eeb1d325e53989eb54042df373f6
Author: Zhipeng Wang <zhipeng.wang_1@nxp.com>

irqchip/imx-irqsteer: Mask all interrupts in probe() and remove()

This commit masks all interrupts in probe before wiring up chained handlers,
and again in remove to quiesce the hardware for the next probe. This is
intended to prevent interrupt storms on module reload.

> diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx=
-irqsteer.c
> index 4a2fe8ba97f50..0c9c99f1141a9 100644
> --- a/drivers/irqchip/irq-imx-irqsteer.c
> +++ b/drivers/irqchip/irq-imx-irqsteer.c
[ ... ]
> @@ -279,6 +283,11 @@ static void imx_irqsteer_remove(struct platform_devi=
ce *pdev)
>  	struct irqsteer_data *irqsteer_data =3D platform_get_drvdata(pdev);
>  	int hwirq, i;
> =20
> +	/* mask all interrupts so a stale line cannot storm on the next probe */
> +	for (i =3D 0; i < irqsteer_data->reg_num; i++)
> +		writel_relaxed(0, irqsteer_data->regs +
> +			       CHANMASK(i, irqsteer_data->reg_num));
[Severity: High]
Will this hardware register access cause a fatal bus error during device un=
bind?

During driver unbind (via module unload or sysfs), the driver core explicit=
ly
calls pm_runtime_put_sync() before calling the driver's remove callback. Th=
is
drops the runtime PM usage count and synchronously suspends the device, whi=
ch
disables the device's clock.

If the hardware is already unclocked, does calling writel_relaxed() on the
CHANMASK hardware registers without first waking the device up via
pm_runtime_get_sync() trigger a synchronous external abort on i.MX platform=
s?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260807072346.1222=
389-1-Zhipeng.wang_1@oss.nxp.com?part=3D3
