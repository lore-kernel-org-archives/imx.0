Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AB3233B6EF
	for <imx@lists.linux.dev>; Tue,  3 Mar 2026 12:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772540034; cv=none; b=m+PwjNpqXGW5I8Hj11U5TayN/1LzYlbW4WUkrMdPrrTSHW49kYVly8m0A+7ICO2h3lF4f5GY8wTsWR+rvaKhkkIl8A34U3Ec5+8xL/hrM4wOAzJQYcXtZAH04aTKFsXF3jmN8/4phPOvGd6fLf0kUkavALhhs+PBrbgzrVZe3dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772540034; c=relaxed/simple;
	bh=iaaMMI/k7WQJvHt1nbIJyR0XOGadyN9uqrto12B+tb8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y9re9usrSdpr4JrgZovIDiVkMZaHCRAJ2Wbi1WCDF8ycGOaYBCMfr6sSZ/08SEJDTsTmN3yN1wR37Q2iV0HU1HB80ZNm/rt4hEhikwRfye6Y8I1v7br7OyLGkLXEMWeA3sna7I3EGi2wQlSU9vSGP5C67NGB1k0sAzYRmf3Cxlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9OHjrUD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9OHjrUD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4836f4cbe0bso47822495e9.3
        for <imx@lists.linux.dev>; Tue, 03 Mar 2026 04:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772540031; x=1773144831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gqNb2+lvfz7Zcwb57rdSTxDdzqT6Z0aXOwyE7epiZnM=;
        b=V9OHjrUDCvcxhNWIPlVfSoxmNlWk8AqEI1F/UqL5DJ6l3jbDpLWCXd61aiUQFgIrk7
         RFb5saYtLLlX4mGOlVE8FPQMXY9NcAzF3e9d4JeI22koi1qLISKtpAL3t6ssOQoRjREw
         JnkxD7g/b2uHZoatwk5imS7a3T7kgvPlxO16Hx5iASliKAVR4qLBNMZw7CTGZHnFFwMG
         X5br8snqWwb0XOxw/k5yHBHKAUdemv+0q/1NWdUHUfJkQ3ZyBw4ygcSoNYTSwEdcL6r9
         4P1dtqTdd7l9bIYYkyFt7JE+NitO+UHbFJWdRtOs/tezlXAY9g005gJzazeN6pWn7Q6j
         2IXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772540031; x=1773144831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gqNb2+lvfz7Zcwb57rdSTxDdzqT6Z0aXOwyE7epiZnM=;
        b=bqHDHZsz/Wy0sUvXQ1M9tbv63/1q9wp3UTyXf1StFW86y8AcpykZKvOxok7tqXF5HO
         TWmLfMuAnVvEwP5zsGDsFoVZ8AXIneRETbmL3UXkvcNmf/+pkq3kkVa87ZoVOhFpj9eE
         BZuz6VbIiSusfXXK8/vfsE55K3AhHDZzbXdSZaL44MVGW72BLfLrW9yLBF2C5YiWrIjn
         vKOLZbyT6PsaOoanaA9cgk1SvGR0ZNRXYARMsh8SYRYpPGq+CzVMOdYz1c4geUzxuuip
         +s+WF16a5EWbMynuXskgOc+/blFpwKmdSfBbi4TlKex6SrpfGrYPF9qNV2lHBUqGZEzp
         d/Qw==
X-Forwarded-Encrypted: i=1; AJvYcCUz8yAQk83mO3VPdRpGZsYR14/jZdNkFtHZdMRN6L4nuvlvuW4DH9Y2BN3o6ERqnG4SG9M=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9iRh1mJf21sR+tkUi6+oPGbmHjetYetvEPuvTYFvXSYjiOnhg
	qCztcAXH5UmQVzxTvRR+qP2XtTwLYmw2HaUrOK3dW9ZawWzXlNZ2p4dU
