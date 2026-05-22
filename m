Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426573D7D66
	for <imx@lists.linux.dev>; Fri, 22 May 2026 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448846; cv=none; b=pSNoErX+/F0GMvIZIQhPrhi/RwurUOmD84WQkB5nxi/jHPQeP+hgVvuNDVjeSEKPnn3jXcFqoSmolWAwMF8DXqHzwfBxHsDmOX7X/jRpTF954s5Burh8VVU3Gl9l5E4nR+GQsU3IibeY96VElXxiD8QG3fJ0Nl6qiJwUnkj8Ptg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448846; c=relaxed/simple;
	bh=1b9vA5ArOQjt25Yusb6+c/gRU0czHvJheGDMdHPu6X4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ddymKZP4X0k4KE/OQ54JMejmEoP3yco/OuA92z0+RVDPNs58NPhsdaqGa41IUadxZOM2TkjDW7Is67VrVh4Em99SjCg7qRdEikWSlEK2yYU60S400aZuJDje7ZOWLB2471jFFBjgrDgJzHZdpupLyB2Zji8/V+Gpin4zhf3bzQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fSGZLUf2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSGZLUf2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48d146705b4so77819745e9.3
        for <imx@lists.linux.dev>; Fri, 22 May 2026 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448843; x=1780053643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYSKle0N5gkhHFZVlrjMQ1yuCxunHMt9ZfrNwqt0f6k=;
        b=fSGZLUf2QThSiGuB8uYzShyPGS2KQyFkihxYZPXlMQOy+LAPLt0XWW3lZAHMbgQM8C
         TLysoEmeDYgckaB1MxMmih74sSttSUmKn5SGkMXyuH2Obuv9T+2ndcDElLh7HHWrLoqJ
         vrkK2hKYPcvWOKQ8UipgV0rA/6E+vLHgyRN2KJcfJlA/o/aYsKG/kPZnbF8rHQcO19B6
         p0DCdkH7GduFIZDpNrtZCxN0njH6YJeOfdIinYLG8+3+k023Abr1vhChDERyRl7Al2WM
         OmYRzlv62wyXl8r8QE86ogFTyYd3DyxsTy1f9jfzzJ5cD/jfr8ZaRelhyxdwSN9qRvjF
         O3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448843; x=1780053643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hYSKle0N5gkhHFZVlrjMQ1yuCxunHMt9ZfrNwqt0f6k=;
        b=K6ovX24ZaQOF4Jg137Z6HX2dxoI6rKSJ50/jmQmaj/K7NA5WKZpWWupJ2HgAkewDnK
         dsLhZfggs8nzhLu6n7q+lCUFvIapGfA1HgLLIOsYepkeV85I+JaphhHR6BwcRId8uGH0
         fzxkiB/+znmG0nnz2BWKpjh9C2oT2a/OHKEIwjaSu5d6J8+fRaJJV1qfJbUFEI+NKnwP
         /oPXYEtNo7pkb6NBvHP9n/J8tdd2tWd6vCbGxGBj/R4SZl3nSxNpZfq+da+83PnfRs56
         FchaaHLfe5Fg7OCkyqJaese4jM+swD3qglZyse+BgGCtipjkET0G5I0Cc98YSDUG6dNo
         Yhkw==
X-Forwarded-Encrypted: i=1; AFNElJ+0eoMML4RkAzVS8o8Vbnvaic95gIsMLVjEKRgtcZIorp7sHO4pvDMAVWddgxemAvwZUzI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwyrH5Yz2zj5G4ZbnLu1UyXxLoRoIaL8elH2bB2wi4Dv6Uy+RmM
	y/U/jKZzZXSXVMlCw0YhrWlWVKX8yelkRLgmLzfaETFWRIzk4JZeCLC/
X-Gm-Gg: Acq92OFD4X/au8JSwQrJ4RvRZkQg5BNPwqKKy5xUdHZoUjhfK/jcvMAvm0gxq7U4HB/
	FV8/XpnEjkAr6X9FI/WivgNX6GTfKHf431oWGPPiUSxI2JW5mvyXj/4zytETFgwpDeOhg+Jdg48
	6DMUSrWfZ4PCiMrIHMk4CHpf38r7pCLICsmxtDC0y92QeoflLFLz4d4kBeo1u3pmppyMubBBDxS
	OVOrTZCz1dETNCA+Gf/j82Dwp9UzOvWrN1Xq2mQyMhmuilpVW1l/Dey8vXBWODbB2bjdE2eksVG
	NItOezVGIB+F2Lj1pwxrTB5IHSLtW30nodflXlOjp9NIzTV3BBSFXB8+IgsUgxePv5n4tHkNKmq
	DPlPZ9M9+cYZ96T7jmsViLANkSxwUl6z783JiqT45+atF5tTG8Thv1BUT8ptscIyLRkGSE9xFfh
	Wolzafca5zc6Pd8ka9G1FPiwDAsGHsRRmPMi0Jeg4aq3cmkM0t98CazPKaUbOx
X-Received: by 2002:a05:600c:a402:b0:48a:f18:ece4 with SMTP id 5b1f17b1804b1-490426d3f95mr30812985e9.24.1779448842577;
        Fri, 22 May 2026 04:20:42 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:42 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
Date: Fri, 22 May 2026 04:18:49 -0700
Message-ID: <20260522111849.783-6-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
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

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  3 +
 .../dts/freescale/imx95-15x15-frdm-rpmsg.dtso | 65 +++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 513f61eb27b8..a30a99e42426 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -521,6 +521,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-pcie0-ep.dtb imx943-evk-pcie1-ep.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
@@ -539,6 +540,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
+imx95-15x15-frdm-rpmsg-dtbs = imx95-15x15-frdm.dtb imx95-15x15-frdm-rpmsg.dtbo
+
 imx95-15x15-evk-pcie-dtbs += imx95-15x15-evk.dtb imx-m2-pcie.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie.dtb
 
diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
new file mode 100644
index 000000000000..b39444dde66e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm-rpmsg.dtso
@@ -0,0 +1,65 @@
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
+&cm7 {
+	memory-region = <&vdev0buffer>, <&vdev0vring0>,
+			<&vdev0vring1>, <&rsc_table>;
+	memory-region-names = "vdev0buffer", "vdev0vring0",
+			      "vdev0vring1", "rsc-table";
+	status = "okay";
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
+	status = "disabled";
+};
-- 
2.43.0

