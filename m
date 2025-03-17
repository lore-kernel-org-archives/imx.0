Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE0023315F
	for <imx@lists.linux.dev>; Mon, 17 Mar 2025 11:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742210340; cv=none; b=BZWGAUawQqbH98jHnZEkDt+fhfC1fpKhC2lPB3P+RN1sE+yHfius+Zdi4/XW4UtZnLR6vfZDPTAOEihYM9GWFOgZ1PpQwiU7Ye9PSafHETsn/usbe4QVl+QJHDXrZZtHEBSiBXXJZlDqAby/4FRHZEX7xyjkB/TdWs+EKOTm3a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742210340; c=relaxed/simple;
	bh=BNlq7x+/ooXQ5PNMvqwHrshQHFzbSVEM5YZ1/1EZSOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KPfpC9s2AOfsGW7H359ZFY2XWgtXMtekud/ELepHL+nA/czpYy57zy2+JwZHtna3E40N+vXgcVgLuai6vvW+45Z6MPWwXWa7XVQaqsxP7w+GMJNF+8QjTneeLy1z/SzsV96mEhN38vHGTzFcbl0v8HVoLlc+KsB/hy6Et54Yb2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X72fKOEC; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X72fKOEC"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5dbe706f94fso890747a12.2
        for <imx@lists.linux.dev>; Mon, 17 Mar 2025 04:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742210336; x=1742815136; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yb1bmwpZfvOX6yMK1i3HHBS8ZlfwQU6J5gT+QGlyLNY=;
        b=X72fKOECkt5jGShRbdRznEXzSzSAVxmSwex8dsioNzox+wdT/0z4jfufiAfktJLDzM
         CSU4OW41w18qR6of7co/S5/TVdJZ4D/8WSj67/KTEKqAurUsBUQxYzL7xsyTU+Pnzqu4
         aGROcilK4SqCz+/sI2QhRBtctjHF0CwJlKm57KIivDUCGPo1k3PiIycMOjLwQ+JtDmY9
         9JpRjaXb1bYq2qZpEJoh1FEoOHt/9+PkUSyRyVUkH9eKCCz64mHkegIlkIgf8vpor10C
         vrZqh/11bdxxyje/fISzklSn1JHC5iGn0oXjlebbQ5KQ/kwLmYzCWL/YSc1hjmyOgiPe
         F5Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742210336; x=1742815136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yb1bmwpZfvOX6yMK1i3HHBS8ZlfwQU6J5gT+QGlyLNY=;
        b=tZ3IIwS4PtHpw19hspb+DdWIFdEgsLWBH5ij4+4m6w9Zsqrsm9o5R8rZOEwzvr8hWC
         D3EcwSnI4TFrfbC8IjttPnHsAna+Htj/J4Jt2xU4QbTC2hgc6lV6pNa1IviA2/bBQc6+
         HmcAWvyQxjnu2z5ABhWk3eyloKsdBYrG8p3voKBkj1gFI/xIax6TWGgLuk1qwkqB963R
         i9Pc+3ddE7BaGgfdslFr63PuUVzynFQx2n2w9RzxuCNy92RhbJWyG/HCPKSy43y/Ya4v
         IX0PQBVVOfV/tqu5A92l6KyThk8nLxqQEf39XpLAbjo8yMDr9ydm2XFDAcq/IdNNEi2j
         qpVA==
X-Forwarded-Encrypted: i=1; AJvYcCXo3WhF5KYAJwGajjqJgXi5yfP40rTtNR3GFqCgx5LFC5WsqPwwrs0nI5arZ9wlLtMcNOo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1w0fXACHZuvlOsqospy/eoGwFbcR4pbCuZnKAnobap0Fu70t/
	k9MHF9jGga/ddZRzg0avKaRsjdo4WytsYTg9hD+sGcoxl96IX9hwmSbBudT8bMs=
X-Gm-Gg: ASbGncvJtLhoxL7EyB6DoAnGaSK+nIzzg4zmmd9go2Bi5iPaphI1QTIxxK9nK33gs4h
	EYmNtfhZdDw5INT0uk+GtqclDpsrjoRGfAlJ4ZWVEV3HBwRjYdJ6Gw5lySa+7WTs3GEyyLlx69J
	H0Xjw9yqZzgJoxk+JotnlCneUs1k0c7GtRjRCTophh1RWYhEr9/MDNFtskDEfISAmbpQ4O6b6Ga
	ExwliGrBtI/g1hJYydoOuGJpUvKCRGMThhKG9pjTdTC9A/GQtk0yohUfJvTASLhwtf02PBm1rGr
	fnTW2rfKclePvSjbZBtuikCQWoktbbVQm0kZUaevxhmgwqeFGglEiKJYGg==
X-Google-Smtp-Source: AGHT+IGfG0kMUMy8OCD9zOa9XSNGd00YZZiW8tI8Vc7MTZK1U10MgZJVD9O1t41p31Vck9HevRFDYQ==
X-Received: by 2002:a05:6402:3592:b0:5e4:d192:86c5 with SMTP id 4fb4d7f45d1cf-5e8a10edf48mr4164494a12.9.1742210336553;
        Mon, 17 Mar 2025 04:18:56 -0700 (PDT)
Received: from krzk-bin.. ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e816973b87sm5851428a12.23.2025.03.17.04.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 04:18:56 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: dts: nxp: Align NAND controller node name with bindings
Date: Mon, 17 Mar 2025 12:18:53 +0100
Message-ID: <20250317111853.43708-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Bindings expect NAND controller device nodes to be named
"nand-controller".

Cc: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx25.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx35.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx25.dtsi b/arch/arm/boot/dts/nxp/imx/imx25.dtsi
index 9cfff2151b7e..82601a4b7b4b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx25.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx25.dtsi
@@ -611,7 +611,7 @@ bus@80000000 {
 			reg = <0x80000000 0x3b002000>;
 			ranges;
 
-			nfc: nand@bb000000 {
+			nfc: nand-controller@bb000000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx35.dtsi b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
index 30beb39e0162..111d7c0331f5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx35.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx35.dtsi
@@ -363,7 +363,7 @@ emi@80000000 { /* External Memory Interface */
 			reg = <0x80000000 0x40000000>;
 			ranges;
 
-			nfc: nand@bb000000 {
+			nfc: nand-controller@bb000000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				compatible = "fsl,imx35-nand", "fsl,imx25-nand";
diff --git a/arch/arm/boot/dts/nxp/imx/imx51.dtsi b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
index 8323e3a56a1f..f42903c9cf0d 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
@@ -595,7 +595,7 @@ weim: memory-controller@83fda000 {
 				status = "disabled";
 			};
 
-			nfc: nand@83fdb000 {
+			nfc: nand-controller@83fdb000 {
 				#address-cells = <1>;
 				#size-cells = <1>;
 				compatible = "fsl,imx51-nand";
diff --git a/arch/arm/boot/dts/nxp/imx/imx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
index faac7cc249d0..0c38c37dd142 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
@@ -775,7 +775,7 @@ audmux: audmux@63fd0000 {
 				status = "disabled";
 			};
 
-			nfc: nand@63fdb000 {
+			nfc: nand-controller@63fdb000 {
 				compatible = "fsl,imx53-nand";
 				reg = <0x63fdb000 0x1000 0xf7ff0000 0x10000>;
 				interrupts = <8>;
-- 
2.43.0

