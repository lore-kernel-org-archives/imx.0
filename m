Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6526B4D8D83;
	Thu,  2 Jul 2026 09:50:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782985805; cv=none; b=jh/B+U/3L4MsQwn9QQiWMn11aTO4QW7q4RiEroZaXhgk2YPnqdBgBIXl/2SG3kR16MenIWBYtRiu0KvWfgTxBn0zXyQw9/ekH6oBbgERPgEWAkUYoPNnm/Sek6jWdPqWEaCLLbwr/+KTnJCUUebMNXC7k8miTgPFUDdk6oO42YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782985805; c=relaxed/simple;
	bh=L6Qq3uruWQZ9MQS+XgdfCBx9XCyavONZ41mp4BOL+rI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=L7nKzNwcSRQfpj22sscyb+pVkUrWzVYJtwonkV26m0OKee8azNwwqxS7ccXwFY5XbXzqOfOdqrKNTG3JYTZbDG16gsnTaqNZ1UXxaTlaIO+uc3p1A8uXFtCY5KHcPUHfL+PCQ0Z1Ij7BNwFnqepIeF+Q8q6v+PNOKfsAEcO2xUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l2+/Rav5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l2+/Rav5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75BA61F01814;
	Thu,  2 Jul 2026 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782985802;
	bh=QAt8IkPU78AUXj470E16sbWH2G3KHOHy3Bnt2mFNG+w=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=l2+/Rav5RUI4Bom64i5UgoF5NRaFjer5MVBYETWPlbXTTcvEmeZ18xbeGkC55q9kf
	 i1N2tjQFS30CG59hBZCbbzQGue6tPloAwQ7GgjDHbUiSSzSWNKpD5WrrE5bRA7ci+x
	 z7V3YGwHv7s6UFtrKst5JY2OYbv7MpgnX/pqTgyYiWdTPj2g3OILLECJgmg4q6N+9/
	 qxW973/we32IYU3hVwJaJU2YXeoQWUxPYSUfiG0S4MDt9YvHY/6aUidEuF1jQTamRw
	 zXbzD5V14pgjDAaFuC9KviOSqi3rjAORGweb8tNHNB9QdxVC4dh2UHvGXBiJlIwvgm
	 JklBHKQZZiwiA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 09/18] arm64: dts: ti: k3-j721e-sk: Add overlay for
 fusion application daughter board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yemike Abhilash Chandra" <y-abhilashchandra@ti.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260702093123.1048575-10-y-abhilashchandra@ti.com>
References: <20260702093123.1048575-1-y-abhilashchandra@ti.com>
 <20260702093123.1048575-10-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 02 Jul 2026 09:50:01 +0000
Message-Id: <20260702095002.75BA61F01814@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Low] Inconsistent definition of the `bus-type` property between CSI-2 en=
dpoints.
- [Low] Minor DTS styling and whitespace inconsistencies in port definition=
s.
--

commit 6e2c6c33cfd930bf555fb197269fc8e707df6261
Author: Vaishnav Achath <vaishnav.a@ti.com>

arm64: dts: ti: k3-j721e-sk: Add overlay for fusion application daughter bo=
ard

This commit adds a device tree overlay for the Fusion application daughter
board, enabling FPDLink-III based sensors to connect to TI EVMs. It
configures two DS90UB960 deserializers and is compatible with J721E SK,
AM68-SK, and AM69-SK boards.

> diff --git a/arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso b/arc=
h/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
> new file mode 100644
> index 0000000000000..dd82ec3accfed
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j721e-sk-fpdlink-fusion.dtso
[ ... ]
> +		deserializer_0_ports: ports {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			port@0{
> +				reg=3D <0>;

[Severity: Low]
This isn't a bug, but there are a few minor formatting inconsistencies with
whitespace before braces and around equal signs (e.g., port@0{ instead of
port@0 {, and reg=3D <0>; instead of reg =3D <0>;). Should these be adjuste=
d to
match standard device tree style?

> +				status =3D "disabled";
> +			};
[ ... ]
> +&cdns_csi2rx0 {
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		csi0_port0: port@0 {
> +			reg =3D <0>;
> +			status =3D "okay";
> +
> +			csi2_phy0: endpoint {
> +				remote-endpoint =3D <&ds90ub960_0_csi_out>;
> +				clock-lanes =3D <0>;
> +				data-lanes =3D <1 2 3 4>;
> +				link-frequencies =3D /bits/ 64 <800000000>;
> +
> +			};

[Severity: Low]
Is it intentional that the bus-type property is omitted here in csi2_phy0,
while it is explicitly defined in csi2_phy1 below? While the V4L2 framework
might infer V4L2_MBUS_CSI2_DPHY automatically from the clock and data lanes,
would it be better to keep the property definitions consistent between the
two endpoints?

> +		};
> +	};
> +};
> +
> +&cdns_csi2rx1 {
> +	ports {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		csi1_port0: port@0 {
> +			reg =3D <0>;
> +			status =3D "okay";
> +
> +			csi2_phy1: endpoint {
> +				remote-endpoint =3D <&ds90ub960_1_csi_out>;
> +				bus-type =3D <4>; /* CSI2 DPHY */
> +				clock-lanes =3D <0>;
> +				data-lanes =3D <1 2 3 4>;
> +				link-frequencies =3D /bits/ 64 <800000000>;
> +			};
> +		};
> +	};
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702093123.1048=
575-1-y-abhilashchandra@ti.com?part=3D9
