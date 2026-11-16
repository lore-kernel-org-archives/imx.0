Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794833097;
	b=wG/rzjwYHqTg9EsmSx0QdhL+cUatTpCAg6z/5qkBc2S1OUSNkZmXjqs6Wnin4QyQIMUm
	 eG5pG71EMhNSn8kxgy932NC7n7GQZBt93JGTwYLhl1WfaZ1YHIdlfm3nS4JQzrM6hy8aN
	 Esw/m3UBYvCDOIxDiRHOHIlC0r3VOvI/f47n+PPboXlQBbGNDaZ8DiWhUg0Q0F8xGBDCe
	 rgK5t6xsOwTzgkxMooPnSikTs0zKLZ7vv+tfMsriI6M7NIcu8mOWCv6hvdAIYgmi8UBZM
	 g6/T3HruOmVo8tKCB/0KB40KeQN3kdeskru7/ixDyVtwqHnoM3OinXgkDGf56v7O7Dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794833097;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=gYZuACJ6kAaCbxUt3rIUaPowEkktTLX0kl3Lp00TZX0=;
	b=Gm0Bz/92VaVhqFisbdcGa9Cd7Qu1DdUxaTlZQyfUoj0f8KrzHBpJAq6wfCB7UzJ/rGCx
	 zljyj3YAozHSCO3izPv0IUZo661KNOfCz+j4fHOtOxXYHv1Lhw5LXAenVU0BraUg+R0qG
	 hhPsBf9CoHiAl1JlhPVpE0SB9qhRPAsSdH+T3y6ft6p4SL0qZAW2qXZhNE2wDm55IPCXB
	 pAcmnSnhbghg+7qR/uBgD8wlVE52+Y4pFa1E6N3bAfHLOpzuKDREBFDRe4vIp9PAXF3Io
	 7KuOPFCbUt1YiVeG4cDsJxHBiERQ3rQoKH0gxwRobz5m0bo/d30STofDMJzHExYpbbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="D/kkIfiW";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86AB606A336
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D/kkIfiW
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D90A1F000C4;
	Mon, 16 Nov 2026 12:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794833096;
	bh=gYZuACJ6kAaCbxUt3rIUaPowEkktTLX0kl3Lp00TZX0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D/kkIfiWznCn26o/Cc4PD4SLefkOWPHAI7zUS2cBrwsKwmMkSAiMRv/aX2hJ0/aE4
	 lJ/RiN3nWud/vBoTnstq2+vmtcIrfWd7y01E8t485vSDP43JAnlMG6e801VAKKm8h1
	 PMWpj0+ixD8qZkc4HWh1eKdOxiKd2fKWcvAu9MrgErtRHcuCqECgzSGYAk4WXUlUjr
	 KZA10eDCZ58POdlJ3LASfjShqwIFVvC5EAAkDDMtJjYtCkZ61K9cdJu37hrpOQ1HIS
	 ktb0zL3fOuz+LNzAcqkmf7nlDZEb+mNwIuv5921HhEYppnkAsYlf424YPAYMPjqM0x
	 /o9kxuG8a2Rzw==
Message-ID: <sashiko-outbox-217021@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx: acknowledge the count byte of an atomic block
 read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261116122707.1349139-1-mehmet.fide@gmail.com>
References: <20261116122707.1349139-1-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Nov 2026 12:44:55 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [Medium] i2c: imx: missing TXAK for 1-byte block read in
  i2c_imx_isr_read_block_data_len() [1]
--

commit 0b842b7d356553521b725411a4e465612a28658b
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

i2c: imx: acknowledge the count byte of an atomic block read

This commit clears I2CR_TXAK in i2c_imx_prepare_read() when I2C_M_RECV_LEN
is set so that atomic SMBus block reads acknowledge the initial count byte.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151f..1a3fc245d6ba7 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1283,7 +1283,7 @@ static int i2c_imx_prepare_read(struct imx_i2c_stru=
ct *i2c_imx,
>  	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
>  	 * length is unknown
>  	 */
> -	if (msgs->len - 1)
> +	if ((msgs->len - 1) || (msgs->flags & I2C_M_RECV_LEN))
>  		temp &=3D ~I2CR_TXAK;
>  	if (use_dma)
>  		temp |=3D I2CR_DMAEN;

[Severity: Medium]
This problem wasn't introduced by this patch, but on the interrupt-driven
path, does i2c_imx_isr_read_block_data_len() fail to set I2CR_TXAK
[1] when an SMBus block read without PEC returns a block length of
1 byte?

Reading the count byte from IMX_I2C_I2DR immediately starts clocking in the
single payload byte.  When len is 1 and the initial msg->len is 1,
i2c_imx_isr_read_block_data_len() updates msg->len to 2 and msg_buf_idx to
1 without setting I2CR_TXAK:

drivers/i2c/busses/i2c-imx.c:i2c_imx_isr_read_block_data_len() {
	...
	i2c_imx->msg->len +=3D len;
	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] =3D len;
}

On the next interrupt, i2c_imx_isr_read_continue() sees
msg_buf_idx =3D=3D msg->len - 1 and misses the msg->len - 2 branch that sets
I2CR_TXAK.  The controller then acknowledges the final byte before
generating a stop condition, which can cause the target device to hold SDA
low and wedge the bus.

[1] https://sashiko.dev/#/bug/linux-8e52fb9c-78a7-426b-ad34-b729995ff1c3

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261116122707.1349=
139-1-mehmet.fide@gmail.com?part=3D1
