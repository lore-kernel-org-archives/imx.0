Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF3A441037
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 17:47:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788198432; cv=none; b=h92HPWNFI8a4AcPgVp+PJsg8DRoqf2XK5jU5DuQLCkcfjGf2w90DarstDeM0TWO13A0MbuGwdZ3zz2MG8dph6613WZsFjjOu6LdXqo8LenNuPXJ8MNFZPBfuar1lbYM7wQ2bM5/5jJ3/vYSkXARPhIguSuaqZMQppuq0UW0jJWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788198432; c=relaxed/simple;
	bh=r+OH0BGp+6+IVdWHhu/E+1ly56QUTwZe8EdA8NSSZP0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mdKjefwbxn8alBtu/xA3cBcrrXicYw2rf55Sb2HcwT4dPEzNZc3t2/slr6S/TOBMUrb4dr94nSmzvPEWolXaEtxqmZ2NBoUTeuPjC8lx1eamBVn4hMGhSoyW6J5PHhkeNPUAuv9k7a5FfPmSc393BTbkzqhWyGHkkCrvdx0Ug6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mmhz1xrQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mmhz1xrQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182721F000E9;
	Mon, 31 Aug 2026 17:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788198431;
	bh=um4lf/+zU2hWPWhq6S+Hc3ktqfcUxK/8RihbDdxddLc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Mmhz1xrQd5+Uo0T9HMR0ILwE5SRhQA++l0Dg0h0ZB/qlzNwhBqNhAVZdzV/KY5nU7
	 wHmRlPz7lDWPs6YSgctoG1+yr++XE3s3/FWfhpYrvVuPsA1j8rIbsJjCPo+XG9aTu5
	 BUiG1dNDNOkNBdqWwvDYy7EDgrHkq1SeqMrt1TNG0e71XUS1U6H1hcq+M6MwleUms7
	 o70EKyWjQrTZvHa9ebltezM3G0KCY4Zfizt/uT/LWJnMBVBjh6bl0Rgg+TvCF80uqo
	 UpW7RfxJZ94nEdStnHwcm3LXv1MOmBfPhcklqKRdcfa/xJ88M7NbA9r+gdRwBDBhXB
	 q0wKJAuJP9tPw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] spi: spi-nxp-fspi: propagate clock
 reconfig failures in nxp_fspi_select_mem()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260831133314.4125787-661-sashal@kernel.org>
References: <20260831133314.4125787-1-sashal@kernel.org>
 <20260831133314.4125787-661-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 31 Aug 2026 17:47:10 +0000
Message-Id: <20260831174711.182721F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

New issues:
- [High] Hardware chip-select configuration is desynchronized from software=
 tracking state on clock reconfiguration failure.
- [High] PM runtime state remains active while hardware clocks are left dis=
abled on clock enable failure, causing a subsequent synchronous external ab=
ort.

Pre-existing issues:
- [High] Teardown asymmetry leaves the IRQ handler active after hardware cl=
ocks are disabled, risking an external abort.
- [High] Unchecked pm_runtime_get_sync() in nxp_fspi_cleanup() can lead to =
a synchronous external abort.
- [High] The interrupt handler accesses hardware registers without verifyin=
g the PM active state, violating subsystem guidelines and risking an extern=
al abort.
--

commit 90f6f57222227859ff0d0df74b2ed0073979680a
Author: Haibo Chen <haibo.chen@nxp.com>

spi: spi-nxp-fspi: propagate clock reconfig failures in nxp_fspi_select_mem=
()

This commit modifies nxp_fspi_select_mem() to return an integer error code
instead of void. It ensures that if clock reconfiguration fails, the failure
is propagated to nxp_fspi_exec_op(), which then bails out to avoid triggeri=
ng
a synchronous external abort when accessing gated hardware registers.

