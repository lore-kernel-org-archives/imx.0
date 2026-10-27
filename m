Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=188.68.39.254
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793099898;
	b=S6rALOkIIUUHlPFF9ODsYUDmqaIsz7RRI3IGNTh3yvhHvk2NzfxMmjk9Jl83VDriGRfk
	 gEV5k2jYkGchckKINxRlLYkVdqtcr8HxSkQEYJhTzQvuj9IDKAmuYjhuib8PFm/nRKOH4
	 p6wMCePBiD5KJVVqarHZLeI8LORTSSiC+R9KONqGDgzrjgCYUd1q+48zYLR1+oBT1qRhV
	 UXoO0Jg804mV+stTpU2+YfbsTe8l+FQPFO0UEXIMxVGPnBYKNDXujQXfX88zikNSYUvKS
	 dhtiH0rkCyK5oZ6pcy+5STDpyiq1WZ1HRRaiaSXeUMRqg63PDo/IZZl4HA9gQXYAe0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793099898;
	h=DMARC-Filter:DKIM-Signature:From:To:CC:Subject:Date:Message-ID:
	 X-klartext:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type;
	bh=Vfd5Zd+m6HNfCiZ4UDrZ6b24cU1Wbos2NPOmkyVZCys=;
	b=uk0zTZ6LTpp9Re3qBlaeaW1AY7n9fN/XN6Q9xLmhcEi3yewFL6feIfq7CE/k+6RJSuuy
	 hXgQu1h7n8c1n4If7HgyPsydUPClFiYKxsneSaXG61IiYJrPErPHLkzOAbO8y08fuyHq0
	 mcVDxoVciJ3gneOaSCiXdSJysViwMzJ+iuKtLqAaYfVFkHf6uS40/UJSGpV4c7gJZXUHt
	 xgtweJvBgezGuqqIZ+UdX5IHiI1tL/LN6HrKVdaj99X1y6sjrf/OSBNz7HOI8poJeoY7I
	 j271UxXIQ1HO/ku2qofqdxkZL8U/Pt3WRLHgF/cotyvyAEo+jbVCzqkGvTCvH/F/0qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=dh-electronics.com;
	spf=pass smtp.mailfrom=dh-electronics.com;
	dkim=pass header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=W4XXs8+B;
	arc=none smtp.remote-ip=188.68.39.254
Received: from mx2.securetransport.de (mx2.securetransport.de [188.68.39.254])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A108606A31A
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 11:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A108606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dh-electronics.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=dh-electronics.com header.i=@dh-electronics.com header.a=rsa-sha256 header.s=dhelectronicscom header.b=W4XXs8+B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dh-electronics.com;
	s=dhelectronicscom; t=1793099857;
	bh=Vfd5Zd+m6HNfCiZ4UDrZ6b24cU1Wbos2NPOmkyVZCys=;
	h=From:To:CC:Subject:Date:In-Reply-To:References:From;
	b=W4XXs8+BGcoaj6tHtxuj3wTH/EFcsnI6WENGz5on3tcr0FdkJErdfh8oiI5lTDQDr
	 MifUHCrXsJ/DLIVjHClXiMQ0uGaBH9qJ8r+UNqGqiWYh80b4eMe+9QVqTqin7M0eSG
	 z1TE/FBGQK4f3P+l3CYWp+WxiQOww0zYEUta0DMvKJ9xSokpCyuRQx1rTi8FnUNf2m
	 siTRx0CicILpVAjTByYDe9nRblZxc/qDwAW6jksVV5Loc7x+/yJ18+DhtT3X+9VmG7
	 nMrAoeOjMGEfIFd53zQQ4YVNP3LwmCeP7WgJieh8t/Yg5SLcisncyFjjHdDPDN4kZ0
	 bvi0iP79I07eQ==
From: Christoph Niedermaier <cniedermaier@dh-electronics.com>
To: <linux-arm-kernel@lists.infradead.org>
CC: Christoph Niedermaier <cniedermaier@dh-electronics.com>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
	<devicetree@vger.kernel.org>, <imx@lists.linux.dev>,
	<kernel@dh-electronics.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 2/2] ARM: dts: imx6ull-dhcor-maveo-box: Correct PCB number
Date: Tue, 27 Oct 2026 12:12:01 +0100
Message-ID: <20261027111201.20936-2-cniedermaier@dh-electronics.com>
X-klartext: yes
In-Reply-To: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
References: <20261027111201.20936-1-cniedermaier@dh-electronics.com>
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

The PCB number of the maveo box isn't 525. Change the
number to the correct number, 625.

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
V2: - No changes
---
 arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
index 0b48de79c595..0f900e58d8a4 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6ull-dhcor-maveo-box.dts
@@ -6,7 +6,7 @@
  * DHCOM iMX6ULL variant:
  * DHCR-iMX6ULL-C080-R051-SPI-WBT-I-01LG
  * DHCOR PCB number: 578-200 or newer
- * maveo box PCB number: 525-200 or newer
+ * maveo box PCB number: 625-200 or newer
  */
 
 /dts-v1/;
-- 
2.30.2

