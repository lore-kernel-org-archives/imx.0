Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506A071B3D
	for <imx@lists.linux.dev>; Tue, 21 May 2024 10:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716287113; cv=none; b=KF8Bb7ucg/PlktvmuFXstyh3Dqh7k+Ruy99dqVrqJPcY6jRVPUITO+YOCsqoNfMw+Ag/KK7nyPAe62MUOsG8wnEToGsEfyPUWXtjEou8C3JwUTC/u+IdXxOXEOX/zuCfGOtxcTzRii2fjqIv42TaoiWAvSTBwJeIgXrZK6eBqsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716287113; c=relaxed/simple;
	bh=ar5nHA4ikFzxKS1TgAhH+XRs+dOFWLJW9KjHXYwvMQ4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tKC+Zl6fFhReXMdy1D+hJsah4/8egn3qVahLG/QC7lNWYx6iO2X2L/5BYUvnbyM9WyOWHR4z/jpf8mPr4+UdK1oZArW70E6T6gsz5rV9TF3UTnCmYMl71e4LwS2U1g4GPFVPLxNoDyUXf7rI+DqIxxB93hlaUy+d0YC4lP1xvOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=oacA+/V9; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="oacA+/V9"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id F26C0880A8;
	Tue, 21 May 2024 12:25:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1716287104;
	bh=kQf1XrDc22DQ1tD3jV9qG10PJK2Jzh9S4KgcrmgoAEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oacA+/V9xUWZRxZ7Ro63VoqZvzcgX9Nl4xk/6XdpPtkYAxl1ANZujL2BGXM4vGj07
	 dsadQSZ9/4qDTw32Lz7zQ7CjBfYofG455gDES0y/6D6aewG12ZaFefrG35Wxwx6vuH
	 AvG5nyUtK2Uc64CbW6NoknoOKFI40h9GbOWlOTZLc8DMcV84pbedbrZ3FVaCZ5veDl
	 SQ8svQEXXfQCuHEhoZxOdJhj8GkqyvjIhnXDkrT1wKOEgZ+7pEhzpGJhHPZiRwIrzE
	 HiWkgHVRz8wfJthxAS4ukRBrWmXaw9L5mZFhuhYBOmFMxn5mmVjOOO7nF2581X+MzT
	 Ja45UksV1rEhg==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 2/3] arm64: dts: imx8mm: Avoid iMX8MM errata ERR050080 on i.MX8MM Menlo board
Date: Tue, 21 May 2024 12:23:12 +0200
Message-ID: <20240521102435.10019-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240521102435.10019-1-marex@denx.de>
References: <20240521102435.10019-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

i.MX8MM Mask Set Errata for Mask 0N87W, Rev. 1, 09/2021 document has the
following errata, which could affect the beeper and the LEDs. The beeper
has external pull down and it is likely gonna be off most of the time, so
disable pull resistors altogether. The LEDs do not have any external pull
resistors, so enable internal pull down, as they are also likely gonna be
off most of the time. The rest of the IO is not affected by the errata,
as it is not being driven against the pull resistor for the majority of
uptime.

"
ERR050080:
IO: Degradation of internal IO pullup/pulldown current capability for
    IO's continuously driven in a 3.3V operating mode
Description:
    There is a degradation of the internal IO pullup/pulldown capability
    when the IO pads are continuously driven in the opposite logic level,
    for example, when internal pullup is enabled with external logic
    driving the pin low, and a 3.3V operating condition which limits
    the pads pullup/pulldown ability.

    All IO pin groups are impacted except for XTAL, DDR, PCI, USB, and
    MIPI PHY IO’s.
Workaround:
    Where the IO’s are used for 3.3V operation and the circuit requires
    pullup or pulldown, use external resistors for the pullup/pulldown
    and disable the internal pullup/pulldown via software.
"

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts b/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
index 4c38979f7333f..ed83a019159ac 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-mx8menlo.dts
@@ -210,7 +210,7 @@ &iomuxc {
 
 	pinctrl_beeper: beepergrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3			0x1c4
+			MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3			0x4
 		>;
 	};
 
@@ -225,8 +225,8 @@ MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9		0x1c4
 
 	pinctrl_led: ledgrp {
 		fsl,pins = <
-			MX8MM_IOMUXC_SAI1_TXD6_GPIO4_IO18		0x1c4
-			MX8MM_IOMUXC_SAI1_TXFS_GPIO4_IO10		0x1c4
+			MX8MM_IOMUXC_SAI1_TXD6_GPIO4_IO18		0x184
+			MX8MM_IOMUXC_SAI1_TXFS_GPIO4_IO10		0x184
 		>;
 	};
 
-- 
2.43.0

