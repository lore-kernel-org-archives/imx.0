Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8F022C853
	for <imx@lists.linux.dev>; Fri, 25 Oct 2024 01:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729818566; cv=none; b=JLQwsHdOrPCwPXjwBLS1WbtAl9sU6iYaPkrzU8WMpH09rXez96S49Pw73m45POu/3z+Jm4RfAG3msDWoXBW772pMS6bGqkNc9qpGFKxW1KpRTarYoIGR7rxESunNEZgtP9WGb3cVTtp68/QBiQ32IlDFIm0q+hx0OUWZjV4jtkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729818566; c=relaxed/simple;
	bh=H6EAbkPdNb30lIXnY3i51JLMKdSWy2MCsieDAd3AOvQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jkZrHD2EyOPROdg524f0etUlpZN8q8MH5i31lIUPsqLuQdDHrnczxEsUth9+DSJXR+mfmKBLw3+6W3qBPZZbtGgQheHb6L6QLaVgkzwjWmE33JT3PMfd/+elPi1xc+S4ChSOMYBOl0Xjfedw7RyURmYihCuq40Chjpwe9JNC1kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f9AwIUmt; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f9AwIUmt"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71f5208217dso966525b3a.2
        for <imx@lists.linux.dev>; Thu, 24 Oct 2024 18:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729818564; x=1730423364; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BZZZwz0qurP9at0y9Iwkn9okEEYxxIWrTa7jOw0qqL8=;
        b=f9AwIUmtv5KAxcbLYRzfGe+yKX8h3JXMGaztVjD0CWXK04q18Q3hi2MVuotBenxGzk
         FO9S+kwDaMixsbnsmEY7QNRJxtl/Gp5BpD7kAs1oyeADRX3mR0yx3fV1wd26lMDr6RJ0
         950OILOtAFd1rE+xguiX/KfsLdyKdIE1/TaEhz89oTIEmgo4/+SGhLdG+VpuWXIdnVwE
         NWE2AJspUOtGOCDysaEVRQckZ+7kOCbJ2fztZXBouZnx1glgd+pLzlqLnyYMBXzQXEei
         CrGUwsoltnEwnOP8VoMPrGBY9+WwbQ3vob31N8HggdSnqRjAvViY8Py64Bq0BsyfLZXb
         a3mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729818564; x=1730423364;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZZZwz0qurP9at0y9Iwkn9okEEYxxIWrTa7jOw0qqL8=;
        b=wNcvDzHRyIHfx6oPFjsqKyyB+CKdjEsFRvn9EKKIf6dI7JoLBrjhojAy0nH03x944/
         dvKCPXru6y3gTNvol63s0Vi4yxwZLxLzxK0gvVz82cKJX8frdVmyUw8zO87HTOBEQi9x
         mZQz5mThpJQgvwvcwkRKVqc1K+tVctYvy1+C1Ahzze2kXf8wQEoyD8/Al7fS9XQo2yV0
         NAMZY4dXGnTL8ZdLvOl9fapp2kTCkYbVI6Ny5RtCqN0UhbZqvMyhp1qhmfk5csSJ3yXM
         fy8RQTUMHQV46/q351J37vNUmp/e0Rxsn3QVkR0OwoXoDjQxYMc8qqgp0mRU0TY9R7tw
         0QEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuNxRW69RwBgndoHAp7jdwLGMPl7USFRxHGKwTW+kRNqxcO/njqHFi2OTlzTIkGCys1Mo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwxnSny+3OGiSYx2+nzUOaqxYLJYVJ7o9yJPN5ujSj7oGJ3fgCq
	iVifcHvS4oytvlDamE4mwE9lX99DsqXFpbwKDIoubvNbtl/R6EbS
X-Google-Smtp-Source: AGHT+IGSKlwpc9RSgZd1gLwMZJwlxrL+8JK1LO1Y3wo3SThclhiafbQHvDrAqcRAj0ItBTgz5ukhLQ==
X-Received: by 2002:a05:6a00:8d4:b0:71e:617:63c1 with SMTP id d2e1a72fcca58-72045fe2578mr4463593b3a.27.1729818564114;
        Thu, 24 Oct 2024 18:09:24 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b160:3edf:6e5d:8d4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0b93csm52875b3a.137.2024.10.24.18.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Oct 2024 18:09:22 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH 1/3] ARM: dts: imx6sll: Remove regulator-3p0 unit address
Date: Thu, 24 Oct 2024 22:08:53 -0300
Message-Id: <20241025010855.1593365-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

According to imx-thermal.yaml, the anatop regulators should not
contain unit-address/reg entries.

Change it accordingly.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..0fc22c03ccea 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -507,12 +507,9 @@ anatop: anatop@20c8000 {
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
-				#address-cells = <1>;
-				#size-cells = <0>;
 
-				reg_3p0: regulator-3p0@20c8120 {
+				reg_3p0: regulator-3p0 {
 					compatible = "fsl,anatop-regulator";
-					reg = <0x20c8120>;
 					regulator-name = "vdd3p0";
 					regulator-min-microvolt = <2625000>;
 					regulator-max-microvolt = <3400000>;
-- 
2.34.1

