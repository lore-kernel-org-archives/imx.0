Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=116.203.31.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792590334;
	b=xOHUMlitt3dmTYQTjLnnvJjxSel0Y28jzJzMGycESRf40oNqcCBRHFOyCEqUCBo0CVN0
	 1JXcrm31v9nhFMrDSi/4mLjIxj0S5U/JDZqjoQiLu612wj32EkgsV09BljrvgR9XqLeuH
	 ICn6kWZa5DsPDgvtdGwAMhcC2xn5UEoIsUWGRXcMV6dFdcWv2UQvYTm3HfrVE+bW5TRwl
	 j/sAXk5Y+JrwNE4zUT2OHNRuRiE2eikYhII+nibVczDxkNgqryFWTJ3XYrJk40PsER78e
	 +NKi3JHuI52Y4j/L9qjc8bXSXTwALzwXPX7b/JPQVsNqNpjOExSK/x6s3sXTJgz1RwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792590334;
	h=DMARC-Filter:DKIM-Signature:From:To:CC:Subject:Date:Message-ID:
	 X-klartext:MIME-Version:Content-Transfer-Encoding:Content-Type;
	bh=GwYxX1wk58u2mRJeMPK0eBJeUORqabGvuAvjULQKsPI=;
	b=kgLTilpCOEnnSlRONpKpmq4kHjJ6WATOxcZkkvBvt4A2HBEWcL9RfQZo0DKObeEWHdCN
	 W0joSHOu1iFcjCtNlK54d1DWvnSrRpzwVnP+kQffsF0dsxh8KLoquTQZXEAEdl7OQTg10
	 ZcfLk8h0cwXK1aiMC3jSXhfV5WApQXYDcMhHXgUsDi+c/jnbNyl878Lw3BYwUeckR+s/9
	 WNozK40gZaeOLEyD6VSjVJxepnwV1zAagE34/HA7mtge9D1xAh6UzNZJeAp6VGkbXMfSN
	 +JJ+DPzbp9P8d3CWeahAguwHRaXVtDwxnEqmJneMpbhlVi77nqyL3/fzoOlmsYP+VhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=GPql0afa;
	arc=none smtp.remote-ip=116.203.31.6
Received: from mx3.securetransport.de (mx3.securetransport.de [116.203.31.6])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A133606A31A
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 13:45:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A133606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=GPql0afa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1792590294;
	bh=GwYxX1wk58u2mRJeMPK0eBJeUORqabGvuAvjULQKsPI=;
	h=From:To:CC:Subject:Date:From;
	b=GPql0afaXz3KvtX0jWuuLVZm9xr+e42VbE+OOBRuTufjjkrn/ECrHgaXzhWEUZHhe
	 hDhkpnf5uK0mccZ1mJzjWmI8HjHtn10YcefBLxHdYqScM09PqFRiGdNr91xQR3pnx9
	 3YE3U3SsMX89Rt35CSXu6u+FnpWyU4hE1mf/BBliiRUahmuiiiYp42CfNkYofXFQXM
	 62c924b+NzmvmBr7cYanchI4aPKbo1xoRPUDiRCAaF/dfb/m/d5dMCRQ01E4R495I5
	 fW5bcpEhbRYHNH9ipZLWhNuml6g4QUk0YfKqfM9U4v2lrxVsiM//CuUthXh3mUtaVu
	 /9g0TttgrpLPw==
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<kernel@dh-electronics.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ARM: dts: imx6ull-dhcor-maveo-box: Remove unused SPI device
Date: Wed, 21 Oct 2026 15:44:34 +0200
Message-ID: <20261021134435.17350-1-cniedermaier@dh-electronics.com>
X-klartext: yes
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

On the maveo box, the SPI pins are connected to connector X10,
but no device is connected. The device "dhcom-board" was used
only to test the hardware, but was not removed afterward. So
remove this device to accurately represent the current hardware
configuration here.

Fixes: 145e2732a5e9 ("ARM: dts: imx6ull-dhcor: Add Marantec maveo box")
Signed-off-by: Christoph Niedermaier <cniedermaier@dh-electronics.com>
---
Cc: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Marek Vasut <marex@nabladev.com>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
index 047f7b2d8526..eb0b91040110 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
@@ -60,14 +60,6 @@ &ecspi4 {
 	pinctrl-0 = <&pinctrl_ecspi4>;
 	pinctrl-names = "default";
 	status = "okay";
-
-	spidev@0 {
-		compatible = "dh,dhcom-board";
-		reg = <0>;
-		spi-cpha;
-		spi-cpol;
-		spi-max-frequency = <54000000>;
-	};
 };
 
 &gpio1 {
-- 
2.30.2

