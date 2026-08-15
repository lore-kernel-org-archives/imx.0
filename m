Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD721E98EF
	for <imx@lists.linux.dev>; Sat, 15 Aug 2026 15:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786807529; cv=none; b=oY2ED9tQobm5LeGChfeLyW7rD6lFLszK9mAKFnHqZwPwp5Dsxtf05ik2LYlDB1ORYffobItbCQUqx0hdRx64vloYJnLThUM2cBIrku931A/nTrhmQfWdIiYkjqYL0Pak07wbOzaTL2rr/dcx9pIe1hKMOktX/E9Fuh1ubXt9gyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786807529; c=relaxed/simple;
	bh=oWylfuXlvXUNxdfg6H+xe5LU6TuJoNWBp0bOheWsIHU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Dg3Koj/bAmkSRNliMlH87ZdkqE4m08kr4TKMyqozuSNW7tdC67csPWwcaJswV7U0sZtIBl6+7g9J5gj6OL7i1HbT5b9bqMXFYtbgK80HV9qjbCM+6cIMCs/852LF8Rgo7XlOUX8KO7Cl9zsOHGKP7iYTszb9mJF4we/IvbsIuXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h39HiT/6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h39HiT/6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02541F000E9;
	Sat, 15 Aug 2026 15:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786807527;
	bh=4V8U9otJ4EWH1k1h+44CE51xUxe6fMSFxSgw/kTNrP8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=h39HiT/6uwDkjNuIS9XwLuJovDIukoQ2QnERo2gDdBa0gv1ulGs55lL5C03SW0cYo
	 ZYgC8VKbBq9jiXbna8sc+1bFky7KWMZ5eF1H9Q3HElykn8syI0AUdu5OGGdGuW3J1O
	 qzhXFkq6X0XPT8DPQzkW0f5yfqF1IXCFKKfOL/MJbKQ4MeEnrWANUN80u8SGTUu6Kt
	 DxH6QisYyUafPDWm5ib0nQtGmgCFac1Kv9FsSaTzPAB+peY6WKp2qj79DdiV5aMhOZ
	 kq/77asVuD78VL2cEE9KsSMd3ylxzUI3asqYRZyHzYNz+Y9CFzpHOU5TFbTPBfHq4H
	 l1r7ZCNzX1xaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] i2c: mxs: fix DMA channel leak on probe error
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ruoyu Wang" <ruoyuw560@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260815151720.3757460-1-ruoyuw560@gmail.com>
References: <20260815151720.3757460-1-ruoyuw560@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 15:25:26 +0000
Message-Id: <20260815152526.E02541F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] On a DMA transfer timeout, the active DMA bounce buffer is imprope=
rly freed before unmapping and terminating the DMA engine, leading to a use=
-after-free and potential memory corruption.
- [High] The DMA completion callback signals the waiting thread before unma=
pping the DMA buffer, causing a race condition where the CPU may read stale=
 data and the buffer may be freed before unmapping completes.
--

--- Patch [1]: [PATCH v2] i2c: mxs: fix DMA channel leak on probe error ---
commit 3a30f1ffa0258833921bc6e721cb282f66cc45c7
Author: Ruoyu Wang <ruoyuw560@gmail.com>
i2c: mxs: fix DMA channel leak on probe error

This commit fixes a DMA channel leak in mxs_i2c_probe() by using
devm_dma_request_chan(). This ensures the device core releases the
channel on probe failure and driver detach, removing the need for
manual release in the remove callback.

> diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
> index 4e07babea9c3f..eee4fdcd9df31 100644
> --- a/drivers/i2c/busses/i2c-mxs.c
> +++ b/drivers/i2c/busses/i2c-mxs.c
> @@ -839,7 +839,7 @@ static int mxs_i2c_probe(struct platform_device *pdev)
>  	}
> =20
>  	/* Setup the DMA */
> -	i2c->dmach =3D dma_request_chan(dev, "rx-tx");
> +	i2c->dmach =3D devm_dma_request_chan(dev, "rx-tx");

[Severity: High]
This is a pre-existing issue, but does the timeout path in
mxs_i2c_xfer_msg() free the active DMA bounce buffer before
terminating the DMA engine?

In mxs_i2c_xfer_msg(), if the completion times out:

		time_left =3D wait_for_completion_timeout(&i2c->cmd_complete,
						msecs_to_jiffies(1000));
		i2c_put_dma_safe_msg_buf(dma_buf, msg, true);
		if (!time_left)
			goto timeout;

The bounce buffer is freed by i2c_put_dma_safe_msg_buf(). The code
then jumps to the timeout label, which calls mxs_i2c_dma_finish() to
unmap the scatterlist but does not call dmaengine_terminate_sync().

Could this leave the DMA hardware active and able to write into the
freed memory?

Additionally, a late DMA completion could cause
mxs_i2c_dma_irq_callback() to execute, resulting in a second call to
mxs_i2c_dma_finish() and a double-unmap of the scatterlist.

[Severity: High]
This is also a pre-existing issue, but does the DMA completion
callback signal the waiting thread before unmapping the DMA buffer?

Looking at mxs_i2c_dma_irq_callback():

static void mxs_i2c_dma_irq_callback(void *param)
{
	struct mxs_i2c_dev *i2c =3D param;

	complete(&i2c->cmd_complete);
	mxs_i2c_dma_finish(i2c);
}

By calling complete() before mxs_i2c_dma_finish(), the waiting thread
in mxs_i2c_xfer_msg() is awakened and proceeds to call
i2c_put_dma_safe_msg_buf().

Since the unmap has not occurred yet, the CPU cache may not be
invalidated. Could this result in the CPU reading stale cached data
during the memcpy from the bounce buffer instead of the actual data
received from the bus?

>  	if (IS_ERR(i2c->dmach)) {
>  		return dev_err_probe(dev, PTR_ERR(i2c->dmach),
>  				     "Failed to request dma\n");

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815151720.3757=
460-1-ruoyuw560@gmail.com?part=3D1
