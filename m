Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CA312EB5CD
	for <imx@lists.linux.dev>; Mon,  9 Feb 2026 17:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770656872; cv=none; b=l4FjVejnD6XTRgebYnv3vTMB56TF6sla9RH4yJWqQn59Kl3RL2gWYHSSjezWZmPqYSrNGq1N6W5s62ic6xYNiXFgz20dVuimX4vAx0eBvhGExi5Eq9GT4FOmnuIGorlkibmyEDmm4RXFth9OVrgS2mkQWRfPyOa4E59/LN5wr1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770656872; c=relaxed/simple;
	bh=0nNpkFJON7kBw1dD4CyfKOcoZ2lLIMZEDZx9r4/Xr+M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=goOLIkrZyE1EwGnZLFXMbjqGAKu1RJFQgADHJ2rkryLCCedH4/A3lihIoNNkYe+lHEHWUrOcQf6vlQBdTcQelbko8IpOtFIGq260AnKH4u+6tYWW1PQduX06nujv4oJw+j3X1BuTR6CcW8Th1kxGnkx5QibEcDV5TbbKCTQSlJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Z+6wmsaX; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Z+6wmsaX"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 26B5B10DE1B;
	Mon,  9 Feb 2026 18:07:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1770656863; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=XauIuDFellsiYlY7XWlolM5IHJifLVytCti9detJRC8=;
	b=Z+6wmsaX4cctLjCUWcBKqic934tnDNnma6VM6I7BCvMR/ajpSkh3mgsMBucpMP0nF9Gqqh
	0p4ldLhPXtkCVzinvoCsoG1b8F108QEJ/hWqRfGScd0qd1N2FF7dGLjREg3/OUbz2RXsLP
	NAbhj+wxT2bvTXGJkdEgleJryvt09dhGyNfaB6+6sjqeaBynNMdPimS5px5Xgzk5MAt5px
	jw1QF3EjavUyo7UzO8h+YRQNidYBgJjqjUVcwvFc6TQBWv5X0BmX3beHXJkH0yLNwXsid2
	H0ZcsW5ayThcsbj/ege58ZMv9bozsVkQWUWy8CW8gfFduxi+4Nzko8HZoEZzNg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx6ull-dhcor: Handle both 1DX and 1YN WiFi on i.MX6ULL DHCOR
Date: Mon,  9 Feb 2026 18:07:04 +0100
Message-ID: <20260209170739.22379-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The muRata 1DX WiFi/BT chip is mounted on the DHCOM i.MX6ULL. This chip
has been discontinued and replaced by the muRata 1YN chip. The new chip
is a drop-in replacement of the old chip. To support both chips for the
i.MX6ULL DHCOR, drop the more specific compatible string and let the
driver auto-detect the chip type. Currently, there are no known quirks
that would apply only to one or the other chip.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
index 75486e1b0c15f..a0adcd3fe1229 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-som.dtsi
@@ -201,7 +201,7 @@ &uart2 {
 	 * the speed can be increased accordingly.
 	 */
 	bluetooth: bluetooth {
-		compatible = "brcm,bcm43430a1-bt"; /* muRata 1DX */
+		compatible = "brcm,bcm4329-bt"; /* muRata 1DX or 1YN */
 		max-speed = <3000000>;
 		vbat-supply = <&vcc_3v3>;
 		vddio-supply = <&vcc_3v3>;
@@ -222,7 +222,7 @@ &usdhc1 {
 	status = "okay";
 
 	brcmf: wifi@1 {
-		compatible = "brcm,bcm43430a1-fmac", "brcm,bcm4329-fmac"; /* muRata 1DX */
+		compatible = "brcm,bcm4329-fmac"; /* muRata 1DX or 1YN */
 		reg = <1>;
 	};
 };
-- 
2.51.0

