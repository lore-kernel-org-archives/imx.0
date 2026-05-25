Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4AD37DE9F
	for <imx@lists.linux.dev>; Mon, 25 May 2026 12:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779710646; cv=none; b=gz+FUsOx67yqIOTRRNz44Yhuo8DESz6ejmrqGzA70qVME2e1Z/vr/rdfWG2Rc+eRD5zsvtranpTY0Up+a8hppqmRTCAWB1qqgGd/X3s1KZ6WncTu76z1xHgIIdJMvqxELFtXrs+bL5KEoJLS1Zjr8oQdKvGpUFrhBAwnw/yVHnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779710646; c=relaxed/simple;
	bh=2tFAdsReZx1V03oReoipeM4XbTvE8qEFn7sKubfHPx8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fTphCRBQxlKg+rlP0XqPPp3SBl25tfg55oFfCIliwoZke/ApYgEtglybS3LLPqhryL0hSMph8hSxOD2KpCiPuKYwGMbNlKoAdRIz3/9A5SZ/ZJYwtT8q+Qp/BjDnFI5tdxdSmlBE5vkpyUzyXcD7caEKtsw7InkaJsSuphMBdgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LiLXFrOJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LiLXFrOJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAF831F000E9;
	Mon, 25 May 2026 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779710644;
	bh=eyBCEe0Gu2pTUA6hmZdymBWif9ON1pbM2EksfxoLxEw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LiLXFrOJJhHhkfcnQtVaz34IxTBSbHRfyXRw+ujPx27QQ5QMpqg23Shw7pWnrpOmd
	 qcZk3DWK9Vn9+qykaxscZnvyRLJ48UKiD8FbU97Xv64A2N5mmGOFO+BmBzDlCjLpAP
	 Bekih4X2xxKIY2L0A6fLYqFM32DeM8DTvfEoAfIX8lMz5QTQN/MTd+d5GsgYa3ZZQk
	 sYQd//aV8e/YKSI0pr45bFmf4/LiMI6FJhrynclYDpzYNHXjAxzdzc4uSLPtbQnrHI
	 WEvKP8+aMYBWiEN78pMQJqUNRNSZnB/bPqyjyvXGpRKPyRG7V/F+PtEqPOZwGwnLFa
	 arV8YHJtFtyEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (atomic)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-1-f30ab53dd97c@free.fr>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v1-1-f30ab53dd97c@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 25 May 2026 12:04:04 +0000
Message-Id: <20260525120404.BAF831F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Atomic SMBus block reads without PEC fail because `i2c_imx_prepare=
_read` incorrectly NACKs the length byte.
- [High] Returning `-EPROTO` directly when `len > I2C_SMBUS_BLOCK_MAX` aban=
dons an in-flight receive cycle, leaving the I2C bus permanently stuck.
--

commit 83c9437aa27a45a7ddaac360874e6cfec57d3cf7
Author: Vincent Jardin <vjardin@free.fr>

i2c: imx: fix locked bus on SMBus block-read of 0 (atomic)

This commit fixes a locked I2C bus issue in atomic mode when an SMBus
block-read has a byte count of 0. It handles count=3D0 by NACKing the
in-flight dummy byte and adjusting the message length to emit a STOP
condition properly.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1436,8 +1436,19 @@ static int i2c_imx_atomic_read(struct imx_i2c_stru=
ct *i2c_imx,
>  		 */
>  		if ((!i) && block_data) {

[Severity: High]
This is a pre-existing issue, but does i2c_imx_prepare_read() incorrectly
NACK the length byte for atomic SMBus block reads without PEC?

When i2c_imx_prepare_read() is called earlier in this function to clear the
I2CR_TXAK flag and ACK the initial bytes, it uses a check for (msgs->len - =
1).
For SMBus block reads (I2C_M_RECV_LEN), the initial msgs->len provided by t=
he
I2C core is 1.

This causes msgs->len - 1 to evaluate to 0, which leaves TXAK set to 1. The
controller then NACKs the very first length byte, causing the target to abo=
rt
the transfer and immediately fail atomic SMBus block reads.

>  			len =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> -			if ((len =3D=3D 0) || (len > I2C_SMBUS_BLOCK_MAX))
> +			if (len > I2C_SMBUS_BLOCK_MAX)
>  				return -EPROTO;

[Severity: High]
This is a pre-existing issue, but does returning -EPROTO directly here
abandon an in-flight receive cycle and leave the bus permanently stuck?

When reading the length byte via imx_i2c_read_reg(..., IMX_I2C_I2DR), the
hardware automatically initiates the reception of the next byte. If the len=
gth
exceeds I2C_SMBUS_BLOCK_MAX, returning directly without generating a NACK or
STOP condition abandons the transfer.

Because the target device remains in the middle of a transmit cycle holding
SDA low waiting for clock pulses, and atomic polling mode disables sleepable
GPIO bus recovery functions, does this cause the I2C bus to wedge until a
power cycle?

Should the same graceful abort sequence used for len =3D=3D 0 (NACKing the
in-flight dummy byte and emitting a STOP) be applied here as well?

> +			if (len =3D=3D 0) {
> +				/*
> +				 * SMBus 3.1 6.5.7: support count byte of 0.
> +				 */
> +				temp =3D imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +				temp |=3D I2CR_TXAK;
> +				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +				msgs->buf[0] =3D 0;
> +				msgs->len =3D 2;
> +				continue;
> +			}
>  			dev_dbg(&i2c_imx->adapter.dev,
>  				"<%s> read length: 0x%X\n",
>  				__func__, len);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260525-for-upstre=
am-i2c-lx2160-fix-v1-v1-0-f30ab53dd97c@free.fr?part=3D1
