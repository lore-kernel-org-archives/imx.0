Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FF840D58A
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 02:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782701710; cv=none; b=dmx10t7j9QacKR/Dq5atZrSGE0WXDALz0cnBm8rr1J7093/KbGV44SyM3SKMt5Xz6SUjoZewUfxMwzHNtkri+Cl5pzOO9oADKrFchAoYbEAQGU8Jo5pEvEoG6PJpnPm0K8ZzAzL2vN8+jcRGVqLXpu/5XiIDmuyiUQzBC2QaZX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782701710; c=relaxed/simple;
	bh=eSYnai1BJftxez3GxplayAPKrxwey+FgIxLdFvJ0Eic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=omQUyQ9IyHcnNBHcShfzvU2HLcq883tRtqOBoHBaPkGjf9QvHVFfclX+vQbnK7g3zu/uS9ya434bOBnwdt/7HalePN0VJA5FtqhMHAEHJA02EPMxh5qNLiVY8c2up828HJKTuvXyOMZZ7bPGPY2ZEJ/B5sd9RSiuN3W4NdRYj30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqGvvjJz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqGvvjJz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50ED41F000E9;
	Mon, 29 Jun 2026 02:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782701708;
	bh=lPttCtrv4uwk2rAOCvZl18HDpUiWNVv+b4RWRJRYzRM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BqGvvjJzO35YgCwPpxWajQ3tEumgLZDpHnj3uaOGdlPs9FFw5KrXvSljLGU1KYp3v
	 Q/KJDiO2hdsZj3Lz2ppsGfTcXwOJHXqGXRRmkS+BMFVAs20sPOpUusfMJX/iISava4
	 dmMJXLJrOKGv43wDtx3jhVuS0NEOryYBjlTNgtoIEOuf1Ln1cI4EUaKUT8ZogBW9wM
	 yHM73KSW5bjEkRPbsgdgU2XDKl6ufC7KNanUVJFb2TTnJUZh8xBh3dQbv9jluRHgJx
	 h70zF1bvDXLTwts1WilFmdkB1ZvYob0fQS6ic25HE9pa9OJtEwBK8NP4DO29WX6cvO
	 C7zXTJxyQMEUg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] i2c: imx: Fix slave registration race and error
 handling
Reply-To: sashiko-reviews@lists.linux.dev
To: Liem <liem16213@gmail.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260629023829.152651-2-liem16213@gmail.com>
References: <AM0PR04MB6802B863CD9B9AE1609C1785E8EB2@AM0PR04MB6802.eurprd04.prod.outlook.com>
 <20260629023829.152651-1-liem16213@gmail.com>
 <20260629023829.152651-2-liem16213@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 02:55:07 +0000
Message-Id: <20260629025508.50ED41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Shared interrupt handler accesses hardware registers while the dev=
ice may be runtime suspended, and the suspend callback lacks synchronize_ir=
q().
- [High] Lockless nullification of `i2c_imx->slave` in `i2c_imx_unreg_slave=
()` creates a race condition with the interrupt handler, risking a NULL poi=
nter dereference.
- [High] Inconsistent handling of `pm_runtime_put_sync()` return value in `=
i2c_imx_unreg_slave()` can cause spurious unregistration failures in the I2=
C core.
- [High] `i2c_imx_slave_init()` is executed outside of the `slave_lock` in =
`i2c_imx_reg_slave()`, exposing partially initialized hardware state to con=
current ISR execution.
- [High] DMA mappings are permanently leaked on the timeout error paths dur=
ing DMA transfers.
--

commit 04be58cb17fc93e06e4dbace3d95e195d097878a
Author: Liem <liem16213@gmail.com>

i2c: imx: Fix slave registration race and error handling

