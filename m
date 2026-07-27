Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36DC237A49D
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 09:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785143817; cv=none; b=kHmeG9wHYIHViS074Enw7GE/ycjhtZ3miQKOBHUcfpXETsZ43UKSmOcfJjEPge28mIGk/SJclpN5/QC7Sdsf8v7wxou+s9RlxC6W7g/KH/KLCA8WitrzeszH00dIXc0SMqc8VHBLj5ZYi0icVhoKep93+fpCNCH9j30QV2ldEfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785143817; c=relaxed/simple;
	bh=eMY6ZY/cMN33QrmWW8nSyD5+207x0NPhBQR48B8g8qY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qveCnngokB6U6fVE3EUkNEYLM1xACx569+PSEfPji+BE2l6TZCvyJlc2xcHhCh0U1gA1Numk4E8UzCYMLiVWUL0kmLLGnaMcpyrW0ihH4FnH1LVczxzf3otGrOjwEKLsYQbPPXTcwKEnQOhc2VQo3v6JPiY0tdwTWBaFAtXaiHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E2oPOScG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E2oPOScG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 888821F000E9;
	Mon, 27 Jul 2026 09:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785143815;
	bh=pUff4oWPqZNcisQBQmohBX7Hzhjt1mt2K/3TBIDcVuQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E2oPOScGPbUTDh1aEN6u1PJttga8IoAqxkB764NBsPXXOXbj3hNhkkgaAjVOmpZ15
	 XcecqQgMi0na2tZdKaNYF5huW1iBYiNiymlt4fNdGaZa81qw+iDe23hCiSdNX/ceN8
	 T7GntSspOQ0Nast+ycwS/e7BgpOMYT1PvJJwZ/NJuqt2mjT6ffR6XgOFyH9Iko4+R2
	 oKgniH7paly15g+gTJZ5deIUhzUc6iDfA6scjGE4FI10IL+cuq+vfowxOEYsYz4XIS
	 Q069JGOmwhK3+VmoDQ8d7zBy+8U6siDp73nPACJnCLM8l1wkPo73WsXZ5SdRbK/4ks
	 UeARQ1wWyaWgQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] spi: spi-nxp-fspi: add per-SoC SDR/DTR clock rate
 limits for all supported SoCs
Reply-To: sashiko-reviews@lists.linux.dev
To: haibo.chen@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260727-fspi-clock-v1-1-f4f3be6c366d@nxp.com>
References: <20260727-fspi-clock-v1-1-f4f3be6c366d@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 09:16:54 +0000
Message-Id: <20260727091655.888821F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing clock re-enable on error path in `nxp_fspi_select_mem` lea=
ds to synchronous aborts.
- [High] FlexSPI `MCR0` register is modified while the module is enabled.
- [High] Flawed detection of DTR mode for operations missing optional phase=
s (e.g., commands with no data).
--

--- Patch [1]: [PATCH] spi: spi-nxp-fspi: add per-SoC SDR/DTR clock rate li=
mits for all supported SoCs ---
commit 45fd7def019be2b4fb5ec79c57cfe9cfd93dcfb4
Author: Haibo Chen <haibo.chen@nxp.com>

spi: spi-nxp-fspi: add per-SoC SDR/DTR clock rate limits for all supported =
SoCs

This patch introduces per-SoC clock rate limits for both SDR and DTR modes
by adding max_sdr_rate and max_dtr_rate to nxp_fspi_devtype_data. It updates
nxp_fspi_select_rx_sample_clk_source() to use these SoC-specific limits ins=
tead
of a global 166MHz cap.

> diff --git a/drivers/spi/spi-nxp-fspi.c b/drivers/spi/spi-nxp-fspi.c
> index d94a2a7b98d44..1159f5fc8a3a6 100644
> --- a/drivers/spi/spi-nxp-fspi.c
> +++ b/drivers/spi/spi-nxp-fspi.c

[ ... ]

> @@ -691,10 +755,20 @@ static void nxp_fspi_select_rx_sample_clk_source(st=
ruct nxp_fspi *f,
>  	reg =3D fspi_readl(f, f->iobase + FSPI_MCR0);
>  	if (op_is_dtr) {
>  		reg |=3D FSPI_MCR0_RXCLKSRC(3);

[Severity: High]
This is a pre-existing issue, but modifying the FlexSPI MCR0 register while
the module is enabled can lead to unpredictable IP behavior.=20

Does this code need to assert the MDIS bit (disable the module) before
modifying MCR0, as hardware state machines might ignore register writes or
corrupt their internal state if changed on the fly?

> -		f->max_rate =3D 166000000;
> +		/*
> +		 * Use the SoC-specific DTR max rate if provided, otherwise
> +		 * fall back to 166MHz (limit from IMX8MN datasheet =C2=A73.9.9).
> +		 */
> +		f->max_rate =3D f->devtype_data->max_dtr_rate ?
> +			      f->devtype_data->max_dtr_rate : 166000000;
>  	} else {	/*select mode 0 */

[ ... ]


While reviewing this patch, I noticed a couple of other pre-existing issues
in nxp_fspi_select_mem() within the same file:

drivers/spi/spi-nxp-fspi.c:nxp_fspi_select_mem() {
    ...
	/* flexspi only support one DTR mode: 8D-8D-8D */
	bool op_is_dtr =3D op->cmd.dtr && op->addr.dtr && op->dummy.dtr && op->dat=
a.dtr;
    ...
}

[Severity: High]
This is a pre-existing issue, but does this boolean check strictly require
all four phases to have the DTR flag set?

For an 8D-8D-8D command missing an optional phase (e.g., Read Status Regist=
er
missing an address phase), spi-mem sets nbytes=3D0 and dtr=3D0 for that pha=
se.
This would evaluate to false, causing valid DTR operations to fall back to
SDR sample clock and half the target frequency.

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

[Severity: High]
This is a pre-existing issue, but does this code leave the FlexSPI clock
disabled on the error path?

If clk_set_rate() or nxp_fspi_clk_prep_enable() fails, the function returns
early without restoring the clock.

Since it returns void, the caller is unaware of the failure and might
immediately access hardware registers, which could lead to synchronous
external aborts.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-fspi-clock=
-v1-1-f4f3be6c366d@nxp.com?part=3D1