X-Gm-Gg: ATEYQzxBYB1tbtj5nDvCPLFG4RI8SgCmILZTvfgdew/UHY2od8yAT0pPF17gPMxVPjM
	QsohgBbRxiuEsA0RHY/t8ymwwL/mC9CE89Bi1RKelzqwM1gRKutDGgd982PmwhqmXH7Jj8FOren
	TLTW1UqIZOgAYlGDC5nbaDSQYFUWlE6mMOaPMzIn/bH3HtVDhDB1cKJOaihTUyjpA6rBvMIxLVc
	nI2jbUvvSyZgub2IQDYPSqrBValdu6oABRL/gw9frxg/Zm/GmfSURT1HhhzcLc75GORaaXZAD4c
	hBYEzDR4b7iQbied3p64B7hmGiNZbi27KSdHh58lDstFLTsTACKGyNEkfqDuoRkFxEFnd8xF7t0
	nko300tYhDONXn5HoWoSHKmjTCcfuZ41LV1c+5ZvlQ72zcxLYCMeaXcdCNOKM3/JIMvxpBlFB6i
	h5pKTqEmR8IgzIFz7gv6ROZ0PpkD95atOZ8bNJafqPllyiM9qHA8o28xK/APSXmWkhtMfdMMmw9
	Tsgd+bbbnmXZJtC
X-Received: by 2002:a05:600c:4fc8:b0:47b:e2a9:2bd7 with SMTP id 5b1f17b1804b1-483c9beaca0mr330124105e9.19.1772540031180;
        Tue, 03 Mar 2026 04:13:51 -0800 (PST)
Received: from emanueleg-nb.corp.toradex.int (93-34-120-147.ip49.fastwebnet.it. [93.34.120.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c75b272sm33572593f8f.24.2026.03.03.04.13.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 04:13:50 -0800 (PST)
From: Emanuele Ghidoli <ghidoliemanuele@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: dts: freescale: imx95-toradex-smarc: Support Cortex M7
Date: Tue,  3 Mar 2026 13:13:06 +0100
Message-ID: <20260303121324.1576841-1-ghidoliemanuele@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>

Enable Cortex M7, the vring nodes, a mailbox and reserve DDR memory for
the M7. The remoteproc framework is so capable to load and run the M7
firmware.

Signed-off-by: Emanuele Ghidoli <emanuele.ghidoli@toradex.com>
---
 .../dts/freescale/imx95-toradex-smarc.dtsi    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 5932ba238a8a..77c4a6dee098 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -42,6 +42,16 @@ clk_serdes_eth_ref: clock-eth-ref {
 		enable-gpios = <&som_gpio_expander_1 13 GPIO_ACTIVE_HIGH>;
 	};
 
+	cm7: remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu7 0 1
+			  &mu7 1 1
+			  &mu7 3 1>;
+		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
+	};
+
 	connector {
 		compatible = "gpio-usb-b-connector", "usb-b-connector";
 		/* SMARC P64 - USB0_OTG_ID */
@@ -156,6 +166,42 @@ linux_cma: linux,cma {
 			alloc-ranges = <0 0x80000000 0 0x7f000000>;
 			linux,cma-default;
 		};
+
+		m7_reserved: memory@80000000 {
+			reg = <0 0x80000000 0 0x1000000>;
+			no-map;
+		};
+
+		rsc_table: memory@88220000 {
+			reg = <0 0x88220000 0 0x1000>;
+			no-map;
+		};
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
+		vdev1vring0: memory@88010000 {
+			reg = <0 0x88010000 0 0x8000>;
+			no-map;
+		};
+
+		vdev1vring1: memory@88018000 {
+			reg = <0 0x88018000 0 0x8000>;
+			no-map;
+		};
+
+		vdevbuffer: memory@88020000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x88020000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 
@@ -572,6 +618,10 @@ &lpuart3 {
 	pinctrl-0 = <&pinctrl_uart3>;
 };
 
+&mu7 {
+	status = "okay";
+};
+
 /* SMARC MDIO, shared between all ethernet ports */
 &netc_emdio {
 	pinctrl-names = "default";
-- 
2.43.0

