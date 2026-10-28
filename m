Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793187318;
	b=pBCb3yo3wErtc7SDpv9LUDqnqghE7IAgsb7Pp0DScluvpfAE0H08qW1FoSyJQx7Av1o/
	 c+PvUWHeCD3pvW9VCu7Krlj6J4YD6S8MzWR6YTIgq3/PkNiHU9SSAGxsbE0EHRtPDcWO/
	 isEQg9VUWo5XONkPR9iB7zHxn2iLXJo7VaBJid5ZdPvo2wbsLXgclHhkBc/N6a2I6y8Dm
	 kr8QhRlUwbfNO/efSAkE0tE8sOnm4IVnPKzjCs9/UqdaqqzlhQ25tdRYbXouiA+MRJLtT
	 ANkYJRD7DuVpo6zKddycfVYz6+eD36MTvHAGoTuA0owM6LfNxTO1ihSen70IZ14HTnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793187318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer;
	bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=;
	b=TX9L0rHlpZPqzVmtAaEWbaO4KDdp9O1dC8iTBH9QxRqYcdzwkodtZVJy/k6D2bm7WH7W
	 F0TrgQ32QXhatcSZzDb5F61TJ8MD1slhGNEAIymf1JfeWaszEc1X874URXlveM1VlTWGV
	 3pqj4CFqttMgbe/2HsKjyz+U8knu5A1xQnEP7oQKLHpPFVuSlw9vOdJUfXQ9N6CJGBkvZ
	 DZGtM+oEywKkJKP+G5hiscU8aMWZIV5YF8csnk990tvNk/1l7ftxmumeDKMErctEdV0Uw
	 axIEx6VWDfgwCgKidbQLMPk3VDzavE2wWJ1rfMqlvDpybiJ4K3RCSsUv6qHuBAgQQYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8KPdrgI;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24DA606A31C
	for <imx@lists.linux.dev>; Wed, 28 Oct 2026 11:35:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D24DA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K8KPdrgI
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso518106f8f.2
        for <imx@lists.linux.dev>; Wed, 28 Oct 2026 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793187316; x=1793792116; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=;
        b=K8KPdrgID4C2xq/8N9y9Yx5K44nfvYeOIVuO4rx41kbflg0PB8v+4yJutcAQbCvhkw
         muETvmD9naynav0sHhhymSCZoORfrkK2XjXm8DaMtOmQl8C+o4pgTzyXs64ySI04WTUL
         wSqH2SIEy299m3If7MbL02jlRYO5I0NHbLLbUo5oD8UaP+MDgqB2mlkxeWJFc+VFI7z6
         ubKcAJu604d8tDNnG47fn9SgYgB/t2Go4VIq/FgsVQ2jHN2r8+GoetVfs+tYjlbBC89A
         eBPizyccvqaDLg14soSvWXOjCuDn/9AiPKClkyygBhAKmn3za/15tjdw6J7U0FPmh3oS
         iI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793187316; x=1793792116;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=kzgvlmTIhVHGThdIV5sswGrWTSAc2jljnSQn/BZ1riE=;
        b=WTjTWtdEa9FZp/M9FpyXqX4hmjpZ7S/r4UDNquCT1FRFPwU9+8aW8cnPer3bRhxKAl
         YIBp7MyU1taRUoz7aFjTYW/W3/7V2zzAyYcIvF5OwqEPWw3E12rTn+DpQ/h9sBYPD0MV
         gtwPFXhUcmRIe0cRLp6VYxI2bYTBbGVyOc3YnYQ9TDvJovTXYBgZqqaipTASPfzv6min
         IJihnHai6B7q6ol3a/CxsxzKThVqx2111EtL85p0mQZIBHlqRgPmnP8JnouG48IC6Elj
         LdjdnCwy2wLsZuEdDh4zAw5F4ZQjT3n89GDjD+MR62gwMxYo2x2xXq940clfYhUzslvU
         GMDQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8eVplvkBHX0gnEymGYMAdf5zBh4GY6Enl7ffxvP3Yfrur5bbXK0KdMpLTWCCtQhv1Bxs=@lists.linux.dev
