Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877ED301476
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869487; cv=none; b=X9JA7YJD3I3MOajlogJ87g6N+nt9p312Lqs3c2N4VURngrlYXXSZD27mh8wWyywVTmOIphOj/F8zrDSFhqUSl99DblTPlm36XPkq6LcwVF3y/xgFzcm0OfEpfLW+rpPiXFCqNKCS2OAEeRTcmCdwHvhqxDGKlTtpmBKn/KFN4hA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869487; c=relaxed/simple;
	bh=3SVpgon+i1YQeIuy3oRoxPKfUy9lcns76Zkt/Y4NV+k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KjWmHPM3QcJ2TZ4Lc/0gXHh8WzgANL4D6py0A060gRrl87fBfArK9aQ4hv5dhfzVEL7tLXwRskEh2Rv8RkkpBD07wBxKO6V44HbzMjpcZqYU0B6A627sB9HQegSJOM7kUPkaP0kWgYvxrfcBwaIDhWJ7+p52sPCkc0+Ye4fq5lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bakd+bqj; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bakd+bqj"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-afcb79fb221so27927866b.2
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 06:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869484; x=1756474284; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lLPWBbvJzifuSCPGTnAy7x/NBrhVR2Sch+UbydDDTnc=;
        b=bakd+bqjISsiInEBHBYMacEkiHlp9lL6jO6ZTHclApI1mMEGjN+FQlqKc0Q7p2SSmL
         eoqRwXbyzyEQfdvY6tAkJYodqFhFBDO05rO3CqIPEz4tp6ZsNoTCqAuDN4kTILLFLOgi
         88mk965PXnGnaGispZkuh8i/s/Rj6nsDgUe7PkRHzL9kZTtmct0n6wKK3rddArhNHLgB
         iRvvYvc8VkBFcsUbvLTW8/iQnx+v/5+PZPLsz+sBnVeE+WF49tBkJ+eaGPIIlpOnYnV0
         Z72Y3gi29QaJFEfnWZnFgRY7lbJO3R/4YTwBSBEeOSXTdk7oEWoa01tBI5JA4IfZkTwU
         VgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869484; x=1756474284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lLPWBbvJzifuSCPGTnAy7x/NBrhVR2Sch+UbydDDTnc=;
        b=cRnwBFshs7hilQ6ooxgyOZo8sY9rSpgR3ogHzpHy9wwehMRzVfMt9zmJI/pmadG/Wd
         XVG99t668nn0uBYq7d8fk99OhUnPodkTowAskXtG87iVhGNd6pbDv+JjRcIRs7wlwXOQ
         dV5EAUwJs/mvRD8fBn8fTmmlOf2YkmlIfTrWZEGk6KPYBeMXfgD4oX4X3XmVqjccg7FQ
         Egl7PHBA3wZPv7YTXMzGdzz3Yyu1Kf2Ov/EvR7LDKHpEJZ+ZGmgfm0rQ3reyBo4/8MRP
         3lRxG7E+vtfegxnCu7ehtxFG4hKhEhiJd1Nluv9aCauaKIRFAEhbBoJUUU4FIWNlnJ6Z
         JBaw==
X-Forwarded-Encrypted: i=1; AJvYcCW1iD+4AxQYX3A0Bqmi/zeKWxQQmO5NxVShpfCr2gscuo5U1/noa1/yq3rsNc0loua9Lvg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyehuLnTONAPOdA8DMPTmnNGAqt0zs7/LpRmpIeWBoQ/6qHJOdq
	ac/vKMv/AOzXCrFlnvQH6poqvi1z19DM8egnLZi0lv2T95zi3B9rux1AJyciCcqs7ms=
