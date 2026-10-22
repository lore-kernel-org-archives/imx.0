Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792678986;
	b=HH+DpGbCUZuk9+m+Skm8uuVRgfzkVpipBfgQ+CX+Jpra8WTiVBPcrPDUvItD0Io96TyL
	 yTvgWf4aITVxs+0wO7ygiR/TtjtnYyRvdjki39yhh2HICGHVvluRGPPOyO++P0SIlcIbb
	 H0HxaD7OKa0NoW7qvE7tMCTSv4UjqH8Wk4IdwHf4Mh2XABD6iekPVCjBJzI2rurQ6aTkd
	 J8FhmMRE6YWfO1jUlwscTKjhSIqjQsySpPlNK4Zf23/+x7/YFoaIq+eNrh99fXJyy2U43
	 bjXIc7YMJQWYjCn+i0A3CPoXBT5/ioZ5cmAOzW8kYFrJtl0KjwXhJ/+0cE66YncRaXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792678986;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:To:Cc:X-Mailer;
	bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=;
	b=M5C0h0lgQ9TBAF1bl3xjxHE1dHJwAlhZHkq3Aw0AygL0ngGORXLlsM6ua6nteSZLCfoj
	 0AYbbUPGbzDgmygkZR2iWZYPuFDve7iW3fXySe1rr0fwC4/7OCQnAzPbwcqVbKOFV7x9a
	 CVI/lfzasu4uhnUrxe9CJ4jg+4ZVB5R4SyaRdKugBXtaJP07mowZUPA/mywq5vOvfOGD2
	 /6d0lT4Lyjga+jIfRxjlpBR+RTuYBy2hAY8HhXPHyu6VdQzYFDklms4LSTTwP3hGY5N6r
	 cD9GiesFeFQN+5pmiES04xmidoahetciOf3NN4JQxzDFQ5cyjlue83s1Q0BOZ0UFj7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oyiYo4KR;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC61606A319
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CC61606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oyiYo4KR
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so12030945e9.0
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792678985; x=1793283785; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=;
        b=oyiYo4KRBFqQFBolNE/z3QqlVQ4VmhzAD/ta+Cc7MVziAro4ENl0Q/PNGd7vcbKQZZ
         vj2GwE0fZOzVQKFpYD46yJZ0k9fOQx1xEAyVAJf9VG/26KFUcAEspmdWPV87eR15mGgb
         ktLODJ3lkPZIceg5Ndya5DB8n5TtuDYfT7eRdocZ3NXZSxdVdN+pIqCE/rNV3bDNFTSE
         E4b3Db6+vO9aoEjR551HVD4LXVGTL9LmE2sWvKYt4gqTprDr07UPQgNH7OiSiA2oF61m
         VllwZW0JVYqBWm+aYK1pbdAlQbLIcFxqHeJDaIqTvXgZfE+xRqqWs2xLcRPEDYkuoNSv
         RtDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792678985; x=1793283785;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=myYidWIIbWAkZv9VR701i1PRbNKaJd28wzAcC9LDW4Q=;
        b=TxEG+bmDIxiSm67FKNOHBd7MRxc7bmlpE6PCut1SyCXJEPVN0/og1kTiGDaih+XTF8
         zoT3sdLF2Sb371TROpgVtHLyV3ihLuBUAB2oJXwKqdxOjP+wke/IHA1hEzVH6IESIFkM
         umQdliQh5KW2VkEqndp66LAUzuM3CruTLE/ODiIEkwRZVZqPCqIc78S4uvoeorzBf/e3
         mo5rTJ6TMntZOdsc2x5rgSP63wiqTyeGNl+ajXlZLM/TpUM1QlfTGABJreaOsGe8FLoQ
         vfAEjeSFzLYTfg27lz3fI9Fmx8/UjVMFEn3E/eG1Se7DTrU5xFMBH+K697bXm4tUjZZO
         8rNA==
