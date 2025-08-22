Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3953C30499D
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 13:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869493; cv=none; b=V2IdTzbBCR9i2pBWl8aRENpo4YvnwLdpCx/Usu7oa6ImHh5+T3tLuyTQs84dPO1OU1I6JUCSFhDA8Mdm+XKr8C8jQysDDVfUR6yszuXwANAQ0MJPjiPTB7xhFID8PY34D9/ekWJ+ENqrv6ZEMUoLqxRPCyqgaL+p6qWgwXteh+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869493; c=relaxed/simple;
	bh=w5jQPRtxKVdZsfZ+Eeys3YE/WQZUF747Kck162jzCnk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eYGTenej2qQsiFN4sNp6hzLNFqXR/AlcWCR184smIw6nA1ojuarE5EhLHnOehXaR9j5qYMDI/jxI13TOXLxtwehea3hcM6gFo52zJ0nFQPAyp+Yuk4XX8PxoW1ITgN6gAo9hPqAciMGWcX1EnAEU2tIkyehzqMHMtbuHNR4Sdl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SFFS1F0b; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SFFS1F0b"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7ab87ffso26636766b.3
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 06:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869490; x=1756474290; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2i3UALvvPP6Ui/onN1qTLdYAr1h9hBKlMv+xunaajbs=;
        b=SFFS1F0brRo1etIQ6vDrXKzjO2P9IdZc5MuJxpjlA6SgayHgkwymcgi5NmS1ZmCZVc
         PzebP4DtuNgqsQIeq4uG+hCAGNIB6Zo8P/8S6FmLuaLvUzyvWkrv3tNLc6aULtZL4WD+
         W/OZB1xMMC2Gr5Hpwec5doQXr1CrRlReMBYU49Tzhmr8qsUIIBEM7LTQuZmrep8EzjVb
         SniD8Tvfj/QIX+79VWlr3LUqTFdfDO3r0ztlJia2g06VARlIB4Our7vUcsbj1/h/ZT9/
         SSLFQSpOY/BDrZbQUdZW+1SLyytzcC8j2w+sz3YtSIfSX92qbytqjtBsWSI1YSANdqro
         FiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869490; x=1756474290;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2i3UALvvPP6Ui/onN1qTLdYAr1h9hBKlMv+xunaajbs=;
        b=dk2M5l8P96cCXDs7P2SB5XYFuRT/mjqmdhLvFWKZVTYNUjXllLWHfnFpSYNLNLGNzh
         /5wTwjTywqCXR/VlX1tKMYE7xjj0E1tOdqbA/BMs2YIqM+dmkLF8uxJXEN9vwGkevcZI
         5lutN1V8EBr2/YKkjPbJdtIJbS2/pnCqwJ0UVttcX0mCz6pS+kq/YKykywDgTOgaGehQ
         tYBiheJE06UmwWNFwlYMUuYVd2wbW7aPebH4H+hEw4HVamBynXtYxe23qBaP13gwYMJO
         8z+GCyMtQEg8n2p8/500JWQLMl4NDwsBncH/vOgpqCMUQoYA7Z5eXg32R0Fiv0EFU3q1
         la9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWai2kybyy2WZ3S+QDlAmWMAGFxPRLeib+9dNJauum0lIVb0r7c3JocW4JqDwipE1NPt7Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9KTYtru+jwkKt24lDSsRRUHmwM7+0gsTHh2OsKzeTCBR8glcC
	pk9nxZV52VN9Pbw7jokVAobtVbFZ3lpybs8XZULGKfjq1ViRkp1YzL6lSNauDuYYPWc=
