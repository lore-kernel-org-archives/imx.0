Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE3193451D6
	for <imx@lists.linux.dev>; Fri,  9 Oct 2026 18:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569775; cv=none; b=RmC1FUjFLqIkUAaW1bQmfW5qEadypTKxWNqdqlZHMQwLP+/6WpjIyyrie2ORqnfLujqV4n8OijRLh0FU19w52tF7B2QD4OiI9zl+413kD/jpleYVMRF3MXeS0eYwU0H7+RcKlOt/Qx2hbc/5Ncahr1r5waB/uMO9hfJvUSh71dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569775; c=relaxed/simple;
	bh=N4+6l5R64I7mH2Se2Hy6bEfMUwCP8I7+RhAGgVmGF0U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gz3jnN9py+GA7me499KD+NxrAXYrXF9v1xacTZ2xdSx6feNBvFZt/Sl3JLhS7R8RoxcJZyFSoAi509bOmEeB1w0ZNTwlQJ1BvQ+32uQtrwUzan9+3vq+e2Xq9dG4K/vf2xxoN90dJLF3pbR+7KrZ0sIphsM3Ym5TVynj2ACsqg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=c73AyekH; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="c73AyekH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1791569755; x=1792174555; i=wahrenst@gmx.net;
	bh=DSl5opG1vGnvwklTn11CdgwFu8SczIEjmNSxqtCH0Uo=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=c73AyekHjMi4tJcJlpfCLNbYBXWCUPj1o5TWXlGTd2jthTIHk+9IKOw92eviktTZ
	 GrhuVx+NFVipZZXqoVIKU8lrtORdIN25kK6RcT2bc6Myv+EUpOeAxgyiNT/mEy4Uq
	 W6FvDNCMaFO+zn7r1+lnTf60MjVK7ex9XtwfFm/VzTqwKeSs/FpUG9OIvqeG5n5Xm
	 deI8PuA4KVaLgPQV09fBD+cmiJqjRNfOXmE8tUMJgeuvbwdzrmMQY7w1PgBq4KfRO
	 Se4kqKAzz0vl53UgFZq4k+oeEyXbnapTP8d+ycqQVFhGyWqEyzWgl4M3N2ZenJqiU
	 EsL+WC+VbIYqhdH59g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MStCe-1x5uey3xhm-00PsuA; Fri, 09
 Oct 2026 20:15:55 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V6 0/2] arm64: dts: freescale: Add chargebyte Charge Control Y
Date: Fri,  9 Oct 2026 20:15:49 +0200
Message-ID: <20261009181551.6478-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:esvhwAYVbbgDT+q6Gcu44Ck6nQXTLc185E1fA/yvZkjn4eoDzkT
 S/FWrc5VX40NONGbuo2xzB8v/Jqq314qTaZiym654imUmprsJun0tdfzbyXsPVo/x4UtN1+
 +PCFHC1eQ55AWCu4FCaGN5SV3y5hsgci1WWAavqvuf2GbocaUIpnkvw1xS2+6VC1oTxPsgK
 GbFmJQlUVAu0Rgg0d5vMg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LE4Jg8Xigbc=;pHvNNGxVGAcC49cJCDNe54sfHMI
 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

This series adds support for the chargebyte Charge Control Y, which is
an Electrical Vehicle Supply Equipment (EVSE) for MCS (Megawatt
Charging System) charging stations.

sashiko reported in the first version of the series [1] that X_nRST_LAN
is available via GPIO line names, but there is no reset mechanismn in the
device tree. This finding is valid. Since the reset line feature isn't
implemented for LAN8651 driver yet, I like to proceed with the current
version. The LAN8651 handles reset via SPI commands and in rare cases
we still have the possibility to control the reset from userspace.
Btw the pin has a pull resistor in hardware, so it's not floating.

sashiko complained in the fourth version of the series [2] about the
reset polarity of ethphy2 and the different drive strength across the
data lines. Both is intended.

[1] - https://lore.kernel.org/linux-devicetree/20260818093147.E556C1F000E9=
@smtp.kernel.org/
[2] - https://lore.kernel.org/linux-devicetree/20260903082122.A777C1F000E9=
@smtp.kernel.org/

Changes in V6:
- drop already applied binding patches
- rebase on next-20261002

Changes in V5:
- fix delete-node for pinctrl_leds (reported by sashiko)
- add Krzysztof's Reviewed-by

Changes in V4:
- prepend constrains fix for ti,tcan104x-can binding (reported by sashiko)

Changes in V3:
- add Acked-by's from Conor
- add missing SD2_VSELECT to default pinctrl of SD interface (reported by =
sashiko)
- clarify LAN8651 GPIO usage in device tree (suggested by Frank Li)
- move X_nRST_LAN into dedicated pinctrl group to make it more self-explai=
ning

Changes in V2:
- drop phy-can-transceiver changes and make MCP2542 compatible to TI TCAN1=
042
  as suggested by Marc Kleine-Budde & Frank Li
- implemented SD2_nRESET as vmmc supply for SD card interface
  (reported by sashiko)
- add UHS support for SD card interface
- dropped downstream property ti,leds-polarity (reported by sashiko)
- fix GPIO line name of X_LAN_nCS (reported by sashiko)
- drop unconnected pins (X_TDI, X_TMS_SWDIO, X_TDO) from GPIO line names=
=20

Stefan Wahren (2):
  dt-bindings: arm: fsl: Add chargebyte Charge Control Y
  arm64: dts: freescale: Add chargebyte Charge Control Y

 .../devicetree/bindings/arm/fsl.yaml          |   1 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../dts/freescale/imx93-charge-control-y.dts  | 438 ++++++++++++++++++
 .../boot/dts/freescale/imx93-phycore-som.dtsi |   2 +-
 4 files changed, 441 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-charge-control-y.d=
ts

=2D-=20
2.43.0

