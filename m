Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB4B17C7CC
	for <imx@lists.linux.dev>; Sun, 27 Oct 2024 22:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730069857; cv=none; b=qWsbfPezJNuhW+fqgH30pLIKS4ufBqJBMF5NsoCoGVfrDE6ST3B2Xjz6j6qrTRF7e7XjzLvbegpmAjKzwPuNCaXOEwsOxrNXvXtOZ13TmrMChRYFyz01p8oqsgLqZr0JawQThVdgGHfNPV01vBQ8PV9WbOMo4kaVLjR/c0O9Et8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730069857; c=relaxed/simple;
	bh=hpQ1kENVEqtKc8RKiPUelfaIDKuTSn4e8AzK40FjTx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ml+4JOjyiz7BOnrvZttLkcwW2h5u4dt1xHGcGfjuxGoD9G+LDyxuDo+qceK97r5Qi3X8cL+34VjaZwmlhKzmTPlq6GKQkUlNggSpQYFAFjF632fMAwCvNzClcYoovC19o0d63wwcV/bJo9rVtJFtvY5VIrNF1lP6RbphZo95RPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBd/mYgA; arc=none smtp.client-ip=209.85.217.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBd/mYgA"
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-4a46f36158cso1328620137.2
        for <imx@lists.linux.dev>; Sun, 27 Oct 2024 15:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730069853; x=1730674653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vgy3VGk1Pn11Ai88JL42MQBwi3PPMEdh/Mp+3wfCo1k=;
        b=JBd/mYgAYPf7jaoma2M9eWGxVCkV0q/SO+QVa4hlHQzgdma/+/0QCKCUo+dyXpVlmF
         ljXmkJotfHdjlhBMDKgX3FwmPVUkpLqCzxvVer/Vj1B6F0iBCBsgtnN8EwFF4R2gonr5
         0ep4rqzPidFh5Ey7iIpGLv26yUcIN/4TEnu9iKOvM4ACQuYypBc/cGS891SDjYMg2JCu
         +3ujTzwk5e/M9OA/rRj+bWBLcA1U1SxwwPEeZEzmRS0Ro+xB6hJO7E/W/pEeHSETxFD9
         /sK62KkcceZGsaKUOYSr1TINZkHbMLPFMOQOSr6VOTd/tQf0gNfPSPx/h5kEZlpL9PWO
         BhpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730069853; x=1730674653;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vgy3VGk1Pn11Ai88JL42MQBwi3PPMEdh/Mp+3wfCo1k=;
        b=MZlea9belgBA0Aq96SU7z6Pkr3DaMxsW6HXichiD95Bz7+gNoTIxCQ6OeXGbxSEpCs
         CAMbdpZDy4EabV7xtTFo7ANX+RQrrHE6eZAQ2+EVK9gWlg2UhY3SJiv0+JmRWTKhAByD
         boxfRA0PCR26TpVNJMXnJxKfnCyTXLr78fgWrXm3KpU3BXQVH3c7V//HLkQiGPb82sxX
         jRAlXi4wl41ZlHdky/CbTj5N3HpHitH5LzQN7+mMN2CLRo7eRuyJBcfntcs9ghgin8Bz
         MfxfcHdSH1LdUrwcrV4UASX5tALKsERuptPHyaKdXAXLT4kRHrmllulRtyzgCkKQ30NY
         uKSw==
X-Gm-Message-State: AOJu0YxXyoMTw3rtTFN+BC4TZX85Dndp3jEmsSaN/YkZRvLanSYVjY/s
	jAkyNBaTwZZRzBoUXkSk+31h4ryzudCURtxS8PGoIJenAJI1aY/Y
X-Google-Smtp-Source: AGHT+IEp5GS5n0x05w29XQotioDngzTwdv1OubJphqMniSQH5Is15OR/44MN0WnwiCxIyQF01R4TOg==
X-Received: by 2002:a05:6102:a4a:b0:4a5:be31:b349 with SMTP id ada2fe7eead31-4a8cfd6d248mr3458945137.28.1730069853086;
        Sun, 27 Oct 2024 15:57:33 -0700 (PDT)
Received: from localhost.localdomain ([2605:59c0:1487:f210:963b:c209:74fa:42bd])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-85580b18374sm819159241.26.2024.10.27.15.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 15:57:31 -0700 (PDT)
From: Gilles Talis <gilles.talis@gmail.com>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	shawnguo@kernel.org,
	devicetree@vger.kernel.org
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	festevam@gmail.com,
	Gilles Talis <gilles.talis@gmail.com>
Subject: [PATCH] arm64: dts: imx8mp-navqp: Add HDMI support
Date: Sun, 27 Oct 2024 18:54:08 -0400
Message-ID: <20241027225408.195475-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI connector on the board is a micro-HDMI (type "d")

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 .../arm64/boot/dts/freescale/imx8mp-navqp.dts | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts b/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
index 5fd1614982cd..4a4f7c1adc23 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-navqp.dts
@@ -18,6 +18,18 @@ chosen {
 		stdout-path = &uart2;
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "J15";
+		type = "d";
+
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -85,6 +97,28 @@ ethphy0: ethernet-phy@0 {
 	};
 };
 
+&hdmi_pvi {
+	status = "okay";
+};
+
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			hdmi_tx_out: endpoint {
+				remote-endpoint = <&hdmi_connector_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
 &i2c1 {
 	clock-frequency = <400000>;
 	pinctrl-names = "default";
@@ -213,6 +247,10 @@ rtc@53 {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &uart2 {
 	/* console */
 	pinctrl-names = "default";
@@ -279,6 +317,15 @@ MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16				0x19
 		>;
 	};
 
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c2
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0x10
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x10
+		>;
+	};
+
 	pinctrl_i2c1: i2c1grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL					0x400001c3

base-commit: 42f7652d3eb527d03665b09edac47f85fb600924
-- 
2.43.0

