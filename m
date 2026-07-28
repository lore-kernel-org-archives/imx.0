Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BB941E6B6
	for <imx@lists.linux.dev>; Tue, 28 Jul 2026 10:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785234215; cv=none; b=M0TgaygaeXTEixQzHu6Aumh6KBrSulqbEQfhweZy6O8dYTI35EozHBuTIGSI95uIOd7KIYCamrHlnua4hCh41cUhQcASN6QSKhk9+IuyfA5Mf2VJbQc/3Z2awlJF4YEm+QvSw7aY99c3KKNxhgPhPpG60lXCRrfF48CzXhhWI5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785234215; c=relaxed/simple;
	bh=I++X/IkeIPfa0GLwII2IO6WKhHVDz6RkphGXxwfFTmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=PNcXJ1QjS4tSd22C17EaUJ3DcMcK+n3IaFB19YIqkYqUPQb8SWWwygZm8JQQA3oh9xxitUqSYirt/eGzbsrtJ1wi/luj4wUfdaYFQciLQJkq/jOllGy7++vZjvFyIIXCwXqBnNSdEiRM2S0mIjnCcVW+GRwCoG+SkxHOffAoDt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W1EZVAzU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W1EZVAzU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19C051F000E9;
	Tue, 28 Jul 2026 10:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785234214;
	bh=IOTffybjHGMDNzA1OGE6coV2LPvaSIqpRzDuNrG/TcA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W1EZVAzU6ogDyXx9Y54Mb0nqMT06F7KBUz2jihBmG54hpV3r0WmRe7RPBfyspKbLC
	 3i1qYdilBfoCl3+JVEcSkYe5tZgF5MX6u3URU/ADROcV/N5qHTPKtANzUylGfXOAF/
	 SEwRoZPE69gmGYazJv5deb+NWOrclpN0nuA7GVHujYug13wea76UmnU96rW0eoivhh
	 Eebq8XbQRlHA9gQZvAHGG1BQ8Yi19NaI4KqkfxDt9ftCy02fhaykwuV0pcOnGY/JLe
	 IUln0LQfAdXH0tdkB2uC1WZMC9mX9gm8JMjqkAVqvp5gTzoDpsSAVM9JglP7htGJDJ
	 CYXDxX2r0NYzA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/3] spi: spi-nxp-fspi: add per-SoC SDR/DTR clock
 rate limits for all supported SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260728-fspi-clock-v2-1-dbe786a4a6eb@nxp.com>
References: <20260728-fspi-clock-v2-0-dbe786a4a6eb@nxp.com>
 <20260728-fspi-clock-v2-1-dbe786a4a6eb@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Jul 2026 10:23:33 +0000
Message-Id: <20260728102334.19C051F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but clock configurat=
ion failures in `nxp_fspi_select_mem()` and `nxp_fspi_default_setup()` are =
silently ignored, leaving the controller unclocked and leading to system cr=
ashes upon subsequent register accesses.
--

--- Patch [1]: [PATCH v2 1/3] spi: spi-nxp-fspi: add per-SoC SDR/DTR clock =
rate limits for all supported SoCs ---
commit f96188480d6d41456b1f17269268e30b0c1612e5
Author: Haibo Chen <haibo.chen@nxp.com>

spi: spi-nxp-fspi: add per-SoC SDR/DTR clock rate limits for all supported =
SoCs

This commit corrects and updates the maximum clock rates for SDR and DTR
modes across various supported NXP SoCs. It adds max_sdr_rate and
max_dtr_rate fields to the devtype data and updates the runtime clock
rate selection to respect these SoC-specific limits.

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c

[ ... ]

> @@ -691,10 +757,20 @@ static void nxp_fspi_select_rx_sample_clk_source(st=
ruct nxp_fspi *f,
>  	reg =3D fspi_readl(f, f->iobase + FSPI_MCR0);
>  	if (op_is_dtr) {
>  		reg |=3D FSPI_MCR0_RXCLKSRC(3);
> -		f->max_rate =3D 166000000;
> +		/*
> +		 * Use the SoC-specific DTR max rate if provided, otherwise
> +		 * fall back to 166MHz (limit from IMX8MN datasheet =C2=A73.9.9).
> +		 */
> +		f->max_rate =3D f->devtype_data->max_dtr_rate ?
> +			      f->devtype_data->max_dtr_rate : 166000000;
>  	} else {	/*select mode 0 */
>  		reg &=3D ~FSPI_MCR0_RXCLKSRC(3);
> -		f->max_rate =3D 66000000;
> +		/*
> +		 * Use the SoC-specific SDR max rate if provided, otherwise
> +		 * fall back to 66MHz (limit from IMX8MN datasheet =C2=A73.9.9).
> +		 */
> +		f->max_rate =3D f->devtype_data->max_sdr_rate ?
> +			      f->devtype_data->max_sdr_rate : 66000000;

[Severity: High]
This is a pre-existing issue, but I noticed that changing the maximum rate
limit could potentially expose a silent failure path if the clock framework
returns an error for these newly configured max limits.

In nxp_fspi_select_mem(), the clock is disabled before configuring the
rate. If clk_set_rate() or nxp_fspi_clk_prep_enable() fails, the function
returns early without propagating the error:

drivers/spi/spi-nxp-fspi.c:nxp_fspi_select_mem() {
    ...
    nxp_fspi_clk_disable_unprep(f);

    ret =3D clk_set_rate(f->clk, rate);
    if (ret)
        return;

    ret =3D nxp_fspi_clk_prep_enable(f);
    if (ret)
        return;
    ...
}

Since nxp_fspi_select_mem() returns void, its caller nxp_fspi_exec_op()
continues executing and accesses registers in nxp_fspi_prepare_lut(), even
though the clock is left disabled:

drivers/spi/spi-nxp-fspi.c:nxp_fspi_exec_op() {
    ...
    nxp_fspi_select_mem(f, mem->spi, op);

    nxp_fspi_prepare_lut(f, op);
    ...
}

Could this unclocked IP block access lead to a system crash (such as an
external abort or kernel panic)?

Additionally, nxp_fspi_probe() seems to completely ignore the return value
of nxp_fspi_default_setup():

drivers/spi/spi-nxp-fspi.c:nxp_fspi_probe() {
    ...
    nxp_fspi_default_setup(f);

    ret =3D pm_runtime_put_sync(dev);
    ...
}

Should these errors be propagated up the call chain to ensure we avoid
accessing memory-mapped registers when the clock fails to initialize or
enable?

>  	}
>  	fspi_writel(f, reg, f->iobase + FSPI_MCR0);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728-fspi-clock=
-v2-0-dbe786a4a6eb@nxp.com?part=3D1
