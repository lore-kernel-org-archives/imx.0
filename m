Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF4F477E31
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 14:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497457; cv=none; b=coLksGUTFDQTO6zwW7ULd9cf/LUxmvvsoo5foEA4JzYXmhzVxJ4mPIvIbq/a7L/XFGsCwwBHrq838YalIeMPNVEUcdz1f1qOppOz4K99HY9DRdg9VbWUsYtLBxL71wfUCoE6wG+0pKiBGQO+ifb0RFH2tlUC7HByzWOCnlWGSQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497457; c=relaxed/simple;
	bh=/kpNjBflrS8g+S0mHG1ImgGCsUUL03+6OayeWxJ858Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SbIjnW3rmevZOyHFfI3fe8KYuZDFtgAojlFym/hIaEUJqgZyqlQF/CAfrh8G6VTKfXiClGM6lT5YXAtisd4rs+7al9ev7+CZSwmnyCBozAc/LsiQtlC5OWpkTjP7ri+19rrePlr4HjRCr82Nk8GWg4vzGF/bo1Xhyybak9VG7+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KTJwk2aW; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KTJwk2aW"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490abf12f0fso4617585e9.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780497454; x=1781102254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ek2z2hCKg51eeqqNP9O236wR5gFYHNYlKZaWXk0NZ1A=;
        b=KTJwk2aWqrWYJ8/GIKTxEjv3JG94hG/s/gnqDRuPz2RbKUeUdbSJZg2wRdcZacagv/
         OVvQsVafYRZ9xbtPvNTIjIVf0nBdV68hV1njllvNSRzsTbUFYZ9tEm/4y0U1e6RjT8uG
         RNLOC7O3ecS41qkdHUFuJU7mUurIrVcbJtSmbiAdUI5LWSX8mpYTJfAlyUj0GXVyDY8x
         SnjjUho5kIBe5iBow6WUewmlBVus3mk2o3MbAXCopYRkyb9oJ4zI0YB9r5REH6q1R05N
         RPAbYZjyLaSHWapyWLFcsJJP2fiuDnr9FtKrpRuMzvVYNg0yOvmIDN8gAWDFs+rrdS3q
         Mw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780497454; x=1781102254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ek2z2hCKg51eeqqNP9O236wR5gFYHNYlKZaWXk0NZ1A=;
        b=AYfGLUSt6cxGxehZggxLHNcIIBZngpUyssKKzLMoQLb90i7Q7r8T7UH6cuZPLwB4IB
         VHkbRlJTr3HU5ZKhh9zCrrU6qh8EkWO9/eCTxDgMruz2Ig8MTroMwFW+8KfYjTiO142B
         hDHGen+dQnRz9kAqbdqOR2nZ+nXSnnlH7EYeHnmnO9WSp3LPJFRfhxAKXZ5opFrrre7a
         JqixIdahL7JvYlHrKNtiudiLTNCGMxLXEb3O+qCjUh2JMOWrPA4m3MgbywyOX/Tv6glb
         5VgQZzmcN7jnWZwyQsfwzxVr6iT6osJOpiU6REkaQ+3CnXFqWfQDNPtrlNEY17LrsytV
         NXjQ==
X-Forwarded-Encrypted: i=1; AFNElJ9KbK8LImxrHufY9qQvDKvWzdgXq9C7OFCCHODZAWV1lJSKrHgOc0Ir7vl0XwMFZxCYnAk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFNTjFGIBIxBsfDM23j9n3P4wgioaio79oIZbuhK8CfioF4lqS
	7DF4IQ9MLLNoFlAj7QExCcg8DVLg05qZhU1ds4GvCRW9PQTOy/0ek0cq
X-Gm-Gg: Acq92OEAbL5/r4keUZtXVEcd5msChsGQ3emAa8TBb1fBgxPFb21LoUbEbKbWLSLg7to
	9pzNY3cT23TWDxuZNFrtDomDUtqvBOPogi96L5UaCoeodXXLH3TZ18RA6mrHPv19NDaItV6Vrmj
	TvF5TNPUH/Qbh1TYXN5Ho3WVkRRMFuywer6EInqTAhQRAESf0Mcia1NdRzOuGkyWctWhmVVFGE8
	7oDBe3pC2zTLWyzNiDrVtMUsmHXvxl5uXo3mvVKKQgVY0OJo07ocv1iX93OeJmwW8pSC2n5oWzB
	JzZk89+ar3nFA77DVe+NpH+UDW+rimPy0NkZbjcTzHchuPJHfHKsCs7jT5LC7/pfTSj+Fr4j9TW
	5C2ngYXaqAcCDMEBgPTM956cn+byItVSd3AQ5KKktWhTcts75yyPIcSVAJ1EdgxyepBGD+LIg/L
	RgEc8v5zQgxOd9+lGeRIjt4LTnkOkvhweC2LkdkA2N5735Jbpld2IP8kqn0+J045xQVUyPzUEN7
	1WA89J9Wnto7N4jmuQfRbCQGUWRZWb4l4pZFzZMv/+oMFTS
X-Received: by 2002:a05:600c:3510:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-490b6151755mr47163205e9.14.1780497453687;
        Wed, 03 Jun 2026 07:37:33 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b6150bfcsm120267855e9.3.2026.06.03.07.37.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 07:37:33 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 07/14] arm64: dts: imx8mp-var-som-symphony: add HDMI support
Date: Wed,  3 Jun 2026 16:37:14 +0200
Message-ID: <24154af5fc04cf4b355dbebc33566f83d85b222e.1780497188.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780497188.git.stefano.r@variscite.com>
References: <cover.1780497188.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the HDMI display pipeline and HDMI audio support on the Symphony
carrier board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - Add missing HDMI pinctrl configuration
 - Enable LCDIF3 for the HDMI display pipeline

 .../dts/freescale/imx8mp-var-som-symphony.dts | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index db0ae706f648..f7eebf265fab 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -48,6 +48,18 @@ led-0 {
 		};
 	};
 
+	native-hdmi-connector {
+		compatible = "hdmi-connector";
+		label = "HDMI OUT";
+		type = "a";
+
+		port {
+			hdmi_in: endpoint {
+				remote-endpoint = <&hdmi_tx_out>;
+			};
+		};
+	};
+
 	pcie0_refclk: pcie0-refclk {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -74,6 +86,43 @@ reg_usdhc2_vqmmc: regulator-usdhc2-vqmmc {
 		states = <3300000 0x0 1800000 0x1>;
 		vin-supply = <&ldo5>;
 	};
+
+	sound-hdmi {
+		compatible = "fsl,imx-audio-hdmi";
+		model = "audio-hdmi";
+		audio-cpu = <&aud2htx>;
+		hdmi-out;
+	};
+};
+
+&aud2htx {
+	status = "okay";
+};
+
+&hdmi_pai {
+	status = "okay";
+};
+
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
+				remote-endpoint = <&hdmi_in>;
+			};
+		};
+	};
+};
+
+&hdmi_tx_phy {
+	status = "okay";
 };
 
 &i2c3 {
@@ -152,6 +201,10 @@ rtc@68 {
 	};
 };
 
+&lcdif3 {
+	status = "okay";
+};
+
 &pcie {
 	reset-gpio = <&pcal6408 1 GPIO_ACTIVE_LOW>;
 	status = "okay";
@@ -253,6 +306,14 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_hdmi: hdmigrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
+			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c2
+			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0x10
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3

