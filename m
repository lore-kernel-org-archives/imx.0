Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E24158540
	for <imx@lists.linux.dev>; Mon, 19 Aug 2024 23:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724109507; cv=none; b=YWbSSIIqQaOqfTm0sCcsMoQDJblGCpt0SE5dehtzB8dQi7sGndNdlI6aPxKjAmSYceqN75Eoii6AQcLIJEQr2gPqj6ASWwP5nYKQSHGLtNlk7fYXDCa0IGsKY05LjCa6myp7c3NQJ0+SV2b0VJEw3vIjcHTGR4iUs9PuIyuqgLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724109507; c=relaxed/simple;
	bh=nDkB+Ww4MYVoZoirlDdkfzPsZQSkzci2SQlq2oXxB/c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ahJgWxebWa/vrVbIiW8dbXhe2ZS4edU70qGJpDxUnAN0ClXkXoiTbCyclYgBwChJqZbloRG7GjNxwE6N4yOCOGET8nVWKEXaf02kzhfpyvDBSkEJLmGfKAAHywND5nEo3/MdExDih4BxAa2K8nsq65uJ6faJzbjcFVxu1HC2nI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eR9rmUtt; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eR9rmUtt"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-6bf6606363fso28628706d6.3
        for <imx@lists.linux.dev>; Mon, 19 Aug 2024 16:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724109504; x=1724714304; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiFnHmrt0EWkf3S/OpgimW69Fg3R9RUUTwktkVeZhYQ=;
        b=eR9rmUtterEGn0dxfdh+v+w3wBoBpEEKSBpScXBVpQMDXJOHLTPC+1PyG0gkcaps+Z
         UJigfJTME0aTFsyeIzZ7NvuorcanQp3PHevH3+SJQhMYBhfgJyTQoYkNHeNuf7pw2MKl
         0Wz42+I9+NT5daalmldSSCEI27rTlnpIrm+t9QgQhKKig66WnF0P3RnmviyckAN6UUer
         jyKMOX/BRHaDgFJp82C5qT+epx8FFDjGrkQVQUXO0RVJG0EfgpP91FcHYxlIckt9HkuK
         it7iyUP4L2XzJvuF27BFUFIhO7umsx5TvIKXs3mHFqJ9PeUrsZ0pamsLNT8kvlT2UfPf
         P6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724109504; x=1724714304;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZiFnHmrt0EWkf3S/OpgimW69Fg3R9RUUTwktkVeZhYQ=;
        b=Y3jsmy5Wj+KzDtvdsCULt1dFC16UDUp8QqRe+RWPhwWq/cXhk15oaRtEhwbwsJh3I6
         vrdhmtSNpSw+78mDk+rPjELtJ7wipINjgCiHr5GhHWWNB608HPUj4kZ3pIEaRAL7m7OE
         ap106prsbuMCBayC0aIFmcM6UjSQDZakaYBWwl+rMUuGSi1Mk2VPn17bAz0Z0L96S8LL
         KL+HDCpqaG37UZ6M8kL0kg2JvD4aQYfSHx8T5Qt/A+W5yOGGrNT2VU8T9yo23CEGsNF3
         3SOCahn0Actp4X4xwXYPEjoYnASuWpAvjrXMaQ53j6r3j+qHpS3z+3ewD9fz+3GEovPv
         vflw==
X-Forwarded-Encrypted: i=1; AJvYcCVozl1gwNMuvyC4MRJ3HUzqeDbvHb1D0q50UgvHqkmtxnIHCkPEn3hyFfHnYH70c5MQKvM=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsNwTgLOVuyqh0zJ0JlIQ44NOCiqAYjyGHJ/bHQqhIhuNStFMk
	r3rbJ+jyYyEY+i+1iajdcbKZ2b3QZn+Z7fAyu3YbN8ML5kJmWy0+
X-Google-Smtp-Source: AGHT+IHywoFpr673NReZLMMHP5xFVSycDI4yD/ui5qJSteVY+UBAFV3a3GqYKs/VWSTsB49RwMrAiw==
X-Received: by 2002:a05:6214:3c9c:b0:6b7:a6eb:c343 with SMTP id 6a1803df08f44-6bf7ce9648fmr134090106d6.51.1724109503783;
        Mon, 19 Aug 2024 16:18:23 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:ea5e:cd26:a652:264d])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6bf6fef0267sm47063786d6.113.2024.08.19.16.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 16:18:23 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2] arm64: dts: imx8mp-beacon: Enable DW HDMI Bridge
Date: Mon, 19 Aug 2024 18:18:14 -0500
Message-ID: <20240819231814.120053-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a second HDMI connector on the baseboard which is routed
to the DW HDMI bridge through the PVI to the LCDIF3 and requires the
HDMI PHY to be enabled too.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Fix Missing reg on hdmi_tx port@1 node.

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index cc9b81d46188..31c33acb560c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -105,6 +105,17 @@ hdmi_con: endpoint {
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_connector: endpoint {
+				remote-endpoint = <&hdmi_to_connector>;
+			};
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -282,6 +293,26 @@ usb-mux-hog {
 	};
 };
 
+&hdmi_tx {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_hdmi>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			reg = <1>;
+
+			hdmi_to_connector:endpoint {
+				remote-endpoint = <&hdmi_connector>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
+};
+
 &i2c2 {
 	clock-frequency = <384000>;
 	pinctrl-names = "default";
@@ -344,6 +375,10 @@ pcieclk: clock-generator@68 {
 	};
 };
 
+&hdmi_pvi {
+	status = "okay";
+};
+
 &i2c3 {
 	/* Connected to USB Hub */
 	usb-typec@52 {
@@ -464,6 +499,10 @@ &lcdif1 {
 	status = "okay";
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &micfil {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pdm>;
@@ -646,6 +685,15 @@ MX8MP_IOMUXC_SAI1_TXD7__GPIO4_IO19	0x140
 		>;
 	};
 
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL	0x400001c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA	0x400001c2
+			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD		0x40000010
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC		0x40000010
+		>;
+	};
+
 	pinctrl_i2c2: i2c2grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL	0x400001c2
-- 
2.43.0

