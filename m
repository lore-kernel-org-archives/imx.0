Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630024;
	b=rOapjoNGz12EDaDnhi3uZ0SUwsQfJrzfhBEuAszMKrsDArhpz4IO7HCxwrn/XuIFQFCg
	 tSHcqUuQ5EmzNuGcvvciH9v4ZskwLRlAkv0PeCuKsvxRQkZqGGK5ehlPEpw5UjRjDcZo+
	 JUdSyHc4XlG3rJbV6muV9AuIcwBTsWNljmw+ABlgLBlYDju6vxYRsQiYCWvl8PSXP3+sc
	 Oj35DaWSqysxiVG80w4ZwgOE6F4tzjBLLQPsgv0nY5FwqOEKWDZD9I0vD853Q0qyVOSp6
	 itco9cpoWkuBTWBf2dq7SOcVRGccnJsCL3/rlZYkcODMQSv6wY7bdp4EIr0NCzEmPMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630024;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=kx3zYbAeKFChjkf+m0qBDI1/KKwb22mPGiwRggcCpQ4=;
	b=jAAP9Y9/TfbWT3eGN7lB0lobOmNVCclhc3L8H5yiY1tJYq1/xc5Ljz59SLzffRhdBjnt
	 wXGAm+ZSE2G5yFgi2+FmBv13WU+ghsw+AgpFfjqGO7i0jYXHyrpyWgE6Sqr2PgPttUnQz
	 3czD1i1YnlhIywVLEIQzdPuJTdn8dKgC23vWSfjKQEw+a0VtBqg1fnm4Vq5947bH9sFIS
	 QxMSWxInWGXPV3NekfQhvrAMYz2IS17+OdK2VC3UyzbeIxHIYu42HLoRPZXrUa4UahR1K
	 DIdWX8SefxRWWWs44k1LTizIKw02jfBomz01pe9xQY6m6VGaozshazYNyU+Z/l1zBNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lWc6zt7z;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9AD606A6B5
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lWc6zt7z
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB65B1F000EE;
	Wed, 25 Nov 2026 18:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630024;
	bh=kx3zYbAeKFChjkf+m0qBDI1/KKwb22mPGiwRggcCpQ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lWc6zt7zi9rfauFjGA+ikEwBfftWAnSxXNJLG8ilKIIDcN+sDmV2qgilSWeljyc0b
	 /6vNzkPYjiG6v+UlBInG+qpST3eraq//s5XmhCH6S7+XzU7BDi4/lgek8dNwQbZ5tz
	 ZS2P8vmsrGL8tLeOf0fFne+KQOiJ2qY6/vbaY2Hx1n8Zhr96of4eZNfci/Y1szLLhZ
	 N/v0cV+mtJTrNOmSVkR5EZ+ODRGcnR0G1zU+ml0AaPSkKbctpL4FPGo969VyftfNmQ
	 vyUvQqLL5QKjjYfGhD4ZngDLVz9JQieZbrdf0pfGfuXx3YAnswHAudjv58gHL/F4oV
	 arbbafci4Ad5Q==
Message-ID: <sashiko-outbox-233906@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 03/16] spi: spi-mem: Add support for dummy cycles
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Mark Brown" <broonie@kernel.org>, "Liang
 Yang" <liang.yang@amlogic.com>, "Feng Chen" <feng.chen@amlogic.com>, "Xianwei
 Zhao" <xianwei.zhao@amlogic.com>, "Han Xu" <han.xu@nxp.com>, "Conor Dooley" <conor.dooley@microchip.com>, "Valentina
 Fernandez" <valentina.fernandezalanis@microchip.com>, "Daire McNamara" <daire.mcnamara@microchip.com>, "Haibo
 Chen" <haibo.chen@nxp.com>, "Jyan Chou" <jyanchou@realtek.com>, "Yu-Chun
 Lin" <eleanor.lin@realtek.com>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Michael
 Walle" <mwalle@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>, "Richard
 Weinberger" <richard@nod.at>, "Vignesh Raghavendra" <vigneshr@ti.com>
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>, "Alvin Zhou" <alvinzhou@mxic.com.tw>, "Cheng
 Ming Lin" <chengminglin@mxic.com.tw>, linux-amlogic@lists.infradead.org, imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, linux-mtd@lists.infradead.org, Frank.Li@kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-3-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-3-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:07:02 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] spi: spi-mem: broken nodirmap fallback in
  spi_mem_dirmap_create()
- [High] spi: spi-mem: missing dummy phase on spi_sync() path in
  spi_mem_exec_op()
- [Medium] spi: spi-mem: missing dummy conversion in
  spi_mem_poll_status()
