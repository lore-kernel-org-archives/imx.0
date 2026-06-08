Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE233D891E
	for <imx@lists.linux.dev>; Mon,  8 Jun 2026 14:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929696; cv=none; b=hT3qlw7u3fJo0w62ygUIwFRscc2D6O++rLMDpMuAoV4Ax717GdfWS/zs5Lz3aHIeEhcp/ciaWP595qiNYs8Oca0uhQVNptrFNymx3Fb2jw+fzzM7oyyo1+T7ud/491Soxj/jJLJSfuk/KI+0LrSzLn8VvKEsDCoCU5aBRqhiy+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929696; c=relaxed/simple;
	bh=cMeUXQZYhaxl8CjW70xCdkk9iC5nfQTb1mViDk//cQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pc3EyMnivxoacf8WubPyCLpChE7Ua9LOoBkGYHaN5eMypOEWNNi2IZ5dXwpBmsUXEvD954ZYuah+YoxDJl3dpJNgZxveeTxivIEajrhPUpg2rDze2AQPLw2iLunKOXJAFAsmMFiyOuHulKR9Kt7tjd7sdS7SykF+9JqR7UVhqE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MQVGz0pi; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MQVGz0pi"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so14036875e9.1
        for <imx@lists.linux.dev>; Mon, 08 Jun 2026 07:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780929693; x=1781534493; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pWTK0vPDX9/u7hsXS3gp6N0x4YihiQ+Mlh3rTBzALqQ=;
        b=MQVGz0pi0rTzFDqylp6OG9e6Zl/MGSdi0CwO5ncRgbu3Cu/uJ6K2vSvRyNi4CDmfFX
         THzGA9kTqD5M77ZLMGW5e6Joa0487bYo3Te17mYWDyGcud6seRhfS6qIwjEyv3fZj2CO
         idULkIQSduwxGqUxHKlahyf+8nSC9jpVuaccwpIlqIZTl0+cLJEPskES9NpNdJ0Vdw+5
         AKsYE8SjSifKkz4OvlhYdfMtlePJeQBpiCYneqe3je5aagnwVERXujACGEyVhKFOPprP
         2j7KhZ3DEAnNC5Y1D32QrGoutfRrCFSU7Drz2cBGESWgytOTCLEyEuE4PRHT9ECxrg1A
         vcqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780929693; x=1781534493;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pWTK0vPDX9/u7hsXS3gp6N0x4YihiQ+Mlh3rTBzALqQ=;
        b=PuSqczrd8kqy0BXU+hBk7QmgOomwAlLSq4pngX7smzCL0J/7KLSuGP+ZMq6FupmxeP
         5vyD4H4+YyVZ/agDFgsfDm/HwQodf5a9qWn7K1PDAQwXY5hm5v3rZVGW+wGkJGR0MJB8
         Z7NtxhINZYqDUYiY4ETl3r/BOW+9EjsFwul60Dw0o1hORTr/GBwq2hd1E5sEMZgRfEJh
         vL44i6L5souNp4eXMqUEyVMgO6yWu1CclieZOOSnFsaIEf+GinUrUobmb9ysDOP8nOzw
         ZacYWWHjS8NeMzM3i1NitAS8cN4PNuMH80RGr77as7mmINWR7ZFLE/AXU7LHQZuegUen
         6vaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/BmsJ6AwN2bzaKIrqBYUsudKbWHBAkDbAPn7EEIdWFN2RWRjGfjj9Nr9kjwLidjnu3njg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwM9V04u5worLowbD6nTyxdqW55cz3fIAgFj0VT10j8wDjOyq+d
	yssjD9V3A8Gttss2EpMlvXJfoIcEfu5OlwmJOuTUd5t4gwo//pIhAzlg
X-Gm-Gg: Acq92OF9o9dd/owC/0B/wqWkNiOU1GspJfzc+BKA9OxT4u7FB6fBJUqvsjGR8Rrkeld
	RK1lqGwiPuvjZ7JDJfe/bzYC30JCh5OU4YyDj4syfEJoxQ2vOmgVbSoxVuvlgXIJF6oeDqib0z4
	Ir6Al9+jtSkEgGZiwyFs2SC7C/Yrw08Yzq3EGgy+CLIVZY83xZPFKERBzmqvtawBzBVBmvAZGGW
	Mc7t3rSjxPZ+2w1gnjr3vproasEpxtM249kOLAMMAuf8LoUu8aRVNx2EBkhrn1XaiFmghAM7nsY
	Qm274Mn+iqBYVvtN0em7P2yTMzmIKOtBRBRHWtCD6/qk1AKPAO2+iK6CzJETPQ1R2r1y1eSxYQv
	+NpvWKZcKmgi8SKScx3g7Zcv0akrdJe/auCrQ2AuOp4ta2iTB6AiopytaTtJkCMT2JanjTTY4OK
	qKOxS4k4siEvbspSfFgW37x52KepYqTKyhP1xMxfc3RINyHcWO4tuR31HoDxzvRKQUsF7ObzSP1
	KlbI/o4iUDPaxAKyABK7e8RXqfOZ0XQTZMjIH25B6JtJCoN
X-Received: by 2002:a05:600d:6444:20b0:490:5466:8591 with SMTP id 5b1f17b1804b1-490c26e1acbmr190687155e9.12.1780929692574;
        Mon, 08 Jun 2026 07:41:32 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-244.cust.vodafonedsl.it. [93.144.65.244])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2dcad5sm58222519f8f.5.2026.06.08.07.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 07:41:32 -0700 (PDT)
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
Subject: [PATCH v5 09/14] arm64: dts: imx8mp-var-som-symphony: enable ECSPI2
Date: Mon,  8 Jun 2026 16:41:10 +0200
Message-ID: <77a60c287ec6df2915806f80024b3d13a7905198.1780929317.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780929317.git.stefano.r@variscite.com>
References: <cover.1780929317.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Enable the ECSPI2 bus on the Symphony carrier board and add the pinctrl
configuration for the SPI signals and chip select GPIO.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - 

v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - 

 .../dts/freescale/imx8mp-var-som-symphony.dts    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
index f8a4b5b2e9fb..387bbe3454c3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-var-som-symphony.dts
@@ -99,6 +99,13 @@ &aud2htx {
 	status = "okay";
 };
 
+&ecspi2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ecspi2>;
+	cs-gpios = <&gpio5 13 GPIO_ACTIVE_LOW>;
+	status = "okay";
+};
+
 &hdmi_pai {
 	status = "okay";
 };
@@ -327,6 +334,15 @@ MX8MP_IOMUXC_SPDIF_TX__GPIO5_IO03				0x16
 		>;
 	};
 
+	pinctrl_ecspi2: ecspi2grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_ECSPI2_SCLK__ECSPI2_SCLK				0x12
+			MX8MP_IOMUXC_ECSPI2_MOSI__ECSPI2_MOSI				0x12
+			MX8MP_IOMUXC_ECSPI2_MISO__ECSPI2_MISO				0x12
+			MX8MP_IOMUXC_ECSPI2_SS0__GPIO5_IO13				0x12
+		>;
+	};
+
 	pinctrl_hdmi: hdmigrp {
 		fsl,pins = <
 			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c2
-- 
2.47.3

