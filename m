Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B0A17E8F0
	for <imx@lists.linux.dev>; Wed, 29 May 2024 03:49:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716954549; cv=none; b=ch+T8WDEXcb0SkfYr0e3AlVoUQYIkEZ3eiHqunj9UAL/b7KdMfDopAqW37woXwJbABXkcbp67J1HNb4RzOoEM1qqYIUZZigQ2r8tkgiVlAW5e5TEYO3zVh5OFU8W2U6JKEB65vtifBXk3cT5oHfQ69/yIOFYnr/cX9AkrmWllCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716954549; c=relaxed/simple;
	bh=3NAHOwIQTDXtNlU8i81GnYZjk8f2OfzXlqUgXm7FCEc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DSpthMbG3Soc6O1kRx7x3pO5pyVZZ0wyx3Nlv9VD0Plwi+Nhb0Bj32A9ZsoKVUEKXlsdKyZlkFDHQp9MTfV5/9P+eKk+G522JkVVCzQcYr0UNM9XumR6BpKloNG+ywSUrQ8W2fVeowCjGKx39MD2xoP4Zl7S9N+Fum4UJThT61A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJRD80is; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJRD80is"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6f8b36f10d7so25440b3a.0
        for <imx@lists.linux.dev>; Tue, 28 May 2024 20:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716954547; x=1717559347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ypZlzXpmfWiVW7jdMoXt93b/dsMiorXU/dyr3NecVGE=;
        b=QJRD80isMP+qC9Rprx2Mg5MIlFsu7cGMgPuqniChsDA0z1Vsff+cenVJQyHNsg1+ON
         qTL73Mgxqcwx/jI7EBHGMrSpoyQKSABJ83rkpT3akAY9fbyfpjaGfS3R1fOP2M9eDG1d
         G5H6NcU4lBlveJv4fr+L75gZVnMJfJ6NTVcUhJuMwMlsdr639s2w1jKzHCtNwI9sC1Gn
         /arb24H37fFlVbMwgDNVQaEg4dLBMIYqNKFSasAL1Jc7Bq+flD+cfYA6iK2iX8YJddri
         viD72GLuPu99O2sS+Bgggh/oUDvnMCmT6vfN9tB2qLk50cDXAT1Q3vMiKyda9aaqUFCa
         m0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716954547; x=1717559347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ypZlzXpmfWiVW7jdMoXt93b/dsMiorXU/dyr3NecVGE=;
        b=ZUmJCa1O0xarZZf9Uy+UmBF+dknB5os4gUTDodYL5a0KNcuVbehebMHM3B2weRqOEN
         zCXEop8TFtVoLxqnGfO+O2uI2aZ2O67XaQhR0+7lvO1V6Y45VpXWaISW8doeI0sy446M
         BWRRYsUtsIC2Z8CbCPi4GNM0qSStZByBYnW+TNO15LvLAvbd7IORT7FFCilW+67qUZLa
         F4UBqyZCwGjxpp8CZu1Jle4/k1L3mnDqH9xMOb0lOb34LAJYqNQ6yP75gu5ME3rNRrEQ
         AeqTsUwf8IfPd/8lw7rsSGyd+Z0q76Y1ORTkGQvxBA3wpwOUFo5lCmvQLAtzZ7YQ++E3
         uabg==
X-Forwarded-Encrypted: i=1; AJvYcCVBJFt/IKPSZHyOsz7EufgVwsw9NftcllsAFc1LBgSG1hf1b357NFcnVN6wU+nsO+Tp/ZoyAuhYDNYtPWdVOsMRp61L
X-Gm-Message-State: AOJu0YyaaIO0xwAx4tUNXA7epPjN3pLTmN+MgIo7TKRttkIiLTnjl339
	ByF6+6MGcSeTduJq388CHEPdwdsWQH/FYRfKG7rNup3jg/KNVwQd
X-Google-Smtp-Source: AGHT+IGl/riRWvfcu1mplacFQEsee+UPiwTEMZRD4kwMjY0t2VQHHxOY6xzKyidSa0hRW424LY/LCg==
X-Received: by 2002:a05:6a00:4bad:b0:6ed:cc50:36cd with SMTP id d2e1a72fcca58-6f8f41b0c01mr14778987b3a.2.1716954547158;
        Tue, 28 May 2024 20:49:07 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:dfd9:2d9b:ff9d:4f57])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f8fcfe64f8sm7139408b3a.151.2024.05.28.20.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 20:49:06 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	haibo.chen@nxp.com,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] arm64: dts: imx93-11x11-evk: Remove the 'no-sdio' property
Date: Wed, 29 May 2024 00:48:54 -0300
Message-Id: <20240529034854.1595664-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The usdhc2 port is connected to the microSD slot. The presence of the
'no-sdio' property prevents Wifi SDIO cards, such as CMP9010-X-EVB [1]
to be detected.

Remove the 'no-sdio' property so that SDIO cards could also work.

[1] https://www.nxp.com/products/wireless-connectivity/wi-fi-plus-bluetooth-plus-802-15-4/cmp9010-x-evb-iw416-usd-interface-evaluation-board:CMP9010-X-EVB

Fixes: e37907bd8294 ("arm64: dts: freescale: add i.MX93 11x11 EVK basic support")
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
index d400d85f42a9..bd98eff4d685 100644
--- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
@@ -296,7 +296,6 @@ &usdhc2 {
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	bus-width = <4>;
 	status = "okay";
-	no-sdio;
 	no-mmc;
 };
 
-- 
2.34.1

