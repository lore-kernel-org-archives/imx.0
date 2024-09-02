Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3DD14900E
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 07:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263549; cv=none; b=n8Nv2EQoJNMVU7sRQynRvSyIiPfiy4uGuADVZ3I70K2vnH7V9tVYKkVHbc74F+mBOYDET6pnCpriHrrsBt1YL4r3UI7+rGqbyt69JaYp1yFG5HU15ETP3jM5544bNpJE4RY392Xoqdq06aGX/DZ675spw3rVy4/ah4C6HfE2FoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263549; c=relaxed/simple;
	bh=3nAkcyovcR5wQ+ZHWPzbOoAXDGnZb9kF/DhMrsUvhkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o3mLQngkaPxq1qi0wpu1P/uiRe/Awy51ha9h9icdLK6lkRunilaW9+k4ODWzQ4D0vJrMaNC9RfeKcsMf/vhYaHjEu7FZcWWnmPGTxQCb7Z1G0SF/u69Ft/bAMp0Nvqv0Wypp/uDX++NFQdoPfAN0JmMQ/BsSqPT+nu1VxKRT8rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JdJ3kC4k; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JdJ3kC4k"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42bbbe94b88so3883905e9.3
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 00:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725263545; x=1725868345; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XGwfN0CeifX9HzgQ4u8AIzU8rGDPcSifb8zJ05Qy9/Y=;
        b=JdJ3kC4kVSZKg87Nzo10E3Fimp4xx7xr7m3r5JONmq2/UdUOpJRCaw2JrBoEUCuucd
         z8wRDiAr55u3cDOn/7Lt3jrFuwyk7oArCs8B9zYElsz17JOsUUTQKhXuyEvWklBtQJI4
         13oC+KPINxsRB91lZvkf+QHspB5pn4mA+h/E1DMRjONBQGWnaW93yBtI343lbZoCV5FK
         OY7WB0hx1zrl3CdTiUYCFKfWUO7kQHx1tDf/UJTPYMiLywgMi10FkJpoJ7fFhLuXgVD1
         0VW2cOaiCtuc/Iu8UUu1Vk1ufXY68advfa/0JSLVVXzkUR52isp9FExRhHuh9JRXoSn/
         HTEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263545; x=1725868345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XGwfN0CeifX9HzgQ4u8AIzU8rGDPcSifb8zJ05Qy9/Y=;
        b=AI3yAvA0jkXNa5gp7aNsYUJy1F5u2LlDACLUKtZ/KPLbJmB2uhdz5wXJOI4JMniJLL
         vLFS0i5o9CGkEBo3UBMsxBwTgBxYiFGGmbJj14mxWHuw96LgE4AN9kfmsr4+PluMzT3h
         yCgfuH6gvAY3WWlFDYH/F9+SZv56F29cfamKwHvA3GLsADY3ZQz7cBjZfe6OLnOtPdpx
         2CZYVWt1dciqpKh4aDcb+WdJNClWw45UvCQ2pREk5rQFE7nbVVXtAD0xUZhkQ95F5vr/
         xCS/jMetALwqsLmj0k174clELI4Mx8Ip2hbZ7M+UChurabXX/DS/L74gig89lnoTtTXv
         +p1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXxDdcdeJHDNJ1b2PjjiIIV2G4amkFjw319JpaPhQjoYSKm9eAHbT09Iuaa79YPNUofWh0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMLQsNK+QdV35WCKgvBX5IVBA1VEzw4FHQfhYa2UnDZ0OaK4vv
	a5RbHYjbHjn7cm3FRl1ZBMeO2zSc6upyES0Rwojq9eJ0+nMSUOppMOO46I36Qs4=
X-Google-Smtp-Source: AGHT+IH08wIcIro8Jehvl/Hi929ZBc8qRS7+U/oFTc3nEePg/wnCtxc7gBUpCSptuXI5+Y+n2+ZYgA==
X-Received: by 2002:a5d:588e:0:b0:374:d088:476f with SMTP id ffacd0b85a97d-374d0884b17mr191134f8f.5.1725263544757;
        Mon, 02 Sep 2024 00:52:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba641db12sm164768265e9.35.2024.09.02.00.52.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:52:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: imx8mm-var-som: drop unused top-level compatible
Date: Mon,  2 Sep 2024 09:52:19 +0200
Message-ID: <20240902075220.27971-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Variscite VAR-SOM-MX8MM System-on-Module cannot be used alone
without motherboard, so drop the top-level compatible field to avoid any
false impression that such usage is possible.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
index d7830df5b6f9..cdfacbc35db5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som.dtsi
@@ -8,7 +8,6 @@
 
 / {
 	model = "Variscite VAR-SOM-MX8MM module";
-	compatible = "variscite,var-som-mx8mm", "fsl,imx8mm";
 
 	chosen {
 		stdout-path = &uart4;
-- 
2.43.0

