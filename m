Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8476C1A6827;
	Wed, 13 May 2026 00:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778632017; cv=none; b=nmVkxk/acQIwZHNEeEmXTEKjBNRmHoDHr5SHfnNwGb0shtJZrdw8uuOAuR5sD9yFg1/2WRgx+FdYNFwjcKSalTOpyKo4TWxIZuZoMc4Zlvoj/REXvojY7wB+ucg0DIInYSlcv32+un6QuU9ZZk/ibJEwaRtJhehkXIqy3YROOMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778632017; c=relaxed/simple;
	bh=Iu79rO8oVCg4E5Sg718+9d7YG+zg8RQw/kF+BEA1ADo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=pEOD2hDT4UfxEh7gdvCrhEgyaYf5SRrKRaxdD23OIMWQcfkNOjEmXnq5vxefVVB0ta5No/0zSgaHjqARUN1Dkx6sjgJkdWds3e8wtt4VRrMwOnJ1mNjeWJ6Hl8bx1oCXqSzuotTeaF/l0SoWAn2e1Z2j4YjCyGgXIz6rEksV7OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JDXMlMAr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JDXMlMAr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8D20C2BCB0;
	Wed, 13 May 2026 00:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778632017;
	bh=Iu79rO8oVCg4E5Sg718+9d7YG+zg8RQw/kF+BEA1ADo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=JDXMlMArvfPAWRhKTYf8qts0ef98MCrPe7Qxbn4rKSpS55/fSXsuzdgP3JJaZ7gjF
	 8tcv1AOKKGhmgZQeIay4yRod/0PNYlBh6QzRJUOS2/zb+AnODMIqn41H2iguPacwz7
	 zXyIF8FKo1gEMwpZRPFL46o8yYSTC7UDXH4eyim0EEFYectJE0JpCUj8dBpA01l5AD
	 siISB0SXEpUMP+/Bjm2gbNwjh51K7pU+zUjYomEHfAjK8D7nTXIqATbjrk8n3QZxNV
	 1vjtVxaJ2KhiZ26TcA1bvZLBMSI6BJSjstoLBu/FujKuMWACIap1a4N+6cAf3XqmNl
	 1hAhuEFjU9WMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: imx6qdl-sabrelite: add mdio phy address 0
Reply-To: sashiko-reviews@lists.linux.dev
To: "Frank Li" <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
References: <20260511-b4-imx25_dts_simple_warning-v1-1-01b855a5ce25@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 13 May 2026 00:26:56 +0000
Message-Id: <20260513002656.C8D20C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Setting the Ethernet PHY `reg` property to the MDIO broadcast addr=
ess (0) instead of the actual hardware-strapped address breaks Ethernet ini=
tialization on the SABRE Lite board.
--

commit fbbd7813db5860f802e25f49f30fa7e2a33c20e6
Author: Frank Li <Frank.Li@nxp.com>
ARM: dts: imx6qdl-sabrelite: add mdio phy address 0

This commit explicitly sets the Ethernet PHY reg property to 0 to resolve
device tree schema validation warnings. It relies on the IEEE 802.3
specification indicating that a PHY should respond to the broadcast
address 0.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi b/arch/arm/=
boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-sabrelite.dtsi
> @@ -291,8 +291,9 @@ mdio {
>  		#address-cells =3D <1>;
>  		#size-cells =3D <0>;
> =20
> -		ethphy: ethernet-phy {
> +		ethphy: ethernet-phy@0 {
>  			compatible =3D "ethernet-phy-ieee802.3-c22";
> +			reg =3D <0>;

Could this cause a regression in Ethernet functionality on the Sabre Lite
board?

The device tree should accurately describe the physical hardware topology,
but the Micrel KSZ9021 PHY on the Sabre Lite board is hardware-strapped to
address 6, not 0. Furthermore, the KSZ9021 datasheet indicates that it does
not support address 0 as a broadcast address.

Prior to this patch, the absence of a reg property caused
of_mdio_parse_addr() to return an error. This triggered an auto-probing
loop over all 32 addresses, which successfully found the PHY at address 6.

By explicitly defining reg =3D <0>, the kernel skips the auto-scanning
fallback and exclusively probes address 0. Because the PHY does not respond
to MDIO reads at address 0, get_phy_device() will read 0xFFFF and fail with
-ENODEV, preventing the PHY from registering.

Should this instead set the reg property to the actual hardware-strapped
address 6 to satisfy the schema without breaking initialization?

>  			txen-skew-ps =3D <0>;
>  			txc-skew-ps =3D <3000>;
>  			rxdv-skew-ps =3D <0>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511-b4-imx25_d=
ts_simple_warning-v1-0-01b855a5ce25@nxp.com?part=3D1
