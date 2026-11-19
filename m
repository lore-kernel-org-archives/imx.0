Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795069388;
	b=Vw483F+PNInGR61iyORRHvPgjA0Z5hrAaCF5TElFURaxTTOY9zaeY5nzLnstsMdrJMaL
	 0PyLLKvcANgPCUrif9fCrcVnrYw94rFNM+ttt4njyaAhM2QdiM1fa5NG1yoGk5z2QlPKD
	 gUvgRMre8a9OarGxtolzRz8V5DWGpjZdITQgTRG4r+0fna2RJb4jLuZ5M08QGdBx7OUFs
	 n6WuMuypF7KfThgmwVW+XteYByYogSaOltdgKZGqCkq2tHinPApdzz9NlYO0hk3zcppu/
	 +O0pEMXtX3O1KBsxzSPbdFWMTtZ5zob4qzjGDNLiM1NKJVd/1Is61z+Oqqv0K0UmS1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795069388;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=;
	b=HhzGGuj8eT7IAHUE1hBV+Y+SnW9Zc9IFfKffwL/dcbTrYx+nQA9nXytIyW5ZSxUptKk9
	 Oz9K8IlxpSrk9tULSR6ol/H5/2Wro5OywaGj0GIa30mCOrHjZ2tUd0qPKjskQ6mphhKre
	 6nEPNScjUICHTsXHPxiIyrMTMEeyZ0iDT8b/wOez4QdDAtU5bvuWPKOy5LAcwZwJq7svr
	 JuPVo0d86uZHbvWLYvvrWY9PwXMYpRrJ0lsIOP3te5KckNkstgzhfCJ6B5v5kojgTA7TZ
	 imIi4/6UcuH3JfyxpUhzUK6S2r4yp+IgZVx75CstJ0ci9g+IdFM7vOAb5kr7hAVZkdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=jclark.com;
	spf=pass smtp.mailfrom=jclark.com;
	dkim=pass header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IFZvNijI;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FAA606A32A
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 06:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88FAA606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jclark.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jclark.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IFZvNijI
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e9d7791b00so19649295ad.0
        for <imx@lists.linux.dev>; Wed, 18 Nov 2026 22:23:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795069387; x=1795674187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=;
        b=IFZvNijISejbD/T/pe2iRcTdnLOKYeAEc9tX5sUj6d1w3XdUJQ8zlczKxdoFHp4/3b
         7qYer8KAevPX5lk3Qtgq4cIxvrnA7hNewAoazKVwM3Y3+xLYn97XMwnwXMBwgMOPjcTS
         1l1YGMzwv0/+6XmwvlweeL2P1Ha6q2DesIE+EcmS5Kjk10gC8oeT2131AfMvi0cb+sWq
         RHC/Ji0W2EqVS0D9PtMTPZ2gttODomo+HyUn8SAeFlXc8T1UmHtLbKmmeI63xnHPgJ5N
         rItPMBjcSHf+yo5iOFyCSh84SqyximLYT6VTfBsbD9zXx1THz5RvTLw0WUox+xdu/xmX
         0J7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795069387; x=1795674187;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vIyXTGC5+88ay5cdcjaG1P2/fm08Yk80tNUxmrQFq58=;
        b=ByF/+IiNkNB4DKPL5ULbgZav5xsbIh1A/tw5Ev5U/mE4upfb5imCHk13nJvvyQoqqh
         XFoDNFwOckul/qlfjeN6xyrTrw8B3txviItZg6kL7NGZUF9eQ7XL82Pk8qd8HM42x7Y3
         7w7rR9lNmYuH6vICqH8Iv/qtpvxYxOVLDGLVHUiTKZwwTD+Y5w+dwyTHCxxBOfoDIlIx
         0vIezzLkDwiVjtO9QBgu8rbPn9m8rp7AmPAxf6h8xRPdFfvMM2pgQ0iPtlMvYzduR21R
         fUGGcAw0XWYkcKPuMJVBIfqyPQTrPW+RFXy5XU5rgDAwqcGgp4ojxLQaJgNdOQvWso8i
         HIEw==
X-Forwarded-Encrypted: i=1; AL+hErG44OaOKanvVFsttSoVaRjcWWzA+9ep2N4Od/6vPiFXFPAUF3nyjkMKzo4lQTOuRPIcx5M=@lists.linux.dev
X-Gm-Message-State: APuU4Z+jG0obZ9c26orBWNKWpINlz++gJlvMrxYdAg6s9VRXbsQA3Gt4
	0SgSLcXkPMe22kyhZ3cCNuzCo23R6byxyh4YzkxYa9/dCzcksQqjUi4owo5o1Cdb9A==
