Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630012;
	b=13ZdGMmCgALgVsq+yvVljoD3jR1+KbU3lJWRAbrukmuCzJIw7O2/FzdDHCmtbS+64thi
	 +oKAEMhb0HdvT82SZVp2+PjAPKC4xzm57xB9GtRd1qz1NqOq9KZRLCQ1jxGgR3PR3etRt
	 hXVCaz6ovoBRpOnaPvVqFuEpOgLT0Pbi7Qb7xvQ7x3rtmIBXJ0xA5zcLG6c9oM73E3iIQ
	 hDE+xZDO5fwO/ugQOBLkCMrvG6ZktYUKwncIHSi2dTr9ehCfasxx9lYHDdW5LjpfmsKHp
	 uzd/82gpmynrug6lE4OgMMKIJhmSw1QRB101rPuvP/FxagXXt3TyFO0pCprgYu3AFqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630012;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=HHdRWEBXfDf2cU3cyNr1uxBhFCBOQ6B2mKFsYYkFHI8=;
	b=J3LbO92qpkoQ42ty9OPy3r1szRXqXPTXru+m6CpZ33qWLioMaAoZiDIe3BVNfRAjtJyz
	 agm2QBpSSZJMffNlRBvh3LxOMQFI1v0eAS+B3HGk62MJyoUZk3YPXtIb7wNrSZmUgbWw9
	 69/LXLgrOUna80gTuHZH+CJamAuxN6+sdISxUFyC8XJVeJBO/YUMoEYOAqIzX/ZF7n5Ab
	 8r2Ab6alwltn8YFltWcrUI+qwqMBsxR+U7JMtt8Zl7l/nL7BPjhYJlUoA9BAI5ydMsoho
	 nTAOA0MshCvi9NY5dZOZIDXDlmgKevgbJHCSijaMfq2N5Iq4vb6qvruoO0tAQ/bPq/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=POHtSeP3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF93606A6B0
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:06:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=POHtSeP3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9CF1F000CA;
	Wed, 25 Nov 2026 18:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630011;
	bh=HHdRWEBXfDf2cU3cyNr1uxBhFCBOQ6B2mKFsYYkFHI8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=POHtSeP38iBwVU4uIlKqOXshQgc3LsBaaERjLwcH2RsVnaYmjkBcgAPTcibjLgHxs
	 Snxo/B+Tww1zWJC8odpSgWznqQIeCzlVuAc1zjlWRey3QNegoQrF7TIMylbndFBYrU
	 wUOZokfikFQUMUrffOjALxd1X8WrDJpOcZjt79/d1eclXpPWqRsmXQMEhaThW2j8c5
	 uARSuf9sTzRrCLiVd8UtGEsmLh40tfQycYuqWTuOFLov9JVnkjOkfHuw7p6taiz82n
	 TZA/4MoUjlF0liNKsYVqy8TVcqKILadVz6R1eX6WeOC7sHD6kmZEhJ+B0ThyLKhuA3
	 c4tuOGBl4ooSQ==
Message-ID: <sashiko-outbox-233905@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH RFC 09/16] spi: microchip-core-qspi: Consume dummy
 cycles directly
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
In-Reply-To: <20261125-macronix-upstreaming-spi-mem-cycles-v1-9-fd036402fd37@bootlin.com>
References: <20261125-macronix-upstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com>
 <20261125-macronix-upstreaming-spi-mem-cycles-v1-9-fd036402fd37@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 25 Nov 2026 18:06:50 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [High] spi: microchip-core-qspi: dummy_cycles drops dummy phase on
  GPIO-CS fallback
- [Medium] spi: microchip-core-qspi: unchecked ncycles shift in
  mchp_coreqspi_config_op()
--

commit 2317911309a9a0d90fc21347c53a3b7c2797fde4
Author: Miquel Raynal <miquel.raynal@bootlin.com>

spi: microchip-core-qspi: Consume dummy cycles directly

This commit advertises the dummy_cycles capability in
mchp_coreqspi_mem_caps and uses op->dummy.ncycles directly in
mchp_coreqspi_config_op() instead of converting op->dummy.nbytes.

> diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-micr=
ochip-core-qspi.c
> index c0ea65014d2ea..2fc1df7380620 100644
> --- a/drivers/spi/spi-microchip-core-qspi.c
> +++ b/drivers/spi/spi-microchip-core-qspi.c
> @@ -420,7 +420,6 @@ static int mchp_coreqspi_setup_clock(struct mchp_core=
qspi *qspi, struct spi_devi
> =20
>  static void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const st=
ruct spi_mem_op *op)
>  {
> -	u32 idle_cycles =3D 0;
>  	int total_bytes, cmd_bytes, frames, ctrl;
> =20
>  	cmd_bytes =3D op->cmd.nbytes + op->addr.nbytes;
> @@ -459,11 +458,7 @@ static void mchp_coreqspi_config_op(struct mchp_core=
qspi *qspi, const struct spi
>  	writel_relaxed(frames, qspi->regs + REG_FRAMESUP);
>  	frames =3D total_bytes & BYTESLOWER_MASK;
>  	frames |=3D cmd_bytes << FRAMES_CMDBYTES_SHIFT;
> -
> -	if (op->dummy.buswidth)
> -		idle_cycles =3D op->dummy.nbytes * 8 / op->dummy.buswidth;
> -
> -	frames |=3D idle_cycles << FRAMES_IDLE_SHIFT;
> +	frames |=3D op->dummy.ncycles << FRAMES_IDLE_SHIFT;

[Severity: Medium]
Can op->dummy.ncycles << FRAMES_IDLE_SHIFT overflow the 4-bit
FRAMES_IDLE_MASK field in REG_FRAMES?

drivers/spi/spi-microchip-core-qspi.c:
    #define FRAMES_IDLE_MASK	GENMASK(29, 26)
    #define FRAMES_IDLE_SHIFT	26
    #define FRAMES_FLAGBYTE		BIT(30)
    #define FRAMES_FLAGWORD		BIT(31)

mchp_coreqspi_supports_op() does not reject op->dummy.ncycles > 15.
When a flash operation requests more than 15 dummy cycles (such as SFDP
BFPT read modes with 16 or 20 cycles), shifting u8 op->dummy.ncycles (as a
signed int) by 26 overflows into FRAMES_FLAGBYTE and FRAMES_FLAGWORD (and
is undefined behavior when ncycles >=3D 32), while truncating the programmed
idle cycles to op->dummy.ncycles & 0xf.

Should mchp_coreqspi_supports_op() reject op->dummy.ncycles > 15?

>  	ctrl =3D readl_relaxed(qspi->regs + REG_CONTROL);
> =20
>  	if (ctrl & CONTROL_MODE12_MASK)
> @@ -601,6 +596,7 @@ static const struct spi_controller_mem_ops mchp_coreq=
spi_mem_ops =3D {
> =20
>  static const struct spi_controller_mem_caps mchp_coreqspi_mem_caps =3D {
>  	.per_op_freq =3D true,
> +	.dummy_cycles =3D true,
>  };

[Severity: High]
Does setting .dummy_cycles =3D true drop the dummy phase when a SPI memory
device uses a GPIO chip-select?

mchp_coreqspi_probe() sets ctlr->use_gpio_descriptors =3D true.  In
spi_mem_exec_op(), spi_mem_convert_dummy() runs before the
!spi_get_csgpiod(mem->spi, 0) check:

drivers/spi/spi-mem.c:spi_mem_exec_op() {
    ...
	spi_mem_convert_dummy(mem, op);
    ...
	if (ctlr->mem_ops && ctlr->mem_ops->exec_op && !spi_get_csgpiod(mem->spi, =
0)) {
    ...
	if (op->dummy.nbytes) {
		memset(tmpbuf + op->addr.nbytes + 1, 0xff, op->dummy.nbytes);
		xfers[xferpos].tx_buf =3D tmpbuf + op->addr.nbytes + 1;
		xfers[xferpos].len =3D op->dummy.nbytes;
    ...
}

With .dummy_cycles =3D true, spi_mem_convert_dummy() stores the dummy phase
in op->dummy.ncycles and sets op->dummy.nbytes =3D 0.  When a GPIO CS is
used, spi_mem_exec_op() falls back to spi_sync(), which only creates a
dummy transfer when op->dummy.nbytes is non-zero, while
mchp_coreqspi_prepare_message() hardcodes idle_cycles =3D 0.  As a result,
no dummy cycles are transmitted on the bus, corrupting flash reads on
boards with GPIO chip-selects.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261125-macronix-u=
pstreaming-spi-mem-cycles-v1-0-fd036402fd37@bootlin.com?part=3D9
