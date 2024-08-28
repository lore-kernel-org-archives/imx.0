Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D78D5166F34
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 09:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724839006; cv=none; b=SnnjHCa7aJN4lCNJ/0Q5/CJYDyO2nsRVtR+fivRJJX5GqmCBlEfVOT8llFR00m3W2aUBSQ6wNsHvFMYFf0vHEmYP2RfZ9M1Q9LiYeR0rD8tbweesMlkrYnSb2d9yfyQFDsNCWhSqf3O1QdWgLxqgOA8mKEUIwxhVE33V6cSGW+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724839006; c=relaxed/simple;
	bh=ge4SxTWNVKyFGRQiLbdG08o14Wfg6HB1zk1RSCadr00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QON0zoqgYzPySqnx+CZ2Wnok5sENAu0XVr4z/FXF53tFVNG1uYRsnfvYCKk5+p6CGM9bLDYZgLdaynC3KyN+igEUy7r7FrUtEBpXSv677MRT0GBs1ZBEXzuEeA70BZbfjibqHjCJbrw6wVF/FKQw8Cu4lvijf2h5Buk7lpgajCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cdi5dJUN; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cdi5dJUN"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4280692835dso9255965e9.1
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 02:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724839003; x=1725443803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/jIvTuTNMLOubMyObTcs7DeZHs1cvzKt8VJq5iN+3Y=;
        b=cdi5dJUNyc8Vrx2xPKqvX0C6djFdhyyPxBTfe4ksSsIQd6upjDzaEWKfDK6xb+/bw3
         AUmQ+SYCGr6RXXoX7yOmtATUssIRdXTmCRr+IH7qX1QY/7o/T72CcqXVfPCPfDay2LTz
         1N+PSUOmtivi1ERm0a7RH2SGNj7dt0DfDxll1ix1DU53LIFm8l3TjiXQU3oUhcwRWmQc
         Rkt00q+YsuAHM3F6KdCmvU23c9xseMNXkEpdWy++OwCe0HPbFFSJawbOYmyjrN2hNVxj
         piWKMDGC69i4mqNvgJ3G9XtxW+RgUfofYmESzJbgf5cVb+TsVzAhiHd100dpMYr83Gmh
         3DjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724839003; x=1725443803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N/jIvTuTNMLOubMyObTcs7DeZHs1cvzKt8VJq5iN+3Y=;
        b=wXZ4lVySPXWe7n+arDxoei7gOdPOWDsSQpODJ9XEGKoliJ+XzzWD6eXmamBkAVDIMI
         6iSZZH519TnTw+IWv5GoId0vIoGdMXe3wfXivPAbwzY78X3m3GdXIy1NLRp5MVYU7Wbz
         q5BXPPNaB0JY2KR9tYJP/Xemwe8Ar99v/myxfRaXEulwQcysopAFRfFAXJ3XqFvRl6VQ
         hO2sZqmLneFq2Qlc3DndsN4IMVKFDu9BjZjKpEqEnk9EOR3p0XDQMBhTh2F0aY8TpJ5Z
         CWEY9Qnxyl+J5bJWcCD+8kLcWGIGX9dZh/8pHAT5ePbGxrIszWbMrpmjjO1QnuXAzfVN
         ZD5w==
X-Forwarded-Encrypted: i=1; AJvYcCUNX2K41d1NKtm0bq27WX5vwcRLRrnu/bWzoeAga8cRvzjYeJ54PdURHfJtBOFEKvdgf2M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzJbTan0a+HrCpL4GrjvSdaNV34BuR6gzm5yY604Yi6MhWK40oN
	hH5brOH1Vg4AVk9OTBDOJ44MkLlYKadaIoSMfu3OVFcW89DK+cf3P3BQjSn9KyI=
X-Google-Smtp-Source: AGHT+IF5V1OJizmXPGv7EUtJkonq52X5+q4graFsdQFbBk5bixOQ03LcyEh/3h0hEpedeZ8cEZc+UQ==
X-Received: by 2002:a05:600c:5118:b0:425:6dfa:c005 with SMTP id 5b1f17b1804b1-42acc8dca6dmr70541755e9.2.1724839003070;
        Wed, 28 Aug 2024 02:56:43 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730810fb33sm15067077f8f.13.2024.08.28.02.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:56:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] ARM: dts: imx7d-zii-rmu2: fix Ethernet PHY pinctrl property
Date: Wed, 28 Aug 2024 11:56:36 +0200
Message-ID: <20240828095638.231569-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240828095638.231569-1-krzysztof.kozlowski@linaro.org>
References: <20240828095638.231569-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no "fsl,phy" property in pin controller pincfg nodes:

  imx7d-zii-rmu2.dtb: pinctrl@302c0000: enet1phyinterruptgrp: 'fsl,pins' is a required property
  imx7d-zii-rmu2.dtb: pinctrl@302c0000: enet1phyinterruptgrp: 'fsl,phy' does not match any of the regexes: 'pinctrl-[0-9]+'

Fixes: f496e6750083 ("ARM: dts: Add ZII support for ZII i.MX7 RMU2 board")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/nxp/imx/imx7d-zii-rmu2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-zii-rmu2.dts b/arch/arm/boot/dts/nxp/imx/imx7d-zii-rmu2.dts
index 521493342fe9..8f5566027c25 100644
--- a/arch/arm/boot/dts/nxp/imx/imx7d-zii-rmu2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx7d-zii-rmu2.dts
@@ -350,7 +350,7 @@ MX7D_PAD_SD3_RESET_B__SD3_RESET_B	0x59
 
 &iomuxc_lpsr {
 	pinctrl_enet1_phy_interrupt: enet1phyinterruptgrp {
-		fsl,phy = <
+		fsl,pins = <
 			MX7D_PAD_LPSR_GPIO1_IO02__GPIO1_IO2	0x08
 		>;
 	};
-- 
2.43.0

