Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B00FD37417C
	for <imx@lists.linux.dev>; Tue, 17 Feb 2026 18:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771353821; cv=none; b=Yp0OZS0eJ51gZpUKlpzZFjN9k7T5JKmy0GrmnmZji6tDVUTcmUpQkX6TX1ejudfDlFfRAOUZx/c59foJVhx/jWI+T6onS8UXBFQIzm3pyLumdc9o7Z2U8LJVW+bMWl48uSaNCEp3lU0q3YJY/dsilXSn2W7cKjv89ysRsSUWD6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771353821; c=relaxed/simple;
	bh=k0TPNsCkcM/eeL4f90ns/+RRCekT2+wpnyTzz5zBV78=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIncyzItu2LO7MhcOIeWJ5mTQiGX/cq2Nh1351Fpi5gHsH4TKTVnSkiyWhLmw+lZqujL1wtQrMfOtc+6W/8PTGOn01thJxtt71Nr7HXQPTsMVLJs6fzdIzqyp8e2cG0NW7XBjrozEVhBAeBVhA/UNcEs8M3rlyQS9MCuRxhX2ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a3mbYx7x; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a3mbYx7x"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4837634de51so15643465e9.1
        for <imx@lists.linux.dev>; Tue, 17 Feb 2026 10:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353816; x=1771958616; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZfvx2TSwnhF6sMsrr7tpSL8G7O+D4yIrBCpFk7zB/0=;
        b=a3mbYx7xPiIFip7ZTZPobwlsAdKPjaA4QVxRE4zVdZskB39JGFuKmOp0oJCr6sPKU2
         p7YxYbvzzeJQ1WxgO2X6gOgr0fCpTRu6zAH/eGcRdpcRrl9DFY/EkevDRkA2oL0OcZWO
         4otlGJv0Q2vkDbboNDsTVB5UnCy6RFIbhqLHJpwWZQTlFaNkw3fLtKvQSBrcUsoKEwTs
         mz96Rai0vV08Mkc/jbaa3gUhlhuj0wEy/T7QBh2CNZXXash9EryLRIuTfmMS6oYSWeux
         zpaJiKHM/hRbTHAeDz7HXXPaRwMAqfnM6E10CMuSjBGVHyFeuJafQpkCsd+oEEAzlKDO
         kFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353816; x=1771958616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GZfvx2TSwnhF6sMsrr7tpSL8G7O+D4yIrBCpFk7zB/0=;
        b=k2oDiuvg0bQbWMe0p/dTgs0hxv0u7iMwkhG0mDOjbiDWHohAu+nu/ssECsH0Ftv5S8
         TMSZMgkqQwlZdjTuSc8JoEdkK+m3w4e0wgIbJWwz1M7f9Z8bFP1RhV0Q+V/gi4vGUgC8
         rkTy5TJkGjGTQwTZfw+KXneTG+Sxpp1/tV6o0+vJS/U2hS1u8r2LwEy8VtfH6Y21nqj4
         ftb0nkDNoEmDzcjl22La9sD4KdOBlkllb0YYAUY4t4mjwUoF0in/y7mjyJbA0zR40tDC
         Gle0YQVtKcdOzXb05vJnkiDMpbazdNZIBfPCwVSN8qbhuTSdULV3G1XKJdI930cyfMnp
         rEjQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsCTuqv9lJ1WLKMu1n6rkCZjJIa4A6xId+MEEqWspAgLXdJWov/k77DKFI1hKdB4HFRps=@lists.linux.dev
X-Gm-Message-State: AOJu0YwSC/vkNnEMgrz7KAX7AFXFrGwpcJrdHFinC5z+XLfSaDJ503Hx
	xNEqtwR9rOoZFZwFb/qD+uNfVABbDIEOHBXy0Z+mKgyif7DTv3T5F3jI
X-Gm-Gg: AZuq6aK9JzsBneqH5ybCUdtJlqpjVyiucjsLH5QCvp9M+mE4xRi/b9CC8c4VGPu9XhX
	T0dLePe87QopWejehLeTXxga78DMZ6cCkbs8ao8VKFwirnvRrMW3S7Ka/IWn2m4texBYSkgGqwl
	RFzGMbey/j/g4umtYPsO1pYkM3RXRXbuLvPPooytyXuXP4HXPyf+cnL1LTRLbpvH1QOCAhyePkb
	MuAG3xVmamnQRbF26+qyLPs+qVknT3tyDwDJEe+bWH2D5pTVJitxohbJaMndB+mjSkuWhC1bftp
	6CyyKkCMP7wFuZmtt0SqHxzgtTXQ8rBOIDXbDBIefND3AuHPqbv8VyzhbcwKqS+08nSiVkUmfW0
	XrSusP2btQ0L7Fuhi/z3FrYKJje/S1/ywY3KMykSR9221mH5DHdjRD14vEdFrb6+A0wWa7oLPkA
	QwbSi6MdqxJ5pgHWhp10G73D7cagESEvSTDjaf64I4qlMwy4w5NDnThdXR8e2tLROqKSeerYj0o
	VsmRH30yNCfShENve0IUB0C4uNUOGjX1EAqc0Qh
X-Received: by 2002:a05:600c:3b8b:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-4837104307amr310912825e9.3.1771353816025;
        Tue, 17 Feb 2026 10:43:36 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:35 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 09/11] arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
Date: Tue, 17 Feb 2026 19:42:43 +0100
Message-ID: <c48ee9db2f8c98e0836e995577da8dbb4717d9c4.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM2 device on the VAR-SOM Symphony carrier board.

The ST33K TPM2 is connected over I2C, and A PCA6408 GPIO expander is
used to control the reset signal required to release the TPM from reset.

This patch adds:
- The PCA6408 GPIO expander.
- The ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mm-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 40ffa1f36b2f..b4dba1961eee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -137,6 +137,20 @@ typec1_dr_sw: endpoint {
 };
 
 &i2c3 {
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5406";
-- 
2.47.3

