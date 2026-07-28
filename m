Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87138421248
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 10:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234199; cv=none; b=UojkP4dCE9JbZiLIc6odDs9hxUPs0ghQU22MWj+mkHdHc6bFylLrQ6ELh+pzRRyc2sMPSuGC+619Qap2TNx5S4qJ5t2KNt9lUyRcsgNAIFJ0Dr/TFnVQy5rLU/bS+5vpgjhZqwZkY++fnlVzbDOvbwPEMs2nP+Dw84AOCNlOVvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234199; c=relaxed/simple;
	bh=CYUq+bofGybPnRj8wqqjI0nkGlcPaiRUABor5GR6q0Q=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L7zNUc3sBsPAn3s9y4KuMk/mbUSmFrGbupFBlC0YgoXIW1qZJvS3AtoRRdbMVQIYv3brUk/C8Y5m5sloOpO0crVSZOc5HRJ0pdp3NCEBQX2jsby4dGgUSXl1YYXWSRj/UYpQMBnpggoxNZFDTqETEnma3KV2R+iFabgsZ+I9yWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b2RZgdO2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b2RZgdO2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E11301F000E9;
	Tue, 28 Jul 2026 10:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785234198;
	bh=jVKAlqvWasJ+omeRSlJpmouoXL1APR+y6Acs6Q3njwQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b2RZgdO2vnYmYV57ZVOGHoUk4hdcAyesApg3zOQmquTPPMqFjCJLr5GH2NwIpb7Pw
	 oIJPoxi2ABA3tet/U46ZKsrNyFVHIAWNKB2cb/4hpO0d8jzWat+j1j/AYIRGxWkfC1
	 SvHI4MaqqrNuKTjMjUZ++O2lx42dP/yUrPLT3m9W9rED481ktk4ij5G979b65zTwK/
	 m2tCYbbdfLSDJuSqUXbydU+YoQKCCfQmyaL44BttxdloMR1pf7h3qw8t3nNVGT3W5J
	 JRiFvOHa+MxdnP8jKwimpBQI3O058XoCCta+lTv9N7t3eZbLi76xNTK7AUwHX3yEjU
	 BkR5sNoQKe9FA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] spi: spi-nxp-fspi: enter stop mode before
 reconfiguring MCR0 and DLL
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260728-fspi-clock-v2-2-dbe786a4a6eb@nxp.com>
References: <20260728-fspi-clock-v2-0-dbe786a4a6eb@nxp.com>
 <20260728-fspi-clock-v2-2-dbe786a4a6eb@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 10:23:17 +0000
Message-Id: <20260728102317.E11301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Error paths in nxp_fspi_select_mem() leave the FlexSPI module perm=
anently in stop mode.
--

--- Patch [2]: [PATCH v2 2/3] spi: spi-nxp-fspi: enter stop mode before rec=
onfiguring MCR0 and DLL ---
commit 4391ccb7c73c0489ac0b6f714a7073bb2b08b3c1
Author: Haibo Chen <haibo.chen@nxp.com>

spi: spi-nxp-fspi: enter stop mode before reconfiguring MCR0 and DLL

This patch modifies nxp_fspi_select_mem() to enter stop mode by setting
MCR0[MDIS] before reconfiguring the RX sample clock source and DLL control
registers. It then exits stop mode once the reconfiguration is complete
according to the reference manual.

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index 6de6d432cdcb2..a426b8d92193a 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c
[ ... ]
> @@ -896,6 +897,15 @@ static void nxp_fspi_select_mem(struct nxp_fspi *f, =
struct spi_device *spi,
> =20
>  	dev_dbg(f->dev, "Target device [CS:%x] selected\n", spi_get_chipselect(=
spi, 0));
> =20
> +	/*
> +	 * Per the FlexSPI reference manual (initialization sequence), MCR0 and
> +	 * the DLL control registers should be configured while the module is in
> +	 * stop mode (MCR0[MDIS] =3D 1). Enter stop mode before reconfiguring t=
he
> +	 * RX sample clock source and the DLL, then exit stop mode afterwards.
> +	 */
> +	reg =3D fspi_readl(f, f->iobase + FSPI_MCR0);
> +	fspi_writel(f, reg | FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);
> +
>  	nxp_fspi_select_rx_sample_clk_source(f, op_is_dtr);
>  	rate =3D min(f->max_rate, op->max_freq);
> =20
[ ... ]
> @@ -928,6 +938,10 @@ static void nxp_fspi_select_mem(struct nxp_fspi *f, =
struct spi_device *spi,
>  	else
>  		nxp_fspi_dll_override(f);
> =20
> +	/* Exit stop mode now that MCR0 and the DLL have been reconfigured. */
> +	reg =3D fspi_readl(f, f->iobase + FSPI_MCR0);
> +	fspi_writel(f, reg & ~FSPI_MCR0_MDIS, f->iobase + FSPI_MCR0);
> +

[Severity: High]
Does this leave the FlexSPI module permanently in stop mode if the clock
configuration fails earlier in this function?

If clk_set_rate() or nxp_fspi_clk_prep_enable() fails, the code returns ear=
ly
without executing this exit block:

        ret =3D clk_set_rate(f->clk, rate);
        if (ret) {
                /* ... */
                nxp_fspi_clk_prep_enable(f);
                return ret;
        }

Because the early returns happen before the stop mode is cleared, the
hardware module is left disabled since FSPI_MCR0_MDIS remains set.

If this error occurs, a subsequent SPI transfer matching the previous
successful state could hit the early-return fast path at the top of
nxp_fspi_select_mem(), skip the hardware reconfiguration, and attempt
to execute a transfer while the hardware is still disabled.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-fspi-clock=
-v2-0-dbe786a4a6eb@nxp.com?part=3D2
