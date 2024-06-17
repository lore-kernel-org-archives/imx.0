Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6C0198823
	for <imx@lists.linux.dev>; Mon, 17 Jun 2024 22:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718663999; cv=none; b=TnI83mrd8BSEq1pQSkfvv4X/RHYC8vj/F9WIixrrpVNBoMivYoTjArLHXV//y9mVTB7ym0V778ymVP/rvCOsRxYRzwr9znnotSFBOS3SeMjG5o5peh2XEFYaR2hQYT5XvK8d0/8f/GBa6VVbMvTcq29BRbvByq6GMGaFoXMTcRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718663999; c=relaxed/simple;
	bh=bi6Y8zmXiTKInnkXG7JwRP6/fjYzKkL1vZpdveEyuRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bGU3OqiiYQLeOE/5ZXwAdCC/Ti8b26epdJ1nWxwwNsV08eJz2eces4yvorxlDx5K29O2wsrlgaUd9jvtbUA8LwN9Gni9DlvlssgsHKlrpOyTYHy3u5YFFano+jIYpOunRA48pyXBBTQtDncrrUMxsSSgXJfPIAMEYkYMEmJhvIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITpAR0dn; arc=none smtp.client-ip=209.85.166.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITpAR0dn"
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7eb75c0d0a7so154162739f.3
        for <imx@lists.linux.dev>; Mon, 17 Jun 2024 15:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718663997; x=1719268797; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pilmjE7Fd1aeWcRQgiLhuPvlXnr77T8c/+92X/hR46s=;
        b=ITpAR0dnV/oeNbyU99eXl0oB5K6z/9FL1eVBr3AY7TMLFK0UudJO6nwRFdm7f1Or2w
         dBylndFZe0Rx4XVj4Yaopy8l4YcQUkd/01yDfM5bqB/WdLa44/H6//l4Vx+ruZzJSiBp
         SQZetUW4qACrJyWwjcQ8BgogklAdRFXoqHiWHMco4WXiTTOFuNz6SVZMwQLKjvWIN7Pp
         ORHloO5HBIFbVABkSFLckqLUrv3GqKMa/3wDWGbN+lLj9Cz2OXuLG0ewJGPR8vDWOdLn
         ozof2DHuQN35FpDXhhpVnfgc5YxiLkfRnSgh6f+Ofn6h1wNMhuk8D8SY+1kr0AJwc9Nr
         na7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718663997; x=1719268797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pilmjE7Fd1aeWcRQgiLhuPvlXnr77T8c/+92X/hR46s=;
        b=v3cXBSX8+aTmLHo1OK8um7IAcob7KrsXQZE2duk1ssCbnCnrr/W8eTDtZt7grl7mFX
         t7psWvriWA1+8MmTit5OrhkPydlPGUTzoQjaSH8+JVc305Cm8wu31P646Tp0oS0VVSmW
         Fe9ycYRvZr/XwQ30jssuG8L0zwaM5sxw72i5BuY1p7EQ9f6e6JqoWaX/17Sj3xu+fQo7
         EdUC+Pj2Z7lLC0EO4WoXi2/SHxI4VQrC/5y1481dLlg8aPSa3h04R9Q+ZsQlfsO+yhH8
         9qmMwGOuk2vf1SmjfGUOysJ8um2z2ElMCbleJwbmoC3rZCyW1SOANY9OLOClVrtfBRe8
         rMuw==
X-Forwarded-Encrypted: i=1; AJvYcCW0R6iTfUOY4ptmkmmLV0XWGVnU7Gq5d504jS9eMfGrZrs9iqnUAO5kd+pUD6H2FTYYQJ5Z3xJDARVT0d486e6N3SiN
X-Gm-Message-State: AOJu0YwJVCbafR9ZXJjdp8Gll4O1m87J580UMFBM/cnzVnANa6DQ0lgV
	baa0bkTYIEaiFV5+jOzEDppktM+/p11vLlp6uZVpqlVtF+9WvTUU
