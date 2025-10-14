Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B4A313530
	for <imx@lists.linux.dev>; Tue, 14 Oct 2025 12:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760446616; cv=none; b=EI4ftlrkDWJ5vcfUoWof1Y9KVmCZYiIhVPcoUenX1zCxzvku8V4099vnXu4Tx6FFfgjeAP6vu9iB3epwr3mjLE5nBdovbB8fxzZ6CqRQahIMtTGlEFifgLCGAK/8CHRAiXMmQE1Fvwz+bEh7vx8/63SAC4oKWAw6YATMSAwRj4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760446616; c=relaxed/simple;
	bh=LZnaDE/S/cnLfsiCdgYQZBmm8CJyduVyYwPzdW3joA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eHCiAg+LiTpzeTD4eAks4kv5JPZnflZ2yWCDZHCtRMx87N8qCQluS2WZMGZBQuwzoHZV52qeAqzDvtVVFxBFLC6Uf9CWUK98pKdGDEqHqKwiJ9AvARRJEKgop0rCdqASVAA79PCDlnuHpV/FBoToRIi+Fla3VzuifCSqtp8gzFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MaFKlhkG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MaFKlhkG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2897522a1dfso49240595ad.1
        for <imx@lists.linux.dev>; Tue, 14 Oct 2025 05:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760446614; x=1761051414; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o38gmX36PyqmjEq1ZTvcb122z3x4XvhpJiBBsGOOwy4=;
        b=MaFKlhkGg9AEoGMW/IcSVfdd0c5jMoPUlPm53XD3xXTKCOKy0QMBG/8+OD9IMYACUz
         hUr/IcgIn90K+VPOGiZxdETM+hROCAnXRSQNwUlSKe8v1AJKM6wO3wplttP54o/au2m0
         P14XuQoNPpa1bX5xyirPoMJrUV6IsX3X9yMn0yWTXJoINUwNEWHsZTIvYfDo7aPy6rII
         7b4kpv2vK/fUSbb2HNRUu9Dz15hdfa3xq2nx1YbAz09IXgMsMkAcF2dqYVICbREienhE
         Y+xNawXiujwDWDzrjWvs2etGztceFTgssFghC6aaLd6hBY4dl5rD0KDRFosHHWe1CZcU
         1P3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760446614; x=1761051414;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o38gmX36PyqmjEq1ZTvcb122z3x4XvhpJiBBsGOOwy4=;
        b=WL+JRSCNPjVjP90s9mieBAJt0UET6BylaVXuhq/swMSJMLt4QgcY8+aimaS+Y7D3X3
         jUitJCKpCejqJGouSnoVVYYcasUXom03t9vBGdxpDUlinco/95FrmbE8yd5FTzHjbXy2
         AwTxBV0+wXKhDzOzIH7mdJyFGan1OGvBhSYE5JHiWa96BOizGx/sIGtySKeICqomwNLL
         bx9kRDqmayrKHhTPwRS8gzzt1DZyWplRnvRgeonw+Xs2g7mBziJycOloMnAhEVtwGBt5
         xvpBLFK5MGb87BpPMk86vRxgDUW9Y4I2YCDY3LVUiE06xRaZgB4w3il/tXu1M4gia5Wx
         E/pw==
X-Forwarded-Encrypted: i=1; AJvYcCUaJfgoRUPOs6xTmUsA4PVNwCu8XeKVIu6iy4YZBJGAEmJTpcx2IYMX/q1cP6fEOFd8myU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxpRbe5PEAC37UXvI9qTSNANc9jvAN7NT2H2cNcs55VJTv9I52a
	6zeFTXq1Ld52KMgrA41Z0XNur63FlrItYi2XirEqutjLY+YUKAswKM5A
