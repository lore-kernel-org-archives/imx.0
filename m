Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8461158A20
	for <imx@lists.linux.dev>; Thu, 16 May 2024 20:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715892099; cv=none; b=PFTZbC9iHUw35T+AFT8lkvuD7luXoamkMufBTpBw7M+VdiEKjwSlofxAkqag0awP4Y+xAJzbcMgiiZG6WvacNuSof5nCtESZsZM7iR25u6rn3675RUMzyUJQ/xlgW3GsQBS6uzvcvfTRbEF1BXHaYyoTe2YITZ9OBrCGQdCDZdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715892099; c=relaxed/simple;
	bh=4oadGygxYA7bjkv7TT+WWegMW5gp9hz2kjni4oNe4jQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mE8NHeUWaRwWYxs8esYIvCVL2GMy0uQh5zevvkdES/n6S3nC6ydDFm126jvmI4knWbhB4KVFEC9JATInmbvTY4mp8VZsMcBoSRq60J1InjrbEsQIWfXgxqitTuKScQXCCoL0vxV7Y7Y6reQ+QOurs2mCPotyaTf6COh6WIXzJBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K/QV4LwE; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K/QV4LwE"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-41fd5dc0439so59543715e9.0
        for <imx@lists.linux.dev>; Thu, 16 May 2024 13:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715892095; x=1716496895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Kwo/PJKWqwFR8G1QKaJWay+TAo/b1R/praQRuQi8t8=;
        b=K/QV4LwEaqq/Nt1hw6iuySkjJxPdb0DS2wLlqtkQCwlmxP0ElMPYhA/v1wvUALtn8X
         lbZDGlBEjBudBXaBYxI6tNmdeYG081TDVtP8ABQdQs4nX12aid4RruJ8DULEecI48nx6
         zdvVmB8CZ/1QGhvXQwgeue2ZtLq3qFZPapSRi4uPcYWxFytynsjdInIjC6gIMUrXbeQ4
         5/IM9hc8aqBUB8w7w3m0X/d7lF597+sSPdk8sRPv3VyEUORCLo4it1vY+ljBNbZk42FG
         kg/c8rFDtKaq2yWWmEGNyW2C8LxcCuHJMv/kz33JUBYyN0jjrR4KSZZps78R+LEAFoy7
         jYLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715892095; x=1716496895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Kwo/PJKWqwFR8G1QKaJWay+TAo/b1R/praQRuQi8t8=;
        b=eyhuf1wVYEaNtEGHGUSGoMRvyiLTJfai2NBw4nSyCM5ag5KQBAFm6OiT5UoOJYVYZf
         2CCbeFYzvQvNn+HUjN+obZ1Sa/ElnHxDjlpVwmnJayhoT0BB3dB3i7xc2JsjGU1G42aJ
         YvEJXg3oOuD5pKSXR9xaYPaWpVyV7ZOOinsDi6WVFW3KivTLhvgy6fUNbBGZ+5YJl1hk
         /jJBMtwe0ABSiFGADr+OkHECa0kZEApTJC66sb3lfKULPGsXUKznimQLrSrj0/0Z1N0c
         fgZNSggz98qVpeAxW5CJmOJUWhK19HcO1lsmz6LvuFT/OyfmL0f1/ORq5QEMatB/gC0k
         aXmw==
X-Forwarded-Encrypted: i=1; AJvYcCX6XwEd9EONg1KslBnpLaj6wA9h/sYHbCejFJupFp/+wa5Cwnc8U3PRzuawKIpWbZMSV6Yna0oXRe8tIQ6kWCyorGEX
X-Gm-Message-State: AOJu0Yx+ccT+plDQTwn5Lxw1PL2y7oYM1TPz9jetMm62AbBogFgSqQvJ
	lhvm+cESGFF+rZvlKVG0CBvgBPcV861eVWDgZPwOgPnnXBo7wt2k
X-Google-Smtp-Source: AGHT+IFNas3/3kPAsfpD5yX3BBvTnf6Ycfw16x5JhHOqISi3MwmXqWdKiNWT3OlLuArijC+XTR2qiw==
X-Received: by 2002:a05:600c:198a:b0:41b:fc3a:f1ef with SMTP id 5b1f17b1804b1-41feac5a3damr136908115e9.33.1715892095152;
        Thu, 16 May 2024 13:41:35 -0700 (PDT)
Received: from localhost.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2b8f7fsm10859828a12.66.2024.05.16.13.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 13:41:34 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: laurentiu.mihalcea@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx8ulp: add AVD-SIM node
Date: Thu, 16 May 2024 23:40:31 +0300
Message-Id: <20240516204031.171920-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516204031.171920-1-laurentiumihalcea111@gmail.com>
References: <20240516204031.171920-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add node for imx8ulp's AVD-SIM. This also includes its children.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index c4a0082f30d3..5135d98dc6f2 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -520,6 +520,23 @@ per_bridge5: bus@2d800000 {
 			#size-cells = <1>;
 			ranges;
 
+			avd_sim: syscon@2da50000 {
+				compatible = "nxp,imx8ulp-avd-sim", "syscon";
+				reg = <0x2da50000 0x38>;
+				clocks = <&pcc5 IMX8ULP_CLK_AVD_SIM>;
+
+				mux: mux-controller {
+					compatible = "mmio-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+
+				avd_sim_rst: reset-controller {
+					compatible = "nxp,imx8ulp-avd-sim-reset";
+					#reset-cells = <1>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.34.1