X-Gm-Message-State: AFq9FYJoFeux9jQ0cImktVMidfBg2jtOcJTYWGltsIN8Jtd3SdGhqxRs
	qsPk/uCcEhd7FODskj+2mlUpSlu+9VFEdZQXaYK4l0dWjAXvwysCxwwa
X-Gm-Gg: AYBFou2mdKmpgbceMTwxi6CXUXt/uMsbXVfk7IjQcEA8xavKT6MTy5WPj6ByNMM6rI+
	8OXyyQp7a0JKagIkMoIEJSslV7kcGFQ1M+MsO1S2uIss6kQoO3xCLfQI5nS+o7Vzdc4TNZRDjMr
	OfD1fm3lHsipMiE9dvs3yiCmcjQrEtmDWTUThv/E5LIC2TIHv/6zBsls0MbesQw6DlYSAkQRTdB
	UdIbLklTce3xHIdYVp6s2hf0NJIrInlHHHZkF3LWcpgJW+qFh2TdbnMRKRkIywo7chYNQWO/aRG
	DedTIAxmO0fwQ2NGCIWb58egKeynfDLKCs1RRevmi175R3235WFrVOhdGg7j4bntE+fc+w8sTUR
	yuYBdNrvpqA/ymUygKufArnkUmkn90UHyFSf9rv1EkQtjJIuZ+1egYwADMbM7QKRSP9f/m1YeM/
	gCnjcV7YZFRIo3aUB0oDOh3UTeeKDym2avrIh1bKmwYnLZLyoG78ju+I3unNqgPk7VRrEzo6nbV
	Nf2Hd87eJqgnnH/7ZHIOCRW5YGb3ghPev9Dp0bnHEYtYoPxbtgH9vqiVrj/Jtl1FWTxhC3VRZk7
	3zLsL2gpq56qOtwSPr+ZXWjAEHCOTB/5KU/r+ZMcDOr2mLu1OkrNpkz1RgqKvxNu+RZODtmrwKp
	NIg71R4Je+PJ9Ts2N/nRbu0U4Rz1Adw==
X-Received: by 2002:a05:6000:2207:b0:48e:5df2:fd24 with SMTP id ffacd0b85a97d-48e5df2feb5mr4476377f8f.32.1793187315926;
        Wed, 28 Oct 2026 04:35:15 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f36asm28144706f8f.1.2026.10.28.04.35.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 04:35:15 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Wed, 28 Oct 2026 12:35:09 +0100
Subject: [PATCH v4] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
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
Message-Id: <20261028-verdin-imx8mp-m7-v4-1-d4e23e62ebea@toradex.com>
X-B4-Tracking: v=1; b=H4sIAOzd4WoC/4XPMW7DMAwF0KsEmstApBRb6tR7FB1Uia41yA7kQ
 nAQ+O5lPBRtMmT4wyfAR/CqFq6ZF/V6uKrKLS95nqTYl4OKY5i+GHKSrkhTh5o0NK4pT5DL6so
 ZSg+h80yd61xvUcnaufKQ1518/5A+5uV7rpf9QsPbdMe0x3tslMRQuAaoHNIFGoIGE72xnmP69
 MObSCHxeoxzUTe80S+IWuNTkATsExprBJQ8guYPSPT4bjOAEAZylsmdDKb/xLZtP0UfMshUAQA
 A
X-Change-ID: 20261020-verdin-imx8mp-m7-a69e26868741
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.16.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
This patch was previously part of the Verdin iMX8M OV5640 series and is
now sent separately, as requested on v2.

I am away in November, replies may be delayed until December.
---
Changes in v4:
- Use IMX8MP_CLK_M7_CORE: IMX8MP_CLK_M7_DIV is not registered by the
  i.MX8MP clock driver, so the remote processor got no clock (Sashiko, Frank)
- Link to v3: https://lore.kernel.org/r/20261022-verdin-imx8mp-m7-v3-1-af284e28531d@toradex.com

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
index 9fee2cf9ef54..8bffa4a27776 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_CORE>;
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

