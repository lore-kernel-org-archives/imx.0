Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C3C3081D6
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 18:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783967354; cv=none; b=SrmFwnk+L9to1kY1LOirlP11oSEclw9VRszrvj1VJxUefry5qzM+VO5RDIWMiDSqPkPHbiFB8uz5quJwnxCuEiR6cLhUiYL5QcZmvlDQhhPncpfzbIuyCFlkN8buDH3HxThP7kMeLIV385lb89J+Dx7hMBPsOC2fhZBxyyjeW3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783967354; c=relaxed/simple;
	bh=Qk728M9F+dxCx126ClOI0zqX30I2QwxYV3igz7l/PYE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=G2ocgVQKyozExcDUftbbgkI4tF6hVrH+uUFtV7ZdozVVeC5S60Y9JQG6yVXRacVlDejZHCfEw/NwhFrMYUQqqc7b98veP6VkT1oZGyOZGyGbnpOGN5Tsrs01WL1DofVQwhDSsXfejmnfiBHK7MqoxxK/My86dw22wGfufwD3PnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2JxjvYp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2JxjvYp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D881F000E9;
	Mon, 13 Jul 2026 18:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783967352;
	bh=Uxrko+njakIW+wCRZ3vKSZkaUv5PncJ3C+d/vVU4VgY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=S2JxjvYp/+Ve55MFc9z/CBSjKVCOwb/Z0ZPMng7GseNkB5c6X4ZTlCzUNfkaFdydw
	 25MPZ5HR/oXP6VlfZRaRQleoy2E3xEgCpyKZEapPzAp0wbO1yzD3K/jddU/ejT7npo
	 NHuTknxgVHCVtYLUu1StEcY+cOETlu/8LsX2XFHGkuM98wJ9qrjIq5AYCdQYni60Is
	 RW8QvUjR6phW8T0Q7T3OE8OdxJS+hrwVUbWZJ5y2xxa54/gp0HnqQFi5wptIPBkql+
	 E85V6Ij2rrETimFcgSDOYEqbW4BWzBXBunovdWVhekt2DfK745ELoGWHS0oNPpcoD4
	 78wqpG1QLia/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 2/2] i2c: imx: fix locked bus on SMBus block-read of
 0 (IRQ)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-2-073ac9e103a5@free.fr>
References: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
 <20260713-for-upstream-i2c-lx2160-fix-v1-v3-2-073ac9e103a5@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 18:29:11 +0000
Message-Id: <20260713182912.55D881F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] SMBus block read with a received length of 1 fails to NACK the fin=
al data byte in the ISR state machine, potentially causing a bus hang.
--

--- Patch [2]: [PATCH v3 2/2] i2c: imx: fix locked bus on SMBus block-read =
of 0 (IRQ) ---
commit 2303c0a2b014ac50e9fdc1a3b61bbfbe99012c6a
Author: Vincent Jardin <vjardin@free.fr>

i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)

SMBus 3.1 6.5.7 allows a Block Read byte count of 0, but the
interrupt-driven block-read state machine rejects it as -EPROTO. Worse,
it returns without a NACK+STOP: the next receive cycle has already
started, so the target keeps holding SDA and the bus stays stuck until a
power cycle of this i2c controller.

> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1061,11 +1061,28 @@ static inline enum imx_i2c_state i2c_imx_isr_read=
_continue(struct imx_i2c_struct
>  static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct=
 *i2c_imx)
>  {
>  	u8 len =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +	unsigned int temp;
> =20
>  	if (len =3D=3D 0 || len > I2C_SMBUS_BLOCK_MAX) {

[ ... ]

>  		i2c_imx->isr_result =3D -EPROTO;
>  		i2c_imx->state =3D IMX_I2C_STATE_FAILED;
>  		wake_up(&i2c_imx->queue);
> +		return;
>  	}
>  	i2c_imx->msg->len +=3D len;
>  	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] =3D len;

[Severity: High]
This is a pre-existing issue, but does this code properly handle the case w=
here
the received length is 1?

When len is 1, the length is updated but we fail to set the I2CR_TXAK bit. =
Since
reading I2DR at the start of i2c_imx_isr_read_block_data_len() already init=
iated
reception of the final byte, doesn't the master end up ACKing the final byte
instead of NACKing it?

If the slave holds SDA low, and we later try to generate a STOP condition in
i2c_imx_isr_read_continue():

	if ((i2c_imx->msg->len - 1) =3D=3D i2c_imx->msg_buf_idx) {
		if (i2c_imx->is_lastmsg) {
			/* ... */
			temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
			if (!(temp & I2CR_MSTA))
				i2c_imx->stopped =3D  1;
			temp &=3D ~(I2CR_MSTA | I2CR_MTX);
			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);

Will the STOP fail and permanently hang the bus because SDA is held low?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-for-upstre=
am-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr?part=3D2
