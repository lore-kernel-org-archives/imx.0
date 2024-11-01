Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32F01A0AEC
	for <imx@lists.linux.dev>; Fri,  1 Nov 2024 13:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730469276; cv=none; b=XlxWCtxUgraBzHNgtUsTmDRqSWLn9f30bvdR2qtQSAtYe3CAyfSmyhMmgLRxuuuBTzyiBf8rdF1gUI8uRYerrfYLMoZC9zheGEoqSlcLK/jKDlKkze1XIQtviKy3PHQlZD+2r468+/7yxqXJD7aI/JPbHu8NMAVoYsAFT9L2qqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730469276; c=relaxed/simple;
	bh=KCjKq65HkRNpVVajlxDvGX6zd4RVJJDgsLxzsXtMres=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VrgjDQrr+XHeWJ0RbFfMfRSQrT/1GnO2xRNhbWVtzJKOSSy8shZ0TB2PA/MRE2HVf+al7YAhm2hd1Dqhy5A1ixhnAcl0ATft3R0kxlWOKeqm49p7drwaIOuSQ6P/jVtsoxfxQSXs4JQuYoKEREuvWJvBp8o2oF2mqSHHYVEtQ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d/S3qz4G; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d/S3qz4G"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e467c3996so1645556b3a.2
        for <imx@lists.linux.dev>; Fri, 01 Nov 2024 06:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730469274; x=1731074074; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9XxDoLs63Ik2eMNpQfC7mj7nFGiFRzg3AZMRbgqbLD4=;
        b=d/S3qz4G0K9ZQF5r+mQmzuTORWrUP7mqZd+Zi6b9iHgiHzec91Ic7kiOKDf4tnnA2T
         3DbN8FnfZjgqO0Xs6qFS4pL4teFfUYoYVZ3cWU6DJ9Rz5dsVZ5hA6TPWAmY5SG+pUnoj
         jeEbZFP6sayRYM4gQozZkm1SZp1+yxu0jc4qxjXlncmwuvBl4zP1H/er5P0H/rUdoDQo
         R4Q5ZTq/bFJiqhIFmisd6CeuH9A4WBImTvCN7Si+pBR/CQGCg2Bj/itP2tSjaMcUpNnW
         YfIx4SKtJ/y5K4GsnLyQAMNrEryDgliDq1WjrLaXus6uxn8M5iNY3egzyyAtaLbCog/i
         qJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730469274; x=1731074074;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9XxDoLs63Ik2eMNpQfC7mj7nFGiFRzg3AZMRbgqbLD4=;
        b=P0E6zKx2IOSSgntYvLcO2tzoVbdwV2vjMQz7g8vfZ7S3CJWnbMQB3/++AGO+VAWjYT
         p/7uf6xPvUBSJCOf/OfUKyGZVQRFdE1OZNORsM6gKnkEsB0PO6DPZfOPAPXj49cm/bPF
         ztzQfSxDRrpJht5sJk3Lq9zr3b2TobWKZA9+heYpiHF6kjWId2SaCEOSgJn+G6Ts3Kiq
         /uwlG29chg1m12tsKgd/pZEHGWsnnlgfH9GKUKcg8EOxwbIHhrvQmv2uKElmlAnm97uD
         BkKPKizYU1riP435N7umB6TLsGb5eofxFVzdhKRlMGY+JkpOhiEeBvqGYRN7ncC6yHvO
         tz5g==
X-Forwarded-Encrypted: i=1; AJvYcCXo6jrtzYlIg4FoDT+cTHPuBXVC/VIn4pX7MO8yKw+dC50qwZyrsVhqE1bxXWJCAvCm5Rg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxD3BjZ7Bqyy5zhP0CUaM34CXN3NArUFrwD2PTvJrMiRYXFjPqh
	jkIgDqoWzBj3xJ0lYq/qpNqz62USy25E3GBo4KUPN/aT2Yc9ObRi
X-Google-Smtp-Source: AGHT+IH8W2eCY65X0S8AQbE9o3p5Q3zI8rq+GaKzoJeNimr8oXqT3hybKf0PinVDefFIyOyprLWsVg==
X-Received: by 2002:a05:6a20:c797:b0:1d4:fcd0:5bea with SMTP id adf61e73a8af0-1d9a83ab7f2mr30193095637.6.1730469273852;
        Fri, 01 Nov 2024 06:54:33 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:f81d:d4e5:9f89:77f2])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc1eb3a7sm2656270b3a.81.2024.11.01.06.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 06:54:33 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v4 3/3] ARM: dts: imx6sl: Provide a more specific lcdif compatible
Date: Fri,  1 Nov 2024 10:54:06 -0300
Message-Id: <20241101135406.47836-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241101135406.47836-1-festevam@gmail.com>
References: <20241101135406.47836-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.

Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
"fsl,imx28-lcdif" for DT compatibility.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v3:
- None.

 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..840e19b2ca0f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -773,7 +773,8 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..eff83f5e5535 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -648,7 +648,8 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.34.1

