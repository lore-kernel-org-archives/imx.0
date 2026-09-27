Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2669A3EFFC9
	for <imx@lists.linux.dev>; Sun, 27 Sep 2026 12:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790513226; cv=none; b=QwnHl6pEWsgq4aMRPPkPMu3GlQ5K3yEL0TwHCZDYB/dVvGWdUvBnRzJXbPjKa8WRjzCaAUXqFM9ps9qBw+no/HanLlP8W+pvMLZoNWhT6MPNlBbss02lmLfCPkFZd62tOXOR0R4E10Fh5sWsapkkzQNurleZQ7JEigZcS0NsYt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790513226; c=relaxed/simple;
	bh=htXpuHN2eIspX5UEp9Af232bcJRmgLfiR2t4CCT/FOQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aFnOoCFkrVzUQeqvDTHs8+eVLDItObFa6HC0J3mWDtOyQk5D26DGx8LaM3iqjF3d5gaGs8uFeTRdlqkSAX6dV5HUN/3cyc1n0Y2E9OK5zA3hL5CFDiLrFwiA+K4/AgWRNBArsSrO1aNDP45boY6Q/tWwMcDcKK6DKKUQTgmBrcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sKszTwQ0; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sKszTwQ0"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e69b9e16aso24248175e9.1
        for <imx@lists.linux.dev>; Sun, 27 Sep 2026 05:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513216; x=1791118016; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kNuRDePVXJ9oNOK+zyTa8eRl0QFtPM/iNNylMvoO+3M=;
        b=sKszTwQ0+4JU3jzRtoAfQ43VGGsApKnkXxdxHJU9/SN0b4H+cCSgwMGjrYVXn04YY4
         BW5xwFFAX6sGvYuBLbDGIYkwkz5O3ozKlJmB/R1FlOWViJ3QtyHi3drvp19Ty35PxIgB
         Hd468LxMZZuSJlo4NVWqnF162iH/rXeH53HDBebsPdvTKp+tEPmhZzHmadgzknGKmizE
         +PrHZ8fZKPhBZTPcR2QUv6dLjwlUdJlg97wfLGeeFcQfAPdzVHz6HEl4n4O3oU2wzcA9
         9iuvQODmhHs0y2C0eMqzKOXgmV4F8x4WY32+dzWZ/AnJzmmHs/P4+XRIMVyy+bsrBngP
         S3hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513216; x=1791118016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kNuRDePVXJ9oNOK+zyTa8eRl0QFtPM/iNNylMvoO+3M=;
        b=EWCH1SPvoYyCxpJiYO9hJG81sUKfuQe/RBCfsU/wY5SFMaAgrOGg79ydgnqaB0Om8C
         FLp5CjoMe+T5iJ5QjjJD4YKUCCZlC1yQ2ijPDSYgwtQXi2ndi9s8QePU2dByLXiIGOhU
         /QXylmCQU7mtbFT8z+3gARQKrwWRTwPz1uZUJygF+enCunUwIdqJ/TSegVJpXS49jS+V
         7/oUk3UgPcocbP7YHqLqcCpgAN+Rmf/luGVEcln2zCVSWQwDhcyqOP2V9fh9KANIs238
         i8b5+vZfaltLNfyAzAXLT1W37pJEkOYqPZOEiwcxXYGZVSiQ++jqt31v+5KyrojCA0wB
         /mwQ==
X-Forwarded-Encrypted: i=1; AKwUvBzlN9OztrjlWXn4oLwgBzTqoij2/g4wJevSEUEcfkBsPC3EYtmA1Z3qag4KONW0ZWT3uoE=@lists.linux.dev
X-Gm-Message-State: AFuF++mZfTvqul90/KDyqNAvSVUNAhJ3o0xRZ0AnlV1qKSmEvKQs+pik
	nJNs5ts6IQiYlnr6EmQ3D5Y4QiRR5Dj+wpdrVuoGzFloZYWdqYcNMVdy
