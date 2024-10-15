Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26AA41B0F0E
	for <imx@lists.linux.dev>; Tue, 15 Oct 2024 22:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729032290; cv=none; b=dUdcbbQDPSdQqh0jNBdwy+6sZNax9LI9kKPT2TCzHsx0fcaNim6U24Mc82caKo/LaETFgqsGjw6bs3XDE15J1Vvrat9/tCGntxjUw0hSit0YYC5r1gquidEWhtRuDnzRiBosT169UHHf4gWgaBxFIPbNpaxiXPrwFvO+thaEg2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729032290; c=relaxed/simple;
	bh=zwBsvOnl9TxZV7ONcmKarlYbywqteu42+m78Za3/qd8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ivwurJ9Y4plAI1lySwXEu8qjukdvzJx1aKC4//Zn9LpN1hmwSgZzQ55ecmH68SXTGCp5X+wd5FiTSUljeLBSdkhU97Q5AEPAPpwkgOiPwIPEcXkkylzgJvzPF8hZDt6VFlnZYR94OB66P5rLQWft7jVJzJ9eBE/OYBzHd/rJMIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=GXxLURb0; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="GXxLURb0"
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 228E187D1A;
	Wed, 16 Oct 2024 00:44:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729032287;
	bh=pXAQtoDM6FVV9vWsnh6V0QV6tZN7yS0DEA+DZgj3ldc=;
	h=From:To:Cc:Subject:Date:From;
	b=GXxLURb0yqIwcBGA8Yu0BiwmVeGNkrp5FP9KH1ETkBULRwFyQb+INLdytxJAbz7YI
	 nzxQYrSmfNpHSLWZKn55Igz4fxv5JF5WZJFCE2RQ5qWIjIV8B6B+5qf2Yib8Oaejx/
	 h9APcc+gdRvhIKKeGHAV0r5cnVsxuphUwE54lWVuCc4FzAwx2Vc3VUIrXNCHlCADc2
	 JVnvWYwqz1OoNJs/mq7aRhhAB740dECezzoPRr6cxvwdb0ET4wDZobC6pZrUTrXFXi
	 wuVyUvE5BZGHgx09EJLfFWpELkrvAKXLUHgb+zfhGG3qIjthdK7dHPsiX1un1M8uHu
	 L3IzUU3yF+izA==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
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
	kernel@dh-electronics.com
Subject: [PATCH] ARM: dts: imx6qdl-dhcom-som: Drop bogus regulator-suspend-mem-microvolt
Date: Wed, 16 Oct 2024 00:44:10 +0200
Message-ID: <20241015224436.94334-1-marex@denx.de>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

Drop unused regulator-suspend-mem-microvolt property from PMIC regulator nodes.
This property is not used by either U-Boot, Linux, nor is it documented in the
DT bindings, remove it.

Signed-off-by: Marek Vasut <marex@denx.de>
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
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
index eaa87b3331648..af0d95396cd51 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
@@ -256,7 +256,6 @@ sw1_reg: sw1 {
 				regulator-max-microvolt = <1527272>;
 				regulator-min-microvolt = <787500>;
 				regulator-ramp-delay = <7000>;
-				regulator-suspend-mem-microvolt = <1040000>;
 			};
 
 			sw2_reg: sw2 {
@@ -275,7 +274,6 @@ sw3_reg: sw3 {
 				regulator-max-microvolt = <1527272>;
 				regulator-min-microvolt = <787500>;
 				regulator-ramp-delay = <7000>;
-				regulator-suspend-mem-microvolt = <980000>;
 			};
 
 			sw4_reg: sw4 {
-- 
2.45.2

