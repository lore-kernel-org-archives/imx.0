Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794257975;
	b=eubrhxahmIKoZPPNvfwMt2E4vwjzc7opd2qsmh7C/y7m2I4HM/tphgUooBu/EdjvIjEz
	 02ZJHhaQJCGqf4I4gl7SXRQwYBgykfQRb6w/z1cKSaF94Uly5K1gKXrJwblZ2mq5lloWD
	 6qaz0Ca9Hjlc2t0VxCNomaVQHz1VDRiAW9mwJfBA3D86gBPQ4IhG4v8MmVJ4O+TsJP3gB
	 OF8AWydAfttX0pKZGgCWwqUadjRYnsAshtWRzfUWcm/FS+WYUDms1ZDTB3pJQ04vs+rnz
	 +FSqShfzmiJSGacbMFRNSQkVaCnJvJ9lA07wMmrPixBxreeITCzS/ig9epcQEwDq/iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794257975;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=0pNIpJ2XYUEiaROUBLiZw7MiKBMSmSE6udhiS67VKTM=;
	b=FlOGFKwAOj0I9ujNSj/C9yNRANnegfTYUA00zL8Kxl3CHLlKrcFQwGtN59vk+sFB6nll
	 v5auV3iaNL/5OfnSKhLvPVkiXjZ+usGflbU2ttbiX5LJGD6WF++73RnzBB9PnEQe0e7uq
	 v7l14/2Jo8MXnazSm02Hd5vTwSUDqqi+0UrcDOYhYZigiktqB3ihiS8aOv91E7t/EGG3c
	 jncufQyInij0qzISKAhpcGdzBIJ8enRfN4hh2HljsdbavjTm0Skc7LS7QgmrfQduiIY4V
	 Rk//vMg6zQkiNGP1KYnes+gJuUsINE2KJ0ckLA2lpst/sibW99hIdZqQ+yYpHbMt7ZQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hy04obhK;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F66606A31C
	for <imx@lists.linux.dev>; Mon,  9 Nov 2026 20:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hy04obhK
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E85961F008A1;
	Mon,  9 Nov 2026 20:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794257974;
	bh=0pNIpJ2XYUEiaROUBLiZw7MiKBMSmSE6udhiS67VKTM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hy04obhKeguCuR86/zrVfB7EwHSxJq8sDLDpxFRc6y0VxRbcnhj/Vu2au37SY/jz2
	 nLnnQgG+BU83ySErQWx1L4NbdEoOty1Jhjf+SkB1NooGfDOBo7cQMkb1l1dvnIdNA+
	 m9DNCXV5lKRuydNaviGknx5DbHsWbliLXdF/A/ZJ9u9tE3ErFJzMym1myguN7CmO9F
	 VqSAFtNPQuDwmLlVkVqOKafHfUo5cmEAFccbqKn2Zt6JCCEIZf/fP3ublyJXixYOni
	 kP9glwyyHrebbsSmLJxkJp4ynjswN3igfAHgw8eUB9wekH5b+YRC8RAjMSSYJcp6u5
	 nXHK/jJ0g/vgw==
Message-ID: <sashiko-outbox-205622@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 6/6] i2c: xiic: remove redundant
 pm_runtime_dont_use_autosuspend() calls
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <crofts@kernel.org>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261109-i2c-remove-dont-use-autosuspend-v1-6-49a08b8daf36@kernel.org>
References: <20261109-i2c-remove-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org>
 <20261109-i2c-remove-dont-use-autosuspend-v1-6-49a08b8daf36@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 09 Nov 2026 20:59:33 +0000
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
- [High] i2c: xiic: premature IRQ registration in xiic_i2c_probe() [1]
--

commit 188337d85ab0ac1fad4560f785b36f1dce4f451f
Author: Joshua Crofts <crofts@kernel.org>

i2c: xiic: remove redundant pm_runtime_dont_use_autosuspend() calls

This commit removes redundant pm_runtime_dont_use_autosuspend() calls from
the probe error path and remove callback in the xiic I2C driver.

> diff --git a/drivers/i2c/busses/i2c-xiic.c b/drivers/i2c/busses/i2c-xiic.c
> index ab7916745ad39..4e06fa4f73d77 100644
> --- a/drivers/i2c/busses/i2c-xiic.c
> +++ b/drivers/i2c/busses/i2c-xiic.c
> @@ -1580,7 +1580,6 @@ static int xiic_i2c_probe(struct platform_device *p=
dev)
>  err_pm_disable:
>  	pm_runtime_disable(dev);
>  	pm_runtime_set_suspended(dev);
> -	pm_runtime_dont_use_autosuspend(dev);
> =20
>  	return ret;
>  }

[Severity: High]
This problem wasn't introduced by this patch, but can registering the IRQ
in xiic_i2c_probe() before detecting hardware endianness cause an
interrupt storm [1]?

drivers/i2c/busses/i2c-xiic.c:xiic_i2c_probe() {
    ...
	ret =3D request_threaded_irq(irq, NULL, xiic_process, IRQF_ONESHOT,
				   pdev->name, i2c);
	if (ret)
		goto err_pm_disable;

	i2c->singlemaster =3D device_property_read_bool(dev, "single-master");

	/*
	 * Detect endianness
	 * Try to reset the TX FIFO. Then check the EMPTY flag. If it is not
	 * set, assume that the endianness was wrong and swap.
	 */
	i2c->endianness =3D LITTLE;
	xiic_setreg32(i2c, XIIC_CR_REG_OFFSET, XIIC_CR_TX_FIFO_RESET_MASK);
	/* Reset is cleared in xiic_reinit */
	sr =3D xiic_getreg32(i2c, XIIC_SR_REG_OFFSET);
	if (!(sr & XIIC_SR_TX_FIFO_EMPTY_MASK))
		i2c->endianness =3D BIG;
    ...
}

If a pending interrupt remains from an earlier boot stage on a big-endian
system, xiic_process() can fire immediately after request_threaded_irq()
while i2c->endianness is still zero-initialized to LITTLE.  xiic_getreg32()
and xiic_setreg32() then use little-endian accessors, failing to clear the
interrupt and hanging the system in an unhandled IRQ storm.  Detecting
endianness and running xiic_reinit() before requesting the IRQ would avoid
this.

[1] https://sashiko.dev/#/bug/linux-6466439c-c62b-471e-ba38-0219e368df95

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-i2c-remove=
-dont-use-autosuspend-v1-0-49a08b8daf36@kernel.org?part=3D6
