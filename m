Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2EAA3F1AB9;
	Fri, 10 Jul 2026 09:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677133; cv=none; b=Vpl++99T+EFdhMUgj8WIoGjiA1M7Y9cg3WpDAQ9BNsdXJoZmdonTIhxSzMgAu08DOYvB3HsxXOtf0xE6SS6WVOjcT925MJR0ql7QmFPbgl9SIkqpz9TiOh40F6u7UtxFBc4X0nA8ZE7K2FQyv5o5MY4sVQIKBLqriYDQJwPsp/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677133; c=relaxed/simple;
	bh=NUFjCk3oqw2dSbEAvpZcxPw/anPdbxhEKmmXwYdepmk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gHv3zOeds8ordqrr/65S+RPF76P6EIWUTZ67LqsHrBkFI+VDvplbz3btBetgbL3wbH746ghifGkmLafSVDVgYJ3OSI5kONh7vv5wQIOuPT8qQdMzBooRGcHGdh5EiGmYOWIpLIHkrNSRtIVgkj92GHqrcB1qmBF4BEhTx27QkuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hi7N51qn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hi7N51qn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BE9D1F000E9;
	Fri, 10 Jul 2026 09:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783677131;
	bh=fgkoZDvu/KpucpdsDgHoaFyN8Y5VW/QxCC6OVX1+Fjw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hi7N51qnB8QJDHp6gR4UakKIlNGbnNcoNEeHRr1zran5Pr+zA8cL+wJzG+0OGSHLE
	 Og9OvK7564NWLi3EhSJIv245NXsSgMisWD3xFatoa4Ht1GPu4adLqs+YyLZ7up+llL
	 ltvze1+bpA3u61/GMWkp6DOxM0IEJQQplzBP9koDBHWk9mfHQWIOkF2OP7gRqNQS/D
	 /bejW8sQOW6eSDTF2kGaexmJjMARLVuBMrqD/a6Rut8LqOky9B2DC/uNuHQ5BOkP+n
	 zUa7n91vHqyL/RdRZWtrQSZyyqca0SxpFUtYMQ4tyw6YaNQK0Xh+dFlZK6iU1HESrP
	 5edGulHUciI7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mq: Add dcss node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Esben Haabendal" <esben@geanix.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260710-imx8mq-dcss-device-tree-node-v1-1-fc724dfd574e@geanix.com>
References: <20260710-imx8mq-dcss-device-tree-node-v1-1-fc724dfd574e@geanix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 09:52:10 +0000
Message-Id: <20260710095211.6BE9D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `dcss` device node is missing the `power-domains =3D <&pgc_dis=
p>;` property, which will cause a bus hang when the driver accesses its reg=
isters.
- [Low] The `dcss` node is placed at the `soc` level, outside of the `aips4=
` bus node, causing an overlapping `reg` region and violating the hardware =
bus topology.
--

--- Patch [1]: [PATCH] arm64: dts: imx8mq: Add dcss node ---
commit 014c87fe4bc51f0ac006bc4660c8f156f9a40538
Author: Esben Haabendal <esben@geanix.com>

arm64: dts: imx8mq: Add dcss node
   =20
Add DCSS node for i.MX8MQ based on the example in the bindings documentatio=
n.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/=
dts/freescale/imx8mq.dtsi
> index e60872aeeb49e..fb99bd3ad7c92 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
> @@ -1611,6 +1611,27 @@ irqsteer: interrupt-controller@32e2d000 {
>  			};
>  		};
> =20
> +		dcss: display-controller@32e00000 {

[Severity: Low]
The aips4 bus explicitly claims the 0x32c00000 - 0x33000000 address range:

		aips4: bus@32c00000 { /* AIPS4 */
			compatible =3D "fsl,aips-bus", "simple-bus";
			reg =3D <0x32c00000 0x400000>;
			ranges =3D <0x32c00000 0x32c00000 0x400000>;

Placing the dcss node at the soc level with address 0x32e00000 creates an
overlapping reg region and violates the hardware bus topology, which can
cause structural devicetree warnings about overlapping ranges.

Should this node be placed as a child of the aips4 bus instead?

> +			compatible =3D "nxp,imx8mq-dcss";
> +			reg =3D <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
> +			interrupts =3D <6>, <8>, <9>;

[Severity: High]
If power-domains =3D <&pgc_disp>; is omitted, the generic PM domain framewo=
rk
won't track the dependency between this device and the DISP domain.

If no other active devices claim pgc_disp, the PM core may disable the
domain during late_initcall.=20

If a board enables this node and the driver subsequently tries to access the
memory-mapped registers of the unpowered peripheral, it will trigger a
synchronous external abort and panic the kernel.

Is this node missing the power-domains property?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710-imx8mq-dcs=
s-device-tree-node-v1-1-fc724dfd574e@geanix.com?part=3D1
