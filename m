Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C6B301004
	for <imx@lists.linux.dev>; Fri, 27 Mar 2026 16:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774629187; cv=none; b=Nc4pcp/frY7QTNdsXfBcao9c8PDpb2kpqskedvk6SJ/rOkXaxNmm8TIwlt9KV8yyToVzxslhf+DgESyuSl0CryO7NmCG5J4UTz45tqVDrpkuijiLwSZDa0ALWHkxT9uK0pcpyWC/KDxWuLO1K8NBPUwBNMrleaOeFawn32HD7tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774629187; c=relaxed/simple;
	bh=FqU3DCQ9wVCZs1rUXt0lNtK3WzwimgAkpy1L21cml2Q=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CnYYfxwZ/ErDXvuKzA8EQbVLlp8+r54xYDO1VFqKNynshriPBF3jn2T8eiboqJpmQ+38Gk8ACtTSFtgMqnTniEIqFZ3xkemCZc+dNUL3Be0+mLcmklh2kJuRa0wYFsUOkK3vkL5X7OIGJAxG4i/6xdItKH8f8E0K9RJfhRwPGQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b64tu7rR; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b64tu7rR"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso18966605e9.3
        for <imx@lists.linux.dev>; Fri, 27 Mar 2026 09:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774629184; x=1775233984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rlEToPEr+d4V7DfWGTWOj3TmBp5gc4y+lbp6HYbSKds=;
        b=b64tu7rRkKd6293IMu85ovQDePe7cN5chzaOrN1hYAJdyz1Ve3YeUo3xZIeDIFomp5
         pvNEaTV0gUAvkXdVWXPT1JcfZ7tIen/ypSv/GlQ09gaBrauM/QLSzpy6uwehDvWoc9Em
         jPdATb1/LxCKc5m1yesKJ1HMXz+MnpSFGkRK9YWOn8XTL3T/d3RLcc1BZN5BfTwFNywl
         ZywuY7iror9HbOb9o4byqHbw0aS+JTY0TDFRLfOmcBVtD3fo3Gkj3VrvhBgLzOWqZ2ae
         0s/5txDU5JtniCWMA4jYKQB/NfW6jhPHPWSKSsqKq3fqxpV48U3QG68O6L9rYPVos5jl
         k7mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774629184; x=1775233984;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rlEToPEr+d4V7DfWGTWOj3TmBp5gc4y+lbp6HYbSKds=;
        b=ecdRDEG1uNgB9USMigANBgVNy6mH15E+i1Z2j3h5Mzmtbjng3X/zD1C9qMa4s8Wk7f
         E34EgAqXR1CoRvfkqBCmeyl12je9smkuojJlQjHKKUbfkjG73RxTuJ/fEkIZ3QmWuMyO
         rP6Im3Jx4B3Lo440NkyG6x4rXgO50dR9LSDgiSJM8qjKvpLugnOWElQCvjtUmyYxslaE
         gyWusbseFfBV/2qW4PVVJeWSSG1RYGnvA2Cx5Bjg88pdxqOhN7lXCzS7rhcnBg1GuRs/
         Qp9qLdeogYZ1vWWMuDIg5h4Bn/v01EnPatp3+N7milu5BzmKkxLoVw25C1dVktN2v23a
         v5Eg==
X-Forwarded-Encrypted: i=1; AJvYcCVRnFufuMMC3JsBHuIPXTtVJboZjqkS0I3J713PNoaOWLBADpEx+xnxDKkWWTsEAHA9T68=@lists.linux.dev
X-Gm-Message-State: AOJu0YytK8Iv7cUXAMtlcAWao2INhVr0rjtuyQpyDKVjOqAwdYNdmRWE
	98COGHhpFEMVIT72TJt22v2mxSdXr3mLZvqk/v2fU7tm28VNoPpTCiXK
X-Gm-Gg: ATEYQzxiDjtCwSdz3ICRUOPdaSJyS4/RuoOWpjpQHIPunydFasAmxG1701PUIKjfzNi
	OVAL1CuVcG2f26VIoqi1xE4AeDz+M1Q46SDpKmGhrl8Ry5MpSfAfQ5I1R3BhKhiu4e01+imFZaZ
	yXId9yQ6xUO1NHCSVzbTNg8NJ2CythvhpI/VvhKDUnuTcKZbYdCzg23ScNkNzdkTFZKODDUA0O9
	fJG2AQr3Tpi9MW2J0+OIjjXWm7NGjOTfj2oZf23/4PzlV8vzP0ICfVXZbsoBk+OoY6L8M+NBOeX
	5dhPtBiSBAsvX98A6lAbxE/zI1C3J2CVBzne4+pFcPtqbvu2WWNowdSraebyCggeZbVVF8YhdB1
	M5dM7823crfP5UmepJ1+XXtnzpamgcrOVAN1tlp8fwX57jshM9y1CwScJws/h9QPT8Yqx9KTm7I
	n7lI0KAww+Mb9sIWLArY8MJHxkog/6rfjJWUYAE689GmXXKU+GkBtS+mkirXTa+h9mZXrF0lbmK
	SjCWejjXQ+9pNSNIva9W1LKOJ2eGYTYuVQI
X-Received: by 2002:a05:600c:8b41:b0:485:41c4:e2e5 with SMTP id 5b1f17b1804b1-48727edf577mr52913915e9.27.1774629184028;
        Fri, 27 Mar 2026 09:33:04 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm193697875e9.11.2026.03.27.09.33.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 09:33:03 -0700 (PDT)
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
Subject: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select supply for PCA6408
Date: Fri, 27 Mar 2026 17:32:43 +0100
Message-ID: <20260327163243.17334-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

RGB_SEL controls the routing of some carrier board lines on the Sonata
board. The two PCA6408 GPIO expanders depend on that path being enabled,
so describe the selector as a fixed regulator and use it as their
vcc-supply.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index afa39dab240a..3b5816884f24 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -90,6 +90,13 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
+	reg_rgb_sel: regulator-rgb-sel {
+		compatible = "regulator-fixed";
+		regulator-name = "rgb-select";
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -195,6 +202,7 @@ pca6408_1: gpio@20 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca6408_2: gpio@21 {
@@ -204,6 +212,7 @@ pca6408_2: gpio@21 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca9534: gpio@22 {
-- 
2.47.3

