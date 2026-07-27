Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0143D646B
	for <imx@lists.linux.dev>; Mon, 27 Jul 2026 19:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181992; cv=none; b=dnToKjEMK+6szsxDyyxNxpY/mjkyvOc2sWcqmYsYnIxy/DBbyMR5NfwedneqEfUpWnswCzFA9CfL2avT6UBY8JEDGP8stH40Hz+vEswgzj65txdoonDx4wT9+FYqFM1FP1ZcPt5uP6IZzyCxwIS8qcuf5JRp6c37ZQTS1iOFK7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181992; c=relaxed/simple;
	bh=TcoUVSgN/8N28cHoUevx7RerogmEwXS9SBDYiq3YQB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FSSciMrpe6Lx63MHm6UsHVF/TsY4v+LxQR8bOzgwsYow3/3G5piOrwFVJXsCSDup2HKChLzrzW/+Y53Z8hRX0xcCFLTBOZrO3sU4Bpw0Maxj+Eq5d9/XooE5uifgb6VxhPnyQs6IUR6q8VIBoBmmMmXZZs/XwSfVJqVLZKTCOjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=LHNpAhi2; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="LHNpAhi2"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E790911908E;
	Mon, 27 Jul 2026 21:52:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785181981; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=r5VwuJaTofoTUyhH415dZcMRDHP4VbNN+85B7EMG3us=;
	b=LHNpAhi23S2VF3Vfx03usofswuCMdARInV6S1Pf+fjONzJGqHA71KQ3IlEyk8iG26MJhJK
	zfhKDU9/bf124ong+sJcBUw3fKx2t9Q2s4z4HzVRz4FBV08ifk2LMIHlCxJBAzFi2oe9rX
	fA0nPYgx3vlHk2kk1Dd7n8FCCj8ZqevquivaJfDQ5HfKfGe56aVpHneeSz1j+L7dIN0ZDD
	eXDPYPcyOT/0dBK9tbSq5mHrdHK3qQNxqrb7fxnrfuqwk4IQAZR/KggH2qW6EO/SuKSL/o
	FKmDM/Xg5G0e+hCpKt3OunrhD7PEx77/CsKXg9XMl+yEy3ugTm5C/6rCvt/0Kw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 2/7] arm64: dts: imx8mm: imx8mp: Add LVDS DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Mon, 27 Jul 2026 21:52:17 +0200
Message-ID: <20260727195244.78199-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727195244.78199-1-marex@nabladev.com>
References: <20260727195244.78199-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add DT overlay for the DSI-to-LVDS adapter eDM-MOD-iMX8Mm-LVDS populated
with Lontium LT9211 bridge. This adapter can be optionally populated onto
the eDM SBC. This adapter can be extended with multiple panels, currently
supported are the following:

- AUO G215HVN011
- Innolux G070Y2-L01
- Innolux G101ICE-L01
- Innolux G121XCE-L01
- Innolux G156HCE-L01
- Multi-Inno Technology MI0700A2T-30
- Multi-Inno Technology MI1010Z1T-1CP11

Note that in case of the i.MX8M Plus eDM SBC, the adapter name containing
iMX8Mm is not a typo, this is the adapter model string. The adapter was
originally developed for the iMX8Mm eDM SBC.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Deduplicate the DTOs further
V3: - Rename buckN to buckN_reg and ldoN to ldoN_reg to be consistent across MX8MM and MX8MP
    - Split off anything non-LVDS related
