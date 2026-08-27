Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88B5D2DF126
	for <imx@lists.linux.dev>; Thu, 27 Aug 2026 15:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787846261; cv=none; b=nYb0nMYph1wBV5PsEb3poZNgw8av99UHJEXe7D5mmD/pHSVanhf48soPTov/zTOOdLVgR6HuwnLrD1usnrGuW1H60SgiL0eXt40X8MvVQG0SC4Es9hJmN/5x8Pami4GLr9qWV00uaWszDlSbncPuQeKEeHQSmQ2ZXloLCTdfhcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787846261; c=relaxed/simple;
	bh=/aypEm9TiisTIYik9Pn+VJGomOz91VUhBZJ1M/LtFYU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iHdRVAKuNrra/Y1E8HFJX8aACn9Snm2qOoI1DwjT3OdYX9rdc7JdnaQcioEkVDCGvETvbFFYrpLC0XmfLO2McBCmMgVmuETeJpHYNyfRMU/U/88qVAPtT02WIgwjnoMTYpt13xpCM2t4+nvFx+tuijDG3wtDG1mFAemiVoBCpIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DyjpIV0R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DyjpIV0R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F01421F000E9;
	Thu, 27 Aug 2026 15:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787846260;
	bh=4lztL/36K+FpkUNm/V+ODWwjBqnjpH7dVSm7N6X/g64=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=DyjpIV0RHewS6Is10A07tqLbEsNDmVciPA59YVqh8hLhZ8okL/0J+Ptz0XmS4sD4G
	 YD7NKVxKjvdgEVhR1qeBPoHjniSCpli+ANjK9d4see9Yx9CqSvJoOQWPJxqFuWZp2U
	 u5SYS7dx0GoKQTqYR5GlVi6WbXeJub4Gbob+CSPhO/Y3qVWqQPnoKwjTKus+6C1JXe
	 sPYSK7tj3STeXPt9U8SfG9Vc7kSJqquqYpj9fbj4a+8hcHC5xXFabKA090Fgn2P8jy
	 wyIpEUKKSNKFfUvd7jVXAqesz8OyawGcybxWoklGl86swGOubnjidgrUtogEg5hv8C
	 9Bxnc+dqOTKnA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] i2c: qcom-geni: release DMA channels on probe error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Shengzhuo Wei" <me@cherr.cc>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
References: <20260827-i2c-dma-channel-leak-v1-0-271d4adc03a0@cherr.cc>
 <20260827-i2c-dma-channel-leak-v1-3-271d4adc03a0@cherr.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 15:57:39 +0000
Message-Id: <20260827155739.F01421F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Double Free / Use-After-Free in `geni_i2c_gpi_xfer` due to stale `=
rx_buf`/`tx_buf` pointers.
- [High] Double free in `geni_i2c_tx_one_msg` and `geni_i2c_rx_one_msg` whe=
n DMA preparation fails.
- [High] Multi-descriptor transfer arrays `dma_buf` and `dma_addr` are leak=
ed on early error paths.
- [High] Probe failure leaves the device in `RPM_ACTIVE` state, permanently=
 leaking clocks and interconnect bandwidth.
- [Medium] Unprotected state modification of `gi2c->err` on timeout in GPI =
transfer mode.
--

commit c5e9b3033c37b684962141040cbfbb6d92768687
Author: Shengzhuo Wei <me@cherr.cc>

i2c: qcom-geni: release DMA channels on probe error

This commit ensures that exclusive GPI tx/rx DMA channels are properly
released if the I2C adapter registration fails during probe. Previously,
the function returned without freeing these channels.

> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-=
qcom-geni.c
> index 658636c1ee0e2..45c770552bd26 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -1189,8 +1189,10 @@ static int geni_i2c_probe(struct platform_device *=
pdev)
>  		return ret;
> =20
>  	ret =3D i2c_add_adapter(&gi2c->adap);
> -	if (ret)
> +	if (ret) {
> +		release_gpi_dma(gi2c);
>  		return dev_err_probe(dev, ret, "Error adding i2c adapter\n");
> +	}

