Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC22139E
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 00:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712190024; cv=none; b=aGrKfEiFmw6HAPPU3eiotJnwcuXTYe8fnOH8I9UlGGYqdrgBbd0HuHN8F9+PiG8gcqHdUs9oqPsFnj8XcFZi6FQqnLVPh5To2qj0cEVuX7n3Ng6VYNRFm1JbU1dBISt8MMRAVbjX3J9K9ActiHFVB8/ImyfcCOu/pS0NLIwzy00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712190024; c=relaxed/simple;
	bh=UKsWN2uz9h3bn7/ge9MZHCvsdhP/ReXNUWuB2NQX+6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BzIwurd8rPT2Q15UoQRhEvaBqLaYZADkv+Fg4PYjg42tFsN+z2tqtIIWxnvFRNHw6rFWIcp7AHw0yzB/ekbyKER4+vLvgvs9vvJO5STuDxQE2+AfuptGCCwakO6TabBrICSXIwIwMWqdQBJs2B2qc1TkCpTICWGyoW//o+aIip8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=gfnYfENW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="gfnYfENW"
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A86E13A3;
	Thu,  4 Apr 2024 02:19:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1712189982;
	bh=UKsWN2uz9h3bn7/ge9MZHCvsdhP/ReXNUWuB2NQX+6A=;
	h=From:To:Cc:Subject:Date:From;
	b=gfnYfENWAR7J/fbxS6cTzH+MCI/XcGgmubOexT9qBdaHVMzUGna4g/5CIO4vja6/E
	 lJQkzVNfx166v1Tep/wdZkXUkDR44SIUPnaLiLKcYjOQWZvdg8OdNEs438xSsY9524
	 X9a7LxbwGN8nRT/SnT1y8s8LJiKvyVeCMxQBd/w4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Jacopo Mondi <jacopo@jmondi.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Fabio Estevam <festevam@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Shawn Guo <shawnguo@kernel.org>
Subject: [PATCH v2] arm64: dts: debix-a: Disable i2c2 in base .dts
Date: Thu,  4 Apr 2024 03:20:09 +0300
Message-ID: <20240404002009.10052-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jacopo Mondi <jacopo@jmondi.org>

The I2C2 bus is used for the CSI and DSI connectors only, no devices are
connected to it on neither the Debix Model A nor its IO board. Disable
the bus in the board's .dts and remove its clock frequency settings, as
the value depends solely on the devices conncted to the CSI and DSI
connectors. Display panel or camera sensor overlays will configure and
enable the bus when necessary.

Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
---
Changes since v1:

- Don't drop the bus, just disable it
---
 arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
index 2c19766ebf09..9b8f97a84e61 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-model-a.dts
@@ -197,10 +197,8 @@ ldo5: LDO5 {
 };
 
 &i2c2 {
-	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_i2c2>;
-	status = "okay";
 };
 
 &i2c3 {

base-commit: 4cece764965020c22cff7665b18a012006359095
-- 
Regards,

Laurent Pinchart

