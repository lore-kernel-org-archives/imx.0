Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7DCC15FD18
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 09:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712309307; cv=none; b=Y1xooYGKLnbyREMqzUE2qaMo4lozSKB6HqI4NkTk5oMgvkENrCZbOKKaNtWu9GtF5GdRe2tWBrly5ynYD+M8sP2KdOVTfpHU3/Rng75BWBKP47j+4DrA+RfG5e1I0xw3whs90J+FEHiUwWkXrFBSCETVLcJ4eGn6Yu1GeekxY4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712309307; c=relaxed/simple;
	bh=WTJy+7FRvsutUwAUfsNeE7+OA0WIOtieEtgmSkwuNwA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mTfjhYZwe0rqkhfoUp/tknwLWpH0ZifDSn1NpcnRjcGX1Mi20d4SyjPqaU5WeHsEHvszGgsbcIb8U/5xJHi1aDgEah+oMNXvCBmVqfMelf2NMQMT5ZisjsRs2ej3p+PJPIlYSbXWgKI/8h2i65xnHFZF/ShWXemEGPWZPgRjH3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=e9QxWgRE; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="e9QxWgRE"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so2380372a12.1
        for <imx@lists.linux.dev>; Fri, 05 Apr 2024 02:28:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712309304; x=1712914104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G3UhqttEClAp302E8PBewqsaaK/r2DdYnzrvOqVi/vc=;
        b=e9QxWgREvFrusB2rYkMnqoXF+xO43W9GCRYZR69fJQsL8vPLWc43b70QyFXDTFvIrh
         6tAD+cTPbA7/eOjF2f/CCOEyLRYh3UItdqRB5a/Ec6TWEG7Vx1apZ4q8KtHUJn3Osa6c
         EqU52f+NzpbSjK32HM2d5Xe7dPJT2OuSoVZQ5/XFTKp22lOwjaDh/8wHvWL426U00fpU
         RCnpcciKR284aVj10oKvhWhUZI1M5YXqelCKs2A2aTqhAT3fwg9X9MQ3YdUH/+B0hws/
         rgalt3E6yE7wUBkkGYD+cGSSUToL2pldNjIkR2g77DzZd6AX2tfjcmm6CKDU/G01L1q3
         VHXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712309304; x=1712914104;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G3UhqttEClAp302E8PBewqsaaK/r2DdYnzrvOqVi/vc=;
        b=Untw6mP0Xl84jXtVutSf4HZ/y4fYFbMZuLBtx2a+ecTY0QtK6hRrLiDAK0UkzS7Ssa
         Zs0UgVPlpebj2ZCJWNEWpaYSzzVnsRNzxL96smeas3Umt1bJKqLLGTOShk9K/u3wDMjM
         f6/vM3clieDa7JzngcMDDutbIzJkmOlLTV6WjAcXwCmRpa1dLq5/XQ9PJLhDM1+JO/HL
         GCjTozsY6CPA7mFrhsdjawMTIHU/ixEFv66B2bMbPLZHggxtXF3iSJ0KGtw8pW/5ZbDs
         5s3HB3lL51aocvKkGdkP7yyeMP1rXR47S1lZi18t5rFKRAjLVa1Q2/RvsI5wjD3NeYcP
         qs7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWRQHI6ab3bnPRZCxp41ejbKDdIOBIOKNQ0Yarm/iEM0NjHKj4qyAVqccIT2CFvE6ENYo+o410UMgiZv+w3O8HkmgX2
X-Gm-Message-State: AOJu0YyTJe1501Bf0mIPSkW35MSim2UUa+hcJKArzEo9AjQVyIOy7az+
	JSJwL0A0WAlqb8dHUxxVCEIBHfw/kE1e/yiS7zFx752VAgkyN+maBIRezvvzTnY=
X-Google-Smtp-Source: AGHT+IFf+KfG1bg7CyXkWbKGh/vtgLwxUWHUP/Muu0AkBFdAliGje48fHgb5Bsgjbbw0qTiPH+opoQ==
X-Received: by 2002:a50:9f21:0:b0:56e:2abd:9d13 with SMTP id b30-20020a509f21000000b0056e2abd9d13mr897099edf.7.1712309304235;
        Fri, 05 Apr 2024 02:28:24 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id a1-20020a508581000000b0056e2432d10bsm587750edh.70.2024.04.05.02.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 02:28:23 -0700 (PDT)
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
Subject: [PATCH 2/2] arm64: dts: imx8mn-var-som-symphony: drop redundant status from typec
Date: Fri,  5 Apr 2024 11:28:19 +0200
Message-Id: <20240405092819.40994-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240405092819.40994-1-krzysztof.kozlowski@linaro.org>
References: <20240405092819.40994-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

"okay" is the default status, so drop redundant property from the typec
node.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index a6b94d1957c9..3434b189fa58 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -126,7 +126,6 @@ extcon_usbotg1: typec@3d {
 		interrupts = <11 IRQ_TYPE_EDGE_FALLING>;
 		pinctrl-names = "default";
 		pinctrl-0 = <&pinctrl_ptn5150>;
-		status = "okay";
 
 		port {
 			typec1_dr_sw: endpoint {
-- 
2.34.1

