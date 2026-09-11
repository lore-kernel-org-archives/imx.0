Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F88341A57C;
	Fri, 11 Sep 2026 07:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789110403; cv=none; b=gQOU45UFiYxZ1j0iNYjgAgpd81mXaQusBP82EUVdnU8EuGRbFmfgzwoVCszmaC5UynUQiBz2beHHMq+ipXRlR5TW47gqk2aXo/ndDhJHgP9jB4IkE0tcGVSjo1jY9FcvAc46mGqNC0V2BBWuOjP71j7X3rkmeDkDq5wX04Y0YwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789110403; c=relaxed/simple;
	bh=63BNlMrAopZoRaJFpwWeRxReF1PPhtyCp1gjfvC+aL4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=IQ+grJWI9FqtUx3ZVoBKbxnzPf/uYwtlibXRrlaJB5cZqUgH2iaXXYPezJejiCdeKKCq4q8JA36S8X32UoJCKDinJLX5+a5DkqOnP3bbgbqsJ1kMBrmdRBAHcSdFtRSwQJczZ4f+VW4eDD/itHLRmqC2vqxtwNqibaw2K8ktEPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kHa89nWE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kHa89nWE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CD771F000FF;
	Fri, 11 Sep 2026 07:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789110388;
	bh=p4SjBmA6memojF+caErUQM70NDLjfNRw8C1EEAZ1YpM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kHa89nWElLvFjCVT8Jq1dGGKtHban6b1IgeG5cmr70sum/MhRRdsZsHJbZW13MmvX
	 aA/HaOzo9tiEKy7mfEyYEwJGCHuR5WM7cY5rImidxyVeu8xy1wuDR2nKwQUL1d7C9+
	 ubRYGq2V8OHt+tz7ioueeLm9l8WvEP0+ajcoRiosJ++FobY3XArYSEL4bgyv178hz3
	 DI8OKrzfcIgHBViWMujwHzWz+auDeXxe+Kk+M3SEXugsgsWLXb7pRBcic8CXXnn/ct
	 Ga0pdaGr1Cdg4ndOhrIlNnpUKw1JLAYPvKmJrXUztL3Hs2fQhR1QpF/sr0ejc7aoeK
	 WfP3QRGpfwj0w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260911-for-upstream-nbxv3-dts-v4-3-2fd07d5575ab@free.fr>
References: <20260911-for-upstream-nbxv3-dts-v4-0-2fd07d5575ab@free.fr>
 <20260911-for-upstream-nbxv3-dts-v4-3-2fd07d5575ab@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 11 Sep 2026 07:06:27 +0000
Message-Id: <20260911070628.6CD771F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Ethernet PHY reset and interrupt lines are defined in GPIO contr=
ollers but not consumed by the PHY nodes.
--

commit 74f5aff92f5e16bafbb9e87c062e7805112769f9
Author: Vincent Jardin <vjardin@free.fr>

arm64: dts: freescale: add Nodebox v3 CPU Module

This commit adds the device tree for the Free Mobile Nodebox v3 CPU module
built around the NXP LX2160A SoC.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/=
arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> new file mode 100644
> index 0000000000000..143b24d69d629
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
> +
> +	rtl8211fd: ethernet-phy@6 {
> +		compatible =3D "ethernet-phy-id001c.c916";
> +		reg =3D <6>;
> +	};
> +};

[Severity: Medium]
Should these PHY nodes consume the reset and interrupt GPIOs defined elsewh=
ere
in this device tree?

The lines "lan8023-mdint", "lan8023-rst", and "u1300-rtl8211fd-int#" are
explicitly defined in other GPIO controllers in this file. Without the
reset-gpios and interrupts properties in the PHY nodes, the PHY framework
cannot reset the hardware during probe (which can lead to initialization
failures if the PHY is left in an unknown state by the bootloader) and
silently falls back to polling mode for link state changes.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260911-for-upstre=
am-nbxv3-dts-v4-0-2fd07d5575ab@free.fr?part=3D3
