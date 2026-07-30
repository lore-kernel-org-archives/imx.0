Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBE144C66F
	for <imx@lists.linux.dev>; Thu, 30 Jul 2026 16:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785429333; cv=none; b=MNE3abQBk/48P8GLxwDZzrPlYLLsLOd+OHP0fsNOKmCjWS/4UzrctyvBGyFyxOclUmA0N3HrBbTUVThTcYlZ5YKozTmGSeRmnhherv5JMc2Fdml7s+b3IBDllWnGDklrRkvd739rX0IDqTJQpsdERs4mmgZSGrE/2jzMKF6Wbow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785429333; c=relaxed/simple;
	bh=kuGy2C+TsQWsScNzk2IT+jSBO4cKZ8il/wZBfLzIWXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRpl6i5+BRTWp3o5Td1D39zod0erO+ZbnKQR2FX70PDGj+/mDVb/G64VqpaDJ5cXgo5d1X6N2IK5RZODAoaJglFW4Pb360MTsGxA40k7Nt0POWlQq48Ls210uQ08KPXl9wkGI1g3sltWfLP0mMLdIlK6bmDn4P85A0LHpe8rdrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hh9bL5e3; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hh9bL5e3"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954afac04bso26369215e9.0
        for <imx@lists.linux.dev>; Thu, 30 Jul 2026 09:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785429330; x=1786034130; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kJhL3RsYBYDwWZhud+U9+49c/408+YK8Ri5w8J9rOB0=;
        b=Hh9bL5e3y1YzUmNn8vi5VCWImDglMBSZbcX8DvJfRC5b/dV3rj6fxEpqHuD/16UEU9
         9flWmc4noARp0kM8uqqQzWcuvnWZnWPEn5PD1/9n8iJznaFOc6fyi8n79zGEtediorMe
         9PMjuBxXigxix8Rg/TA9Kqj64kzTG4Rok59MQD398lweErqfq3Mqi7QjN1SBFge8dxZw
         Pzu7r4/fSq/TL18HDXuspeu31zpfv+MvrQMz9hQ7ZCxmi51+U2HYgOCWN+JEKTBDnQNt
         GbKeMXlOHojKt6HChhzEEDO0UYyNKctIyI1ZJeNaRJpOw1S+srZAxCvIlucxhn5L9yoI
         jAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785429330; x=1786034130;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kJhL3RsYBYDwWZhud+U9+49c/408+YK8Ri5w8J9rOB0=;
        b=JgrWCFkCkhHCQp8HWALvpBAYQJvc7a656FkMcXmdwr9RetPtZS3Ctmeh1WbkUq9d6o
         pzC5bRklrXzkj2utl3z9DdF3N7sxSMau1lYFYC2kMaABsQnBHLk9WmkrLtPYraBnWBuk
         zhz7IvjCVttH5QxB7YViMN9Tb8bsPsH4Jm3Aw5HgL7/EcPOj1utzLlu1B8U0scShxNXZ
         jkY7FsJIldv6cQpkUXjWZc/Q6ygi1bJWQqFG/F5iZwkDmj7eDDzloX5SZgmFunqf+gBZ
         F8sMJbMuICLntxTOj/4jdUMFd1yCPFMcqC1AdypvesV4cgv8pLLQnIPOxRZLA9EWodRo
         W82A==
X-Forwarded-Encrypted: i=1; AHgh+RpZmMNghrqEsr+mxm78Hw6BIejA8/sQkZDBh7qE+mBcMEyDKznAAxHkyvQQF/qbfwCnno8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzTQHn/4oGdQHE0xXfS1GIItIvidN45ZqpLgh1/SHT7Mxq+J/Ch
	Hy+Te5ABrvKP4ToRC7i+xgrjN+4HGGo8Kqg+wVuYHMIlOEP4TIX+tr4H
X-Gm-Gg: AR+sD11fG1d3qSs3ekBwsa5A1IxwlHq+arhJhHjZu4+7adl4egiqJABteocEwmIgCJg
	nQRas+kNeWXNKcwoq4m6MntGncVGI031yfcCztSTxQRiLDpRU3V+3JJg7tzeHX0oL5MFm65Nae6
	jikbXVDmhf1QTMu1zGSq15L+8OiGC+zl4tpyp6XgmgNc4tYyondY9i/sMvr3xNIQTyWYGvaEFRA
	QXgFBxIu8U53I8GDWdj9w9TMvA3K7iMKbmAkCE6SdrPeU4FEoXPG/30iuEHQQbdlzWHdRqVRnOe
	Hc8CNiFcy0kdOuscWMJd1GLUqg2xc/VZmYW+J/ucl55mPOAC+K6Tg27aRl8tbN8vRwDSXSVJdv1
	WBtAIdc7iCLEKP+JqFqIaJU4p0qgKsB79x40y15E3WkHJHY/RQhHUtRtYetRDsmHnMd7qio0VTc
	m0wmGReFRLxaUzsMH3bli6cuHpbAWNgz9GYHSU5FAPJVGj3Sz5li7/AM6oo+GKKG4e99Ekc4eil
	p9VgdHOGHgKSg==
X-Received: by 2002:a05:600c:1987:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-49800ea99b0mr45414735e9.18.1785429329577;
        Thu, 30 Jul 2026 09:35:29 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fc892cdeasm7758445f8f.22.2026.07.30.09.35.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 09:35:29 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
Date: Thu, 30 Jul 2026 09:34:12 -0700
Message-ID: <20260730163412.1145-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add RPMSG DT overlay for the MX95-15x15-FRDM board. This overlay is meant
to be used with the mx95evkrpmsg system manager configuration for
remoteproc and audio over rpmsg-usecases.

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 67 +++++++++++++++++++
 2 files changed, 70 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 95ae85ab4adf..3f98132f5a32 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -707,6 +707,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
@@ -729,6 +730,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
new file mode 100644
index 000000000000..bc02864c6f88
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 NXP
+ *
+ * This DT overlay is meant to be used alongside the mx95evkrpmsg SM
+ * configuration for remoteproc and audio over rpmsg.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		memory-region = <&vdev0buffer>, <&vdev0vring0>,
+				<&vdev0vring1>, <&rsc_table>;
+		memory-region-names = "vdev0buffer", "vdev0vring0",
+				      "vdev0vring1", "rsc-table";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		vdev0vring0: memory@88000000 {
+			reg = <0 0x88000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: memory@88008000 {
+			reg = <0 0x88008000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0buffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
+	};
+
+	sound-micfil {
+		status = "disabled";
+	};
+};
+
+&edma1 {
+	/* reserved for M7 */
+	dma-channel-mask = <0x40>;
+};
+
+&edma2 {
+	/* reserved for M7 and V2X */
+	dma-channel-mask = <0xf>;
+};
+
+&micfil {
+	/* reserved for M7 */
+	status = "reserved";
+};
-- 
2.53.0

