Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556022;
	b=R3vcRbGb2fiCebj71gprxSS+QjgRKBftoB4f0qFnKq4OtRRDm1sA4MnI/oGS9qKJktcY
	 UGt2p4YA/MPk1FYJz74Bd/SUj/Q+rtPfx2D84jasXo2CdgbjdrjIRtZCiEhgxAIKVifBn
	 y8/gTyE0cO5I8U1qXCUmhxQHNs5ISrnnkR3266d4F2uPtSrobWtSy2PzQTBBB6OYAN7/u
	 PUToPhBf0WGTZP/JysfIZc2bX+5t5L2vPp9s+e0gFWMkTIRR/vephQfKuo/himwDJdpqq
	 Rw4Bw52MsNo/Qka9s7jDfcqSZuECkuZeEUAXhn+0mHfcV23nYZXObDQHGzTpuFz3pgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556022;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mY4HYyrMwmwDWJfScfrYA+f0BBR0dz7otEXfLlYsePg=;
	b=B/EvL+q18RucIiGgzgL/d0Ry408lC0M9QzZN+3ULQNx9CZzStSfXYBXwbXliAhg6+vqr
	 eCpXICgN4XTKAH+o/tF3E3XZK2k8lUMK1vluZzni8zJwWzAtay193fD+L/7tD8aylzXsD
	 LfzE4ZnODE84jBzq6z+demnO5gaVyDV6YG4cyb3nEzQpYC/D2uPg7F5NhMlEuxzkLpMaM
	 gqzR40MkJjBAgyg0S5efjvKVw9/R9g7o36L0l2dxG4CkiN8PBtK1/zeIFYpyTB6ueQGpN
	 Fdakt4ibW3YA6XclK+Io3wKBsXn6MWnu6nclGeA4cYeZLtrCxyv1osJVTv29t3zVNdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FESWanxD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E90606A330
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FESWanxD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2841F000C4;
	Fri, 13 Nov 2026 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794556021;
	bh=mY4HYyrMwmwDWJfScfrYA+f0BBR0dz7otEXfLlYsePg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FESWanxDG+qzDJgp91t1cOZnDQiLOJkI1uoHAJm+WsVSDHE9EYxerSmoL3q/o8+LZ
	 Qo+YvD6Xq9xhCmXuGE89H3Jk/3tcDsCsQHr69c1sglcdjtwLBCsxWnetYmpdIW80jh
	 exSUyk9nAK7Xs7ft8Jy/2TY5setVWPIvqPlCxPhL/H/KnfBmiY/zt7rCcXlRZ//CCF
	 aGoFWhiyR8veNckhSqv6TQgf6mZWh5owXUD2dHyDEnMirnyV72P73enVUFjRtro2D7
	 /08pN6416cENi7PpxhyTpLNiSPvtO2JUdzdBx5FWMXuGfywAKrT77LeKVpkvbMSnop
	 ELbVVDPEPH6Eg==
Message-ID: <sashiko-outbox-212366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] i2c: imx: do not carry the interrupt status over to
 the next transfer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261113073250.1037215-2-mehmet.fide@gmail.com>
References: <20261113073250.1037215-1-mehmet.fide@gmail.com>
 <20261113073250.1037215-2-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 07:46:59 +0000
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
- [High] i2c: imx: incorrect message index for I2C_M_RECV_LEN check in
  i2c_imx_xfer_common() [1]
--

commit 264afe43ed92a8a97214ca4df23166f59bf1e387
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

i2c: imx: do not carry the interrupt status over to the next transfer

This commit clears i2c_imx->i2csr at the start of i2c_imx_xfer_common() so
that stale interrupt status from a failed DMA transfer does not cause a
subsequent DMA read to complete prematurely.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151f..1987a0fd81329 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1657,6 +1657,8 @@ static int i2c_imx_xfer_common(struct i2c_adapter *=
adapter,
>  	if (result)
>  		return result;
> =20
> +	i2c_imx->i2csr =3D 0;
> +
>  	/* Start I2C transfer */
>  	result =3D i2c_imx_start(i2c_imx, atomic);
>  	if (result) {

[Severity: High]
This problem wasn't introduced by this patch, but should block_data check
msgs[i].flags instead of msgs->flags [1] in the message loop of
i2c_imx_xfer_common()?

drivers/i2c/busses/i2c-imx.c:i2c_imx_xfer_common() {
    ...
		if (msgs[i].flags & I2C_M_RD) {
			int block_data =3D msgs->flags & I2C_M_RECV_LEN;

			if (atomic)
				result =3D i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);
			else if (use_dma && !block_data)
				result =3D i2c_imx_dma_read(i2c_imx, &msgs[i], is_lastmsg);
    ...
}

In a combined transfer such as an SMBus block read where msgs[0] is a
command write and msgs[1] is a DMA-eligible read with I2C_M_RECV_LEN set,
msgs->flags tests msgs[0].flags, so block_data is 0 for msgs[1].  That
routes msgs[1] to i2c_imx_dma_read(), which does not parse the initial
SMBus block length byte and corrupts or fails the read.

[1] https://sashiko.dev/#/bug/linux-f62df5ed-ad96-43f2-872a-ae2c0100b73f

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113073250.1037=
215-1-mehmet.fide@gmail.com?part=3D1
