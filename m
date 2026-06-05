Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B1C4D8D9D
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 11:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780659490; cv=none; b=VpUTZfMHbM3hSdIa/F7rXyp012LlcpScoq3Tc/18UELP0twed29UWJB8ZggYrvkKnsCW3fB9iCx4UF/23ZOEixYLOIE3ZuUgY7OeYSMxwQLmzYxa0ToQnA4GaCWQLLJAw3fnzDMft6SIBAdeUa0ZwZA0yss13TlZ5Pv3tyrAQtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780659490; c=relaxed/simple;
	bh=+Z1AS70xH1g3nSzkBrXOCRlYByo0ZRJRM5L3O1Uetbs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmE1qoZjI9EWqWkRnC1z8CIh8uDLSTtigW8mLlPN9V/vCqk0BmdKjh61yR23qt4IES3WsNCYeLkCPS6BLrRj61GdNbexTEN55kjN9I265LWy9ogVpp5AmtyPJqa5dBFTkBn2+3cUhOFaXs50sn230nldE8hTMKYeNcUpfVobf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGbh4pGv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGbh4pGv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-46013161068so902602f8f.2
        for <imx@lists.linux.dev>; Fri, 05 Jun 2026 04:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780659487; x=1781264287; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/bPH9nJO/zmP9XNA7k/eJKg93awmo1tL5WymrDFCak=;
        b=OGbh4pGv9BU6OSeOW/IzEJ6awpeZO7yLoDU2cz5hyaW7yT+ygsv2b7qqTrTkk+dqih
         SaRUBoN1dZqmm24Cp/rrUn8vHlBJ5ZdiuSP0EsukC+UOA7gODTvv6ZYiPxZp+2vG0XGW
         5wOCP+ZI/CT0+dxcYErNeh1O5+gkep4NxwzNcpDN4QTLak+Wd918NnyqeCny7HB2PG4a
         dcje1CAu6E+rp+eT7wdf7swqDG7BamsMMUIpewSbCUmig5gFYyCFPHSfa0qKwBuA3XoV
         +MAALaK7pwpLFCTCFtBAlvoEwrKpSJW1pdt/puxzt5l6Cj91TTjdcp3A4+PJ6fkZopa/
         E85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780659487; x=1781264287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9/bPH9nJO/zmP9XNA7k/eJKg93awmo1tL5WymrDFCak=;
        b=o2TLcVw3Osw/rdCjWBS0kvDHqzrAThlSO3BbmhuHcuwRR6v0ZdrHlh1rzVEHnKISVn
         LkJNDXaPC2PUGMWtT+c+iqyto7J3yFmYY9vPaUNop9Ri9pr5RwVCerNYKXCxhyv05in8
         txoLH/ziPcQA33/ZqS0oI1rqylfnVhCPAhuC+Te5NWrlipDGc4n/n45pktqUx1/tz/sM
         sw+kO5Nv14p4kXfbppxaqshDlzKTQQEU9FcPZkE2ltCFX7+aRkjPYI9x0L/1cUQkRsxy
         t21RFPFaQwhPtlLanBUvGMMNCnRaxftR0ofjfmTOOZOb//QAcykpNAvFnJrHoCeF/gqj
         5qOA==
X-Forwarded-Encrypted: i=1; AFNElJ8I0R8ZY91/aZ1ArZdOawpMmnnZBsNc/QM28+J55uPR+fPfcLo2Tkk/gMq32K6egwzsuC0=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi3719SERNMw6bdEhNduteutbaYOjbImXZsXgeTF1m/67ECR/c
	Nlfvz9DHhYOY6zdDBK5iKXuKN6qEjW/A/gmUI3sMyBNccNYEo8d5ZKAO
X-Gm-Gg: Acq92OGBSGSXmBG76XY/nbvlDcmq2qID03XkNRil7SDS/Mp/vojBZuKY9A4OoZagtlg
	JRpi7ilenWNNd3NmbUjE8x8T8zOgav8tDXQlpO66zNfKbDYHrPuhrTAHHWQfX1QVSSlpFHWnSb8
	J8/GP79EXfKW+KN59Iyl8a+p0LrmzbuYPWogfIhtezvwoga7446269dUVyxgopgiilvMpJUny/g
	e8FCTJ7X//p6IYP1omuVgUNlNrTZWOeoEbHBr+fZFEj50/Se/kDY7LQ+dmrycxR7cnh9b4yhTFi
	7eBSK1DblniAWDu0fJ9cvop9gfIqN+yuLx6KEyo4HROnU4eVONWbDoo5D6QHXh5BwS4ZeBhUZTM
	R8yHZ7+OBY2THZhKvh+wiLiCiX+V/VG27PuN1vdruRUIyoIRfV0K4SxLGXlXEukS4iN9pss1gW0
	mUIwe9rG4AI7y6XbNogngEkX5zqwmABVfabUqJO4EjTGBUhQT7dG9qBTZ2r3Jv
X-Received: by 2002:a05:6000:2081:b0:455:fbb:28bb with SMTP id ffacd0b85a97d-4603075f442mr5402974f8f.35.1780659486770;
        Fri, 05 Jun 2026 04:38:06 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46028a6dcbdsm15262439f8f.7.2026.06.05.04.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 04:38:06 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@oss.nxp.com>,
	Francesco Dolcini <francesco@dolcini.it>
Cc: linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/4] arm64: dts: freescale: add DT overlay for MX95-15x15-FRDM RPMSG usage
Date: Fri,  5 Jun 2026 04:36:21 -0700
Message-ID: <20260605113621.1479-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
References: <20260605113621.1479-1-laurentiumihalcea111@gmail.com>
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
index 03988f0eae30..dba191a2f790 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -637,6 +637,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx943-evk-sdwifi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-ab2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-frdm-rpmsg.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-frdm-pro.dtb
@@ -658,6 +659,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
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
2.43.0