Link: https://patch.msgid.link/20260728-fspi-clock-v2-3-dbe786a4a6eb@nxp.com

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 50a7e4916a600..f672619c16afb 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
[ ... ]
> @@ -804,7 +804,7 @@ static void nxp_fspi_select_mem(struct nxp_fspi *f, s=
truct spi_device *spi,
>  	if ((f->selected =3D=3D spi_get_chipselect(spi, 0)) &&
>  	    (!!(f->flags & FSPI_DTR_MODE) =3D=3D op_is_dtr) &&
>  	    (f->pre_op_rate =3D=3D op->max_freq))
> -		return;
> +		return 0;

[Severity: High]
Can hardware chip-select configuration become desynchronized from the softw=
are
tracking state if a clock reconfiguration failure occurs?

If clk_set_rate() fails during a chip select change in nxp_fspi_select_mem()
in drivers/spi/spi-nxp-fspi.c:

nxp_fspi_select_mem()
    fspi_writel(f, size_kb, f->iobase + FSPI_FLSHA1CR0 +
                4 * spi_get_chipselect(spi, 0));

Hardware is reprogrammed to the new chip select, and all other chip selects=
 are
cleared to 0 size.

    ret =3D clk_set_rate(f->clk, rate);
    if (ret)
        return ret;

The function then returns an error, bypassing the state update:

    f->selected =3D spi_get_chipselect(spi, 0);

On the next operation for the old chip select, wouldn't this early return c=
heck
incorrectly succeed (since f->selected still matches the old chip select),
bypassing hardware reconfiguration while the hardware is actually configure=
d for
the new chip select?

[ ... ]
> @@ -836,12 +836,19 @@ static void nxp_fspi_select_mem(struct nxp_fspi *f,=
 struct spi_device *spi,
>  	nxp_fspi_clk_disable_unprep(f);
> =20
>  	ret =3D clk_set_rate(f->clk, rate);
> -	if (ret)
> -		return;
> +	if (ret) {
> +		/*
> +		 * clk_set_rate() failed with the clocks already disabled.
> +		 * Re-enable them so the enable count matches what the caller's
> +		 * pm_runtime_put() (runtime_suspend) will drop.
> +		 */
> +		nxp_fspi_clk_prep_enable(f);
> +		return ret;
> +	}
> =20
>  	ret =3D nxp_fspi_clk_prep_enable(f);
>  	if (ret)
> -		return;
> +		return ret;
[ ... ]
> @@ -1042,7 +1051,16 @@ static int nxp_fspi_exec_op(struct spi_mem *mem, c=
onst struct spi_mem_op *op)
>  				   FSPI_STS0_ARB_IDLE, 1, POLL_TOUT, true);
>  	WARN_ON(err);
> =20
> -	nxp_fspi_select_mem(f, mem->spi, op);
> +	err =3D nxp_fspi_select_mem(f, mem->spi, op);
> +	if (err) {
> +		/*
> +		 * On failure the FlexSPI clock may be left disabled, so avoid
> +		 * any further register access (which would trigger a synchronous
> +		 * external abort) and bail out.
> +		 */
> +		pm_runtime_put_autosuspend(f->dev);
> +		return err;
> +	}

[Severity: High]
If nxp_fspi_clk_prep_enable() fails, the function returns an error while the
hardware clocks are still physically disabled.=20

When this happens, does nxp_fspi_exec_op() in drivers/spi/spi-nxp-fspi.c
correctly handle the PM runtime state?

nxp_fspi_exec_op()
    err =3D nxp_fspi_select_mem(f, mem->spi, op);
    if (err) {
        pm_runtime_put_autosuspend(f->dev);
        return err;
    }

Since autosuspend is used on the error path, the device remains in the
RPM_ACTIVE state for the duration of the timeout, even though hardware cloc=
ks
are off. If another operation runs immediately:

nxp_fspi_exec_op()
    pm_runtime_get_sync(f->dev); /* succeeds instantly without enabling clo=
cks */
    ...
    fspi_readl_poll_tout(f, f->iobase + FSPI_STS0, ...);

Could this sequence trigger a synchronous external abort when accessing the
memory-mapped registers during the subsequent operation?


While reviewing this patch, I also noticed a few pre-existing issues:

> drivers/spi/spi-nxp-fspi.c:nxp_fspi_probe() {
[ ... ]
> 	ret =3D devm_request_irq(dev, irq,
> 			nxp_fspi_irq_handler, 0, pdev->name, f);
> 	if (ret)
> 		return dev_err_probe(dev, ret, "Failed to request irq\n");
[ ... ]
> 	ret =3D devm_add_action_or_reset(dev, nxp_fspi_cleanup, f);
> 	if (ret)
> 		return ret;

[Severity: High]
This is a pre-existing issue, but does this teardown asymmetry risk a
synchronous external abort?

During driver unbind in drivers/spi/spi-nxp-fspi.c, devres will execute LIF=
O,
meaning nxp_fspi_cleanup() will be called before devm_free_irq() completes:

nxp_fspi_cleanup()
    fspi_writel(f, FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);
    pm_runtime_disable(f->dev);
    nxp_fspi_clk_disable_unprep(f);

Since the IRQ handler is still active while clocks are disabled, what happe=
ns if
a spurious or delayed interrupt fires and nxp_fspi_irq_handler() accesses t=
he
hardware registers?


> drivers/spi/spi-nxp-fspi.c:nxp_fspi_cleanup() {
> 	/* enable clock first since there is register access */
> 	pm_runtime_get_sync(f->dev);
>=20
> 	/* disable the hardware */
> 	fspi_writel(f, FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);

[Severity: High]
This is a pre-existing issue, but is it safe to proceed without checking the
return value of pm_runtime_get_sync()?=20

If pm_runtime_get_sync() fails to resume the device in nxp_fspi_cleanup() (=
for
example, due to a clock enable failure), wouldn't the subsequent write to
FSPI_MCR0 occur with gated clocks and trigger a synchronous external abort?


> drivers/spi/spi-nxp-fspi.c:nxp_fspi_irq_handler() {
> 	struct nxp_fspi *f =3D dev_id;
> 	u32 reg;
>=20
> 	/* clear interrupt */
> 	reg =3D fspi_readl(f, f->iobase + FSPI_INTR);

[Severity: High]
This is a pre-existing issue, but does the interrupt handler violate PM
subsystem rules by accessing hardware registers without verifying the PM ac=
tive
state?

If the device is in runtime suspend (with clocks gated) and a spurious
interrupt fires on a shared IRQ line, nxp_fspi_irq_handler() blindly reads
FSPI_INTR in drivers/spi/spi-nxp-fspi.c.

Without calling pm_runtime_get_if_active() first, could this invalid hardwa=
re
access crash the system with a synchronous external abort?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831133314.4125=
787-661-sashal@kernel.org?part=3D1