X-Gm-Gg: ASbGncucFMIRXed2mtDCiJXgJ011vETdK6dGNdEnTndRZMkr5MxtG4VAxibMeplO4KJ
	tpyR+XwZNmI0TKBhsaWTtH6NXN8UyvjczzxGaT7iHruqsNuZXWENf2EuqvDyGeL/qJSrwrqPOtp
	tXmVevLJoIe7rByx5mJztvyOIMwKXBGAci2B9FQxwYxhmqvZtNeI2bVxbiyZ0HrTdtEGH1KYfFT
	bMPF/AvBu/zgR0SyhjxiolXt07Zt6B/Nc/EnPsY4ilmF9s43zNU4tzCDkAHebW6JAoQHi0tdNKE
	8gWFrbzAYu+uMlFeb88oGi05qywl+wf9rInkWeIOiMbM425gld2wlMQDk1uvjW95Hg0w/CPJCEL
	gGgy6+/Sxn2AWr3BZTKyF+wM9PldoHwyOOEc+Z7I=
X-Google-Smtp-Source: AGHT+IHZ5jhA9JpGxGAjhnxBjfGh86JHBTsDrJCTZCPuPU4fbysR9CHB+p5QK15/n8QCznzjnUbV4Q==
X-Received: by 2002:a17:907:9405:b0:af9:5a1c:fee5 with SMTP id a640c23a62f3a-afe2874f3eemr157176966b.0.1755869490268;
        Fri, 22 Aug 2025 06:31:30 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:14 +0200
Subject: [PATCH 05/10] arm64: dts: imx8mm: Add default GIC address cells
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-5-f1b479da9340@linaro.org>
References: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
In-Reply-To: <20250822-b4-dts-interrupt-address-cells-imx-v1-0-f1b479da9340@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1417;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=w5jQPRtxKVdZsfZ+Eeys3YE/WQZUF747Kck162jzCnk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEjwIVHDMjjNUzatpKcLfCThoUYLutFRJ7cw
 HgSaiYJE/mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxIwAKCRDBN2bmhouD
 1xTvD/991PuRFgz8vug1PKR7NPqB+k//ficQEDALcCCDOZPeAgt+1c9/AsH2VEkwsDUDtjRZIRO
 FOUBAHYPr/bcDoNRvgbQP0tyGrxQEtS5QWCvFnFaN8LuIysG7S/9SQ/tat5L/2N9HFwiNDduvt1
 QZlTWj4WmYdxpg84+FqmiM0Thj7h3PBhU/dEvI0+L/oMLzYBbWBr9f7QuBl/Lajh2cm/1YT5bbA
 1v3IL3uqm9+s97dYCDTunv6HxB/Hs5kQ+hfBw4GlleezrordICpGkCfdzZbSgxSVxLoigZYEaXc
 6Cs+Lnp+HYdBC+L6lYbiqpGUz3nLnX84gDviwKOAu8hesje54hPr+fk9fzNzyRDTO62FYDsROHI
 ToW/ol1XArkiMnceIONQe9ZdSEiIRxt7HDdMnRhqdMrhcwT11lbT9mhxXIkcoI7MrP84arLxtf5
 4N4uschFl992r4gnJGmygxE/wu3LtwtQRo2A+9DAg3UFyUbg9Dq3wkf3PPfEXq2/YVVLdjq9Izu
 NWBnWYMBbxlUxFrk5PX9c8RAOx0nM/5c/DpsX+NLNB3Y4VE/FVGuu+MO2PkIXjlom6uN+kwV/1f
 noM4ruD8BYLksYZFwpHYJpheblDAcE2fAdriS6mBT1IZWpJcfEiQseXqOmKrzaCfdhcDDxE4eAe
 SK9s5EkTzpKf2Qw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  imx8mm.dtsi:1355.4-1358.29: Warning (interrupt_map): /soc@0/pcie@33800000:interrupt-map:
    Missing property '#address-cells' in node /soc@0/interrupt-controller@38800000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mm.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm.dtsi b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
index ded89b04697014771c20cd7c285d01b73ac9edb9..fc3cd639310ef07d6d14c457af607f61e2288b1e 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm.dtsi
@@ -1467,6 +1467,7 @@ gic: interrupt-controller@38800000 {
 			compatible = "arm,gic-v3";
 			reg = <0x38800000 0x10000>, /* GIC Dist */
 			      <0x38880000 0xc0000>; /* GICR (RD_base + SGI_base) */
+			#address-cells = <0>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1

