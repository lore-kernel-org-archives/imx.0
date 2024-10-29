Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A69207203
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 19:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730229418; cv=none; b=ke4mS6Yo1ML6xHu37KG3+XG7EPSYIQrhwQYjHjPFJa6X7gQjroLkzNVmq6YOsfyA+niZNgGf5b63sr1AVm0cTcboZYscKshzheDiE5UJepgwSjt6/KyMS/sa8IzyvrsMl3kcvB6Pg2cIlVlJaB0Zzn51LszIEyk2MFPVAXDCAAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730229418; c=relaxed/simple;
	bh=cgnkI4FnhVgTOOOFoFrXelz+SmIgd2L/bkdD960A0So=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nBs68OHWu/LHtAaOWRPIbOfrgDIKrR/cmmNvuW2iyvbYelw8Bmux8KxEQEOYGt3cRhAknT4Kca8xb8SoGp6C73JBxzKz9CFZMYPqffrPsLU5Em1E8jhmQt07feHAFuXPj6VP5Rm5reSvkX8a9hMeOzSyjD9P3BSViFhZuuFrVBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IyqKPnyY; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IyqKPnyY"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7e6ed072cdaso4180949a12.0
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 12:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730229415; x=1730834215; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYKmKtE2fVCas74ElHJ9fhZLrtmW93dELAHBPhCA8b0=;
        b=IyqKPnyYmg92gERE6uq8aLFKpSAa9ifKL5Y9SWRiVctdlOe37qLGLglt856+xVvAUe
         1sfzEQMeigpJjA6CYuYzv9pJ6xMQHwOHHXtsx22W4dTlQF0haJpG/R7WY+SHfYU4VOAc
         YDQ1mINm0KM1ksSUo719TySlqZHQtmooKHeXXGDNqFQVmni8vKzUQQcDF622X4O+7txs
         0MuQHUjpxY1/jj1v8n65LsFiZ034isPhEtJTLcTK6S9d4VHJQCmrR01F9+MjVR0NSecm
         FjrGldxfFKDtDPFf3k5tHxiUZEWqyi+g6b7mjcBsVFg2J/k/fP9bY9dTLYjBrwM2wlK0
         eJdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730229415; x=1730834215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYKmKtE2fVCas74ElHJ9fhZLrtmW93dELAHBPhCA8b0=;
        b=ofVouQLjUPRcoYCe/aUQ8S09x2D8qwm4jEVMJ6a4hPMqx59HiPn5IHxlTsKv1gyMus
         fovfcvu656Qt9CzP2qr51i0BCvXlsl7AKCpAJSVNrAtR1ons6KazP1OqQVfbs/pIT/oq
         W8Jq6LYGWEv5KDi9IjY39lbjm9fxuanKQS+6BZh9iViDZ/gPOvkS0r2mFHCLlPI5zFCt
         6kEeU4FKh1AA/mpct7H9OXiLVGDOcS3+MFE2hcDN3vNBBo9RrMVE5ydZeqcMpncPYCl+
         C3iM8fmAaCmUego5+dlrQ+JaFF9/IsbVKbl26ly96Yl1VJjvWmqJbLiQDxdPBUP4r4J/
         kD6A==
X-Forwarded-Encrypted: i=1; AJvYcCWduj+S/iqAJz/reITeWG7CzYg2qs4juw/uZltFqYz0+DF6VbyW9L5uafmTMCZ0Z4jmzVk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs6dqmq8OJ/yQ/E9k3k9NDLk6WH9wTmYS7pzcn/VvD7V5HyQUC
	axspd2v2A6surVDqJwc44/6J+cCDDm4PmDKaEOKpSYYpuEP41CDm
X-Google-Smtp-Source: AGHT+IFTWq5E2+C67K9DtUnmc5ZutA88kE0YA5e/SigUzJXK7DIsERXz99OcPpiFqA+Gv4FpUe17bA==
X-Received: by 2002:a05:6a21:58b:b0:1d9:762a:98ba with SMTP id adf61e73a8af0-1d9a83c9c31mr17108740637.16.1730229415320;
        Tue, 29 Oct 2024 12:16:55 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:190a:1425:254d:1e7a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8661061sm7842346a12.17.2024.10.29.12.16.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:16:54 -0700 (PDT)
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
Subject: [PATCH v3 3/3] ARM: dts: imx6sl: Provide a more specific lcdif compatible
Date: Tue, 29 Oct 2024 16:16:40 -0300
Message-Id: <20241029191640.379315-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029191640.379315-1-festevam@gmail.com>
References: <20241029191640.379315-1-festevam@gmail.com>
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
Changes since v2:
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

