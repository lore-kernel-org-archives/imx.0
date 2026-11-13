Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794556078;
	b=jqSE0IlqJaYs2uhmV6QJuGAoi8AEnY4q2k7I1jio7Hpb/IaDUT9pSoYiWgNUzzwdNt80
	 4lzLG5rfcXkzV3Md4VuAp4B68Ikl4XOX40AuzJpqIHFhcVQcfDheWTtp/JlU1uSHWpiRB
	 AziLCIkM4sHrhcCWcFaaw2Mj1jfLEpZ7k0shAFG3M4spRZ/hT1d+djBFp8hsHuVUdbSQe
	 4Lq2jR0lI4oand6yfMGI97VdOiJUgJaFqhtBUTy/pJzmDZbc4G2n4rK7KfQ8eE0bjFLwd
	 ZoEKyg52o9WQNrwizAQweuP76CYXtWRzKGUjpdUSTs5ay9H7skXR7iHIJ9v+Oh6x8qA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794556078;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=K983kx2BBZUqpAkIlVMzG9mNTlpab50TucPAELdFaic=;
	b=gFWXZ9+8GGH3xPgl0kh6WMnWh8u7xez0VmzHUt+3nAB48kQCo1/QD/43nha3kTEygsOu
	 9fKK2OCkkc1O1BpLyZ7Fk/uJKx9P8WVXKq4WxVklmCvVsXPII7Rr3s47BmcyDBnyzg3fi
	 H+oSSEQjMXbHi+hc9G17qQsz8r3K1K8G76UUFY/ehS6yN5XTugklEzSYuLoSHvPUzmbmA
	 n84NJTM3xCL93ThlxYRu/BvRFNRkond90PIfLfjEISwLH7qfujCx8bjVlKtejCHLwzx/M
	 0vBxV9Gv7JpCBCQoVvs4OVmtqxDMBgMpkRkLFfTg670K7WoKQ9/p3WRL3cK11OdA7gQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QROYrC8D;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F00FF606A31C
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QROYrC8D
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D611F000C6;
	Fri, 13 Nov 2026 07:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794556077;
	bh=K983kx2BBZUqpAkIlVMzG9mNTlpab50TucPAELdFaic=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=QROYrC8DWyx+X8FR3rbupZ59j3x+Af1yiZGnA4M03t5v2oBN1/81uLAUq4W+Xz5vu
	 dM/lSy6gTimf/SpDb5QZXY/Dj5kVvB1HW+vRg+Lcg8THt9mtq+tQkDA86J/gZVovUX
	 UQO20JSYDBeHW4mIiGhh6J+zvy+7eItHfJxeN5M2WUDghEhXyylkpacECDU/sY+vUk
	 DQ1mEz7Rd9M8+aJZsF5dD9vRDtCAvJF3xILer7DKSG+ecBhae8gVIZlhdOCJFgl1Cn
	 C4iNyg4IMjMKTYwyieDOq7YlKOH++1CCd7fTRE4WwbZYHm5zdKETYim1y7O8rA5HOo
	 bpBgeQpL63QXg==
Message-ID: <sashiko-outbox-212367@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] i2c: imx: return -ENXIO at once when a DMA write is
 not acknowledged
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261113073250.1037215-3-mehmet.fide@gmail.com>
References: <20261113073250.1037215-1-mehmet.fide@gmail.com>
 <20261113073250.1037215-3-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 07:47:56 +0000
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
- [High] i2c: imx: DMA mapping leak in i2c_imx_dma_write() on I2SR_RXAK
- [Medium] i2c: imx: missed NACK on last DMA byte in i2c_imx_dma_write()
--

commit 466099063994a0c4c92a4a0f7a1a450fa666895b
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

i2c: imx: return -ENXIO at once when a DMA write is not acknowledged

This commit completes the DMA wait in the interrupt handler when a
missing acknowledge is detected during a DMA write and returns -ENXIO
from i2c_imx_dma_write().

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 1987a0fd81329..09934f3b13efa 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
[ ... ]
> @@ -1225,6 +1228,11 @@ static int i2c_imx_dma_write(struct imx_i2c_struct=
 *i2c_imx,
>  		return -ETIMEDOUT;
>  	}
> =20
> +	if (i2c_imx->i2csr & I2SR_RXAK) {
> +		dmaengine_terminate_sync(dma->chan_using);
> +		return -ENXIO;
> +	}
> +
>  	/* Waiting for transfer complete. */
>  	while (1) {
>  		temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);

[Severity: High]
Does this error path leak the DMA mapping in dma->dma_buf?

i2c_imx_dma_xfer() maps msgs->buf with dma_map_single(), and outside
submission errors the buffer is only unmapped in i2c_imx_dma_callback():

drivers/i2c/busses/i2c-imx.c:i2c_imx_dma_callback() {
	struct imx_i2c_dma *dma =3D (struct imx_i2c_dma *)arg;

	dma_unmap_single(dma->chan_using->device->dev, dma->dma_buf,
			dma->dma_len, dma->dma_data_dir);
	complete(&dma->cmd_complete);
}

When a write is not acknowledged, the ISR completes dma->cmd_complete and
dmaengine_terminate_sync() aborts the pending DMA transfer without running
i2c_imx_dma_callback().  The mapping is never unmapped, and callers free
the message buffer while it is still DMA-mapped.  Moving dma_unmap_single()
out of i2c_imx_dma_callback() and into i2c_imx_dma_write() and
i2c_imx_dma_read() after waiting and any dmaengine_terminate_sync() call
would avoid both the leak and a double unmap if the callback already ran.

[Severity: Medium]
Can a NACK on the last DMA-transferred byte (msgs->buf[msgs->len - 2]) be
missed because I2SR_RXAK is checked before waiting for I2SR_ICF?

The DMA engine signals dma->cmd_complete as soon as it writes
msgs->buf[msgs->len - 2] into IMX_I2C_I2DR, while that byte is still
shifting out on the bus (I2SR_ICF =3D=3D 0).  i2c_imx_dma_write() wakes up,
checks i2c_imx->i2csr & I2SR_RXAK before the byte finishes transmitting,
and enters the I2SR_ICF polling loop.

If the target NACKs msgs->buf[msgs->len - 2] when it finishes shifting
out, the controller raises an interrupt that stores I2SR_IIF | I2SR_RXAK
into i2c_imx->i2csr and sets I2SR_ICF.  The loop then exits without
rechecking I2SR_RXAK, writes the final byte msgs->buf[msgs->len - 1] to
IMX_I2C_I2DR, and calls i2c_imx_trx_complete(), which returns immediately
by consuming the stale I2SR_IIF from the earlier NACK while the final byte
is still on the wire.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113073250.1037=
215-1-mehmet.fide@gmail.com?part=3D2
