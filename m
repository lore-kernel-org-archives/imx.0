Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637DC49631
	for <imx@lists.linux.dev>; Sun, 22 Sep 2024 17:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727027017; cv=none; b=ePc2h4K2qvX0BXm+oErjn4thxtt9t3BU58VEXK527BBj+ymgABSGI/s3Wj1zfcYH91YaehETbSMaE3sMPUh4n4ZciCfKYV8aFDWI457ICjY54Y4YIdFFIqnPzBmds7ur9d1dd2aS/uavvYH86CtQqvXuT9sQiaW1AhXRdT8fXa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727027017; c=relaxed/simple;
	bh=yy9gl9pQz3F5fgfnipmdtFV0zJl13QipSJnEg+3xNDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ARCai98v8SYzCruG2ZuWsBeEhbZf0fmGIX+GRYELkPkHgsuaaOyFu69ULpKhm7qBn6gIMl73+0AxW8XAxn7WPLKot3rouiLcdIWvBEvF/mbF8HDNVGYTueAZrit/BGVL5nMrca1ayLVpe3OTsXi8XSRDy88+m8BsN1ZRn1wR92E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M6GpxrOt; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M6GpxrOt"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cbbb1727eso31759935e9.2
        for <imx@lists.linux.dev>; Sun, 22 Sep 2024 10:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727027014; x=1727631814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXLPtmmwbw0kH9maBt8kI0QUZhZ3U60BovT7L6yY3xs=;
        b=M6GpxrOtJNgLba/+8W0LbTS1veNjEYgjEKgKi3MgLgnDghmSWHL9cUZCcHLiJE4sfL
         eqZlLQTdSBfkLDg62oHMe2f4A0Wl0bBiAcPUZ1b0qZ+rmwZ+CY02l/kbm9X+nzuEi/gL
         MKOuPJyyZYE03fHFzsH/xX5u3BVTvJQd/HB0pQFMpJtXljuIXHb1IpZAg/q1H+z3WdzR
         RWBum6Qhux4hnkFeIk4yE+6rfg9wWUsm6+g4MU6pCaa7zCDtPeSC5xH73/ZjXveVQbDq
         WQJnR3wkc6/BxY5fZmaRntzVbHPx0MQK/wm9tecPDGyQZsT+9GrRHNk4ZW2EHbeSGlWJ
         FKTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727027014; x=1727631814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXLPtmmwbw0kH9maBt8kI0QUZhZ3U60BovT7L6yY3xs=;
        b=oKUFJGE9kJvFttru+Ie1FHRYAvgo4sQx9lybHjXtoUjkhRwjmzwxIIRFvEJaXx1M0U
         VoMDpOuNY4lLtK4HOTvBqyuC5jLZZoyD/6NtiX0uCYz+0qydVdwQ1SV8zKN3IpwPzfYK
         LTeqllp67/haruwQXNZtae+kFTAtwE6axfKe2AkLQroNHFX5tPgV0/9Iw4lOgZVNQS8Z
         9Pr3x03ReSBTDEBR4HoHRF86A0eh1joD/FXtkHyn4V9DM5CJxvvhkyyNVFwssiGPBUWe
         Ga5/5jJhjmrBvSVanhdhcNauhfKUwDb9B16Qhf8f71GGRbsDlSt5lBqgrNfcFccEkZZ4
         sqHg==
X-Forwarded-Encrypted: i=1; AJvYcCXT4rqpVmBp32y1Ee1p1F3TV87R44dv5ePAUkD9TM9RGgPxdnsc2ubkC5muku3Qrl7mjfE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKXQU4KhR1tGkzzs+C3Fhv76j7U/oR8eAb00Qn4xq/gtS8Zitv
	zkgIpBCZs8c/oNezitPhSI6OYDp6XaRkOdic5JQKpHSn/i77YUCA
X-Google-Smtp-Source: AGHT+IHphXu0dGNfZ9BDNAw2gAnN60BBDuqllWZxOcm2vfWqG7Fy/AldhWq3sNJHPEbqGKEbIpHQ2w==
X-Received: by 2002:a05:600c:4695:b0:42c:ae30:fc4d with SMTP id 5b1f17b1804b1-42e7abe12b1mr74954615e9.7.1727027013486;
        Sun, 22 Sep 2024 10:43:33 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7ae60ad0sm80758535e9.1.2024.09.22.10.43.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 10:43:32 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 3/3] arm64: dts: imx8ulp: add AVD-SIM node
Date: Sun, 22 Sep 2024 13:42:25 -0400
Message-Id: <20240922174225.75948-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240922174225.75948-1-laurentiumihalcea111@gmail.com>
References: <20240922174225.75948-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add node for imx8ulp's AVD-SIM module. This also
includes its children.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index e32d5afcf4a9..1ffa4da23042 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -614,6 +614,19 @@ per_bridge5: bus@2d800000 {
 			#size-cells = <1>;
 			ranges;
 
+			avd_sim: syscon@2da50000 {
+				compatible = "nxp,imx8ulp-avd-sim-reset", "syscon";
+				reg = <0x2da50000 0x38>;
+				clocks = <&pcc5 IMX8ULP_CLK_AVD_SIM>;
+				#reset-cells = <1>;
+
+				mux: mux-controller {
+					compatible = "mmio-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.34.1