This patch fixes a race condition and error handling bug in slave
registration by moving the assignment of the slave pointer after a
successful resume and inside a lock.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index cf5bacf3a4884..136e179d18b2d 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -865,9 +865,6 @@ static int i2c_imx_reg_slave(struct i2c_client *clien=
t)
>  	if (i2c_imx->slave)
>  		return -EBUSY;
> =20
> -	i2c_imx->slave =3D client;
> -	i2c_imx->last_slave_event =3D I2C_SLAVE_STOP;
> -
>  	/* Resume */
>  	ret =3D pm_runtime_resume_and_get(i2c_imx->adapter.dev.parent);
>  	if (ret < 0) {
> @@ -875,6 +872,11 @@ static int i2c_imx_reg_slave(struct i2c_client *clie=
nt)
>  		return ret;
>  	}
> =20
> +	scoped_guard(spinlock_irqsave, &i2c_imx->slave_lock) {
> +		i2c_imx->slave =3D client;
> +		i2c_imx->last_slave_event =3D I2C_SLAVE_STOP;
> +	}
> +
>  	i2c_imx_slave_init(i2c_imx);

[Severity: High]
This is a pre-existing issue, but does executing i2c_imx_slave_init()
outside of the slave_lock expose partially initialized hardware state to
concurrent ISR execution?

If a shared interrupt fires between the lock release and the register reset
in i2c_imx_slave_init(), the ISR could acquire the lock, see i2c_imx->slave
is non-NULL, and act on stale I2SR_IIF flags left over from prior
operations.

Could this invoke i2c_imx_slave_handle() with garbage hardware state?

> =20
>  	return 0;
>  }

While reviewing these locking changes, I noticed a few other patterns in the
driver that might need attention.

drivers/i2c/busses/i2c-imx.c:i2c_imx_unreg_slave() {
    ...
    i2c_imx->slave =3D NULL;
    ...
}

[Severity: High]
This is a pre-existing issue, but does the lockless nullification of
i2c_imx->slave in i2c_imx_unreg_slave() create a race condition with the
interrupt handler?

If the shared interrupt handler i2c_imx_isr() executes concurrently, it may
acquire slave_lock, verify i2c_imx->slave is non-NULL, and proceed. If
i2c_imx_unreg_slave() clears the pointer immediately after this check,
would the ISR pass a NULL pointer to i2c_imx_slave_handle(), causing a
direct NULL pointer dereference?


Also in the removal path:

drivers/i2c/busses/i2c-imx.c:i2c_imx_unreg_slave() {
    ...
    ret =3D pm_runtime_put_sync(i2c_imx->adapter.dev.parent);
    if (ret < 0)
        dev_err(&i2c_imx->adapter.dev, "failed to suspend i2c controller");

    return ret;
}

[Severity: High]
This isn't a bug introduced by this patch, but can this inconsistent
handling of pm_runtime_put_sync() cause spurious unregistration failures?

According to the Runtime PM documentation, pm_runtime_put_sync() returns 1
if the device was already suspended. However, i2c_slave_unregister() expects
exactly 0 for success.

Since unreg_slave() has already successfully detached the slave, does
returning 1 leave the I2C core thinking the slave is still active, failing
to clear client->slave_cb?


Regarding the ISR and power management:

drivers/i2c/busses/i2c-imx.c:i2c_imx_isr() {
    ...
    status =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
    ...
}

drivers/i2c/busses/i2c-imx.c:i2c_imx_runtime_suspend() {
    ...
    clk_disable(i2c_imx->clk);
    ...
}

[Severity: High]
This is a pre-existing issue, but does the shared interrupt handler access
hardware registers while the device might be runtime suspended?

If another device on the same IRQ line triggers an interrupt while the I2C
controller is runtime-suspended, i2c_imx_isr() unconditionally reads
IMX_I2C_I2SR without calling pm_runtime_get_if_active().

Additionally, the suspend callback disables the clock without calling
synchronize_irq() to ensure no ISR is mid-flight.

Could reading memory-mapped registers of a clock-gated device cause a
synchronous external abort or return garbage values?


Finally, looking at the DMA transfer error paths:

drivers/i2c/busses/i2c-imx.c:i2c_imx_dma_write() {
    ...
    if (time_left =3D=3D 0) {
        dmaengine_terminate_sync(dma->chan_using);
        return -ETIMEDOUT;
    }
    ...
}

[Severity: High]
This isn't a bug introduced by this patch, but are the DMA mappings
permanently leaked on these timeout error paths?

Because the transfer is forcefully aborted, the async DMA completion
callback i2c_imx_dma_callback() is never executed. Since
dma_unmap_single() is only called inside that callback, does this result in
exhausting IOMMU space if timeouts occur?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629023829.1526=
51-1-liem16213@gmail.com?part=3D1