X-Forwarded-Encrypted: i=1; AKwUvBwbwkFT/ubxMfac8g0hN0aZWrLt4opEGOOHCZy5SEDFWTX468zS1oJ7uxhsPQ+iQia+ppw=@lists.linux.dev
X-Gm-Message-State: AFq9FYL9/fPWe1S5rlv7wJlAjF+iY9QfBN/JLEQnMhFfYYRiEtrWHQtT
	dVdeXYTKoL1xBC77tWYA2nhqLU4lQV4gbwG+3NZiiZxBkNOefxclWVMd47lLsqQc
X-Gm-Gg: AYBFou355KtKU0x6Qh7nMDnFtrZeEfQ5WTxCD5GRN44VckUr051kpIh1f8z1V0yRW8Z
	0a4++0Q/xwFQ6kNe6QOn7dQs3i9xXPwHDW/irAkoofeZ7qkkNSDC0j7/SUZVb/HC+IOGj170qqE
	GWRuXzHEhYtxiay3yPUQO/P7gyDn03aGJr/rwopboXF0f0Ek4eKBGs+oRZmLpTZj4ivuOL8CZTE
	5oAhBdYOV4ogsKiY5AcDmFEfuzbc4d7RFvfzfuaOcpti1eqvX3AQNp7SkX90IwaB0+T/fVDsHI0
	6WVe4JkYIDdpLnGiN3agn5oKiTv5lMX/RM6UJpGUD6lWGDtKP/yELYbOtc9AvtOFAWcW3Rkm9QW
	LbUOUv/+IulpLWbNf7h9pXOgt2k0RBIT7u+AhpyDhaB9gGoPzjy/t6eAmzll8HWVfwFp9tGOucn
	2MtL1lmN5qag9teLtxqjRcWuODFHUxiU4TdRkABNINKs8yKz/wtLhkxZ1NuH0TPE9rsOzMkDtxL
	zRytE436+W9ZXBWAxLkvC4F6BnkZawTqLR6dnb9YedfprPYzpcZXa2Jo9dCXhL40x1ZsuTzouos
	G9ndkJnLXyePluyxKyocZIL+RcN8ONJ7RnjTmcrRFcS3e02TMLqGodc=
X-Received: by 2002:a05:600c:a49:b0:49f:ffa2:1c72 with SMTP id 5b1f17b1804b1-4a204b20321mr50739115e9.11.1792678984170;
        Thu, 22 Oct 2026 07:23:04 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a207b29276sm95945435e9.6.2026.10.22.07.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:23:03 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:22:59 +0200
Subject: [PATCH v3] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
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
Message-Id: <20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com>
X-B4-Tracking: v=1; b=H4sIAEIc2moC/4XNTQ6CMBAF4KuQrh3TH1KoK+9hXNR2kC4KpDUNh
 HB3BxYmunHxFm+S983KMqaAmV2qlSUsIYdxoKJOFXO9HZ4IwVNnkkstuORQMPkwQIhzGyeIDVh
 tUOpWt00tGM2mhF2YD/J2p96H/BrTcnwoYr8eGDfiF+spzkZMFhJav0ARwEE5o2qDzj9MdyXJe
 pzPboxsx4v8gIJz8ReUBDZeqFoRSPkGt217A40DcXcRAQAA
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
This patch was previously part of the Verdin iMX8M OV5640 series and is
now sent separately, as requested on v2.
---
Changes in v3:
- Split out of the Verdin iMX8M OV5640 series (Frank)
- Move the UART_4 overlay to the shared Toradex Cortex-M UART series:
  https://lore.kernel.org/r/20261022-v1-imx95-overlays-v2-0-c769d6eb54fd@toradex.com
- Link to v2: https://lore.kernel.org/r/20261001-verdin-imx8mp-hmp-camera-ready-v2-0-7d1343ecd3ec@toradex.com

Changes in v2:
- Rebase
- Link to v1: https://lore.kernel.org/r/20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..45a4713c260f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	sound_hdmi: sound-hdmi {
 		compatible = "fsl,imx-audio-hdmi";
 		model = "audio-hdmi";
@@ -185,6 +197,27 @@ reserved-memory {
 
 		/* Use the kernel configuration settings instead */
 		/delete-node/ linux,cma;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 

---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261020-verdin-imx8mp-m7-a69e26868741

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