- [Medium] spi: spi-mem: spi_mem_convert_dummy() bypasses
  spi_mem_check_op()
- [Low] spi: spi-mem: trace_spi_mem_start_op() ignores dummy.ncycles
--

commit a302459c2782bc8488f61e01f3aac67fe9d71262
Author: Miquel Raynal <miquel.raynal@bootlin.com>

spi: spi-mem: Add support for dummy cycles

This commit adds a dummy.ncycles field to struct spi_mem_op and a
dummy_cycles controller capability, converting between dummy clock cycles
and dummy bytes depending on what the SPI memory controller expects.

Link: https://lore.kernel.org/all/20220911174551.653599-1-sergiu.moga@micro=
chip.com/
Link: https://lore.kernel.org/all/20250115134158.19908-1-pratyush@kernel.or=
g/

> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index 9b8b8f2b33877..7f5849bf1a0d7 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c

[ ... ]

> @@ -231,9 +359,13 @@ static int spi_mem_check_op(const struct spi_mem_op =
*op)
> =20
>  	if ((op->addr.nbytes && !op->addr.buswidth) ||
>  	    (op->dummy.nbytes && !op->dummy.buswidth) ||
> +	    (op->dummy.ncycles && !op->dummy.buswidth) ||
>  	    (op->data.nbytes && !op->data.buswidth))
>  		return -EINVAL;
> =20
> +	if (op->dummy.nbytes && op->dummy.ncycles)
> +		return -EINVAL;
> +
>  	if (!spi_mem_buswidth_is_valid(op->cmd.buswidth) ||
>  	    !spi_mem_buswidth_is_valid(op->addr.buswidth) ||
>  	    !spi_mem_buswidth_is_valid(op->dummy.buswidth) ||
> @@ -290,6 +422,9 @@ bool spi_mem_supports_op(struct spi_mem *mem, const s=
truct spi_mem_op *op)
>  	 */
>  	spi_mem_adjust_op_freq(mem, &eval_op);
> =20
> +	if (spi_mem_convert_dummy(mem, &eval_op))
> +		return false;
> +
>  	if (spi_mem_check_op(&eval_op))
>  		return false;

[Severity: Medium]
Should spi_mem_check_op() run before spi_mem_convert_dummy() in
spi_mem_supports_op() and spi_mem_exec_op()?

On controllers without the dummy_cycles capability, an operation with both
dummy.ncycles and dummy.nbytes set enters the if (op->dummy.ncycles) branch
in spi_mem_convert_dummy(), which overwrites op->dummy.nbytes and zeroes
op->dummy.ncycles before spi_mem_check_op() can reject it with -EINVAL.
Running spi_mem_convert_dummy() first also causes spi_mem_exec_op() to
return -EOPNOTSUPP instead of -EINVAL when dummy.buswidth is 0.

[ ... ]

> @@ -390,22 +526,28 @@ static void spi_mem_add_op_stats(struct spi_statist=
ics __percpu *pcpu_stats,
>   *
>   * Return: 0 in case of success, a negative error code otherwise.
>   */
> -int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *op)
> +int spi_mem_exec_op(struct spi_mem *mem, const struct spi_mem_op *ro_op)
>  {
>  	unsigned int tmpbufsize, xferpos =3D 0, totalxferlen =3D 0;
>  	struct spi_controller *ctlr =3D mem->spi->controller;
> +	struct spi_mem_op wr_op =3D *ro_op, *op =3D &wr_op;
>  	struct spi_transfer xfers[4] =3D { };
>  	struct spi_message msg;
>  	u8 *tmpbuf;
>  	int ret;
> =20
>  	/* Make sure the operation frequency is correct before going futher */
> -	spi_mem_adjust_op_freq(mem, (struct spi_mem_op *)op);
> +	spi_mem_adjust_op_freq(mem, op);
> +
> +	/* Also make sure the dummy phase can be consumed by the controller */
> +	ret =3D spi_mem_convert_dummy(mem, op);
> +	if (ret)
> +		return ret;

[Severity: High]
Does calling spi_mem_convert_dummy() here drop the dummy phase when a
dummy_cycles-capable controller falls back to regular SPI transfers via
spi_sync()?

When the controller advertises dummy_cycles, spi_mem_convert_dummy() stores
the dummy phase in op->dummy.ncycles and zeroes op->dummy.nbytes.  If
spi_get_csgpiod(mem->spi, 0) is non-NULL or ctlr->mem_ops->exec_op()
returns -ENOTSUPP or -EOPNOTSUPP, spi_mem_exec_op() falls back to building
spi_transfer entries from op->dummy.nbytes:

drivers/spi/spi-mem.c:spi_mem_exec_op() {
	...
	tmpbufsize =3D op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
	...
	if (op->dummy.nbytes) {
		memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nbytes);
		xfers[xferpos].tx_buf =3D tmpbuf + op->addr.nbytes + 1;
		xfers[xferpos].len =3D op->dummy.nbytes;
	...
}

Because op->dummy.nbytes is 0, the fallback path omits the dummy transfer
completely instead of converting op->dummy.ncycles back to bytes (or
returning -EOPNOTSUPP if the cycle count is not byte-aligned), corrupting
flash transfers.

> =20
>  	dev_vdbg(&mem->spi->dev, "[cmd: 0x%02x][%dB addr: %#8llx][%2dB dummy][%=
4dB data %s] %d%c-%d%c-%d%c-%d%c @ %uHz\n",
>  		 op->cmd.opcode,
>  		 op->addr.nbytes, (op->addr.nbytes ? op->addr.val : 0),
> -		 op->dummy.nbytes,
> +		 spi_mem_get_lossy_dummy_bytes(op),

[Severity: Low]
Does trace_spi_mem_start_op(mem, op) in spi_mem_exec_op() also need to
account for op->dummy.ncycles?

On dummy_cycles-capable controllers, op->dummy.nbytes is 0 after
spi_mem_convert_dummy(), so TRACE_EVENT(spi_mem_start_op) in
include/trace/events/spi-mem.h sizes its dynamic array with
op->dummy.nbytes and omits the dummy bytes from the trace event.

[ ... ]

> @@ -781,6 +931,21 @@ spi_mem_dirmap_create(struct spi_mem *mem,
>  	desc->mem =3D mem;
>  	desc->info =3D *info;
>  	desc->info.op_tmpl =3D &desc->info.primary_op_tmpl;
> +
> +	ret =3D spi_mem_convert_dummy(mem, &desc->info.primary_op_tmpl);
> +	if (ret) {
> +		kfree(desc);
> +		return ERR_PTR(ret);
> +	}
> +
> +	if (desc->info.secondary_op_tmpl.cmd.opcode) {
> +		ret =3D spi_mem_convert_dummy(mem, &desc->info.secondary_op_tmpl);
> +		if (ret) {
> +			kfree(desc);
> +			return ERR_PTR(ret);
> +		}
> +	}

[Severity: High]
Does assigning ret =3D spi_mem_convert_dummy() here break the nodirmap
fallback on controllers that do not implement ctlr->mem_ops->dirmap_create?

spi_mem_dirmap_create() initializes ret to -ENOTSUPP so that when
ctlr->mem_ops->dirmap_create is absent, the if (ret) block below sets
desc->nodirmap =3D true and validates primary_op_tmpl:

drivers/spi/spi-mem.c:spi_mem_dirmap_create() {
	...
	if (ctlr->mem_ops && ctlr->mem_ops->dirmap_create) {
		...
		ret =3D ctlr->mem_ops->dirmap_create(desc);

		spi_mem_access_end(mem);
	}

	if (ret) {
		desc->nodirmap =3D true;
		if (!spi_mem_supports_op(desc->mem, &desc->info.primary_op_tmpl))
			ret =3D -EOPNOTSUPP;
		else
			ret =3D 0;
	}
	...
}

When spi_mem_convert_dummy() succeeds, it sets ret to 0.  If the controller
does not provide dirmap_create, ret stays 0, leaving desc->nodirmap false
and causing all subsequent spi_mem_dirmap_read() and spi_mem_dirmap_write()
calls to fail with -ENOTSUPP.

> +
>  	if (ctlr->mem_ops && ctlr->mem_ops->dirmap_create) {
>  		ret =3D spi_mem_access_start(mem);
>  		if (ret) {

[Severity: Medium]
Should spi_mem_poll_status() also convert the operation with
spi_mem_convert_dummy() before calling ctlr->mem_ops->poll_status()?

drivers/spi/spi-mem.c:spi_mem_poll_status() {
	...
	if (ctlr->mem_ops && ctlr->mem_ops->poll_status && !spi_get_csgpiod(mem->s=
pi, 0)) {
		ret =3D spi_mem_access_start(mem);
		if (ret)
			return ret;

		ret =3D ctlr->mem_ops->poll_status(mem, op, mask, match,
						 initial_delay_us, polling_delay_us,
						 timeout_ms);

		spi_mem_access_end(mem);
	}
	...
}

Without converting a local copy of op in spi_mem_poll_status(),
ctlr->mem_ops->poll_status() receives the caller's unconverted dummy phase
and programs 0 dummy cycles whenever the caller and controller use
different dummy representations.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-macronix-u=
pstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com?part=3D3
