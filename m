Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6F6211298
	for <imx@lists.linux.dev>; Fri, 10 Jan 2025 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736522346; cv=none; b=eZ6KmlvUg1KBeKPnQjGVYJENqiUEPbwPGInL43vMX2ycxE9OTVFLJCmyvnm+7TXTEvC461phv/w5EJJjneF+1sG6Ut8PGFY1rSuwBaQeQ+1eqkvBMMlCx05IIeymxURO210k8Rqd8bBahG+WZbhdpE6QmW3dv4oZ1rP1ucMmvoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736522346; c=relaxed/simple;
	bh=GdxQAAhkvYNc45ogZEOTdokhwj27OmZxfHC7bNT6WS4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lt84ipP5xY+6tU5+GjNRrLdNoV1PdVUP8MLqTdGVUF5057c8EgsP3eQB8jwgTg/7MVmsf9r5kUUtXiPIuxgBF50lD3WI/c1tJO0puzclSf3v1xWjO4FTg067ZU55Zd1R7jZvnQSWfLQhBGqd7lV0tfSejuR7KK6oEwwa+ZpcwP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJdnr5m5; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJdnr5m5"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43623f0c574so16516985e9.2
        for <imx@lists.linux.dev>; Fri, 10 Jan 2025 07:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736522343; x=1737127143; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e5aEpMmoZZCQQPaRUNn2M/cjTXlmafGJ+ljwOWiSLUI=;
        b=CJdnr5m5ORTqBaoqgAj4PoSyKBaxOl2/CDm6yq2QFsQLiXDKkgFXUNFgb11XGG1TPM
         DV+RgxzrrBLlEBiIiAXsmUxmXqyGu6P85cYyBpCLLgfNoU35nUxDw/H0IsKTjUYDimPi
         LBNsn0Cfx9vXeNJ+nFstLBhqRWk5XToxp46Soe9SRfW2n1nmemk2ND0xRFOxGr/KvjUk
         kZ8SL6mudryF/QJO8Vfl07K12tYwI4AgQjtincRBaJY95tpZXcutEBV694nNXNwQKq57
         l8h2ttbV64lSohqBqAJw81nwh06cVnA6yFnJK2XCoO7j71l9YNbZJ6Edj9UtudUwt1Ep
         U+ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736522343; x=1737127143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e5aEpMmoZZCQQPaRUNn2M/cjTXlmafGJ+ljwOWiSLUI=;
        b=MoBgXqb47U9dbQKiLWPVvFB1bCZQYUJ3/VPhXzIjvcwyegtR2jIWRZMNuWjCfZ4oxU
         zCsdO6QgFV1xKl+ZgRp9tE9ujMZo9S00ZZCvCKVBKP3xhok2xrgmQgpWWd3+mgGyYw3E
         fQWPtmGwzGjxaL9LS5yzo02NZFPU1LEYHj3IgYov3mKiWbNQXoWszZ2MoXGY61FVy8pQ
         uR/7TFL8NNmRp9YodBm5YFv7ik2RCr5Vy3U6HzaBYQCYRqFxmUMQBloBMyYvcTGKARVR
         W4GAvL27GjlCK83K06sRkGeaBmtafZhnT43M3+uypYH57dRAVJ7NuV/I2GF2+HWKvnbE
         CdFg==
X-Forwarded-Encrypted: i=1; AJvYcCWmDEjfunYtiUVIa8Q4dn67IyWYWeuwbhR2NUj5TmrghVKI2xC3ZRiLUrenHSDsJYunqJ4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7rMyIhhT6l8no3yVdkHXNV6D9fLLOv9fmEi48jRsaxfJpvnZr
	xR1iTNSwLXZi8bjU2GiynYemi1tfRH4lOoQZc0tVKE5QvIXT5/cn
X-Gm-Gg: ASbGncsMZSJ3z7f1IlHPXpmPL5J8pGxRHPh15L8usUfoZD6X8/7L+5RG55gp/hwbsmQ
	j/OaZjJQ/OZD6ILP3ew+Sb7cU1p6KSGHJtRKPs2sanUPalMsZ17d9YdJL6t5H8PJafEdqOBN43F
	ycct3ADvD2BV5eyNqcaTqYv7ht+zfR6cCY6Zcvecm58Sks949r9OB6atKkKNZo9wYKY+rYiCZTV
	NF5I3dYXkBwTb1jsrPrUOSUVZwOLM6qvhHxtexYf3hwbh9yaia2Pe1aKYHq0W5gSZfewvtJ
X-Google-Smtp-Source: AGHT+IECfAJ2WoCuNj7wvzCw79nESfWsenN47zMVWMkB4VRz8D5aWBaZsf1e+N3uhc6SbLU9mvw4vw==
X-Received: by 2002:a05:600c:1e17:b0:434:9d62:aa23 with SMTP id 5b1f17b1804b1-436e26dda97mr99240525e9.20.1736522343081;
        Fri, 10 Jan 2025 07:19:03 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:d0fc:3598:a372:ece6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9e6249csm54511425e9.38.2025.01.10.07.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 07:19:02 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	max.krummenacher@toradex.com,
	francesco.dolcini@toradex.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v1] ARM: dts: imx6qdl-apalis: Fix poweroff on Apalis iMX6
Date: Fri, 10 Jan 2025 16:18:29 +0100
Message-ID: <20250110151846.214234-1-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

The current solution for powering off the Apalis iMX6 is not functioning
as intended. To resolve this, it is necessary to power off the
vgen2_reg, which will also set the POWER_ENABLE_MOCI signal to a low
state. This ensures the carrier board is properly informed to initiate
its power-off sequence.

The new solution uses the regulator-poweroff driver, which will power
off the regulator during a system shutdown.

CC: stable@vger.kernel.org
Fixes: 4eb56e26f92e ("ARM: dts: imx6q-apalis: Command pmic to standby for poweroff")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
index 1c72da417011..614b65821995 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-apalis.dtsi
@@ -108,6 +108,11 @@ lvds_panel_in: endpoint {
 		};
 	};
 
+	poweroff {
+		compatible = "regulator-poweroff";
+		cpu-supply = <&vgen2_reg>;
+	};
+
 	reg_module_3v3: regulator-module-3v3 {
 		compatible = "regulator-fixed";
 		regulator-always-on;
@@ -236,10 +241,6 @@ &can2 {
 	status = "disabled";
 };
 
-&clks {
-	fsl,pmic-stby-poweroff;
-};
-
 /* Apalis SPI1 */
 &ecspi1 {
 	cs-gpios = <&gpio5 25 GPIO_ACTIVE_LOW>;
@@ -527,7 +528,6 @@ &i2c2 {
 
 	pmic: pmic@8 {
 		compatible = "fsl,pfuze100";
-		fsl,pmic-stby-poweroff;
 		reg = <0x08>;
 
 		regulators {
-- 
2.45.2

