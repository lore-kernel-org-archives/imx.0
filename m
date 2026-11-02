Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646296;
	b=ykyGW+DeP2k2oRqeJImwjiFNq8KyQ5wlWNu/ohD3AzLNUyBdjQ/WYINHu/uN3Buf1rIM
	 fjoi0SWKbvm596V31pH6DDn6M0L6h32Y1oemjMOguHPecAr9giQYquLHd2SOOtARFp1a/
	 t0+B4iCXYMvzNqFZfrNuq7g4200n9GgeGVA2trJDK8efyPMCChpGRxW7uwlDb0eE35qRU
	 MflHsMrNdsI6VN01AQpDyLiro04vo5Doyk2+D/Qi9HZcG97T9i3fTMBE6i0jJSH3JzaRx
	 gwtnopm9PTW6J/MWzvStYz8wU9M1udmwTAwIMBNB+Zq1zRVviGGbS3uvpMP1Jc1BLwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646296;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=LZ4NIzXFzDdhsZ95C1Vj/4IpXzzdt1WDs5+/chJgZts=;
	b=NrhJbo/IHfy5ZBe0uA0u0OPDe2wwXZlV4zzEjfaLag/pZpgm5EwnZIvP5yPtjV8YPjwh
	 jGQ+xX/btPxVCxWhlS2cAq9Ix9up10IbEyIvKtf9BYhCwz8dz2N2zWCTUjBgqlIVkGOgV
	 /op/yESS10TJqAZuP83EVR1N4w7HN/MLPX3Bru8QLzWjKs5NqCmB7wqtwBBsR0YYjUBtC
	 APA9JeN7hg0JAfUkxV05Ou0jbTHBsK2ELr1nqxkkZnpydx02yBKyGfHX8snDEgCVAeCyV
	 zxoAKkm5V69v8177E/4EUt6D8ta2qyVrx19XxfbfU/qDKdYwIs7qo2qBJrRnBQuG/+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWUp4f6g;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 640ED606A324;
	Mon,  2 Nov 2026 19:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=IWUp4f6g
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7561F00A16;
	Mon,  2 Nov 2026 19:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646296;
	bh=LZ4NIzXFzDdhsZ95C1Vj/4IpXzzdt1WDs5+/chJgZts=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IWUp4f6gy6t1goa5rs1M8Ii6BGH5da7kBZRiatKSJpmV/keUXvVLXXQeqJ6xlwjzq
	 TyKbtM/lOPWJn41QmjF9fM0QM4bNFM3B1Epkyi2B8VJc6NatPk0/BEcBYsaTO4Pq+r
	 X8GkL5ukcZ6XFlzl4d2OrneDyqur8AqYIfJXsiyCxJwjE9jzctW9KcFIpvLl20JxSH
	 WK0PkxREHD58XvxaRquIl+4/XUCIBJk1macnFiHl1UsBG9GLcE1iohrmBNJDy7LHVU
	 IH3Bx85Y5K+i1Af5V03OWgQXKDAfMQtQu4nr/rLS3r9S3VWaEkMKM1+5z6nmFznpoY
	 9bZ3Fo/EIC2og==
Message-ID: <sashiko-outbox-193979@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: imx93-var-som-symphony: enable UART
 wakeup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <5e9ae0cbf0b98898a8020bf3d8889fe87405a3d3.1793645417.git.stefano.r@variscite.com>
References: <cover.1793645417.git.stefano.r@variscite.com>
 <5e9ae0cbf0b98898a8020bf3d8889fe87405a3d3.1793645417.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 19:04:55 +0000
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
- [Medium] arm64: dts: imx93: invalid and unused wakeup-source property on =
lpuart1
--

commit 54c0e2db8b2c42ca5d07339b64a64c48881a16ab
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx93-var-som-symphony: enable UART wakeup

This commit adds the wakeup-source property to the lpuart1 node in
imx93-var-som-symphony.dts to enable UART wakeup from system suspend.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/a=
rch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> index 1f0954620195a..47203811abe99 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
> @@ -302,6 +302,7 @@ typec1_dr_sw: endpoint {
>  &lpuart1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_uart1>;
> +	wakeup-source;

[Severity: Medium]
Is wakeup-source supported by the fsl-lpuart binding and driver here?

In arch/arm64/boot/dts/freescale/imx91_93_common.dtsi, lpuart1 uses the
compatible strings fsl,imx93-lpuart, fsl,imx8ulp-lpuart, and
fsl,imx7ulp-lpuart, which bind against
Documentation/devicetree/bindings/serial/fsl-lpuart.yaml. That schema
only references serial.yaml and rs485.yaml and specifies:

    unevaluatedProperties: false

Neither fsl-lpuart.yaml, serial.yaml, nor rs485.yaml defines
wakeup-source, so adding it to &lpuart1 causes a dtbs_check validation
failure.

In addition, neither lpuart_probe() in drivers/tty/serial/fsl_lpuart.c
nor serial_core_add_one_port() in drivers/tty/serial/serial_core.c parses
wakeup-source from the UART DT node. Instead, serial_core_add_one_port()
unconditionally marks the tty device wakeup-capable (leaving wakeup
disabled until enabled via sysfs), and lpuart_uport_is_active() checks
that tty device:

drivers/tty/serial/serial_core.c:serial_core_add_one_port() {
    ...
	if (!IS_ERR(tty_dev)) {
		device_set_wakeup_capable(tty_dev, 1);
	}
    ...
}

drivers/tty/serial/fsl_lpuart.c:lpuart_uport_is_active() {
    ...
		may_wake =3D tty_dev && device_may_wakeup(tty_dev);
    ...
}

Does this property actually have any effect without corresponding binding
and driver support?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793645417.gi=
t.stefano.r@variscite.com?part=3D2
