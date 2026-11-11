Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423889;
	b=C/kw7EuSOKO24BUaCUCGUU17yY2MeuJ44HjgxaTK2y/nvmWrDC9aDOqA1yWmXHPtaH9Z
	 HYpMGON6ZYnTL+qAtxLrQuX4O9aOvAprv7AITyWc58JYDb/wHiMJQZCKuQDHm+Y+HJH7q
	 RRdWfTku0/Awv2cSKduwqHUCZrnTY2arQzUhPe2b6Y6/0LJoKxKRRKHcpu/dm6jDLILIX
	 khKYTTCcaXrYfctRpnmTT0nY+1Nzwm2qyPfdA6rDIDdZLeglOCWI4o7pT5GL3uB8jjm6l
	 QjTDcTnoqv8z0p84OjEZnOx/h8PidQ8KSoYkhCBmowLRwgqN0OfvndNrOkZuN7n8z9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423889;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=;
	b=odwV3xZMMB6vEbybIpjHJfcstZ2JE59hgAvG60SbWYWVpOGppspc1/h++1wQDNTaQr68
	 cjKt4QYdfhkD/9KEID+/2Ga8kWQTXPBzRzsy6mv0iUr/gTET0A8ozY+UHp8DgzjW2PhgE
	 ++uOTnGffI0Ul+z1xd3dBzO2aheGD8UfPiw3/wUCpgsHJOwUCMWpiWGJbJs9wja3u0w4Q
	 c1zweWXVVWI+mpw4QwkDLvwJFchp6EX8q/3uVuB8VSPE+pP4g5lGR6IW7ks03RCE23iQD
	 TyCcz9T1cM4UnBlmYSHE+L7a0iPX961XiUFnlIaaT+2u0VNxzTIOvj5w3eT9c6SG7JA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSmU64GO;
	arc=none smtp.remote-ip=209.85.215.170
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A4B606A8A1
	for <imx@lists.linux.dev>; Wed, 11 Nov 2026 19:04:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97A4B606A8A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WSmU64GO
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cdb9d5c1c8eso1794186a12.0
        for <imx@lists.linux.dev>; Wed, 11 Nov 2026 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423888; x=1795028688; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=;
        b=WSmU64GOaIAP8GMaR5bNFrGx4jNRQOCboNnElicY82cz+oBaG6N7UnG+jIbQhjRTU9
         UwrPwG1JBCs28k8QdWZWIrl3BdKBS5har+r5njVIOxBqAEL/69en4MRMe15zdmyzU7o7
         wWlUsND/ErNHubeLT4C4iufS/pbBCBgom64/GItIftatBOdmmU2QxI6QNXuuWq4oKx3+
         ZL8qKqxFZlSURJ2Pllmck+Ryh4mHhfU9im4BeAUXePuGOrNZeRjFSE+D6M20PqcANB49
         S7ICIFigT6UpJMfM9xFbur2F9Wi1CkRWVMmXqkShqq9Tb8E/1Vop6RYaoWQ1S5bsq4+S
         n65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423888; x=1795028688;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PrbRgt2I4AZhKGeB3X2rrcoDbn6hGDT1j9aliR6cklU=;
        b=JBhB2nnQQ+RNQCmAn4HmxvLTltVoDinlKTvZvy9dMN9VVUZW9iIv0eA3EL5l0ILVTr
         A6zlX/OMRSMKcKfXPzkNqBHV+dxGgm28yEinDqNCV8MVh6mn8Y68qtBH2yNhpMiTk2AW
         DFIp80DntRxJ0MJ2HtlfiN62QYeO34XcbYwhOvK7O9mriEpWfkPePEQUr6YqK6DIQLM/
         wyUvUQNzkCNgocpRmP6HyYeSUeJqjYoBOWLcYAp1UgJ/hNdWX24oSoHafQnT22C+AhVt
         1uY/y1U1IglNms8eQyS2m7h846HIV4Z07y6d1aKEZH6ZqD8i3xWxIO9AWG6hd2pb15hj
         48mQ==
X-Forwarded-Encrypted: i=1; AL+hErHsw4eyy3/YxBiC4c5VALGGvVDFt90A/Mp3m87HwEJVsfkKoTAb1oUqxdE7YyscciISv+k=@lists.linux.dev
X-Gm-Message-State: APuU4Z85p7efOpOUNNEFSsbw47fe1c8PcubAP8STrvV0aDbXzSAKkfAg
	azcLjbnMID7s8WSlDBFwIxiE2d/v9o0MwD/yLLO0EOXLbn4wdi9riGKO
X-Gm-Gg: AYBFou341A9NK/i4169w2X0WppOq4JaWjok/qhV3XltaPl++aLMP6zlqUejrtOn3NQF
	29p3PhKQgmDK0Hm5nEFr8/K1xDq3GZ/xkTEomStYKF3VBu0/p3u3IFIXqutbFZQSKqQ0br/TsNZ
	/rmG6orU7bbfkcYZ7L7kM4/D3gN7xMx1f93MRmltb+DcKd8f7iq2RRas51YIIcKFsJTZZsJnfi1
	p4D30BCjIKK6mJfpM9A2blAjRhf47umhIRD+bRgl7ReOTNxKOyH/U6hplmxdJ4YE4WUI8q/lHWQ
	6EYAEFUjq1HQXehlqFMGXzDDk+6c66MT68TUzhoFTG/R33I/NUUt4IvPNa6ldQhQUTsHdZMMil4
	H+TOjZlhVCsj9Hvfp0N7QdVCgDmpUxmrAq7eRQhTXObecbUxg1OO7aWGUg8SdLxSAmL8X404Ehd
	gl9hCYV0p/49okW7sAhMIr7KedpQJS9sJ4N6Ht9wkCBCFtMecDFQw85S+IBKYDXICNjIIOhT0Kb
	ZIi4m32ZMVxYfqFkMcUC3t4rqLOXVfVQXQC2GMgKr5DKvLv/qaE/pOxscZzvXKXg2rhhNHFIgL/
	kVV5rZVWmXEbT8xMIaqiC4ZW2M8gCR4cnw==
