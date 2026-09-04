Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D01134D92C;
	Fri,  4 Sep 2026 06:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788503941; cv=none; b=BuMiAe2WJbQoBlcfsSkJcJy21C83Y8dzXC5dsumhAvX9uJL+sBqWAMhNzCP3fZ5oiuDiKk7pE/l8jrQYwQhaiiq96EmbfSsTHQhMjgiOaW2zaasfKcGIFiM5gMdYkzbtQBlQD19RokI2JiypFaGLYBD6Os9Gs/srVhbv5rsVaJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788503941; c=relaxed/simple;
	bh=PovhJQXFjGm/q6x5cdBsMqhNyqz7eQrv9KmaZQOSkIQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YFsh9AtT5PwnYzwW4mJOOtHX1kNRRKtFSxbnGDRQRWQFVvKstrZ9FJDRLdhd925OMGf1BbQBgXaYkY6EC9GeoZOxK4nBS+BYAechSPAcWiYwZMfUXaDoZzOxZHu/gnaP6+Q5rPWN3rw/CvdZqPOhFWyUiB2mPVxerLvx7OaWupE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5LA9ZnQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5LA9ZnQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94A9E1F00A3D;
	Fri,  4 Sep 2026 06:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788503940;
	bh=+eI3h9RO4YYLEUDuMp4jg+X+28hsuiGbYj8q4F11Uuo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H5LA9ZnQ969ZH8fUnfb5RYHpx7Ny0XmUwD70As6JiA8XLnlQ+RjKHWCBRwYDO0hWJ
	 AgmYqWRHAX2kwJPU4AQfjXRs8+jKVJ5ZKlEWQGaEV5QAgbqAthLPcWg+9S8xjoMfXZ
	 ltyTOtfAWSRy4NxEFfiMJ4boi7kr3fmPM5xSjEQ02KHaLAS/jE120C0Ol6cP34JbFd
	 osE1z1VO/YCFSlI/4qWjdrzUyDVIZd5gC0DBrjvj0RGhoJBExU2wrCC/bKaoRy4C3o
	 sgMQ8DiOWkkezR6fI/wkRHPU/lhHbf33J56RNaO2+xEhdQg1waZMr/Hx+DvVXG3PGV
	 ceqG4/rN+kKKQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v47 3/7] firmware: imx: add driver for NXP EdgeLock
 Enclave
Reply-To: sashiko-reviews@lists.linux.dev
To: pankaj.gupta@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260904-imx-se-if-v47-3-b474ec6fc52a@nxp.com>
References: <20260904-imx-se-if-v47-0-b474ec6fc52a@nxp.com>
 <20260904-imx-se-if-v47-3-b474ec6fc52a@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 06:38:59 +0000
Message-Id: <20260904063859.94A9E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Discarding successful firmware response and breaking idempotency o=
n deferred signal
--

commit c3c233856b9a36edd6fd79385b30e7951622e780
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: add driver for NXP EdgeLock Enclave

This commit adds the MU-based communication interface for the NXP EdgeLock
Enclave. It enables messaging between the secure enclave firmware and Linux
for features like HSM, SHE, and V2X on i.MX SoCs.

> diff --git a/drivers/firmware/imx/ele_common.c b/drivers/firmware/imx/ele=
_common.c
> --- /dev/null
> +++ b/drivers/firmware/imx/ele_common.c

[ ... ]

> +int ele_msg_send_rcv(struct se_if_priv *priv, void *tx_msg, int tx_msg_s=
z,
> +		     void *rx_msg, int exp_rx_msg_sz)
> +{

[ ... ]

> +	err =3D ele_msg_rcv(priv, &priv->waiting_rsp_clbk_hdl);
> +
> +	if (priv->waiting_rsp_clbk_hdl.signal_rcvd) {
> +		/*
> +		 * Signal was deferred until the FW/kernel protocol resynchronized.
> +		 * On success report -ERESTARTSYS for the interrupted wait; the
> +		 * command is not re-sent. Keep real errors like -ETIMEDOUT.
> +		 */
> +		if (err > 0)
> +			err =3D -ERESTARTSYS;

[Severity: High]
If the firmware successfully completes the transaction and ele_msg_rcv
returns a positive response size (err > 0), does returning -ERESTARTSYS
cause the VFS layer to automatically restart the identical syscall?

Since the hardware has already processed the command successfully and mutat=
ed
its state, wouldn't restarting the syscall cause the same command to be sent
a second time? This appears to break idempotency and could potentially leak
hardware resources (such as unclosed sessions or orphaned keys) because the
first successful response is discarded and userspace is unaware it succeede=
d.

> +		priv->waiting_rsp_clbk_hdl.signal_rcvd =3D false;
> +		dev_dbg(priv->dev, "Err[0x%x]:Interrupted by signal.\n", err);
> +	}
> +
> +	ele_msg_send_rcv_cleanup(priv);
> +
> +	return err;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-imx-se-if-=
v47-0-b474ec6fc52a@nxp.com?part=3D3