X-Google-Smtp-Source: AGHT+IFthX3l4bIPWr8JOAwFidH7wht/c8nO5p55fH77H04hecSOh9g8mWsGGcbpKHaJyVlEct9MiA==
X-Received: by 2002:a05:6602:6d02:b0:7eb:89ba:44fe with SMTP id ca18e2360f4ac-7ebeb647388mr1076974739f.17.1718663997401;
        Mon, 17 Jun 2024 15:39:57 -0700 (PDT)
Received: from aford-System-Version.lan ([2601:447:d002:5be:3ccd:905d:95c6:7d96])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7ebdb74cd1asm251549639f.0.2024.06.17.15.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 15:39:56 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	marex@denx.de,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp: Fix pgc_mlmix location
Date: Mon, 17 Jun 2024 17:39:51 -0500
Message-ID: <20240617223952.1899201-1-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pgc_mlmix shows a power-domain@24, but the reg value is
IMX8MP_POWER_DOMAIN_MLMIX which is set to 4.

The stuff after the @ symbol should match the stuff referenced
by 'reg' so reorder the pgc_mlmix so it to appear as power-domain@4.

Fixes: 834464c8504c ("arm64: dts: imx8mp: add mlmix power domain")
Fixes: 4bedc468b725 ("arm64: dts: imx8mp: Add NPU Node")

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index b92abb5a5c53..3576d2b89b43 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -789,6 +789,23 @@ pgc_usb2_phy: power-domain@3 {
 						reg = <IMX8MP_POWER_DOMAIN_USB2_PHY>;
 					};
 
+					pgc_mlmix: power-domain@4 {
+						#power-domain-cells = <0>;
+						reg = <IMX8MP_POWER_DOMAIN_MLMIX>;
+						clocks = <&clk IMX8MP_CLK_ML_AXI>,
+							 <&clk IMX8MP_CLK_ML_AHB>,
+							 <&clk IMX8MP_CLK_NPU_ROOT>;
+						assigned-clocks = <&clk IMX8MP_CLK_ML_CORE>,
+								  <&clk IMX8MP_CLK_ML_AXI>,
+								  <&clk IMX8MP_CLK_ML_AHB>;
+						assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
+									 <&clk IMX8MP_SYS_PLL1_800M>,
+									 <&clk IMX8MP_SYS_PLL1_800M>;
+						assigned-clock-rates = <800000000>,
+								       <800000000>,
+								       <300000000>;
+					};
+
 					pgc_audio: power-domain@5 {
 						#power-domain-cells = <0>;
 						reg = <IMX8MP_POWER_DOMAIN_AUDIOMIX>;
@@ -900,23 +917,6 @@ pgc_vpu_vc8000e: power-domain@22 {
 						reg = <IMX8MP_POWER_DOMAIN_VPU_VC8000E>;
 						clocks = <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 					};
-
-					pgc_mlmix: power-domain@24 {
-						#power-domain-cells = <0>;
-						reg = <IMX8MP_POWER_DOMAIN_MLMIX>;
-						clocks = <&clk IMX8MP_CLK_ML_AXI>,
-							 <&clk IMX8MP_CLK_ML_AHB>,
-							 <&clk IMX8MP_CLK_NPU_ROOT>;
-						assigned-clocks = <&clk IMX8MP_CLK_ML_CORE>,
-								  <&clk IMX8MP_CLK_ML_AXI>,
-								  <&clk IMX8MP_CLK_ML_AHB>;
-						assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
-									 <&clk IMX8MP_SYS_PLL1_800M>,
-									 <&clk IMX8MP_SYS_PLL1_800M>;
-						assigned-clock-rates = <800000000>,
-								       <800000000>,
-								       <300000000>;
-					};
 				};
 			};
 		};
-- 
2.43.0