V4: Rebase on next-20260703, drop dependency links which have all landed now
V5: Fix g151hce to g156hce typo
V6: Move compatible and reg properties to the beginning of lt9211_codec: bridge@2d { } node
---
 arch/arm64/boot/dts/freescale/Makefile        | 134 +++++++++++++++++-
 ...edm-sbc-overlay-edm-mod-imx8mm-common.dtsi |  59 ++++++++
 ...bc-overlay-edm-mod-imx8mm-lvds-common.dtsi | 118 +++++++++++++++
 ...-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi |  32 +++++
 ...verlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi |  12 ++
 ...verlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi |  12 ++
 ...erlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi |  12 ++
 ...erlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g156hce-l01.dtsi |  12 ++
 ...erlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso |   7 +
 ...verlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi |  12 ++
 ...verlay-edm-mod-imx8mm-lvds-g215hvn011.dtso |   7 +
 ...rlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi |  12 ++
 ...rlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso |   7 +
 ...y-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi |  12 ++
 ...y-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso |   7 +
 ...bc-overlay-edm-mod-imx8mm-lvds-single.dtsi |  20 +++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi |  22 +++
 ...m-data-modul-edm-sbc-overlay-lvds-3v3.dtsi |  19 +++
 ...m-data-modul-edm-sbc-overlay-lvds-5v0.dtsi |  19 +++
 ...-data-modul-edm-sbc-overlay-lvds-dual.dtsi |  29 ++++
 ...modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi |  31 ++++
 ...odul-edm-sbc-overlay-lvds-g101ice-l01.dtsi |  31 ++++
 ...odul-edm-sbc-overlay-lvds-g121xce-l01.dtsi |  31 ++++
 ...odul-edm-sbc-overlay-lvds-g156hce-l01.dtsi |  31 ++++
 ...modul-edm-sbc-overlay-lvds-g215hvn011.dtsi |  30 ++++
 ...dul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi |  31 ++++
 ...-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi |  31 ++++
 ...ata-modul-edm-sbc-overlay-lvds-single.dtsi |  13 ++
 .../freescale/imx8mm-data-modul-edm-sbc.dts   |   8 +-
 ...verlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso |   7 +
 ...erlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso |   7 +
 ...verlay-edm-mod-imx8mm-lvds-g215hvn011.dtso |  11 ++
 ...rlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso |   7 +
 ...y-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso |   7 +
 ...l-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi |  35 +++++
 ...verlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso |  24 ++++
 ...erlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso |  24 ++++
 ...erlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso |  24 ++++
 ...erlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso |  32 +++++
 ...verlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso |  36 +++++
 ...rlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso |  24 ++++
 ...y-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso |  24 ++++
 ...l-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi |  79 +++++++++++
 .../freescale/imx8mp-data-modul-edm-sbc.dts   |  48 +++----
 49 files changed, 1191 insertions(+), 34 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index d5c2dc720197e..30e570e87331a 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -119,7 +119,51 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxl-hummingboard-telematics.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtbo
