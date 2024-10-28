Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A079A1534E9
	for <imx@lists.linux.dev>; Mon, 28 Oct 2024 18:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730138964; cv=none; b=uk0KHkNhYFAfqkZBH2NBs05REq5/8YXyL0hgCxZFlfyeZzbCplJP9IUV461EX1EPXWpKsOzO0vu2n7GqTJyrPSLxu/V15afQkdbaaJJfje+N4LGrE2ZCuC0m+g3MIBJgx36wjFb5I1MPvE8r02WcV4CYIWH33XKj6wyYjwjwxBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730138964; c=relaxed/simple;
	bh=aYF7DphdhzZk+tP6NwU4u2f9RMs1X5zWIo/39nUL8og=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=luoP6jFTaDxHEQTQnaAo4W6BnzVKatQbE6wrgV3zuAg3CsdgdxfUPy5SyCJsYtUla+TJsDs4D0fnvI8QSHrD7QRSarRmHDUuf0k5qFL0baKeGoAXzw14Vq4Vog8fUuHZ2JwO+KH8z/LqmuOHhZUuesCfuWYvudQzjXMEwJXDUfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mF6vFPow; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mF6vFPow"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e56df894d4so3650274a91.3
        for <imx@lists.linux.dev>; Mon, 28 Oct 2024 11:09:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730138962; x=1730743762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UGG5X0yybapnwgmSNjPP2ZTIazkkUBze7cfeSlPaqKw=;
        b=mF6vFPowYTc5QhxY/iNn9GqKwuDpdJ9WCvqCKrKXc7hw7dIJwZ71Z3epTOTSCWUBdm
         jIfF6SfwToFTUi7VWH1xvHq150zdyO34yZhttrRKGVN1RqT0G2PgSVShK+kG6DICxCVl
         8Y9UBn2F9C5F53+nQo4DwxEi8cpFbn2/IfgNFs0pgtvnbjeRN12ce8I5bxwEVDDxmqki
         2l+28Yl42JPyjTWaJXzNxb9UXsy7BqAV2Z5b+Yj/wp0liZZXiYdcyyNpVMu4WdpOo2b7
         JjkA0yq5IuuCupy7Txpm+IHKsYmdfh9N4MDxqZx52pCKcMKXXm7bkShgItYhiaMk//os
         rsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730138962; x=1730743762;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UGG5X0yybapnwgmSNjPP2ZTIazkkUBze7cfeSlPaqKw=;
        b=iP8+I9XPEc2MjS5jWlbgCBgR6UR3mojMsUF1g/w2T8WXNxrAa8DRZV5eO5kCpv+JtR
         V6qkwHHyJWJ4Su7/mOmFAXfJiU/Fbr7YRxUjcfwNvhhNo4qVGRJ8rF9cLcdo4R9LgdJm
         LyDo8A3bWtJJ8XM0o9GJr3Lz9SEaWaftR9KH0kwULjobWTgQ1uKSqN/TIGEHoKpqo8Iw
         fiXe7NDDYNH84v3P4iqcPeeNdvw6dgRPfEJ1Qpy/QGk0ZW8eJ0JUZmQPr9g8wAUw9NIl
         6P00CspZmGU3PVB2/RTJlzUCzLR+MxzR3ksqHtyZxQAJgVoyHcCUs/v29FjvwzFJigG7
         438w==
X-Forwarded-Encrypted: i=1; AJvYcCWoLzFQ/XWuhAWDCpCNQpTkA2YvClWIjfunllc6OZaA0zXkbzb59kmhZ7Nx9aa+OOQgXjo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxfupFJRqFx8J2GaMsmbaJN5CEKABcynZKrljl+XgH0M3FuLKfQ
	OJBIMYpbejhaT33iggRvCGvGHdoqIvJtSjvZ/UM9XYS28VX1AyVe
X-Google-Smtp-Source: AGHT+IFwLZKrhb4CCtfrwaROp/UzNVA+c8FepE7KZrzTAdYxYuZwqx98BKpaRPPTEhyUAxG8NTFaTA==
X-Received: by 2002:a17:90a:4b08:b0:2e2:bad3:e393 with SMTP id 98e67ed59e1d1-2e8f104f1d4mr10710044a91.3.1730138961890;
        Mon, 28 Oct 2024 11:09:21 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:325c:8d87:ee5c:f04e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e3572efbsm7690441a91.22.2024.10.28.11.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 11:09:21 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	andreas@kemnade.info,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/2] ARM: dts: imx6sl: Fix lcdif compatible fallback
Date: Mon, 28 Oct 2024 15:08:43 -0300
Message-Id: <20241028180844.154349-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to fsl,lcdif.yaml, the correct imx6sl and imx6sll lcdif
compatible fallback is 'fsl,imx6sx-lcdif'.

Change it accordingly to fix the following dt-schema warnings:

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..c213f48382d5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -773,7 +773,7 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index d219c2b67294..156cba79268b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -660,7 +660,7 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.34.1

