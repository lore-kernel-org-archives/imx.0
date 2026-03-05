Received: from mx-relay12-hz2.antispameurope.com (mx-relay12-hz2.antispameurope.com [83.246.65.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0E3C3845C8
	for <imx@lists.linux.dev>; Thu,  5 Mar 2026 11:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772709127; cv=pass; b=cJsLeS+waGdUt7CVb3dqyDtC2oIohGkCixm1NMg6KlYFuaXtL8rez/WPgP+oEkiZ0trzqgaOdxuH8q/EkNag402eftDqE+vITF5m2lK3Q02uyQAiaqe5vlc+p/tUb82zZCFA/rb8GyBXX8RiWMdImYhzU3d/zYF4uSfJUyUmwRg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772709127; c=relaxed/simple;
	bh=dXspexM/PX2F8ART0tJsJpHJJRGQMWvcc478lZ7RmKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=prDeLNum15RUEy+z22w6QjrdBXkw9oGZm5avQDlc0B8jAzcfrJkPNzAYE9CPwzOI6hMrXkC4MO3w6o/9R4wU1WnApHLCxUI3WjLiHzomFFGBsUXPHf9Mys/W8YaKDYV3cE25zsETDAx+fXA86PQ8nVC6xHisxhB2VLWDHiLsygc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Q2T9JLcF; arc=pass smtp.client-ip=83.246.65.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Q2T9JLcF"
ARC-Authentication-Results: i=1; mx-gate12-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=PVhuX+l+sVjGT+ko5BL1Nb+mbnU6aEmFddU/rnrJ3m0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772709050;
 b=iuO9SzdGZBOzHe+fQydHcShSoLvKYUALlX9w1k/mm1GvHPBXdYJRClBr+8z9tZ7vsun+Tssg
 NdI0B+Z9GcdAhtvSJ6amK80EkBBLvcEENXZULJk4sB+JUQmBK+IaZaN8ZhErTAmKQ9zJ1crypYv
 v5xxcQKJP/Tl5ZcApHnWDbM4MTUvPt6CH4l3BIP9Z0WLg71asYl+UXTFugGETqyx/3jz61dz7b3
 12uF+0xATQ152/LLoQde9gIWBcCaFgMiq7BUo7OKMDNePUpKQgF4yklxs4CSta2K/O5+09nQk+a
 BNHnIZjP9CIbRRddpsuo0+964a+Ds9NIVrc1/UiB9jpXw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772709050;
 b=GzJVRbhXkZdReuGimv7iJpXrTJvQNdXNhuZtPrTLnK9JUT4cb4TChoNH9+m3YQee/Db7+Zdo
 dkrOty3xRfKSy8TKwn/v2dlHeeMgGeKjdFLMy3v/ysRv+/eBpldOtjlDE6vrbL6+xQaNA7DPEje
 /yM5D0K4oY384EFfuUDmazoRw+jRMSOHrCTLSkw0ZaNPonunIYAPafZhaIrFPerAwgwxwivxoS6
 DMY0hGFz5eTlpoC3LR4ax5uPX1JuqF1EqsEros7JT3c/345qaCpPZsQsRBFWA7HXqrSxf0JfXPY
 aB/32+3zJk2l/PXnynhqiKOybExs3MlnNh8KxUgaVlKOQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay12-hz2.antispameurope.com;
 Thu, 05 Mar 2026 12:10:50 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 5053DA4079E;
	Thu,  5 Mar 2026 12:10:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] arm64: dts: tqma9352-mba93xx*: Fix Ethernet PHY IRQ support
Date: Thu,  5 Mar 2026 12:10:36 +0100
Message-ID: <20260305111040.1899965-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay12-hz2.antispameurope.com with 4fRRfW0jJDz3B9xY
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:1285649cdad526a2a0167bc5483f14a0
X-cloud-security:scantime:1.458
DKIM-Signature: a=rsa-sha256;
 bh=PVhuX+l+sVjGT+ko5BL1Nb+mbnU6aEmFddU/rnrJ3m0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772709050; v=1;
 b=Q2T9JLcFqIvgtBPRDaivXcdlP0sdjARfgKWdpXgNLZGyO7AuGy+KAWpLsMAiviPk3n68zD7j
 5Wow87xKfk8VF1uHWorgYB49ePgQRfeclGSnMZmowRzc9EAajfHPfRAvfWe+tNfC93t2yd6+XmV
 FYIOb9RNIAgjx8A5bKow4+mjzO/8gzm2IHPs1b+SgAlx21CiiLm04ZcbBWAM+OMnSXvzm5tW9kT
 ukhhDp1Fxaw57bs04KQFj/zdq17s3ptIiugE9oMEffyKuLPgw2NacIFdkvCoJ6pvy5AErC12X2S
 W/Qs9bECfLh6NN3rjDqrxQijkKwVkjLF6V51GAtic2lRw==

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts | 4 ++--
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
index 4760d07ea24b5..9108181e6592b 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxca.dts
@@ -242,7 +242,7 @@ ethphy_eqos: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
@@ -275,7 +275,7 @@ ethphy_fec: ethernet-phy@0 {
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
 			enet-phy-lane-no-swap;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index 8a88c98ac05a7..a78bbc46c59b2 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -172,7 +172,7 @@ ethphy_eqos: ethernet-phy@0 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_eqos_phy>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <26 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <26 IRQ_TYPE_LEVEL_LOW>;
 			reset-gpios = <&expander1 0 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
@@ -205,7 +205,7 @@ ethphy_fec: ethernet-phy@0 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&pinctrl_fec_phy>;
 			interrupt-parent = <&gpio3>;
-			interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
 			reset-gpios = <&expander1 1 GPIO_ACTIVE_LOW>;
 			reset-assert-us = <500000>;
 			reset-deassert-us = <50000>;
-- 
2.43.0