X-Received: by 2002:a17:90a:e7d1:b0:3ad:b7d1:8631 with SMTP id 98e67ed59e1d1-3b182e9415emr3094237a91.17.1794423887377;
        Wed, 11 Nov 2026 11:04:47 -0800 (PST)
Received: from [127.0.1.1] ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b181f8fd59sm2727366a91.1.2026.11.11.11.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 11:04:47 -0800 (PST)
From: Leonardo Costa <leoreis.costa@gmail.com>
Date: Wed, 11 Nov 2026 16:04:01 -0300
Subject: [PATCH v2 5/7] ARM: dts: imx6q-apalis: Add Toradex Resistive Touch
 Display 7" Parallel
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261111-b4-v2-apalis-imx6-overlays-v2-5-8129b21634c7@toradex.com>
References: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
In-Reply-To: <20261111-b4-v2-apalis-imx6-overlays-v2-0-8129b21634c7@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-bsp@toradex.com, Leonardo Costa <leonardo.costa@toradex.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794423849; l=3352;
 i=leonardo.costa@toradex.com; s=20261001; h=from:subject:message-id;
 bh=eN7DvQ1E51+JeMrXQEgkpfFssIEPFBdeHdO7BmoHJX8=;
 b=5NJeH5jEmlLAdlRZBAIQgCXVcpiyPOftIb6QuJlQMcDPSElxKYbFx8QwR5gx8VE0bQtiAujaK
 kWmjaDj5Pw0DtP8TD82axOS+f5Z3LVZwK804fkVYt9rjkG9d7uAUk++
X-Developer-Key: i=leonardo.costa@toradex.com; a=ed25519;
 pk=4xvoVLDt+NxIz9D8BJHhT0fD43Ig6XgSDw4jRN/gHzk=

From: Leonardo Costa <leonardo.costa@toradex.com>

Add a device tree overlay for the Resistive Touch Display 7" Parallel
on the Apalis iMX6 parallel RGB LCD interface.

The panel is a LogicTechno LT161010-2NHR 7" WVGA TFT Transmissive LCD
with a resistive touch.

The overlay is also combined with the Apalis iMX6 V1.2 Ixora Carrier
Board V1.2 device tree to provide a ready-to-use DTB.

Link: https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile                 |  6 +++++
 ...-apalis-tdx-panel-res-touch-7inch-parallel.dtso | 30 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index d7f9b2b5bb493..fc9a68cbdd313 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -172,6 +172,10 @@ imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel-dtbs := \
 	imx6q-apalis-v1.2-ixora-v1.2.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo
 
+imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-res-touch-7inch-parallel-dtbs := \
+	imx6q-apalis-v1.2-ixora-v1.2.dtb \
+	imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtbo
+
 imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
 	imx6q-dhcom-pdk2.dtb \
 	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
@@ -330,6 +334,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-tdx-panel-cap-touch-10inch-lvds-v1.dtbo \
 	imx6q-apalis-tdx-panel-cap-touch-7inch-parallel.dtbo \
+	imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtbo \
 	imx6q-apalis-v1.2-eval.dtb \
 	imx6q-apalis-v1.2-eval-hdmi.dtb \
 	imx6q-apalis-v1.2-eval-v1.2.dtb \
@@ -342,6 +347,7 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-apalis-v1.2-ixora-v1.2-hdmi.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-10inch-lvds-v1.dtb \
 	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-cap-touch-7inch-parallel.dtb \
+	imx6q-apalis-v1.2-ixora-v1.2-tdx-panel-res-touch-7inch-parallel.dtb \
 	imx6q-apf6dev.dtb \
 	imx6q-arm2.dtb \
 	imx6q-b450v3.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso
new file mode 100644
index 0000000000000..be2164dcd0369
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-tdx-panel-res-touch-7inch-parallel.dtso
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Toradex Resistive Touch Display 7" Parallel connected through the 40-way
+ * Unified Interface Display connector (as featured on Ixora carrier board and
+ * Apalis Evaluation Board). Touchscreen is available only on Apalis iMX6 v1.2.
+ *
+ * https://docs.toradex.com/104498-7-inch-parallel-resistive-touch-display-800x480.pdf
+ * https://developer.toradex.com/hardware/accessories/displays/resistive-touch-display-7inch-parallel/
+ * https://www.toradex.com/accessories/resistive-touch-display
+ */
+
+/dts-v1/;
+/plugin/;
+
+&backlight {
+	status = "okay";
+};
+
+&lcd_display {
+	status = "okay";
+};
+
+&panel_dpi {
+	compatible = "logictechno,lt161010-2nhr";
+	power-supply = <&reg_3v3_sw>;
+
+	status = "okay";
+};

-- 
2.43.0

