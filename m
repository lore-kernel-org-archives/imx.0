Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F28572D0C60
	for <imx@lists.linux.dev>; Mon, 17 Nov 2025 12:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763383052; cv=pass; b=FC5O0/lFy+hrUe+V1eYLvWxl9Td/vT3C2tssV1aR459r9f77mFN7wREdoT2VVSia2kPB2R/T9HkSEI7RYZNHl+dt6HXc/rNqZeRTljoicVSjiZNhhtDY/mcHb3ueTNFH3Cnnbb6nFRECP39FYly8JgQVj++G1vaFMmhx/FN6OAg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763383052; c=relaxed/simple;
	bh=6eQxmAaacP/aBW8Y3d+Wuo10K5fyUcZaZ5CsJYaQI1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sXNYnu26QFVSzHhNO1bfL+KpO+JYd1TtYlXhzJ4Ojz7z9dQ2F58P4f9uLuTwux55r+R1qwzG8LB6eV6HZVZPwU0UZl0ntzHkoIQqAxU0JgEyf+dc6ScqNriQHm4DF1hfeJtzkMF9u0rozMGPlW0h2VH8NZ5V3j+xQdM2R6Ny3Kk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Bl8gNclz; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Bl8gNclz"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=Nsa/tANqoPEYu2tcmKDNOq4Q7cxzL4+lOwJznVO+Sak=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763383028;
 b=hZ5Yytc6scmJx15w+UmNNNJzbIq4+8UuafO9/0+MhK9Zyc+g6cBAEG2gKZB097eqdBFOmMo4
 kS2ZDdvDWejU7kp5c+iKzbbIQaapTC8hrFsWsnF5SgOGXDTxcDjNiONNdJMk2itL2lHJGxN6GMz
 /dAFA9FUB6Z95Z2gtC2Hx5UEQU+UQn4aXGcI0OdCkdvCiwDliZd37wL+OTp8wCqdV6rCGmWvUjv
 q8G/yYGPM4a3wjma+T2QlN+tclBgIR2/X4wU7qYJbE+mzzhah4gxKmH/ZcKSgIECxMxtUDw5Oe9
 eJZlMFjGyri3oCrJ8gwU+6IscR6Mr32kFyWrvcYiSya5A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763383028;
 b=Xg2Y0oCTa2OAX1/Rk3TEe+8qz9gFppZGlrobOs/X3OhJz7HfPqRhzEQvJwxa5jju1Kz+HCPa
 +u91R+U4tXa9KsbiqNjma+XndD2rspD1vGvEIwT4GF1LW7BWK0aLiUBZWOBXswtvVA0hbMFZFPS
 hzwl01+PUol+/T8qAUFzQmLCfKQwrPKU9EifcCZPKtMU5EgIzfR4Jhvjq2lVXALd7/fDfvMqKXI
 HUPMxE1j3GQWn7vetsDIu0RQ5fj7563PWNA/oXFa9L4w4dcQyaljLxZ6X5O0B6AegL4BXb1WMqV
 5dJKevNPTzI4tRwzv63F1dthC7Uin+45VASlUpQwJaSqw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Mon, 17 Nov 2025 13:37:08 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id BC3B4CC0E8D;
	Mon, 17 Nov 2025 13:36:57 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Martin Schmiedel <Martin.Schmiedel@tq-group.com>
Cc: linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/8] arm64: dts: tqma8mpql-mba8mp-ras314: Fix Ethernet PHY IRQ support
Date: Mon, 17 Nov 2025 13:36:33 +0100
Message-ID: <20251117123643.711968-7-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
References: <20251117123643.711968-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4d96gt3Qwzz3ybvM
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:67e9f8e008322bf58113478606af1b75
X-cloud-security:scantime:1.840
DKIM-Signature: a=rsa-sha256;
 bh=Nsa/tANqoPEYu2tcmKDNOq4Q7cxzL4+lOwJznVO+Sak=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763383027; v=1;
 b=Bl8gNclzSF2ffrSCnO4HM2NVFjp+XpnGay5w6hxUAhMdtNllMXde6wM8jBfo6Ji3Rv3lyOOh
 X61e6CQXIgXCa0FK93h3dKrnGpJTkARUz6xgoA9l1gXspshuQFasUKkjXAS8qo3jgONUTP9mjhx
 0g9AgqzS2e84HyZOWOgcmoDTqZMP5dePidVM5V+uOTwSWnjmiu6/zAnJlAnO3XJkvXtVm7QyXlb
 Zy34UzkQJjD2TPuIS64OktQqOQ6LmDSPieKNiTuXJclPkC5ocYuzNw6xKZZ58F21tVHxvCZQpmJ
 UPp2ERbkBaDjHtLmpWNYv4KiFdb95+0GyZlBuTRczx8Vg==

Ethernet PHY interrupt mode is level triggered. Adjust the mode
accordingly.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
index f7346b3d35fe5..67fe1f63fd93c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314.dts
@@ -190,7 +190,7 @@ ethphy3: ethernet-phy@3 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
@@ -222,7 +222,7 @@ ethphy0: ethernet-phy@0 {
 			reset-deassert-us = <50000>;
 			enet-phy-lane-no-swap;
 			interrupt-parent = <&gpio4>;
-			interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
+			interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
 			ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_25_NS>;
 			ti,fifo-depth = <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
-- 
2.43.0