X-Gm-Gg: AZFdTZfOfpZdid6vCy5KxyMPibJVbADCrWt5YFOKv6NBGfQ1MMED40Rq58F2yXifiyN
	z6ORZEE0uHZJPNnlawgbPEFYlPaUcZuu0TUJ9qyNcbwMDPjibYo3LuOzpShT+GCPn5qFh9DALMe
	WdrB5KXapUdjlhbCjhtAh4/mbEnmNiRwwqp3GI8JQtIuNCx3DkGRbbkSp+kgdPUO2J+4iCzMWSN
	spyPESRnJjKFDEwpBk/IVGVQwdcpoe42f+VCxbGXdAZvEJLC3GZ1UIbz5yWwXpS2Mj5MAvEFT7t
	DkbYTHmHMB1zJJyKC2A76geIC4nKs/zmIUei0emMEgIQEi1Yhdr9PpyJLkQYhnFqi3Jm1qm0eEF
	oUk0oA0RUfw9zF1Mfd3eahFUgWoQVeQpkOlMMvG0BRrGfl/u1Y+YSsEFJ/LHxHFvPwXSsGaqrAY
	6eI7YFPiiu1MQoJJb6Hm1KoJHvIrEMAX11HdMZfmYNzXL9z6PEqYYLMFbCCptK/GOcZkGOnxwH9
	XKYIfay3Ayc9htTk8wIokMnTzw4aKnNAhEIK8H+LXo0uKvIbF0ql6fmzUA2EExSH1QatcoVyWIg
	Ek7F2drrZaohupazCfrouBSoAyKK/4OV8WL3FODdHhsVUs5naYH8KNxZvKUGo6PtrcA2jSM+HS8
	Ygk8IbqgCVQ1PgH/30yKPRwAPTVwod4YREHgj8A==
X-Received: by 2002:a17:902:d48e:b0:2f0:20cc:32fd with SMTP id d9443c01a7336-2f020cc33e9mr13953395ad.51.1795069386749;
        Wed, 18 Nov 2026 22:23:06 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff627f421sm24292605ad.57.2026.11.18.22.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 22:23:06 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-frdm: Add overlay for EQOS PTP event pins
Date: Thu, 19 Nov 2026 13:23:01 +0700
Message-ID: <20261119062301.1778558-1-jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
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

On the FRDM-IMX8MPLUS, pins 13 and 28 of the J18 expansion header are
wired to the SoC pads GPIO1_IO08 and GPIO1_IO09. Very few boards
bring PTP event signals out to a header, so this is a valuable feature
for PTP work. Add an overlay that connects the two pads to PTP event
channel 0 of the EQOS Ethernet controller:

  J18 pin 13 (GPIO1_IO08): ENET_QOS_1588_EVENT0_AUX_IN, external
                           timestamp input
  J18 pin 28 (GPIO1_IO09): ENET_QOS_1588_EVENT0_OUT, periodic output

The input must be EVENT0_AUX_IN, not EVENT0_IN: the stmmac driver
timestamps external events with the auxiliary snapshot; with EVENT0_IN
no timestamps are captured.

Tested with pin 28 wired to pin 13: a 1 Hz periodic output on channel
0 was timestamped on external timestamp channel 0.

Signed-off-by: James Clark <jjc@jclark.com>
---
I used an LLM coding assistant to help prepare this patch.

 arch/arm64/boot/dts/freescale/Makefile        |  5 ++++
 .../dts/freescale/imx8mp-frdm-eqos-ptp.dtso   | 26 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index cfd548284358..5cdad9dbda8c 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -633,6 +633,11 @@ imx8mp-evk-flexcan2-dtbs += imx8mp-evk.dtb imx8mp-evk-flexcan2.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk-flexcan2.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
+
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm-eqos-ptp.dtbo
+imx8mp-frdm-eqos-ptp-dtbs += imx8mp-frdm.dtb imx8mp-frdm-eqos-ptp.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm-eqos-ptp.dtb
+
 DTC_FLAGS_imx8mp-hummingboard-iiot := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-iiot-panel-dsi-WJ70N3TYJHMNG0.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso b/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso
new file mode 100644
index 000000000000..15d0efc30243
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm-eqos-ptp.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Overlay for the NXP FRDM-IMX8MPLUS board: connect PTP event channel 0
+ * of the EQOS Ethernet controller to the J18 expansion header.
+ *
+ *   J18 pin 13 (GPIO1_IO08): external timestamp input (EXTTS 0)
+ *   J18 pin 28 (GPIO1_IO09): periodic output (PEROUT 0)
+ */
+
+#include "imx8mp-pinfunc.h"
+
+/dts-v1/;
+/plugin/;
+
+&eqos {
+	pinctrl-0 = <&pinctrl_eqos>, <&pinctrl_eqos_1588_event>;
+};
+
+&iomuxc {
+	pinctrl_eqos_1588_event: eqos1588eventgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_GPIO1_IO08__ENET_QOS_1588_EVENT0_AUX_IN	(MX8MP_PULL_ENABLE | MX8MP_HYS_SCHMITT)
+			MX8MP_IOMUXC_GPIO1_IO09__ENET_QOS_1588_EVENT0_OUT	(MX8MP_DSE_X6 | MX8MP_FSEL_FAST)
+		>;
+	};
+};
-- 
2.56.0