X-Gm-Gg: ASbGncvoruuIyhtttluz0lzHfj7MHI8vsgU/EscdOIKWrG8twphjV6Jcv3PRurEmnUq
	WzL5XuzeFZUoPRtK0dogXaA3RAMaJnwe5Pe99XHUiDC15ncaWcFQgsDfPY49xWkevK4rICaAWiF
	OHQdhlF6W1KxaGJo2wSB9ZPPZVNK/xvP1hpnTxfFQadpWObSPHVRg4Ibt5q6XHGOWD53+Vbhy0f
	/D9N76aN5Ii095M5EO75uPwUf3t+IJFNluyRKjgvMvgQ0SooMelPqDqsu3WnRZx2BbZ3qn+QGDj
	AmUr600hboc6117lS47wKpyBFYgK3BDSCUQO2C+BBnAAalEcC3d1yr2mmJIfEJmRJvAuBhu1wr5
	kKSCPZJfoFAh3K878QMiJPwfR/LvqvV8D6Ws88FE=
X-Google-Smtp-Source: AGHT+IGye/ypxcYwHYTg5+3IuOjm1+gEOjzMVOKls45nzJUtB1Xa9O00N+ETVyA5ZLC+lUcykguCIw==
X-Received: by 2002:a17:907:7fa3:b0:ad8:9207:b436 with SMTP id a640c23a62f3a-afe29048212mr148055166b.5.1755869483728;
        Fri, 22 Aug 2025 06:31:23 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:10 +0200
Subject: [PATCH 01/10] arm64: dts: fsl-ls1012a: Add default GIC address
 cells
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-1-f1b479da9340@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1322;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=3SVpgon+i1YQeIuy3oRoxPKfUy9lcns76Zkt/Y4NV+k=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEgiIiD6BglCYSYhzqb8B01pZD6xzH72ddRt
 SeeZP/7jl6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxIAAKCRDBN2bmhouD
 16+GEACReaQu8HmfvIKNpHLlEbY6YYh0s0nof4k3fX9yB1JvLMmDUYQa2XucniT/Jjqxn/FpXnc
 1Oc9F8wHgQ7A9tfonoMlLWbMY+n2dy4ZPKsQ7127kXGUnPs40RoNloVb5C+YJprflb4cPT4kFY1
 hD1mLDtmN39cN26PQSkK1cOChLCJ9MkuQ8oig7UmltQO0YU6azgpYcgfrmivxdt/mVD7fWiCddc
 9b1/FkvhKrt0ftpy8WXriKE03cZMgKeFczZrMOB+Cn0NzzevCXi2c9AnTx+cfJsOF4QrGMAx/Kv
 7PmwHYJZ7FWwLo3rx87JZ+NxFVJAuN0GhZl/eoWfXQR3FbnrZRo/XI5b6M/PKMoLLwoa2PmWElA
 Ss1Me+3WYH1tQXKprVqtvkdzlBrhPsDUAivEDiNSJQVPeMdocN2eMwj+qyrr1p4NICMUx6rnHTH
 VJKUFko2xx2xtgkxiEieJ8qhfDOaJTC/MgBquy33kn5/t44wFV8rJj/oPfggEGGgF3TcGoEb5PJ
 BfY8Uq10AX3UWhY+O1/yDV+/xblulpI6ckf40CL2GGeCsxatWkvHaSc2WuHvjFrQcEvQLxS8kkX
 Z2ju3N74J7IDTL+m8izQAEQCxEHMNXg3NWV+YuO4atriqT+vRBz88c0WTTe6qJGJfEij014Q+ns
 i5V0vR3VPO+IctQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  fsl-ls1012a.dtsi:548.4-551.32: Warning (interrupt_map): /soc/pcie@3400000:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
index dd479889658d452142e6d50b507147ba91c799af..fc3e138077b86cd5e3cf95c3d336cb3c6e1c45ef 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1012a.dtsi
@@ -87,6 +87,7 @@ pmu {
 
 	gic: interrupt-controller@1400000 {
 		compatible = "arm,gic-400";
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x1401000 0 0x1000>, /* GICD */

-- 
2.48.1

