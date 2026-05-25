Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDF937E2EE
	for <imx@lists.linux.dev>; Mon, 25 May 2026 13:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779716013; cv=none; b=d5KIeEwEBSmQj+ZzBwVqs+V3aZocv7SkHi0Zk8wegvMfcq8LRrKA7rnm3IIvSufZsvgIzFmxnxIxwkmTb6spQmdhBmhflHuUSPo9qOpFchgHoifg2qS7acs7kHsTgL4WB+HEYlQQK5M7YzBkCWHwNFkPPGe0tUIo05KyvN7l4Fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779716013; c=relaxed/simple;
	bh=/ixv0jFD8RK158eT0VtPukbKFTE7jt7nkceENm1v480=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vy7HH4ZYh4kkQAFCnYc6IHhjEH7yo25HtYl1lkEaJgcoGMqTndFpKPTx2IWaO1I7QFQGp4ZxTtdFLl998ofDNSsillxZfw2XtlGoDOhCLOuGeHxS7HXuFtbyNPeNd63Ywwf8YHz+dpvtMe7Kp42lM3af1YXeFKpHVKcoFLtCtEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4z2yKQP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4z2yKQP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2291F000E9;
	Mon, 25 May 2026 13:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779716012;
	bh=D7pSTj1DPwIybXFNye9r5PIP4Xser8XF6l6VxtJON1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D4z2yKQPbOesEKVPmiJbq8G6O/o6arHaCzaSM818BhOE3CDA420+e85CrV/liUOsw
	 f+XtZv/hk3/hnI6FPW/WXU8uzEGmKQoGqYlYZDd5K4Y8J8kGO57nl7Lw7XS7mt50xc
	 FdhmjzpXEDJV6ZisEWqTuIdttB6TSFRxMuNEte2XoPsIxLYZFzBS01588FDxia0S8B
	 nxxHBka5sHO8aNPhRra6LGJH2MPhMJPRr/XYQGDMWnfZFP3mnzrLtsKeDa3r/6SKWD
	 kuconsBJCTRrlaa4Yzj7XAM3JsiFv+U6czL0b6fyw0lc2TBiFpdXYZtjdVEOH2/CBg
	 Ogc4ZSpJRFlYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (IRQ)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-2-f30ab53dd97c@free.fr>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-2-f30ab53dd97c@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 13:33:31 +0000
Message-Id: <20260525133332.0E2291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing I2C NACK on Error Path (Bus Lockup)
- [High] Missing I2C NACK on Block Read of 1 Byte
- [High] Race Condition in Lockless Register Access
--

commit cfd2ade7e47403976b7dd994263d68446ed5b5ea
Author: Vincent Jardin <vjardin@free.fr>

i2c: imx: fix locked bus on SMBus block-read of 0 (IRQ)
   =20
This patch allows an SMBus Block Read with a byte count of 0. It fixes a
bus lockup by accepting a count of 0, NACKing the in-flight dummy byte
(TXAK), and emitting a STOP condition. It also adds an early return on the
error path when the count exceeds the maximum.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1061,11 +1061,26 @@ static inline void i2c_imx_isr_read_block_data_le=
n(struct imx_i2c_struct *i2c_imx)
>  {
>  	u8 len =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +	unsigned int temp;
> =20
> -	if (len =3D=3D 0 || len > I2C_SMBUS_BLOCK_MAX) {
> +	if (len > I2C_SMBUS_BLOCK_MAX) {
>  		i2c_imx->isr_result =3D -EPROTO;
>  		i2c_imx->state =3D IMX_I2C_STATE_FAILED;
>  		wake_up(&i2c_imx->queue);
> +		return;
> +	}

[Severity: High]
This isn't a bug introduced by this patch, but does the error path for an
oversized length need to set the TXAK bit before aborting the transaction?

Because reading I2DR automatically initiates the reception of the next byte
with ACK enabled, returning early without setting I2CR_TXAK causes the
controller to ACK the in-flight byte.

If the target device drives SDA low, could the subsequent cleanup via
i2c_imx_stop() fail to emit a STOP condition and leave the bus permanently
locked, similar to the zero-length case this patch addresses?

> +
> +	if (len =3D=3D 0) {
> +		/*
> +		 * SMBus 3.1 6.5.7 "Block Write/Read": byte count can be 0
> +		 */
> +		temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +		temp |=3D I2CR_TXAK;
> +		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);

[Severity: High]
This is a pre-existing issue, but is there a potential read-modify-write
race condition on the IMX_I2C_I2CR register here?

If an I2C transaction times out, the process context calls i2c_imx_stop(),
which locklessly clears the I2CR_MSTA bit.

If the hardware interrupt fires concurrently and the ISR reads the register
before i2c_imx_stop() clears MSTA, then writes it back afterward, could the
ISR overwrite the register with MSTA=3D1? Would this transition from 0 back=
 to
1 cause the controller to erroneously generate a new START condition?

> +
> +		i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] =3D 0;
> +		i2c_imx->msg->len =3D 2;
> +		return;
>  	}
>  	i2c_imx->msg->len +=3D len;
>  	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] =3D len;

[Severity: High]
This is a pre-existing issue, but does the master fail to NACK the final da=
ta
byte when performing an SMBus block read with exactly 1 byte of data?

Reading the length byte from I2DR triggers the reception of the single data
byte, but the code does not appear to set I2CR_TXAK when the length is exac=
tly
1.

During the next interrupt, when i2c_imx_isr_read_continue() attempts to iss=
ue
a STOP condition, could the target still be expecting to send more data and
drive SDA low, preventing the STOP condition from being generated?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-for-upstre=
am-i2c-lx2160-fix-v1-v1-0-f30ab53dd97c@free.fr?part=3D2
