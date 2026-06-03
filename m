Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5771E5B9A
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 12:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780488012; cv=none; b=EjuqzAO+/IZWui6H/BE10qK1luzvl3bGqh07cRZjyuozht3xY3u+m2ezqdwMiYcSm2usD0hqH54lO4zC5Mj5Ha7E6ux3DezHv1vSgEBrXxH9CCN7Hfonz+iXGgMdq8xaxJEcmPDD2JV25GW4/pawPuE1M3/0uFgl1Z9bstOMuyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780488012; c=relaxed/simple;
	bh=Hz5gw6ZiZTRDi3T6Y82XHviqJ/HDBrRBmM/1Ow+latA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YO25F1tNGBF8eMF5y67E8V4UO5SeI8OvUpJpvFbfPHU8nwkMMTuRYObtjcu9OXjTJfprwZtnA5LqiVdoHIox0CcLXLm3AJZ0czw3Hi9Pn6bHgAaGcUO7p2/VKMr6jyVCAFA7Uvl8IgS7h0rCnSYgNmpI+I66eeTuPr2DjLlnpIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kejEXhCL; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kejEXhCL"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-45ef29c5561so3063675f8f.0
        for <imx@lists.linux.dev>; Wed, 03 Jun 2026 05:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780488009; x=1781092809; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Pm0RvpU3HH/cr1nURW51vxgVUsJsWvr1G1CVEkJHJc=;
        b=kejEXhCL1kokFj8wUORhrmboG4cEmX/5BZalrOtERapCe+k/CI1jBEg7AJWJcPw32+
         6m1dx2jWIfWAXwoDTtnzcqu67em8v5O9oP7dQHH/tS4qzcpKr47tiijwRP4VKnvnOdCw
         lBEjhaWp3WktYjjQnnh/pUS4k8XEgzw/RtXtodzQmqXPtZ7dIYhkZWXiXNNHUEiL8TME
         TxrW+X9cA8aqiWYtyNylfgVgjKj9d405QpNB2mqi5RXwuxvz6JWnyBleZgrvfS9k60E6
         4b+IgnPYMqDWS15a3Clr+kympeOlb82M22jDl+b8Twpc5nTNvS2qG2AggMYff9vo9hq+
         SCJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780488009; x=1781092809;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Pm0RvpU3HH/cr1nURW51vxgVUsJsWvr1G1CVEkJHJc=;
        b=f377Qfz00CeWaNegIY5fYuf0+4dOYEwSQyQieci8i3PdUhIbkL1qeu18I1ilXIYfU7
         8Ap7afg2tlSf+gEeUM1tmbTaHnFkxtzWqy0nyIoIGoE5G5BuUU40+S+000EkiQUSV/ye
         791pDca5ALFEDCsYsrTUYE9cy5QH76ansCcw8OxeSgeCdmp46OAbog233EfZc4tQCvPi
         kyAGE14kHZ0LVitnk+sEJ50OMwWl0K3daNmKAbqZNfbRAuKKNrnghBQDD7pG64cvgHl3
         9MOTM61Ujyve9EaqF8dr6JUtRlFSFkoAj4usOl7ZU3eluj44MxIGCkcjRQWyBehb9oSj
         zySg==
X-Forwarded-Encrypted: i=1; AFNElJ+wEPTQd2/VcgyuVnugBuCRrGravGuC8861uRtg20GSXntdziGq+TGQqCvAj0jWlJ/fIzM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzS/8U0SEMqHyIqT66KyjQkHqBlAULzg9ntiVtS6wKtuX7vYxYW
	ZwgQ4SiFaVpeUSXbyiO3mW/qzd+hhcUlbmRIBg5OdcpgquU342vmqgq+
X-Gm-Gg: Acq92OGIabDznqF82b734mc63/MYEK3qHT9hvq5SfPMNtzC3EKquP/mdm/W3uWpW0Of
	S5pqheRLd+LAGHTGexKZC/FV1GbeUCpeezkA8badJI5g6HQdT1jzwBAb+uJr79iJPMjwYBE5asG
	xW/VmoZFQF4SINnOh5l+ag6ouxujvaT0rRgvdb662nkBUQdIp5DExhMOL3KGwbvCp8W8VcbFVr9
	pvlmx7shK+3bbOFiOA4BpougP9/IAjFjDDrvyZl/DmWva1hq1NcG8kILsoQ2yzFaZLeSRx3wT8K
	sydu4qN8pge6zum2vRDjWtArBBHE2UR8vh/yDeAaIx6hzrknTCjto6ibDWbdG+iLv6nK3k8WNWI
	AQCQVP5/mAD38fS1DHb7P4B1Wr4BEA5osgSjuC2kwc8NouRI/Vog+jUOslVVYR7D2rOEdSq2PzD
	otBpNQJWY3b0wnZD0m2Qx49dBH4r0YBjzpFdWUuyQbrmdwTm4A2z8baZYyct4h7EZ6mH34XBZoM
	7JpVOZLnExinNz3XAZXrRb+/veBlQLgK9GJ3H01kuG8qXtu
X-Received: by 2002:adf:f50b:0:b0:45e:f073:d2fc with SMTP id ffacd0b85a97d-460217a92afmr3856857f8f.11.1780488008559;
        Wed, 03 Jun 2026 05:00:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f344762sm7771928f8f.23.2026.06.03.05.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 05:00:08 -0700 (PDT)
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
Subject: [PATCH v1 08/12] arm64: dts: imx8mp-var-som-symphony: add capacitive touchscreen
Date: Wed,  3 Jun 2026 13:55:46 +0200
Message-ID: <db8411dc811bd9fcc76ca72cfbfdade2b1eef99b.1780487415.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780487415.git.stefano.r@variscite.com>
References: <cover.1780487415.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add the FT5206 capacitive touchscreen controller on the Symphony carrier
board.
Describe the interrupt pin and touchscreen geometry.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx8mp-var-som-symphony.dts | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index 6878b89c4db8..9622f77f8f13 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -193,6 +193,21 @@ st33ktpm2xi2c: tpm@2e {
 		reset-gpios = <&pcal6408 4 GPIO_ACTIVE_LOW>;
 	};
 
+	/* Capacitive touch controller */
+	ft5x06_ts: touchscreen@38 {
+		compatible = "edt,edt-ft5206";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_captouch>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		touchscreen-size-x = <800>;
+		touchscreen-size-y = <480>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+		wakeup-source;
+	};
+
 	rtc@68 {
 		compatible = "dallas,ds1337";
 		reg = <0x68>;
@@ -300,6 +315,12 @@ &usdhc2 {
 };
 
 &iomuxc {
+	pinctrl_captouch: captouchgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
+		>;
+	};
+
 	pinctrl_i2c3: i2c3grp {
 		fsl,pins = <
 			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL                                 0x400001c2
-- 
2.47.3

