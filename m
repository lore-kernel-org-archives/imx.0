Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D89F3BD22C
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:11:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049479; cv=none; b=b2g6LdqkKzjxA0xsATugEycnfwNC7KcsswXRf+jd7ItGpfiK65y7vhzOnO785hCJVlOX6NxizTuFR7c2ndUJp2Kxv+DMvuhtc5DGSP3Ugdlw8zKNYY4zJJ68ON/XQqk6tuBKEaMtXhMs7hBKzW1Zso7RddOJV/FqSLRg3V89MyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049479; c=relaxed/simple;
	bh=E+DU5t1fa+GGm9oeyXG4fh5KMGGkdFZ36DmmYawGniA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZL4bGC+kw3F7q1eluTua2TRC1j8ylW3w3Z9SqPQ5LOVJDMNhWI6XNP/7arrZbBb1g7WxDK9Fe65W/F9D06eNLaMBExc1ILrQruRwmVWQm8IyogvzjPzQyKcSzJAXbknhZpqOe3Pt3XJQIIRIbhNHnGwX9smKtD14mOlZDUlbmqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KIWnAnff; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KIWnAnff"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4908b92904fso22729425e9.0
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049475; x=1780654275; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w+aM/24gP63Krqe0+2Zo2UxbF+//YntcPeOEzBEtHfs=;
        b=KIWnAnffyKyQS16LnLg/EnLH5bphUI1CKxWVIQP45OI7PyzjeWspi5WzaRWu6aBEkw
         c0Zo0o8R5pF/oIuvnVxzKBMPrb6aPtnw8oPytBfWvZQlzB5a8OH/YOrpZB/Ej6dlRNBz
         EJCvHOCDKsIp3I+3lvCnT/aaSv8oN/aNdL6YEQ0kkjrv/rpzEsDk34hUirTyef3PRVlh
         DFn2ghKtsp28LKU/tkMaQuD13spP1oE8y2ls8AyPtG8S8uoieVs9NqpdeyMrcNp7Lq56
         i0rENiSe6vhtuQfb7ZMlDIXtCZ9YSlDISbGhD1TXb0/68odtq+xEbcoGpwm+0rjya1d4
         ei1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049475; x=1780654275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=w+aM/24gP63Krqe0+2Zo2UxbF+//YntcPeOEzBEtHfs=;
        b=pPx1tfdEAMGv5DI9w5XrzXaX5rex48MtPcxgC4zNiHogT88yUm32IOZlU/+jetMHQh
         v1x7RANTMFiFT1V3Is5RJKwDfkoG8quA2yS1CnUpWL+qmLZ1VJJL7TCCIsG/xP4dF8HF
         cUpdFlMSwDy6NKksaEuCphKHu0ijA7pAGSoDj1R2dvJXJelRscwB6rihGVKbIzOvwc13
         9RZQ073hfZFrxgV2eNwdvreFMn3CCG6VQ5UMBjI3V4c/UNrU+84w5nmYsqNPZpvGxwGl
         C8lIYQokoaQua2Jf8myqXLLQCLmtQkZw/16F5iOpf6zaxibhIsSZtSA6bWlqI4dkrOFb
         oRow==
X-Forwarded-Encrypted: i=1; AFNElJ8rfUXi1aKLyXv4DqEQ9AXCfJ0bDOAxYnJVuozKXMd644RdAb94dUXHO7UOkEH2AUFrbWQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxwqZgJK9da3xz2Z5fm9q9GNxZurCP1chnHk2uFXEH+Cw/LWjP9
	T/dQXFmme72QHN+tvbsdsiDIQZOFRPzOH/OlKl9/OddZ9JF5EamAzyBH
X-Gm-Gg: Acq92OF8SAybosoDi+2mxmuMt3q0pCY2ftJletvIC3fcBs8v0q+uoKlfN8C3mcVm48D
	bovfjqLZ3x4/amhy7DCrr/SFd1tyH1vSgQY1Tj4lX/wQYqsPYnpKVQG28yqiAwz+r5GCbT5IBFr
	3y09WIdVRPz8K3oh/wkdVOj1QQIzX+xG117AidNz5XZIlsHLkY1FWnoyUVoaXonOGYJJJGrVMcd
	CymiGPc7EZFgRjXX8UJNNOLwkNr4dl2C1S6XU1qFVrxPSD6wPxyI+5zzb8CyQeCR60y18pq95kx
	12Y5d8Qx3jKVH9FDdalbb+hywfVJX7MvN7yBCz+KuVDAoEP4B84R0V3fTmObjMQtvbDctEoF/aM
	AvR4pF+8VteTiiRyxvUEvMTTxBrIJYWgv+GABBYtnYMknlvgfMRfGUlWeIh6UyUCt1pbQnC1J7g
	Qv/U8D0t7Gsxa63CQmlLU5gaqU1Xhtri1q6JnvtyXaicuaSSBUHfUZFZ/Rs7JdLx+/yCGG9uvKh
	dxV+xQkAzs1rPvVxpDyzy1YO9odywWW7kNn2n6rMYjVfzE=
X-Received: by 2002:a05:600c:468a:b0:490:9588:bdb6 with SMTP id 5b1f17b1804b1-4909c0c9b87mr40354715e9.33.1780049474638;
        Fri, 29 May 2026 03:11:14 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:14 -0700 (PDT)
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
Subject: [PATCH v1 4/4] arm64: dts: imx93-var-som-symphony: enable TPM3 PWM
Date: Fri, 29 May 2026 12:10:51 +0200
Message-ID: <7fa810b0227fde0205eb0fdefc6a6ef9cfb279eb.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780049085.git.stefano.r@variscite.com>
References: <cover.1780049085.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable TPM3 on the Symphony carrier board and add the pinctrl states for
the PWM output and sleep configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx93-var-som-symphony.dts  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index 23b359e39094..7f79cd7e7a4c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -325,6 +325,13 @@ &lpuart7 {
 	status = "okay";
 };
 
+&tpm3 {
+	pinctrl-0 = <&pinctrl_tpm3>;
+	pinctrl-1 = <&pinctrl_tpm3_sleep>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+};
+
 &usbotg1 {
 	dr_mode = "otg";
 	hnp-disable;
@@ -447,6 +454,18 @@ MX93_PAD_PDM_BIT_STREAM1__GPIO1_IO10            0x31e
 		>;
 	};
 
+	pinctrl_tpm3: tpm3grp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__TPM3_CH3			0x51e
+		>;
+	};
+
+	pinctrl_tpm3_sleep: tpm3sleepgrp {
+		fsl,pins = <
+			MX93_PAD_GPIO_IO24__GPIO2_IO24			0x51e
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX93_PAD_UART1_RXD__LPUART1_RX			0x31e
-- 
2.47.3

