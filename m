Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FAC45028
	for <imx@lists.linux.dev>; Wed,  5 Jun 2024 15:30:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717601429; cv=none; b=NaXChSIL+NCbBcT8ZTA0xKsUtAl/K1rM+lL/u2RaSIP3nUC/WVPA6AvklzeU5CjnIA4ici6qOF7BUCDx4PvgQAW8Odw7uEXnZqsar8EvvqGhx77j1JopN6qsjjb+QD6kq4kQ0ScICF50O6Qgs7B9sWifzboVj7syUxOtVQLUuJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717601429; c=relaxed/simple;
	bh=NMv3VKh5odLNj+GDe8Ww1tODWUNO54F1FJCzMaqqk7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uX79YmkaIRd8OqTlMn+VrktZ01XGz7v7r+EAJXndylHmLRQskkmXorvuxeYpnoXokxGh1uykH8oTL4bciZQNZNcVGstbd1Eyb7Gz6zj/URpHrjsh3D2D+rEQ2xA6jMiNbNeXzkdH7OnnMISgyEXUNQ+UPwWqEThoQmf9r7HWmB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yW+LixIX; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yW+LixIX"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-35dcd5377c4so104981f8f.2
        for <imx@lists.linux.dev>; Wed, 05 Jun 2024 08:30:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717601426; x=1718206226; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/K0vfcsphggQE03HaQTq6oV7X6egbMSNGPCTOf5noQs=;
        b=yW+LixIX+ZtgebmaCE2PPW0s5jou/DoswMAK5kK9T6BkgYtqWBS/weaCE7cJbBESkI
         Ay3U96ZfF0NcPLdn/WJGxe8ye9btKJ7pjbBRj6NJZRGVbGcjf7nW7os0etJeoyac3cB7
         mU9wnPeXepLbIZYahKJCEsf4Cr4a6iy6Sj4M2e949ly8kq/J3uN5XdLncj2SwECeluvJ
         jNrwwDQN0UxZZtkUKW9XXE7wo9Iw+hEGlrYY6JgWQ+3XanO3ofcKlxZ7RQsZTIE7nV5H
         X9VrSgUj+yAtaCJDiz1T0Bd2YOHGz/CuyhGRbTE1QxU/MYkDDtTcLZf1dcIO2YWvwqOQ
         u9OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717601426; x=1718206226;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/K0vfcsphggQE03HaQTq6oV7X6egbMSNGPCTOf5noQs=;
        b=j8LYpbgPhijwftYU0rJ/EOoY12kzcW101P8WtUDsRUM4ylb0PBTWgPLf9DgXGkDAW3
         aA2ZZ7DjmzizPWKq7q3FqQdGmmy7W1UpdGEmhILMlXxC2RKbQlihKhTU0kqgHcnlaGcH
         NCBm4/n5ihik3JIofaFJrPGL+F/svlX2ZEH+hwiRbvkWhFA2Eyc9KmXOYJFHkSQ4aKmM
         cg7jKOfHEbV3j54zIqgyW6DoAA3g6P2risyRIArFzfbsFejeYhT1Wn2fTMQmAw6ZFpwm
         rSNdp5p/2xdyBf81aA4g3+UPHLAA3n57r/CUObFT1xJd6iWt5Us4axuJTPotavJC1ikh
         08Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWroHtFL+N29e94QJSmwBmu5B9/aIePNKq3Yu+4LKgb1xw4Qqps9LUimthSQ4XTSni4xuH0yH8IZEnrZLWdPN6OXiRr
X-Gm-Message-State: AOJu0Yy+dNLT4/bL146kRm/bh2TX9KKas1AZEo4/rvIGIprv5dYC8ku7
	k2NxjmrV0fwzkFX0HDJ6b2IoxpvCepT/vYOZEEe5DE9V5sYgPZ/71IfJ0RMGwA0=
X-Google-Smtp-Source: AGHT+IHE9nDBQ5Sz04khTcIYOGPj0VwRgEjUuiwPv5JSHmid95xhtkpvCP2exEYp6NXmZOXTxCKtiQ==
X-Received: by 2002:a5d:59a5:0:b0:359:b737:68c9 with SMTP id ffacd0b85a97d-35e8ef7ea9fmr2637446f8f.45.1717601426591;
        Wed, 05 Jun 2024 08:30:26 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215814e7cbsm26222295e9.39.2024.06.05.08.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 08:30:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] arm64: dts: imx8: use defines for interrupts
Date: Wed,  5 Jun 2024 17:30:20 +0200
Message-ID: <20240605153020.104717-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605153020.104717-1-krzysztof.kozlowski@linaro.org>
References: <20240605153020.104717-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hard-coded interrupt flags with standard defines for
readability.  No changes in resulting DTBs.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi | 2 +-
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
index 90d1901df2b1..930e14fec423 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-evk.dtsi
@@ -400,7 +400,7 @@ ptn5110: tcpc@50 {
 		pinctrl-0 = <&pinctrl_typec1>;
 		reg = <0x50>;
 		interrupt-parent = <&gpio2>;
-		interrupts = <11 8>;
+		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
 		status = "okay";
 
 		typec1_con: connector {
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index c024be33fbcc..6d002fc1b2be 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -193,7 +193,7 @@ light-sensor@44 {
 		compatible = "isil,isl29023";
 		reg = <0x44>;
 		interrupt-parent = <&lsio_gpio4>;
-		interrupts = <11 2>;
+		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 	};
 
 	pressure-sensor@60 {
-- 
2.43.0

