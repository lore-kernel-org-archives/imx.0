Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFEE23921E9;
	Sun,  4 Oct 2026 14:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791123604; cv=none; b=UjO0qCwM4MU+DAPAZg8PB4IRQK7Q+CuGnvWQXPjnR2RrK3cBY8CrqXVdI20l3PlUUeItBHeQ3nXyGYWxeGAIrtu+/dmb+LVPKAU0QBbgaKmFdXFej2Da1NYHJCpULyvcfgxWH+okDSVpaxtOynt4XAzpdJMzPxVwilCWGAhzwAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791123604; c=relaxed/simple;
	bh=sw8Nm/1ZBUjCMBcV3vtsze3LPK/jLThAPKdelmF/AzI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oUugMakbUbc7XKl/jYTdhx5a2ee6pt7Y3BDUzq3MIhSREInPQRH7lrX9cJ41y/gCiJgQcTec5/cV5WciN1dmHBo/MzlhBG2dnGXOMJbLsGTKFc82WZ9rknl+aobZSfcbyI3C4jIRBR5D/AgrGKetjkqW57OX6SIIycrIkncjqB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+JpqJeq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+JpqJeq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B2F31F000FF;
	Sun,  4 Oct 2026 14:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791123602;
	bh=sw8Nm/1ZBUjCMBcV3vtsze3LPK/jLThAPKdelmF/AzI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T+JpqJeq/Cn4380qxOJE4VAPvA0bgwmfzFQX2T8RjRx4TFS1bXf/YWIs5zmOlg9i5
	 BbNczpzxUc1p4uXSZE3WUt/M9LZCnFawuqtonuI/s8nTm+mCG+J8rI1AVhQRkQWUP0
	 9dOKaf8/sUrerQM60RnIy9ruDCsIZB9PhMbyKiHh4RJLC913GjoKkWVOjsV6OPGisp
	 kPqgNu04ZU78Za1nRGwDN2+mGlp+Ct42Sw/yUAiymlZzPWNo2sw1aTthifIfAeNKES
	 C4ICdx/5eRcjsS49zAfFIpGQXoovkG0xvjPjdAdNxKmFZBQwpf88M8fyBdCwRvglUz
	 v3HMh/F498s+w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/5] ARM: dts: imx6ull-tarragon-common: Fix Ethernet PHY
 issues
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Wahren" <wahrenst@gmx.net>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261004140123.46461-3-wahrenst@gmx.net>
References: <20261004140123.46461-1-wahrenst@gmx.net>
 <20261004140123.46461-3-wahrenst@gmx.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 04 Oct 2026 14:20:01 +0000
Message-Id: <20261004142002.1B2F31F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] dts: Missing PHY ID in compatible string causes PHY probe failure
- [High] dts: PHY reset pinctrl applied too late due to PHY node placement
- [Medium] dts: PHY reset duration drastically reduced from 25ms to 500us
--

commit f2c57a8f69beb5f6e98a9a695928883c23235853
Author: Stefan Wahren <wahrenst@gmx.net>
ARM: dts: imx6ull-tarragon-common: Fix Ethernet PHY issues

This commit moves the SMSC LAN8710 Ethernet PHY reset handling to the
generic PHY reset properties on the Tarragon platform.

[Severity: High]
In arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi, the ethphy0
node at line 131 sets the compatible string to ethernet-phy-ieee802.3-c22.
Does this missing explicit PHY ID cause the MDIO core to fail device
creation?

When the MDIO bus is registered, fwnode_mdiobus_register_phy in
drivers/net/mdio/fwnode_mdio.c (around line 132) will try to parse the PHY
ID from the compatible string. If it fails, it falls back to
get_phy_device to read the ID directly from the MDIO bus. Since the PHY is
still held in hardware reset during this read, it will receive 0xffff and
return -ENODEV. The generic PHY reset logic runs after the PHY device is
created, creating a chicken-and-egg situation where the PHY is never
detected.

[Severity: High]
In arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi, moving the
pinctrl_enet1_phy_rst from the fec1 node (line 114) to the ethphy0 node
(line 130) appears to apply the pinctrl too late.

Could this cause the PHY reset GPIO pad to remain unconfigured during the
initial MDIO device registration reset sequence? The Linux driver core
applies pinctrl state just before the device probe binds. However, the
MDIO core initial hardware reset pulse happens before the PHY device is
added and bound to a driver. Since the i.MX pinctrl driver does not
implement gpio_request_enable, requesting the GPIO does not automatically
mux the pin in hardware, causing the reset pulse to be swallowed and
leading to initialization failures on cold boots.

[Severity: Medium]
In arch/arm/boot/dts/nxp/imx/imx6ull-tarragon-common.dtsi, the previous
phy-reset-duration on the fec1 node at line 118 was 25 milliseconds. The
new reset-assert-us and reset-deassert-us properties on the ethphy0 node
at line 137 are 500 microseconds.

Can this 50x reduction in reset duration violate the PHY hardware timing
requirements and cause intermittent link negotiation failures? It looks
like the units might have been confused between milliseconds and
microseconds when migrating these properties.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261004140123.4646=
1-1-wahrenst@gmx.net?part=3D2