X-Gm-Gg: AYBFou0K3uqOAjlgH4k8yEi2c4DmvNEYWTwImP1m1RxYIaE12Gt2MpN8Z8PC+3TAPHk
	ZRqL1qaEQlEpmUzpJTOxO9+eiZuZuOJUflWEJrnmU0oY/rWk+TZDEunVNe5qsRReYbABKU4sTb/
	syb23D8lkhtXi13BsYf8OKM+zYGQVMuDJdB05U4A6pZLTPZt80Y9sGDjx+pjPZq1mwjFBbWdiPx
	Lor/wPiuaqUoB2KX5FjwErd5EsOdhUytwE16OMZUrA4o8ZgyBSQGNHEzl3g47SRms31W1zZmQYa
	fOMKNstfHWd89zo1/VRSRlRQsUd6ZOFLhdZNUqLPEmQtkbvIWJ24oSnjYBHOpQb3wgNfNDYQIie
	7HMzpI6N2QAUoh5yW6oMyyV3XlM7GLzgXJxDV+adTXoDnlxeaQ1gb/MN7VpEjeVeokFNXZ4hcfi
	gK9fPfPXW/cOzuFjxSr2o0ulCMCMV2v8L6gK6sWd0qD+8xB7YxG6NKVK14adEV2ssdnH823oKpF
	rMAWhNp5ArnzsyhdPPn334/x8lV9hWliOtAcz9A0cPrgi0PdTAWQkE5Ru7Z5FWYM5cP/ArZYmS4
	Uvsy04LqDaTnweCBeN4Tlg==
X-Received: by 2002:a05:600c:870c:b0:49e:8377:c880 with SMTP id 5b1f17b1804b1-49fe7bd0128mr178151005e9.33.1790513216151;
        Sun, 27 Sep 2026 05:46:56 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:55 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v3 11/12] ARM: dts: imx6ulz: Add Variscite i.MX6ULZ board variants
Date: Sun, 27 Sep 2026 14:46:26 +0200
Message-ID: <4e63d123736daddc18dcddeabe96b6e2bfd65611.1790512621.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add i.MX6ULZ board DTS files for VAR-SOM-6UL and DART-6UL with their
carrier, storage, wireless and audio options.

Reuse the shared option and carrier descriptions with the i.MX6ULZ
SoC and module wrappers.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - Use the shared storage and wireless option DTSI files.

v1->v2:
 - Update audio includes for the shared WM8904 and WM8731 files.

 ...z-var-dart-emmc-sd-card-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...art-emmc-sd-card-wm8731-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...var-dart-emmc-wifi-brcm-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...t-emmc-wifi-brcm-wm8731-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...ar-dart-emmc-wifi-iw61x-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...z-var-dart-nand-sd-card-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...art-nand-sd-card-wm8731-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...var-dart-nand-wifi-brcm-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...t-nand-wifi-brcm-wm8731-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...ar-dart-nand-wifi-iw61x-6ulcustomboard.dts | 21 +++++++++++++++++++
 ...lz-var-som-emmc-sd-card-concerto-board.dts | 21 +++++++++++++++++++
 ...lz-var-som-emmc-sd-card-symphony-board.dts | 21 +++++++++++++++++++
 ...som-emmc-sd-card-wm8731-concerto-board.dts | 21 +++++++++++++++++++
 ...som-emmc-sd-card-wm8731-symphony-board.dts | 21 +++++++++++++++++++
 ...-var-som-emmc-wifi-brcm-concerto-board.dts | 21 +++++++++++++++++++
 ...-var-som-emmc-wifi-brcm-symphony-board.dts | 21 +++++++++++++++++++
 ...m-emmc-wifi-brcm-wm8731-concerto-board.dts | 21 +++++++++++++++++++
 ...m-emmc-wifi-brcm-wm8731-symphony-board.dts | 21 +++++++++++++++++++
 ...var-som-emmc-wifi-iw61x-concerto-board.dts | 21 +++++++++++++++++++
 ...var-som-emmc-wifi-iw61x-symphony-board.dts | 21 +++++++++++++++++++
 ...lz-var-som-nand-sd-card-concerto-board.dts | 21 +++++++++++++++++++
 ...lz-var-som-nand-sd-card-symphony-board.dts | 21 +++++++++++++++++++
 ...som-nand-sd-card-wm8731-concerto-board.dts | 21 +++++++++++++++++++
 ...som-nand-sd-card-wm8731-symphony-board.dts | 21 +++++++++++++++++++
 ...-var-som-nand-wifi-brcm-concerto-board.dts | 21 +++++++++++++++++++
 ...-var-som-nand-wifi-brcm-symphony-board.dts | 21 +++++++++++++++++++
 ...m-nand-wifi-brcm-wm8731-concerto-board.dts | 21 +++++++++++++++++++
 ...m-nand-wifi-brcm-wm8731-symphony-board.dts | 21 +++++++++++++++++++
 ...var-som-nand-wifi-iw61x-concerto-board.dts | 21 +++++++++++++++++++
 ...var-som-nand-wifi-iw61x-symphony-board.dts | 21 +++++++++++++++++++
 30 files changed, 630 insertions(+)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts

diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..612246fe5638
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..cddfce9c41d9
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..c942538d64e7
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..cceb477aa49d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..708c341911b4
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, eMMC, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-emmc-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
new file mode 100644
index 000000000000..308514e7f1c2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, SD card & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-sd-card-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..20586513b1fe
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-sd-card-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, SD card & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-sd-card-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
new file mode 100644
index 000000000000..afa3d3d9ac10
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-wifi-brcm-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
new file mode 100644
index 000000000000..ca16b34b5a1f
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-brcm-wm8731-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8731 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-wifi-brcm-wm8731-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
new file mode 100644
index 000000000000..7373a5d438fc
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-nand-wifi-iw61x-6ulcustomboard.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-dart.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
+#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
+
+/ {
+	model = "Variscite DART-6UL with i.MX6ULZ, NAND flash, WiFi IW61x & WM8904 support on VAR-6ULCustomBoard";
+	compatible = "variscite,dart-6ul-imx6ulz-nand-wifi-iw61x-6ulcustomboard",
+		     "variscite,dart-6ul-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..1351767d435e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..973fc53777e2
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..f34cb378a611
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-wm8731-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..ea9f6e4d2e6e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-sd-card-wm8731-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..2271acae99c5
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..590cd1830787
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..79a4b39c20af
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..eadface31718
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-brcm-wm8731-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..f16bf6b0de0c
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-iw61x-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..44a2b61447d3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-emmc.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, eMMC, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-emmc-wifi-iw61x-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
new file mode 100644
index 000000000000..c77d897864d8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
new file mode 100644
index 000000000000..a468c41e603d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..aabd99bd5c2d
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-wm8731-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..6531a4fe25d3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-sd-card-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, SD card & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-sd-card-wm8731-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
new file mode 100644
index 000000000000..b802e5f229be
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
new file mode 100644
index 000000000000..100f3f8a5764
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
new file mode 100644
index 000000000000..c2b71b782e77
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8731 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
new file mode 100644
index 000000000000..c53bfe5b3b14
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-brcm-wm8731-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-brcm.dtsi"
+#include "imx6ul-imx6ull-var-wm8731.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi BRCM & WM8731 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-brcm-wm8731-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
new file mode 100644
index 000000000000..82049810d604
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-concerto-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-concerto-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi IW61x & WM8904 support on Concerto-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-iw61x-concerto-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts
new file mode 100644
index 000000000000..b4980a5992f7
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-nand-wifi-iw61x-symphony-board.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
+ */
+
+/dts-v1/;
+
+#include "imx6ulz.dtsi"
+#include "imx6ulz-var-som.dtsi"
+#include "imx6ul-imx6ull-var-nand.dtsi"
+#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"
+#include "imx6ul-imx6ull-var-wm8904.dtsi"
+#include "imx6ulz-var-som-symphony-board.dtsi"
+
+/ {
+	model = "Variscite VAR-SOM-6UL with i.MX6ULZ, NAND flash, WiFi IW61x & WM8904 support on Symphony-Board";
+	compatible = "variscite,var-som-imx6ulz-nand-wifi-iw61x-symphony-board",
+		     "variscite,var-som-imx6ulz",
+		     "fsl,imx6ull",
+		     "fsl,imx6ulz";
+};
-- 
2.47.3
