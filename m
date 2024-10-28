Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0CCE188010
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 12:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730119574; cv=none; b=BSFv0/GIJyIhfxL5GL+r4/ZHpnEs33ZvZ3Y2Hz3UKCrQZ1EUMgSduoTht+LOrsncWSqowusBpER8NlkuH0m9wSGiZyC5k0VFoSzSJ267ThAIDAs7+gu33nW5OFIbPRuYihldXQTH50wNc6Bsxi3mUWeZrpRjOdwVAcFo1HHI/Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730119574; c=relaxed/simple;
	bh=wAkvCZwiROJTMp0FvIMxx0wZ+f/xjsjOreX8QGz/IF4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AjUIsA0RDU3AMFDcw0J82AGUdMjQTfplKRxZqkoUb394Q6RQF1j7qulhQ+0tztlMIZjuMmG6Yg4XLY5hkJcGv2NeDXV/cB+rgubHpJDSEcg6S0crKW5AhUxZmP1utxxGSCtx+hfWW8BcPiTmkNoGGBcQ4wnaZOYRDKwwfgboiZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhk67Q9F; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhk67Q9F"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20cb47387ceso36517135ad.1
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 05:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730119572; x=1730724372; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=idA2hEcUdIZdPkR2DtLiEItPPio04naz2YdamBrPyD0=;
        b=dhk67Q9F58mNkr5ZtN5XpkWjDPfKDRSK0HtPxe7VuX683aa9wvjHzfHw0umXBiI7Uk
         aK4847nKN85mOTVdAk0+wht1/yL33jkHb1z7E7i+ZDIZxSWRl3bRrVaaFAmfxi2h9L42
         Z4h5CAf3GnTCYPGeoIZNIZBEV8UaeK/e/ZHUDl6jyBQhEYLn3LDMrpG+tR+iayFYCcIl
         gelEaPrpbkWm+DwVsHTuXJhIKT297B+r5C4NI5eO6jRq1Yk84OST5QCmmKWwmG1aQ/7A
         KQI7DlwyqbeXJjMO3H4xbsKraQV7zf2FQDEY5wsIECdFcfDuknEPbPhcM1ged7OthaOq
         iy5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119572; x=1730724372;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idA2hEcUdIZdPkR2DtLiEItPPio04naz2YdamBrPyD0=;
        b=XR1PYeQoSbS212icB3T1rRFtPI0FAhbnGSpbPx8ialxoDUpu0QzQAbfI+gzFjrjvRG
         C/idVgWG5c/9yKzBvbOxib2GZzGuCWR81gdPiIweu7AOwqEZByhcxKLuZwUE5TZP4cYG
         E6Q3eIZ7uPwLXsLaUwboKHcG0z6Be74xiM+fcRzCCWqUm5evr3Hx6ywqwdphoQth7TYF
         PtdAM0r+aEyhG16zIp19e1UzzuezRNvb3VLMofdnsVPvHBCE9Sw7WEUcmXFeB3IR7fwi
         GjYcumPH5N9ZI5luWZI1Za6JxGGeL7E9NzEB8ojJTcMG5lOBt+lIQiUeEf+I9leU1MwC
         u3mw==
X-Forwarded-Encrypted: i=1; AJvYcCVIjkOOpfN2E/0VNtRD4FnT9cLyBzLO4hFE6rUsKfG92ATaCQ3fzH9naR8pZ7gymjEC/Pk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzZIrmfeJ6TPoUqTChdBaLxr1kGEOf8xG/PqUG4v2/3hwLFFIv7
	ssEIytRJhHVfwkA+zlnZ/uAh6vfoaDi4wj6K28Uxj6eeqNBW6ERa
X-Google-Smtp-Source: AGHT+IEhWhO8jWtASWcjVnLJnH+2CiugnkO8wyv3J5+FMlEyhT7K9Ky7XdsE9koqPkJFrgnGLvmvEw==
X-Received: by 2002:a17:902:db0f:b0:20c:cf39:fe3c with SMTP id d9443c01a7336-210c6c34824mr111646485ad.41.1730119572121;
        Mon, 28 Oct 2024 05:46:12 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:325c:8d87:ee5c:f04e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc017858sm49969895ad.134.2024.10.28.05.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 05:46:11 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx6sll: Improve gpc description
Date: Mon, 28 Oct 2024 09:45:45 -0300
Message-Id: <20241028124545.72652-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to fsl,imx-gpc.yaml, 'clocks', 'clock-names', and 'pgc'
are required properties.

Describe them to fix the following dt-schema warnings:

interrupt-controller@20dc000: 'clocks' is a required property
interrupt-controller@20dc000: 'clock-names' is a required property
interrupt-controller@20dc000: 'pgc' is a required property

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..d219c2b67294 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -602,6 +602,18 @@ gpc: interrupt-controller@20dc000 {
 				#interrupt-cells = <3>;
 				interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 				interrupt-parent = <&intc>;
+				clocks = <&clks IMX6SLL_CLK_IPG>;
+				clock-names = "ipg";
+
+				pgc {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					power-domain@0 {
+						reg = <0>;
+						#power-domain-cells = <0>;
+					};
+				};
 			};
 
 			iomuxc: pinctrl@20e0000 {
-- 
2.34.1

