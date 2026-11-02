Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.15.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793629630;
	b=4Nj9F5cJIpg+EZA830NiZf0Ntr6/4cLlEUaJiy33ckIdc87ydYyVqv8a5ysi/Kmzm2hN
	 MeMqjsAWDQzgEt1wRXH5jIsk87z6DR7o4Qi31RXGoUjr8NegKFjT20KxK/KnHWrWuY2PX
	 IhPYbQlY3xJS8vHDH8Je4yKH9qUQstYRsP5pvdPN8cxTjHhawyI31ZmuKwIwPPwA28pKu
	 jrjYsGAn+rHnHvnQ5KtCjuAjpUQPkH5HXupVabHnb1udf2QGrJjrWkxbssnt8dC0dw32h
	 VWCllaRDQ8K2bvii6THNWOIYOJEKE9BDoKUQ9BgXxGpfMdhkan6Ev3IaCwMxC9QExmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793629630;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=0suRggAIYL5I94mk1Ijkl7Jc2YHy69Q53aYi7eMdjlg=;
	b=JPnRKzj4gBwxxR3ATstG0bTVyxPXu5I6lmCvKwsB/hz0HfZdXVhYp/vpqcyTQm5rHj40
	 wHzEcNGvayAFturtp0J0bWLqSxDDp7XPqaKfOk9k7OUJ5mrtohWwPx75odMml5PRIS1CQ
	 ZyuRfXUBtWwGiN2wzpwmBqAIguedZ/5IALbQdh6lhpD8K51zbIU97EQtn71CvtZrTNAph
	 ABWJbrnSfkAcJv5YojHkatibBPq3E4KhF1zTDvqtZn7ZdeNAoJZiV76v6hGBh20POtUHf
	 HlHv72GlKY+bmJHNdIIgRG2WSCy8UwWLPOz74s01P7e5Efu7hDlXOGL2IOAafhmAVrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=VBHlfD7h;
	arc=none smtp.remote-ip=212.227.15.15
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041F9607A8B2
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 14:27:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 041F9607A8B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=VBHlfD7h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1793629617; x=1794234417; i=wahrenst@gmx.net;
	bh=0suRggAIYL5I94mk1Ijkl7Jc2YHy69Q53aYi7eMdjlg=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
	 MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=VBHlfD7hytZTNeecJ7XyS0PmwLtJPAQzqyZmYXFMmnb8HwSvnx1SWfqkKShyW9Al
	 i6gS+ROZY3PQfrybygM6j1UlQR1kSk8dFBwxVsf1eKqHIr3j6r1emedde08Mu/7Te
	 bOp5ZYVlBVrHUtvhq6wn2O3+dawgUhYZ1DgacfoI/Uh5fl8ghvAIrIK5bLLbHxBv3
	 taYV8XOM2bjRx7uFEqvPu6YikhB25Msehzx1fuz/HzVjKcuJ1Jh6VQ8S9qk9HylEY
	 J2rk4CVUu6154I+S9zWt5CDUWXolG4oyHV0TBTwUKFki5anRlPNwdIu1c+6kirJSq
	 slXHH2Apywu+b9XOAg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M3UZ6-1xOREJ27KU-00H2bv; Mon, 02
 Nov 2026 15:26:57 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V7 0/2] arm64: dts: freescale: Add chargebyte Charge Control Y
Date: Mon,  2 Nov 2026 15:26:47 +0100
Message-ID: <20261102142649.8566-1-wahrenst@gmx.net>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:lfYGhF4oVsM5D8nXaMJFc7gXiiXp2tGri8XayLNn0FyvLvJaNkq
 Sev61gpQUV03pMPjy5r6x9DVnzMA3lNcyvLWmuPOL5unxwlo32wh/A0aP1m8oLiDGcn/AVX
 SeFd1w1jaLHC9uLLVleuyiLobx7g2ksEHXzpaLUs21dKTtvQD2xkJJGLUa8B2UT3egNBhb7
 lEvULimOLnDxqO4lgBL7w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:raD3qKDt+R8=;FCTSb4y5GNhJlr7LwpfEWEyuvM+
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

Changes in V7:
- avoid delete-node for SOM LED (suggested by Frank Li)

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
 .../dts/freescale/imx93-charge-control-y.dts  | 437 ++++++++++++++++++
 .../boot/dts/freescale/imx93-phycore-som.dtsi |   4 +-
 4 files changed, 441 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-charge-control-y.d=
ts

=2D-=20
2.34.1

