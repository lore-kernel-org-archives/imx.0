Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01C7247253A;
	Mon, 14 Sep 2026 21:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789420337; cv=none; b=ApThz4LVF1RH7/LEWFyZiZ5rLpo5MvFvAGXjTscU8D4R2S44i77pLAVH5S7dgWdqaNkb+SwhpRs9cMp0zLmcbaZH6fkNxb+uZD+r0Cjp8X5qNPEDnnd4VPtz4+J1f6n9+tXo/LYSVeA6ZdILJqPY/9zxAaryPgmXxgf4SnxCm3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789420337; c=relaxed/simple;
	bh=bnIGdO+aBwD0PsG42r46pt1QgkvjSjxrYUlZcZ01n5c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=S+IUeM++ezuOf3dO1Zgx7PawyyToE2jXS4xNFdoiUD2OUNlHAeeadIyiFJeQnsvT+2F/97zEWogofXOBLhpw/pSkZoLeXr8E+Ou1nyXMbpeqbKKqiaBFT3pzppZCe7e233YeswOrt8b1HH4kB9DSre/s3gCiUZzlQdlc4mNtJnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZnMNf/BF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZnMNf/BF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27DF21F000FF;
	Mon, 14 Sep 2026 21:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789420335;
	bh=vuPMA8S01rRmhWmPHpDlGE79IemYYIelzrstYdvfQ4Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZnMNf/BFA1jrF7PHoiAraSBoDboCG4B2/wvf+KSGKY5b3bISZlYTKFE5ywx4qR0e/
	 BOzFW+i7DNK+z29tZCnpCRnaUZ/CHavHGl7TbW3m3xQED+n/xny9Fnl3eYbY37KCmf
	 7tT46lYqLm1oVoBZXKJKeNKHCG8RYZ3VoWo0NGAVwhWKHe2jv9o7IZcGmRqhzg02YC
	 sZMi7t4FS2Yor97gt+ljWEdOPVHPqMgpTIEnBEljKtnt4diwtMP3F7g2TQJ8Pl+KMl
	 qSNI+j/7kgeh0CFpJfLqi5PS9xmpYdgzVo4WCs0IwCY8txbK/sQR2HovNbjpbqDYqW
	 53IjbdkaHEnxQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260914-for-upstream-nbxv3-dts-v7-3-373a142b08d5@free.fr>
References: <20260914-for-upstream-nbxv3-dts-v7-0-373a142b08d5@free.fr>
 <20260914-for-upstream-nbxv3-dts-v7-3-373a142b08d5@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Sep 2026 21:12:14 +0000
Message-Id: <20260914211215.27DF21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The LAN8023 Ethernet PHY reset line is defined in the GPIO line =
names but not consumed by the PHY or MDIO nodes.
--

commit 01a0f7e456eaf4c337c371a1a52bfa41e64a5e2b
Author: Vincent Jardin <vjardin@free.fr>

arm64: dts: freescale: add Nodebox v3 CPU Module

The Nodebox v3 is a Free Mobile CPU module built around the NXP
LX2160A (16x Cortex-A72, DPAA2).

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/=
arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> new file mode 100644
> index 0000000000000..9c5588a75cdd4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi

[ ... ]

> +&emdio1 {
> +	status =3D "okay";
> +
> +	/* Microchip LAN8023 dual 10G PCS/retimer, Clause 45 only, one address =
per slice */
> +	lan8023_phy_s0: ethernet-phy@2 {
> +		compatible =3D "ethernet-phy-ieee802.3-c45";
> +		reg =3D <2>;
> +	};
> +
> +	lan8023_phy_s1: ethernet-phy@3 {
> +		compatible =3D "ethernet-phy-ieee802.3-c45";
> +		reg =3D <3>;
> +	};

[Severity: Medium]
Will the kernel be able to assert the physical reset line for these PHYs
during probe?

The hardware description defines a physical reset line for the LAN8023
(lan8023-rst on the u800 GPIO expander), but neither the PHY nodes nor the
MDIO bus have a reset-gpios property assigned to consume it.

If the PHY is left in a bad state, such as after a warm reboot or driver
unbind/bind, it might fail to probe or exhibit unstable link behavior
without the reset line being asserted by the phylib framework.

[ ... ]

> +	u800: gpio@75 {
> +		compatible =3D "ti,tca9539";
> +		reg =3D <0x75>;
> +		#gpio-cells =3D <2>;
> +		#interrupt-cells =3D <2>;
> +		gpio-controller;
> +		gpio-line-names =3D
> +			"carrier-gpio0", "carrier-gpio1",
> +			"carrier-gpio2", "carrier-gpio3",
> +			"carrier-gpio4", "carrier-gpio5",
> +			"carrier-gpio6", "carrier-gpio7",
> +			"carrier-gpio8", "carrier-gpio9",
> +			"carrier-gpio10", "carrier-gpio11",
> +			"", "", "",
> +			"lan8023-rst";

[Severity: Medium]
Is this physical reset line intended to be consumed by the ethernet-phy
nodes on the emdio1 bus?

Since this GPIO is never mapped to a consumer in the device tree bindings,
the Linux phylib framework will ignore it.

> +		interrupt-controller;
> +		interrupt-parent =3D <&gpio2>;
> +		interrupts =3D <4 IRQ_TYPE_LEVEL_LOW>;
> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260914-for-upstre=
am-nbxv3-dts-v7-0-373a142b08d5@free.fr?part=3D3
