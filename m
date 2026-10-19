Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423181;
	b=2YWbceyu3hSzKj6HmSOOVAjmYtF6Zb/C5jd3hIb1lqV1TChnjAPF+kw94x5pN6OOOvXo
	 sgXXSYbALsnU6LK2egW719X1or9gHUseH5xOp//Z+inQ4Vh9nwAz1kOrfgxZ1HeRgZGnh
	 BMExCLPDmUKTEY66LgIC/ApUqRMvIgUVVwdb3uEQK4BJjDeeiUJtc/Xq1RBTsQvv91IQY
	 fUz6bVtFlE7oxYeUz3ntE/WSK6T5eG9v0W2wlmljH1uaMMW2bTQpcY510wq6vqisLWaCT
	 l3wLzjZcQt7kaGA+7Fi6fSGVqSC8rAIscY28hsDiRIGNPgV8Bi7JUBZZd8YN5zciVUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423181;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=u1XWHZ6A6xjYAGFOvN9jKK1/2RmfnFzNqN9hZhVahPo=;
	b=AbXWMr4Kh9bwNS7P22jNR628JNtVqi71pILqS3Jkf4CtFhCTG7siTzYK7IMwU2T2TTXA
	 4etbY4UMVqMWn6gO42zzKJLse7yjHwHLwIDZja5w7BvixKBfUwd8FD7aGfD4AF3ZV/R51
	 KEYCLWQfxSEaxZPrVCy6F2flPckitUQrGAFF3c/iqrKJpY1GucRTYn74Nhy0H7m+rQGCb
	 HL1f0rX/ksioNNwj7yoMywGcxBPM2OHl9hIkpHKXvYO1Qqxkmoz5z+6MwvxDU4KeifYvk
	 eBH81haAo1QxWdpAd6vW5tmW4WRIK4hxAgzymEgB7espiIuR4Y31VbtchVpkCYghKMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JnpCfRhi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B76160A5BE3
	for <imx@lists.linux.dev>; Mon, 19 Oct 2026 15:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JnpCfRhi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF0991F000C4;
	Mon, 19 Oct 2026 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792423179;
	bh=u1XWHZ6A6xjYAGFOvN9jKK1/2RmfnFzNqN9hZhVahPo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JnpCfRhi+kRtFHv4VFK+0eqaNHeaywF6jP3U2Tgeic8YTyPXDxZ+NxLQfq84Jd3IK
	 7s5CLkKBKu0UWrFqeI3Orni6XHaOXIbE2Z0UjkBrilRXPUnEPzOjpjAbNbjOM+p5Wv
	 zHpDHPa35bP0LOoqqAjr1wHkOPNKTB9GrZ/CyMZYUbdlmRm/3yzVTWrYrMFMGXNegt
	 KnQdP+ecKVVo7DJ8Uov7o3RWT6rFxFY0xiNiKaKuxtI6C27KMJnS7s8dbj+DKgr6cx
	 1nimR5tmzNfL3CS3fyfwwa9tyIIxqm9nQ2O/PKHeYQ0H/dSnL0jg2loXCXzIGCH/bO
	 k/+dv8GqLnpoA==
Message-ID: <sashiko-outbox-177679@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH AUTOSEL 6.18] spi: fsl-dspi: clean up after failed
 suspend and resume
Reply-To: sashiko-reviews@lists.linux.dev
To: "Sasha Levin" <sashal@kernel.org>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261019135441.1420968-426-sashal@kernel.org>
References: <20261019135441.1420968-1-sashal@kernel.org>
 <20261019135441.1420968-426-sashal@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:19:39 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] spi: fsl-dspi: premature disable_irq() and unroll gap in dspi_susp=
end()
--

commit 7e693362fffc058a6e36cb3136ecf18f7eb1c968
Author: Jiawen Liu <1298662399@qq.com>

spi: fsl-dspi: clean up after failed suspend and resume

This commit checks the return values of spi_controller_suspend() in
dspi_suspend() and spi_controller_resume() in dspi_resume(), restoring the
IRQ or disabling the clock if an error occurs.

Link: https://patch.msgid.link/tencent_427FA55E3D59112524886E9C931CA0F92F06=
@qq.com

> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
> index 83ea296597e94..1283a193b6fcc 100644
> --- a/drivers/spi/spi-fsl-dspi.c
> +++ b/drivers/spi/spi-fsl-dspi.c
> @@ -1464,10 +1464,18 @@ static int dspi_init(struct fsl_dspi *dspi)
>  static int dspi_suspend(struct device *dev)
>  {
>  	struct fsl_dspi *dspi =3D dev_get_drvdata(dev);
> +	int ret;
> =20
>  	if (dspi->irq)
>  		disable_irq(dspi->irq);
> -	spi_controller_suspend(dspi->ctlr);
> +
> +	ret =3D spi_controller_suspend(dspi->ctlr);
> +	if (ret) {
> +		if (dspi->irq)
> +			enable_irq(dspi->irq);
> +		return ret;
> +	}

[Severity: High]
When dspi_suspend() takes this new error return path after
spi_controller_suspend() fails, does it leave SPI_CONTROLLER_SUSPENDED
permanently set on dspi->ctlr->flags?

In drivers/spi/spi-fsl-dspi.c, dspi_suspend() calls disable_irq(dspi->irq)
before calling spi_controller_suspend(dspi->ctlr). On platforms using
DSPI_XSPI_MODE with an IRQ, in-flight or queued transfers in
dspi_transfer_one_message() wait for dspi_interrupt() to signal
dspi->xfer_done:

drivers/spi/spi-fsl-dspi.c:dspi_transfer_one_message() {
    ...
			if (dspi->irq)
				reinit_completion(&dspi->xfer_done);

			dspi_fifo_write(dspi);

			if (dspi->irq)
				wait_for_completion(&dspi->xfer_done);
			else
				dspi_poll(dspi);
    ...
}

Because disable_irq(dspi->irq) has already disabled the interrupt line, an
in-flight IRQ-driven transfer cannot complete while spi_controller_suspend()
waits in spi_stop_queue() for the queue to drain, causing spi_stop_queue()
to time out after 5 seconds with -EBUSY.

In drivers/spi/spi.c, spi_controller_suspend() still calls
__spi_mark_suspended(ctlr) unconditionally even when spi_stop_queue() fails:

drivers/spi/spi.c:spi_controller_suspend() {
    ...
	if (ctlr->queued) {
		ret =3D spi_stop_queue(ctlr);
		if (ret)
			dev_err(&ctlr->dev, "queue stop failed\n");
	}

	__spi_mark_suspended(ctlr);
	return ret;
}

When dspi_suspend() returns -EBUSY to device_suspend(),
dev->power.is_suspended is not set, so device_resume() skips calling
dspi_resume() during suspend-abort recovery. With nothing calling
spi_controller_resume(dspi->ctlr) to clear SPI_CONTROLLER_SUSPENDED,
wouldn't all subsequent synchronous SPI transfers in __spi_sync() fail with
-ESHUTDOWN?

Should disable_irq(dspi->irq) be called after spi_controller_suspend()
succeeds, or should the failure path also call spi_controller_resume()?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019135441.1420=
968-426-sashal@kernel.org?part=3D1
