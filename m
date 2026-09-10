Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 905E94AB1A7
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 15:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789054691; cv=none; b=tWD36pGy4IKmi/3GEg8bMQ7+dwKG+nyRS27W3wj1N512KuUAp4yJhEb6mxt9RKl+xCu0H0X7QD7J0/aTHWRzHJ6ZFGs1nTphc7ng5WbaDLTTj+sfqzgkCk2vhavioiwRLz/2hLE30SufKFgDHZNa73lw9X+gAWKkjRxMLqD9bOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789054691; c=relaxed/simple;
	bh=gzh2q+u58cFhgRp7gV46O/Wa8UfTHXxr/Xs3h1IWYJE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsNTX0ShSzyMtBohPrBM30DL0YPz+pwIK0JKbWMzZTLRRSHLWpeQdhXXw/H2nipaJQlnZFWIBKC8M0QKxhlh/cCTy0Jw+EFNiCJDpWV5AnLSJnXb9FNoF1gf+9CPiedHCehxz4eNV+9XENPX8prUkDes6xPlh51CmvAUsN1qaOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WXUvhOWE; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WXUvhOWE"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-482dd6ee390so7616747f8f.3
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 08:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054686; x=1789659486; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NaPp8HoKKF6sxkd9LUTX+PGTrCWY5tm9shIAUpEtxY0=;
        b=WXUvhOWEAgtJVGmwmIRpFanoC4XyTENohvUw7wA+s3oliOTNh2EUvh/6XtPUKsWx5o
         Tka+tPfoo61bSW/mz1aj6GBP7UrEtue49AaZLa+f9gYDFIbVB135CCCHfcYq+oxiPV4b
         lODvS0Whtm7h1KeWSikPf+W2v9+FCPPhxk5PTGejHTvjr2NRKQTtdbT2R/TfP8KFa52C
         16ESECKFRNnlQdBjVaGWmUsCmkGkt2HIFh6UuQVHhq2Qxb3m1q7NhYIO9V2+I1RpBd4i
         Oqjm5NvF0b4bOOzryil+xQEnQ9DATWpXVaen8TL/Yqi8GTzhUJafqEZ86AHbGc57TydH
         kwXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054686; x=1789659486;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NaPp8HoKKF6sxkd9LUTX+PGTrCWY5tm9shIAUpEtxY0=;
        b=QR1bD6p1xytbueARpLeuGtUA8xr6zUcjq/vhnPsnrSkH8oPZMCvI4sHcRCfTeB8of5
         lYX5+8Oob5Bt6znRbRwobXDO5AUQChBuPmNSvCxX9zMLD/SKaaZLGbdQZtfLmJ3SoYMy
         MrHYaED/ZhZGXSWx20tleqbMK76Wz+OL4/EPWhiK904EuvrTk5MdOUsmSfrom0TfAvl9
         24Vu2C960dK3bdX8IYUZy9gEojms6YykZuRf7xyq0O8ngx7cjsmQ1gcSw+igw4ys8TZV
         2ri6lGx9Q7mSQ2Z+agbxpORvEBuQooANfdP9sO9EsSsaF4eg/XSeOjw6K8ImTxB2tJCJ
         pF6A==
X-Forwarded-Encrypted: i=1; AKwUvBwc3HL6cIGi2EZtUaqK3As63imjmGzHCHwFuxMB4KyvUWoYDffJeBmlQEL8A0nm0dZLLAk=@lists.linux.dev
X-Gm-Message-State: AFuF++krQ2lngErJZx0Ixslx5X05Kst1WBssIuqm++kujvpQH8uuwYgZ
	vpOGT0PgGz5E7UXKfIEiGa6MfBCIqiXFkIwEsCu/TZc06HIYU9YW0InSxCG1gdkb
X-Gm-Gg: AYBFou0aqF9QGmzANVkQzoX1OmMkOl4CtvXvklmz4DqAaAbYO96u0F0RLh3znzm53aa
	joJFDKuvDQxnfHSFYWy1PFSOxxsY8bn1zoX1wX8c2uJQbftVB8tjJ09TyQmAGGILsftzBf99hwc
	OVnFD691WeUR963tp4HiJ50tzFBtB6/fatzVcfBY8C6F4BwbapsYpq7LPdqlIIbp02PgxrG32Fw
	Hq8Omoze2bmF9QCimYra28KvAy4xngVxQj11NdV7MlP0aX/Mzrf+WirHMYGW5Wi9vrkHo0IW/ly
	PHuBbcT5IYhgIQp9dKTo7RzqrnEHxf7re5Onue6HbefCmryx9pSEYSyfn1i9X49e+MjbjWqDYfn
	Vcdk81PgOomJLIAkE9NAzmxvPr71znDZlvq1yl6VVpqeSVF1PHaIF8KxjpGW+62UDCojP5FMJTX
	6WFd3232h5vk+GoI+2iOanwvgm+O/2I/3qLkEmfKcrDxXpqhMn17X8YwYdj1TlztXSbv1xyGzec
	E58eFsXgxxQBMbQ6/nKo5OVX3nVcLW2Am+BrcNPwHNqF2Pvg+gDR2XX1xEXJyAuTNkgcsWYIPvR
	NCAZRs6b
X-Received: by 2002:a05:600c:a49:b0:49c:fc6c:be0c with SMTP id 5b1f17b1804b1-49cffdc3823mr348668065e9.18.1789054686376;
        Thu, 10 Sep 2026 08:38:06 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:05 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:58 +0200
Subject: [PATCH 2/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 UART_4 overlay
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-2-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Verdin UART_4 can be assigned to Cortex-M7 firmware. Add an overlay
that marks the UART as reserved so Linux does not claim the port.

The overlay is also combined with the Verdin iMX8M Plus Development
Board device tree to provide a ready-to-use DTB for the non-WiFi SoM
variant. UART_4 carries Bluetooth on WiFi SoMs.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile                     |  3 +++
 arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso | 14 ++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ca4fec7c1038..8b152903b4b1 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -734,6 +734,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-dsi-to-hdmi.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev-uart4-mcu.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-mallow.dtb
@@ -742,6 +743,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-verdin-wifi-dahlia.dtb
@@ -759,6 +761,7 @@ imx8mp-verdin-nonwifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dahlia.dt
 imx8mp-verdin-nonwifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-nonwifi-dahlia.dtb \
 	imx8mp-verdin-panel-cap-touch-10inch-dsi.dtbo
 imx8mp-verdin-nonwifi-dev-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
+imx8mp-verdin-nonwifi-dev-uart4-mcu-dtbs := imx8mp-verdin-nonwifi-dev.dtb imx8mp-verdin-uart4-mcu.dtbo
 imx8mp-verdin-nonwifi-yavia-dsi-to-hdmi-dtbs := imx8mp-verdin-nonwifi-yavia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-dsi-to-hdmi-dtbs := imx8mp-verdin-wifi-dahlia.dtb imx8mp-verdin-dsi-to-hdmi.dtbo
 imx8mp-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi-dtbs := imx8mp-verdin-wifi-dahlia.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
new file mode 100644
index 000000000000..74d90b39faec
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin-uart4-mcu.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Verdin iMX8M Plus UART_4 for Cortex-M7
+ */
+
+/dts-v1/;
+/plugin/;
+
+/* Verdin UART_4 */
+&uart4 {
+	status = "reserved";
+};

-- 
2.43.0