X-Gm-Gg: ASbGnctCAqOojJc+EDdJctPJYlI80gqjXjrKfzw8+sfIYAUs7MGH5MwgDFd3AYdyBrC
	foY4I1ZzxJFYKme0CL7I0ZSUWNbxOun0xRaylJ/ex1TGxaB6kKvv4qtniHWz6lzuMurqJQvmKUZ
	4sbrDDbikGlaVrswSwWsQ2+1Wh3x4mlLciYkmIP0DQE2o+riZOd375EW/gZR399qchur+nYwT/2
	+3LmvUTkOyFHssjeOjxiBevYOk3PsRCFDnzA9au6+OMAIpXI5eGCMzczozvOFwquhdo+LN07xmS
	xx7xQjB9SxilI3B5iyuapC+vDXMorxDydlM9WZxdUA/ieR6GLPsww/7X5LRV5+dKyJcKFbGnD/t
	R/usg+N6/2YQViaHehU3+ZeI+SRL4uM3ONKIa2AxY/saWBI0Mq7Sws1fT0cPouC9oO46o79+VLH
	4=
X-Google-Smtp-Source: AGHT+IFFPt+m448T/uVhH/uFa4IYkTCQ7dJj+PBX8yKsxeuPCGTRZrXD06eMiOSktRMiwnrCyjS6iw==
X-Received: by 2002:a17:903:2351:b0:269:a23e:9fd7 with SMTP id d9443c01a7336-29027262689mr366784675ad.26.1760446613904;
        Tue, 14 Oct 2025 05:56:53 -0700 (PDT)
Received: from joaog-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3ab2fsm163919985ad.105.2025.10.14.05.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 05:56:53 -0700 (PDT)
From: =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>
Date: Tue, 14 Oct 2025 09:56:43 -0300
Subject: [PATCH v1] arm64: dts: imx8-ss-img: Avoid gpio0_mipi_csi GPIOs
 being deferred
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251014-imx8-gpio-csi-deferred-probe-v1-1-62dd1b949731@toradex.com>
X-B4-Tracking: v=1; b=H4sIAIpI7mgC/x3MQQrDIBAF0KuEWXdAUwxNr1K6sPpNZtEoIwQh5
 O6RLN/mHVShgkrv4SDFLlXy1mEfA4XVbwtYYjeNZnTWmJnl3168FMkcqnBEgioiF80/MJCm4Cb
 /dN5TL4oiSbv7D+2Wvud5AVmyznRyAAAA
X-Change-ID: 20251009-imx8-gpio-csi-deferred-probe-eef6c56a35aa
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <joao.goncalves@toradex.com>
X-Mailer: b4 0.14.2

From: João Paulo Gonçalves <joao.goncalves@toradex.com>

The gpio0_mipi_csi DT nodes are enabled by default, but they are
dependent on the irqsteer_csi nodes, which are not enabled. This causes
the gpio0_mipi_csi GPIOs to be probe deferred. Since these GPIOs can be
used independently of the CSI controller, enable irqsteer_csi by default
too to prevent them from being deferred and to ensure they work out of
the box.

Fixes: 2217f8243714 ("arm64: dts: imx8: add capture controller for i.MX8's img subsystem")
Signed-off-by: João Paulo Gonçalves <joao.goncalves@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
index 2cf0f7208350a416d77b11140279d2f66f41498f..a72b2f1c4a1b2ef26196c810b33ecfdebdbc1675 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-img.dtsi
@@ -67,7 +67,6 @@ irqsteer_csi0: irqsteer@58220000 {
 		power-domains = <&pd IMX_SC_R_CSI_0>;
 		fsl,channel = <0>;
 		fsl,num-irqs = <32>;
-		status = "disabled";
 	};
 
 	gpio0_mipi_csi0: gpio@58222000 {
@@ -144,7 +143,6 @@ irqsteer_csi1: irqsteer@58240000 {
 		power-domains = <&pd IMX_SC_R_CSI_1>;
 		fsl,channel = <0>;
 		fsl,num-irqs = <32>;
-		status = "disabled";
 	};
 
 	gpio0_mipi_csi1: gpio@58242000 {

---
base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
change-id: 20251009-imx8-gpio-csi-deferred-probe-eef6c56a35aa

Best regards,
-- 
João Paulo Gonçalves <joao.goncalves@toradex.com>