[Severity: High]
This isn't a bug introduced by this patch, but does failing the probe here
without forcefully suspending the device leave it locked in the RPM_ACTIVE
state indefinitely?

Since the device is configured for autosuspend earlier in geni_i2c_probe(),
returning an error here triggers devres cleanup. This cleanup cancels the
pending autosuspend timer. Because the usage count is 0 but the device is
still physically active, could this permanently leak power, clocks, and
interconnect bandwidth?

> =20
>  	dev_dbg(dev, "Geni-I2C adaptor successfully added\n");

While reviewing this patch, I also noticed a few other pre-existing issues =
in
the driver.

[Severity: High]
This is a pre-existing issue, but does geni_i2c_gpi_xfer() double-free the
buffer when processing mixed read/write I2C messages?

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_gpi_xfer() {
        ...
		if (!gi2c->is_tx_multi_desc_xfer)
			geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
        ...
}

If a batch contains a read message (which allocates and assigns rx_buf) fol=
lowed
by a write-only message, the second iteration bypasses the read DMA setup.
Since rx_buf and tx_buf are declared outside the loop and not reset to NULL
between iterations, does geni_i2c_gpi_unmap() end up passing the stale rx_b=
uf
from the previous message, causing i2c_put_dma_safe_msg_buf() to double-fre=
e it?

Similarly, on the error path in the same function:

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_gpi_xfer() {
        ...
	else
		geni_i2c_gpi_unmap(gi2c, &msgs[i], tx_buf, tx_addr, rx_buf, rx_addr);
        ...
}

Are the same stale buffer pointers unconditionally passed here on failure,
causing a double free?


[Severity: High]
This is a pre-existing issue, but does a DMA preparation failure lead to a
double free in geni_i2c_tx_msg_cleanup()?

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_tx_one_msg() {
        ...
	} else {
		gi2c->xfer_len =3D len;
		gi2c->dma_addr =3D tx_dma;
		gi2c->dma_buf =3D dma_buf;
	}
        ...
}

When geni_se_tx_dma_prep() fails, this else block is bypassed. Could this l=
eave
gi2c->dma_buf retaining a stale pointer from the previous I2C message?

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_tx_msg_cleanup() {
        ...
		i2c_put_dma_safe_msg_buf(gi2c->dma_buf, cur, !gi2c->err);
        ...
}

When this cleanup function is subsequently called, will it unconditionally =
pass
the stale, non-NULL pointer from the previous message to be freed again?


[Severity: High]
This is a pre-existing issue, but are the multi-descriptor transfer arrays
leaked on early error paths?

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_gpi_multi_desc_unmap() {
        ...
		if (tx_multi_xfer->unmap_msg_cnt =3D=3D gi2c->num_msgs - 1) {
			kfree(tx_multi_xfer->dma_buf);
			kfree(tx_multi_xfer->dma_addr);
			break;
		}
        ...
}

If an early error occurs (such as DMA mapping failing on the first message)=
 and
the code jumps to the error label, the loop bound is lower than the required
threshold. Will gating the kfree() calls behind this final message index ch=
eck
cause dma_buf and dma_addr to be permanently leaked?


[Severity: Medium]
This is a pre-existing issue, but is there a data race when modifying the e=
rror
state on timeout?

drivers/i2c/busses/i2c-qcom-geni.c:geni_i2c_gpi_xfer() {
        ...
				gi2c->err =3D -ETIMEDOUT;
        ...
}

In GPI transfer mode, this error state is updated directly on timeout witho=
ut
holding gi2c->lock.

drivers/i2c/busses/i2c-qcom-geni.c:i2c_gpi_cb_result() {
        ...
		gi2c->err =3D -EIO;
        ...
}

If the DMA transaction completes with an error precisely as the timeout exp=
ires,
could the interrupt handler concurrently modify gi2c->err, leading to a race
that corrupts the logged or returned error code?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827-i2c-dma-ch=
annel-leak-v1-0-271d4adc03a0@cherr.cc?part=3D3
