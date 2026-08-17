Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9874B3C3F5B;
	Mon, 17 Aug 2026 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955729; cv=none; b=uf65YnljJEkMqUFFoXfS9nXrElf+vVNJfAEtIMrBoMvzoUEmHXlYheY9+ECoRlwrXB53xI3kvsoDgYnM7WrXFzDr/LlHc6XPxBDzPKWrseWTmZdUh7seNKkFS1oiiHDCIhNDlgTYQsmT1DeTiREUcCwuET/cm7r9OAMMbGJtmF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955729; c=relaxed/simple;
	bh=oZQvScyA1zqJV4CC6foAQh/CAQe4pGeAga38F8pulH4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KpDy6hDWBkSk5n7I8hMOkpQFJzyzMW7nQ0EBxAZvD9FrVXCW+RU5/k6u3kpNhnd17V9TKe4SmFyKhUx5shO0VigDeoxjr8vEmALq6MHzcf/Of1pxmqO+1Sk7EGW7cUtinG08yMUDoQWJZ8a+PEGovEjm6Lu5JzkhtcKewIQqsCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=flkmgvPK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="flkmgvPK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 657CAC2BD01;
	Mon, 17 Aug 2026 08:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786955729;
	bh=oZQvScyA1zqJV4CC6foAQh/CAQe4pGeAga38F8pulH4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=flkmgvPKf6e8HzNM4+WwQwHcVfhGNFylRnTCo27QCV3LYHrbVkqu5XzyHwNCrtw6i
	 t15amFDREAXU7x37GZO/VM3JA07coVx7hY+O/CMJkgrkzfY5Pc94QdjZkllY09XhLq
	 nE5AqA0wdKw83+NNPux2f8Zb0kbQBZJHNWMQ+t8qFK1Yld1OsCG8nHHHEE4QQ4R8aO
	 jPGbhad8IiqI+iQ4avyxLgITBIm+toM1uQ3Q/177YXD7aDLFqvd3M2+BEhk1f7j2NB
	 fpJIEVS56izeFxg80DBdP2LgwDVRZvvwrJit48QK3WfC4h28SMba9oS9vUcOZXDO6z
	 oWoQO8KNfkRxQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 534E8C5DF70;
	Mon, 17 Aug 2026 08:35:29 +0000 (UTC)
From: Pankaj Gupta via B4 Relay <devnull+pankaj.gupta.oss.nxp.com@kernel.org>
Date: Mon, 17 Aug 2026 19:36:05 +0530
Subject: [PATCH v36 7/7] arm64: dts: imx8ulp: add reserved memory for
 EdgeLock Enclave
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-imx-se-if-v36-7-45c42847bfd8@oss.nxp.com>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
In-Reply-To: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786975564; l=2461;
 i=pankaj.gupta@oss.nxp.com; s=20260817; h=from:subject:message-id;
 bh=8LTJ7dQk+ZmHVQUVQ7z2QFEU98qQ6ZendsUWTwEehrU=;
 b=kNn9ncyZJDpBj1uyCMvvkX807Jvm/cy4I27lgIY1p5LnifaDmHYrm+a5GWXYOUBxA9RM8FmB/
 ymYcIipWCUsDME3VniMYbkoR3MSJUt88zHitpeNQEFI8mEAoLbKHRcp
X-Developer-Key: i=pankaj.gupta@oss.nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-Endpoint-Received: by B4 Relay for pankaj.gupta@oss.nxp.com/20260817 with
 auth_id=955
X-Original-From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
Reply-To: pankaj.gupta@oss.nxp.com

From: Pankaj Gupta <pankaj.gupta@nxp.com>

Reserve 1MB of DDR for the EdgeLock Enclave. The enclave hardware can only
access DDR in the 0x80000000 - 0xafffffff window, so constrain the pool to
that range with alloc-ranges and let the kernel choose the placement rather
than hardcoding an address.

Provide this as a shared imx8ulp-firmware.dtsi that also enables the hsm0
node and wires up its memory-region, so every i.MX8ULP board can bring up
the enclave with a single include instead of duplicating the reserved
memory node. Include it from imx8ulp-evk.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts      |  3 ++-
 .../arm64/boot/dts/freescale/imx8ulp-firmware.dtsi | 31 ++++++++++++++++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
index 5dea66c1e7aa..885242fd07ce 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-evk.dts
@@ -1,11 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0+ OR MIT)
 /*
- * Copyright 2021 NXP
+ * Copyright 2021, 2025 NXP
  */
 
 /dts-v1/;
 
 #include "imx8ulp.dtsi"
+#include "imx8ulp-firmware.dtsi"
 
 / {
 	model = "NXP i.MX8ULP EVK";
diff --git a/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
new file mode 100644
index 000000000000..e4bc352f68af
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8ulp-firmware.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2025 NXP
+ *
+ * Default reserved memory and EdgeLock Enclave (ELE) enablement shared by
+ * i.MX8ULP boards. Include this from a board dts to bring up the secure
+ * enclave without having to duplicate the reserved-memory node. The ELE
+ * hardware can only access DDR in the 0x80000000 - 0xafffffff window, so the
+ * pool is constrained to that range with alloc-ranges and the kernel is left
+ * to place the 1 MiB region.
+ */
+
+/ {
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		ele_reserved: ele-reserved {
+			compatible = "shared-dma-pool";
+			alloc-ranges = <0 0x80000000 0 0x30000000>;
+			size = <0 0x100000>;
+			no-map;
+		};
+	};
+};
+
+&hsm0 {
+	memory-region = <&ele_reserved>;
+	status = "okay";
+};

-- 
2.43.0


