Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793646235;
	b=LJnU8v48XnEqF2eEwqEjT3FXN+/7cBYRlAIk6Q4ufjb27qlB3WKDhY9wupMV2Nu32iy3
	 aYsBtybSg1sc1FpGrS2WhWioPuhQDkQPMEzdYNZcmCj68jUlZunZPCG8P2RvOqWYwb+dO
	 ebWFh9rAdytAKBUad7TR+5H4b6Kf7We4+YG/Jr97EBafEQuWxAl6qx8XzWkawds1Iu1TW
	 4m/qIUHU2xbGdTlTSRxEqeZGglD20dj9aQ+ODGkcj5D8GGBrWW1mMcDEE/2ZB5+wqc6CQ
	 AMKC+FQNfiUmY/XY7KmZle5WbzlAaIei7cr7wYKGmQ1TobBnuN71sn2bdX/uhQczhyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793646235;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dZKv2IvpeuyTw8UI8MdaNVk6vpfn0im8fDXFnVbuTDc=;
	b=fUeWbAaq+eiZfUBC1eJ4GETU/aIrb62AxM6h/IViPCnuT5eE2um0AWsJajf1rxXaHLii
	 UwiXbWELytkl6qX64K1iyAkbHo6xW91xtKc6TL2Ye3ztixDCbiHUAjB/GTQZO4YBmtBeI
	 A5SyeH00TtyuCta6OlToy6FXRGauGu81aHYqbeblqf/b7kzAgv9vtojAjlcSFgYLm1rQ7
	 voCzqCwuygRdClwjymZs9UpkdIkI683glo1e0FxPmv48rfUiGJADFBsEdg1k15seG8QJL
	 C3RsC33tKuumq91LvJxyE8S/C33TV6QSE72Gux1uvZ40rFEYLfZ7sAwJ1u8UalfDi5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D32uSaFq;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA5A606A324;
	Mon,  2 Nov 2026 19:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=D32uSaFq
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3FAC1F00A17;
	Mon,  2 Nov 2026 19:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793646235;
	bh=dZKv2IvpeuyTw8UI8MdaNVk6vpfn0im8fDXFnVbuTDc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D32uSaFqsNco/qhedTlN6iZ9OfDBjinvHNbHEdAUiWoUN/aPocuuLbzdBWMkrOqQ3
	 CHCUB3OiwwCa2NgZ2hLokc92/UyYSv79rzt/JOwkesArPAWVHY4Pwa1DaVtjcumzLn
	 KBGBvK52iMIMmM3/xxGQajrjh36KOmIlhmBxhofJ4lVdyxoCYWL/2Jb/9EnJQaWpxa
	 i4/OHNCDvs8HKabcB/zvn0Pci/UYrHv4Eauu5gKxhtX5bXZb0G3yyWv/rK2rf9hV4H
	 gF/e6oKDLSPyyymaQjH0mRV6hMgsUA1/IwOJyQrJfJ75HU1Fjgv0RlRiKCCya5npgF
	 h2b+/mwoo58jQ==
Message-ID: <sashiko-outbox-193978@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 1/2] arm64: dts: imx93-var-dart-sonata: enable UART
 wakeup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <b51bef917d08b83bd231a4a228fb2d23c19a858b.1793645417.git.stefano.r@variscite.com>
References: <cover.1793645417.git.stefano.r@variscite.com>
 <b51bef917d08b83bd231a4a228fb2d23c19a858b.1793645417.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 02 Nov 2026 19:03:54 +0000
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
- [Medium] arm64: dts: imx93-var-dart-sonata: invalid wakeup-source on lpua=
rt1
--

commit 65667fa7cde1bed5fd9129933907d0e5e0428a2f
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx93-var-dart-sonata: enable UART wakeup

This commit adds the wakeup-source property to the lpuart1 node in
imx93-var-dart-sonata.dts to allow the serial console to wake the system fr=
om
suspend.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts b/ar=
ch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
> index 1ca3ec8330d07..d368a09dc9167 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata.dts
> @@ -385,6 +385,7 @@ can0: can@0 {
>  &lpuart1 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_uart1>;
> +	wakeup-source;

[Severity: Medium]
Does adding wakeup-source to &lpuart1 pass dtbs_check or take effect at
runtime?

The lpuart1 node in arch/arm64/boot/dts/freescale/imx91_93_common.dtsi uses
the "fsl,imx93-lpuart", "fsl,imx8ulp-lpuart", "fsl,imx7ulp-lpuart"
compatibles, which are matched by
Documentation/devicetree/bindings/serial/fsl-lpuart.yaml:

  required:
    - compatible
    - reg
    - interrupts
    - clocks
    - clock-names

  unevaluatedProperties: false

Neither fsl-lpuart.yaml nor the schemas it references (serial.yaml and
rs485.yaml) define wakeup-source, so this causes an unevaluated property
validation failure on serial@44380000.

In addition, neither lpuart_probe() in drivers/tty/serial/fsl_lpuart.c nor
serial_core_add_one_port() in drivers/tty/serial/serial_core.c reads
wakeup-source from the controller device node. Instead,
serial_core_add_one_port() unconditionally marks the child tty device as
wakeup-capable:

  tty_dev =3D tty_port_register_device_attr_serdev(port, drv->tty_driver,
                  uport->line, uport->dev, &uport->port_dev->dev, port,
                  uport->tty_groups);
  if (!IS_ERR(tty_dev)) {
          device_set_wakeup_capable(tty_dev, 1);
  }

And lpuart_uport_is_active() in drivers/tty/serial/fsl_lpuart.c checks
wakeup state on that child tty_dev (configured via sysfs) rather than the
platform device:

  tty =3D tty_port_tty_get(port);
  if (tty) {
          tty_dev =3D tty->dev;
          may_wake =3D tty_dev && device_may_wakeup(tty_dev);
          tty_kref_put(tty);
  }

Should fsl-lpuart.yaml and the driver be updated to support wakeup-source
before adding this property to the devicetree?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1793645417.gi=
t.stefano.r@variscite.com?part=3D1