+
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtbo
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-ddr4-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-emcon-avari.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-emtop-baseboard.dtb
@@ -245,7 +289,93 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-aristainetos3-proton2s.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
-dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtbo
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-drc02.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi
new file mode 100644
index 0000000000000..8a95dc05b1fcf
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi
@@ -0,0 +1,59 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	reg_backlight_en_level: regulator-backlight-en-level {
+		compatible = "regulator-gpio";
+		regulator-name = "Backlight_SEL_EN";
+		regulator-type = "voltage";
+		states = <3300000 0x0>,
+			 <5000000 0x1>;
+
+		/* Default setting: lowest supported voltage. */
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_backlight_pwm_level: regulator-backlight-pwm-level {
+		compatible = "regulator-gpio";
+		regulator-name = "Backlight_SEL_PWM";
+		regulator-type = "voltage";
+		gpios = <&gpio_display 2 GPIO_ACTIVE_HIGH>; /* SEL_PWM */
+		states = <3300000 0x0>,
+			 <5000000 0x1>;
+
+		/* Default setting: lowest supported voltage. */
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_panel_bl: regulator-panel-bl {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_backlight>;
+		regulator-name = "PANEL_BL";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio3 0 0>;
+		enable-active-high;
+		/* Used by panels which enable PWM signal before BL ON/OFF */
+		status = "disabled";
+	};
+};
+
+&reg_panel_vcc {
+	compatible = "regulator-gpio";
+	regulator-type = "voltage";
+	enable-active-high;
+	status = "okay";
+
+	/* Default setting: lowest supported voltage. */
+	gpios-states = <0 0>;	/* Default GPIO state is LOW/LOW, so 3V3 out */
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi
new file mode 100644
index 0000000000000..9abd188ee271e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&{/} {
+	reg_lt9211_vcc18: regulator-lt9211-vcc18 {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9211_VCC18";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&buck5_reg>;	/* X400 pin 51, +1V8_S0 */
+	};
+};
+
+&i2c_display {	/* Display connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+	clock-frequency = <100000>;
+
+	lt9211_codec: bridge@2d {
+		compatible = "lontium,lt9211";
+		reg = <0x2d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_expansion>;
+		interrupts-extended = <&gpio2 3 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+		vccio-supply = <&reg_lt9211_vcc18>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9211_a: endpoint {
+					data-lanes = <1 2 3 4>;
+					remote-endpoint = <&mipi_dsi_bridge1_out>;
+				};
+			};
+		};
+	};
+
+	gpio_display: io-expander@41 {
+		compatible = "nxp,pca9536";
+		reg = <0x41>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "SEL_12V", "SEL_5V", "SEL_PWM", "SEL_EN";
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&reg_backlight_en_level {
+	gpios = <&gpio_display 3 GPIO_ACTIVE_HIGH>; /* SEL_EN */
+};
+
+&reg_backlight_pwm_level {
+	gpios = <&gpio_display 2 GPIO_ACTIVE_HIGH>; /* SEL_PWM */
+};
+
+&reg_panel_bl {
+	gpio = <&gpio3 0 0>;
+};
+
+&iomuxc {
+	/* Free &pinctrl_panel_expansion from hog for lt9211_codec above */
+	pinctrl-0 = <&pinctrl_hog_misc>, <&pinctrl_hog_feature>,
+		    <&pinctrl_hog_panel>, <&pinctrl_hog_sbc>;
+};
+
+&mipi_dsi {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			mipi_dsi_bridge1_out: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				/* Clock and data lanes have DN/DP swapped */
+				lane-polarities = <1 1 1 1 1>;
+				remote-endpoint = <&lt9211_a>;
+			};
+		};
+	};
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/*
+	 * AP63300 voltage divider settings:
+	 *   R1=16k2
+	 *   R2=5k23 with optional series Rs=7k68 (5V) or Rt=1k5 (12V)
+	 *
+	 * 1 / Rx = (1 / R2) [ + (1 / Rs)][ + (1 / Rt)]
+	 * Vout = 0.8 * ((R1 / Rx) + 1)
+	 */
+	gpios = <&gpio_display 1 GPIO_ACTIVE_HIGH>,	/* 5V */
+		<&gpio_display 0 GPIO_ACTIVE_HIGH>;	/* 12V */
+	states = <3300000 0x0>,
+		 <5000000 0x1>,
+		 <12000000 0x2>,
+		 <3900000 0x3>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi
new file mode 100644
index 0000000000000..abe50eb8b4b61
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&lt9211_codec {
+	ports {
+		port@2 {
+			reg = <2>;
+
+			lt9211_out_a: endpoint {
+				remote-endpoint = <&panel_lvds_a>;
+			};
+		};
+
+		port@3 {
+			reg = <3>;
+
+			lt9211_out_b: endpoint {
+				remote-endpoint = <&panel_lvds_b>;
+			};
+		};
+	};
+};
+
+&panel_lvds_a {
+	remote-endpoint = <&lt9211_out_a>;
+};
+
+&panel_lvds_b {
+	remote-endpoint = <&lt9211_out_b>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi
new file mode 100644
index 0000000000000..cca52464a695e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <216000000>;	/* RX ByteClock ~27 MHz */
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
new file mode 100644
index 0000000000000..5d1ea31f33de3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi
new file mode 100644
index 0000000000000..52d216fbba432
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <515000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
new file mode 100644
index 0000000000000..2d1bbdd065227
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi
new file mode 100644
index 0000000000000..aba3c9a1a3e8a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <470000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
new file mode 100644
index 0000000000000..bc2f6fef6256e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtsi
new file mode 100644
index 0000000000000..f478f4e557cce
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <864000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
new file mode 100644
index 0000000000000..5bd417cbac55f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi
new file mode 100644
index 0000000000000..21bec8a01287e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-dual.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <864000000>;	/* RX ByteClock ~27 MHz */
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
new file mode 100644
index 0000000000000..75ae12dfd7fc6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi
new file mode 100644
index 0000000000000..38a3a9a4c75b3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <216000000>;	/* RX ByteClock ~27 MHz */
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
new file mode 100644
index 0000000000000..ee2c79664e355
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi
new file mode 100644
index 0000000000000..98b5c5883cfd0
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi"
+
+&mipi_dsi {
+	samsung,burst-clock-frequency = <400000000>;
+	samsung,esc-clock-frequency = <10000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
new file mode 100644
index 0000000000000..d05f0dcc3137c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi
new file mode 100644
index 0000000000000..9e70c1481c1eb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-single.dtsi
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&lt9211_codec {
+	ports {
+		port@2 {
+			reg = <2>;
+
+			lt9211_out_a: endpoint {
+				remote-endpoint = <&panel_lvds>;
+			};
+		};
+	};
+};
+
+&panel_lvds {
+	remote-endpoint = <&lt9211_out_a>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
new file mode 100644
index 0000000000000..31598aa86b100
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi"
+
+&lcdif {
+	status = "okay";
+};
+
+&lt9211_codec {
+	interrupts-extended = <&gpio2 3 IRQ_TYPE_EDGE_FALLING>;
+	reset-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_panel_vcc {
+	enable-gpios = <&gpio3 6 0>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi
new file mode 100644
index 0000000000000..0955764c0ebff
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&reg_backlight_pwm_level {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_backlight_en_level {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
+
+&reg_panel_vcc {
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi
new file mode 100644
index 0000000000000..70ad6bb9b80ac
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&reg_backlight_pwm_level {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
+
+&reg_backlight_en_level {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
+
+&reg_panel_vcc {
+	regulator-min-microvolt = <5000000>;
+	regulator-max-microvolt = <5000000>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi
new file mode 100644
index 0000000000000..65f9ad81cfbc7
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&panel {
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@0 {
+			reg = <0>;
+			dual-lvds-odd-pixels;
+
+			panel_lvds_b: endpoint {
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+			dual-lvds-even-pixels;
+
+			panel_lvds_a: endpoint {
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi
new file mode 100644
index 0000000000000..80f7b74f1ea08
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 6.3 POWER ON/OFF SEQUENCE, T9 >= 10 ms */
+	pwm-off-delay-ms = <10>;
+	/* 3.2 BACKLIGHT UNIT fPWM=200 Hz (Typ.), value below in ns */
+	pwms = <&pwm1 0 5000000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "innolux,g070y2-l01";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <10000>; /* T8 */
+	off-on-delay-us = <550000>; /* T9 + T6 + T3 + T7 + T4 + T1 + T2 + T5 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 6.3 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <1000>; /* 0.5ms <= T1 + T2 <= 60 ms */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi
new file mode 100644
index 0000000000000..1a2bd204c30b1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 6.3 POWER ON/OFF SEQUENCE, T9 >= 10 ms */
+	pwm-off-delay-ms = <10>;
+	/* 3.2 BACKLIGHT UNIT fPWM=200 Hz (Typ.), value below in ns */
+	pwms = <&pwm1 0 5000000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "innolux,g101ice-l01";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <10000>; /* T8 */
+	off-on-delay-us = <950000>; /* T9 + T6 + T3 + T7 + T4 + T1 + T2 + T5 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 6.3 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <1000>; /* 0.5ms <= T1 + T2 <= 60 ms */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi
new file mode 100644
index 0000000000000..f87e8c821dacb
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Wael Karman <wkarman@data-modul.com>
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 6.2 POWER ON/OFF SEQUENCE, T9 >= 10 ms */
+	pwm-off-delay-ms = <10>;
+	/* 3.2 BACKLIGHT UNIT fPWM=200 Hz (Typ.), value below in ns */
+	pwms = <&pwm1 0 5000000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "innolux,g121xce-l01";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <10000>; /* T8 */
+	off-on-delay-us = <1180000>; /* T9 + T6 + T3 + T7 + T4 + T1 + T2 + T5 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 6.2 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <1000>; /* 0.5ms <= T1 + T2 <= 60 ms */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi
new file mode 100644
index 0000000000000..46c8bc7021a4f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 4.6 POWER ON/OFF SEQUENCE, T9 >= 10 ms */
+	pwm-off-delay-ms = <10>;
+	/* 4.3.2 BACKLIGHT UNIT fPWM=200 Hz (Typ.), value below in ns */
+	pwms = <&pwm1 0 5000000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "innolux,g156hce-l01";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <10000>; /* T8 */
+	off-on-delay-us = <1170000>; /* T9 + T6 + T3 + T7 + T4 + T1 + T2 + T5 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 4.6 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <1000>; /* 0.5ms <= T1 + T2 <= 60 ms */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
new file mode 100644
index 0000000000000..3585170bd59dd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-5v0.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-dual.dtsi"
+
+&backlight {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_panel_backlight>;
+	enable-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
+	/* 6.5 POWER ON/OFF SEQUENCE, T6 >= 10 ms */
+	post-pwm-on-delay-ms = <10>;
+	/* 6.5 POWER ON/OFF SEQUENCE, T7 >= 0 ms */
+	pwm-off-delay-ms = <10>;
+	/* 5.2 BACKLIGHT UNIT 200Hz..20kHz, value below in ns */
+	pwms = <&pwm1 0 66666 0>;	/* 15 kHz = 66666ns */
+	status = "okay";
+};
+
+&panel {
+	/* The G215HVN01 is replacement for T215HVN01, which is supported. */
+	compatible = "auo,t215hvn01";
+};
+
+&reg_panel_vcc {
+	/* 6.5 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <40000>; /* 30.5ms <= T1 + T2 <= 60 ms */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi
new file mode 100644
index 0000000000000..4a077e6e6b8af
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 1.5 POWER ON/OFF SEQUENCE, T4 >= 200 ms */
+	pwm-off-delay-ms = <200>;
+	/* ELECTRICAL CHARACTERISTICS, BL_ADJ Frequency 20K HZ Typ., value below in ns */
+	pwms = <&pwm1 0 50000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "multi-inno,mi0700a2t-30";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <200000>; /* T3 */
+	off-on-delay-us = <1450000>; /* T4 + T5 + T6 + T1 + T2 + T3 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 1.5 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <60000>; /* T1 + T2 >= 1 ms (typ. 60ms) */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi
new file mode 100644
index 0000000000000..e8d8cd85d04ae
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-3v3.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl>;
+	/* 3 POWER ON/OFF SEQUENCE, T7 >= 200 ms */
+	pwm-off-delay-ms = <200>;
+	/* ELECTRICAL CHARACTERISTICS, BL_ADJ Frequency 20K HZ Typ., value below in ns */
+	pwms = <&pwm1 0 50000 0>;
+	status = "okay";
+};
+
+&panel {
+	compatible = "multi-inno,mi1010z1t-1cp11";
+};
+
+&reg_panel_bl {
+	startup-delay-us = <200000>; /* T6 */
+	off-on-delay-us = <1450000>; /* T7 + T3 + T4 + T5 + T1 + T2 + T6 */
+	status = "okay";
+};
+
+&reg_panel_vcc {
+	/* 3 POWER ON/OFF SEQUENCE */
+	startup-delay-us = <60000>; /* T1 + T2 >= 1 ms (typ. 60ms) */
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi
new file mode 100644
index 0000000000000..68c20692241a1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-lvds-single.dtsi
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+&panel {
+	status = "okay";
+
+	port {
+		panel_lvds: endpoint {
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
index 472c584fb3bd2..df857de0375cf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc.dts
@@ -30,11 +30,8 @@ memory@40000000 {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_panel_backlight>;
 		brightness-levels = <0 1 10 20 30 40 50 60 70 75 80 90 100>;
 		default-brightness-level = <7>;
-		enable-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
 		pwms = <&pwm1 0 5000000 0>;
 		/* Disabled by default, unless display board plugged in. */
 		status = "disabled";
@@ -66,7 +63,6 @@ reg_panel_vcc: regulator-panel-vcc {
 		regulator-name = "PANEL_VCC";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
-		gpio = <&gpio3 6 0>;
 		enable-active-high;
 		/* Disabled by default, unless display board plugged in. */
 		status = "disabled";
@@ -454,7 +450,7 @@ pcieclk: clk@6a {
 	};
 };
 
-&i2c3 {	/* Display connector I2C */
+i2c_display: &i2c3 {	/* Display connector I2C */
 	/* IMX8MM ERRATA e7805 -- I2C is limited to 384 kHz due to SoC bug */
 	clock-frequency = <320000>;
 	pinctrl-names = "default", "gpio";
@@ -465,7 +461,7 @@ &i2c3 {	/* Display connector I2C */
 	status = "okay";
 };
 
-&i2c4 {	/* Feature connector I2C */
+i2c_feature: &i2c4 {	/* Feature connector I2C */
 	/* IMX8MM ERRATA e7805 -- I2C is limited to 384 kHz due to SoC bug */
 	clock-frequency = <320000>;
 	pinctrl-names = "default", "gpio";
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
new file mode 100644
index 0000000000000..6b6b160c0f3a1
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
new file mode 100644
index 0000000000000..549ea2ab8819a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
new file mode 100644
index 0000000000000..c8c4328218152
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g121xce-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
new file mode 100644
index 0000000000000..bf5b41ae61dbe
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g156hce-l01.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
new file mode 100644
index 0000000000000..faf2c06fc50c3
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtso
@@ -0,0 +1,11 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g215hvn011.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl_supply>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
new file mode 100644
index 0000000000000..359a8b1521b01
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
new file mode 100644
index 0000000000000..525cedb64a776
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtso
@@ -0,0 +1,7 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtsi"
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
new file mode 100644
index 0000000000000..6c346baee903f
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds.dtsi
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-common.dtsi"
+
+&{/} {
+	reg_panel_bl_supply: regulator-panel-bl-supply {
+		compatible = "regulator-fixed";
+		regulator-name = "BKLT0";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+};
+
+&lcdif1 {
+	status = "okay";
+};
+
+&lt9211_codec {
+	interrupts-extended = <&gpio4 19 IRQ_TYPE_EDGE_FALLING>;
+	reset-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
+};
+
+&reg_panel_bl {
+	vin-supply = <&reg_panel_bl_supply>;
+};
+
+&reg_panel_vcc {
+	enable-gpios = <&gpio3 6 0>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso
new file mode 100644
index 0000000000000..7a4126214a4f6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g070y2-l01.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g070y2-l01.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The G070Y2-L01 panel requires 29.5 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 206.5 MHz , since 206.5 MHz / 7 = 29.5 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <206500000>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
new file mode 100644
index 0000000000000..817d4ec62d0e8
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g101ice-l01.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g101ice-l01.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The G101ICE-L01 panel requires 71.1 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 497.7 MHz , since 497.7 MHz / 7 = 71.1 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <497700000>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso
new file mode 100644
index 0000000000000..729f477038b17
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g121xce-l01.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024 Wael Karman <wkarman@data-modul.com>
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g121xce-l01.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The G121XCE-L01 panel requires 64.9 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 454.3 MHz , since 454.3 MHz / 7 = 64.9 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <454300000>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso
new file mode 100644
index 0000000000000..86163d6ddd5c6
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g156hce-l01.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g156hce-l01.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The G156HCE-L01 panel requires 141.86 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 993.2 MHz , since 993.2 MHz / 7 = 141.86 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <993020000>;
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_b>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds_a>;
+};
+
+&panel_lvds_a {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
+
+&panel_lvds_b {
+	remote-endpoint = <&ldb_lvds_ch0>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
new file mode 100644
index 0000000000000..a6d13c3609796
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-g215hvn011.dtso
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-g215hvn011.dtsi"
+
+&backlight {
+	power-supply = <&reg_panel_bl_supply>;
+};
+
+&media_blk_ctrl {
+	/*
+	 * The G215HVN01 panel requires 148.8 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 1041.6 MHz , since 1041.6 MHz / 7 = 148.8 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <1041600000>;
+};
+
+&ldb_lvds_ch0 {
+	remote-endpoint = <&panel_lvds_b>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds_a>;
+};
+
+&panel_lvds_a {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
+
+&panel_lvds_b {
+	remote-endpoint = <&ldb_lvds_ch0>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso
new file mode 100644
index 0000000000000..76bfbd307ba2d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-mi0700a2t-30.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The MI0700A2T-30 panel requires 33 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 231 MHz , since 231 MHz / 7 = 33 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <231000000>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso
new file mode 100644
index 0000000000000..4066bac28f3df
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtso
@@ -0,0 +1,24 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+
+#include "imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi"
+#include "imx8mm-data-modul-edm-sbc-overlay-lvds-mi1010z1t-1cp11.dtsi"
+
+&media_blk_ctrl {
+	/*
+	 * The MI1010Z1T-1CP11 panel requires 51.2 MHz LVDS clock.
+	 * Set IMX8MP_VIDEO_PLL1 to 358.4 MHz , since 358.4 MHz / 7 = 51.2 MHz .
+	 */
+	assigned-clock-rates = <500000000>, <200000000>,
+			       <0>, <0>, <500000000>, <358400000>;
+};
+
+&ldb_lvds_ch1 {
+	remote-endpoint = <&panel_lvds>;
+};
+
+&panel_lvds {
+	remote-endpoint = <&ldb_lvds_ch1>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
new file mode 100644
index 0000000000000..b06af369a9245
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds.dtsi
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-common.dtsi"
+
+&{/} {
+	reg_panel_bl_supply: regulator-panel-bl-supply {
+		compatible = "regulator-gpio";
+		regulator-type = "voltage";
+		regulator-name = "PANEL_BL_SUPPLY";
+		enable-gpios = <&gpiolvds 0 0>;
+		enable-active-high;
+		status = "okay";
+
+		/*
+		 * MP2328 voltage divider settings:
+		 *   R1=51k1
+		 *   R2=5k62 with optional series Rs=2k21 (12V)
+		 *
+		 * 1 / Rx = (1 / R2) [ + (1 / Rs)][ + (1 / Rt)]
+		 * Vout = 0.5 + ((R1 / Rx) * 0.5)
+		 */
+		gpios = <&gpiolvds 1 GPIO_ACTIVE_HIGH>;	/* 12V */
+		states = <5000000 0x0>,
+			 <12000000 0x1>;
+
+		/* Default setting: lowest supported voltage. */
+		gpios-states = <1>;	/* Default GPIO state is HIGH, so 12V0 out */
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&reg_backlight_en_level {
+	gpios = <&gpiolvds 5 GPIO_ACTIVE_HIGH>; /* SEL_EN */
+};
+
+&reg_backlight_pwm_level {
+	gpios = <&gpiolvds 4 GPIO_ACTIVE_HIGH>; /* SEL_PWM */
+};
+
+&reg_panel_bl {
+	gpio = <&gpiowifi 0 0>;
+	vin-supply = <&reg_panel_bl_supply>;
+};
+
+&reg_panel_vcc {
+	enable-gpios = <&gpiowifi 4 0>;
+	/*
+	 * MP2328 voltage divider settings:
+	 *   R1=51k1
+	 *   R2=9k09 with optional series Rs=5k62 (5V) or Rt=2k21 (12V)
+	 *
+	 * 1 / Rx = (1 / R2) [ + (1 / Rs)][ + (1 / Rt)]
+	 * Vout = 0.5 + ((R1 / Rx) * 0.5)
+	 */
+	gpios = <&gpiolvds 2 GPIO_ACTIVE_HIGH>,	/* 5V */
+		<&gpiolvds 3 GPIO_ACTIVE_HIGH>;	/* 12V */
+	states = <3300000 0x0>,
+		 <5000000 0x1>,
+		 <12000000 0x2>,
+		 <14000000 0x3>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
index cb28cf1cdd23f..c284edfa1f4c8 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc.dts
@@ -30,11 +30,8 @@ memory@40000000 {
 
 	backlight: backlight {
 		compatible = "pwm-backlight";
-		pinctrl-names = "default";
-		pinctrl-0 = <&pinctrl_panel_backlight>;
 		brightness-levels = <0 1 10 20 30 40 50 60 70 75 80 90 100>;
 		default-brightness-level = <7>;
-		enable-gpios = <&gpio3 0 GPIO_ACTIVE_HIGH>;
 		pwms = <&pwm1 0 5000000 0>;
 		/* Disabled by default, unless display board plugged in. */
 		status = "disabled";
@@ -86,9 +83,6 @@ reg_panel_vcc: regulator-panel-vcc {
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
 		regulator-name = "PANEL_VCC";
-		/* GPIO flags are ignored, enable-active-high applies. */
-		gpio = <&gpio3 6 GPIO_ACTIVE_HIGH>;
-		enable-active-high;
 		/* Disabled by default, unless display board plugged in. */
 		status = "disabled";
 	};
@@ -116,7 +110,7 @@ reg_usdhc2_vmmc: regulator-usdhc2-vmmc {
 		enable-active-high;
 		off-on-delay-us = <12000>;
 		startup-delay-us = <100>;
-		vin-supply = <&buck4>;
+		vin-supply = <&buck4_reg>;
 	};
 
 	sound {
@@ -152,19 +146,19 @@ watchdog { /* TPS3813 */
 };
 
 &A53_0 {
-	cpu-supply = <&buck2>;
+	cpu-supply = <&buck2_reg>;
 };
 
 &A53_1 {
-	cpu-supply = <&buck2>;
+	cpu-supply = <&buck2_reg>;
 };
 
 &A53_2 {
-	cpu-supply = <&buck2>;
+	cpu-supply = <&buck2_reg>;
 };
 
 &A53_3 {
-	cpu-supply = <&buck2>;
+	cpu-supply = <&buck2_reg>;
 };
 
 &ecspi1 {
@@ -405,8 +399,8 @@ sgtl5000: audio-codec@a {
 		reg = <0x0a>;
 		#sound-dai-cells = <0>;
 		clocks = <&clk_pwm4>;
-		VDDA-supply = <&buck4>;
-		VDDIO-supply = <&buck4>;
+		VDDA-supply = <&buck4_reg>;
+		VDDIO-supply = <&buck4_reg>;
 	};
 
 	usb-hub@2c {
@@ -454,7 +448,9 @@ pcieclk: clk@6a {
 	};
 };
 
-&i2c2 {
+i2c_display: &i2c2 { };
+
+i2c_feature: &i2c2 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default", "gpio";
 	pinctrl-0 = <&pinctrl_i2c2>;
@@ -527,7 +523,7 @@ pmic: pmic@25 {
 		 * MIMX8ML8CVNKZAB
 		 */
 		regulators {
-			buck1: BUCK1 {	/* VDD_SOC (dual-phase with BUCK3) */
+			buck1_reg: BUCK1 {	/* VDD_SOC (dual-phase with BUCK3) */
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <1000000>;
 				regulator-ramp-delay = <3125>;
@@ -535,7 +531,7 @@ buck1: BUCK1 {	/* VDD_SOC (dual-phase with BUCK3) */
 				regulator-boot-on;
 			};
 
-			buck2: BUCK2 {	/* VDD_ARM */
+			buck2_reg: BUCK2 {	/* VDD_ARM */
 				nxp,dvs-run-voltage = <950000>;
 				nxp,dvs-standby-voltage = <850000>;
 				regulator-min-microvolt = <850000>;
@@ -545,47 +541,47 @@ buck2: BUCK2 {	/* VDD_ARM */
 				regulator-boot-on;
 			};
 
-			buck4: BUCK4 {	/* VDD_3V3 */
+			buck4_reg: BUCK4 {	/* VDD_3V3 */
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 				regulator-boot-on;
 			};
 
-			buck5: BUCK5 {	/* VDD_1V8 */
+			buck5_reg: BUCK5 {	/* VDD_1V8 */
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
 			};
 
-			buck6: BUCK6 {	/* NVCC_DRAM_1V1 */
+			buck6_reg: BUCK6 {	/* NVCC_DRAM_1V1 */
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
 				regulator-always-on;
 				regulator-boot-on;
 			};
 
-			ldo1: LDO1 {	/* NVCC_SNVS_1V8 */
+			ldo1_reg: LDO1 {	/* NVCC_SNVS_1V8 */
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
 			};
 
-			ldo3: LDO3 {	/* VDDA_1V8 */
+			ldo3_reg: LDO3 {	/* VDDA_1V8 */
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 				regulator-boot-on;
 			};
 
-			ldo4: LDO4 {	/* PMIC_LDO4 */
+			ldo4_reg: LDO4 {	/* PMIC_LDO4 */
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
 			};
 
-			ldo5: LDO5 {	/* NVCC_SD2 */
+			ldo5_reg: LDO5 {	/* NVCC_SD2 */
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
 			};
@@ -650,7 +646,7 @@ &usdhc2 {
 	pinctrl-2 = <&pinctrl_usdhc2_200mhz>, <&pinctrl_usdhc2_gpio>;
 	cd-gpios = <&gpio2 12 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
-	vqmmc-supply = <&ldo5>;
+	vqmmc-supply = <&ldo5_reg>;
 	bus-width = <4>;
 	status = "okay";
 };
@@ -661,8 +657,8 @@ &usdhc3 {
 	pinctrl-0 = <&pinctrl_usdhc3>;
 	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
 	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
-	vmmc-supply = <&buck4>;
-	vqmmc-supply = <&buck5>;
+	vmmc-supply = <&buck4_reg>;
+	vqmmc-supply = <&buck5_reg>;
 	bus-width = <8>;
 	no-sd;
 	no-sdio;
-- 
2.53.0

