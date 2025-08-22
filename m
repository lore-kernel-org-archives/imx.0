Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F595303CA2
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 13:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869491; cv=none; b=pjtqUrEupVAWKJ3ozxaKGOVVxtnroiI2pO+Y6ZCf8kGRAUOqugrlNP2hUgI5jBhVjU1+kS1B5+/IJMYYlBtyuEf0IVZZj6+O4il363V7z+FcKL00+XMhHiLpdlmogG6fUlc2BprDLI8ih04TQAUNdeLh2iIDn3H+TOGq7fzYu7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869491; c=relaxed/simple;
	bh=aXy08N5ASlJt1VGT53iFuQkAElMeDXbRExFiLdVB5y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kFrA0eexjQWsLJGAM+rqRrr+v0i37sggL7GfWRWNKgJZbNliuc5WUHDTet9fmpBfe/UyD9QqiWeLdb3mM8Lb3TnAiu0UYkd1yUFgpdGbcEpicxMIGl3X9bQN1/iIEkn75HYbilzwXG6VVBV05Nv07ukXySLnKSETea2QFIlH4Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qzxCl7gj; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qzxCl7gj"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-afcb7aecf92so33699266b.3
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 06:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869489; x=1756474289; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2Ul2W0BQETQWNbcAlwTY9yoNAx48v1oZv5jnDd27cw=;
        b=qzxCl7gjnuwI559oJ3dpQVCXc1qJtqKZ7j6Ac+h7uZz9pguGJe+0wI7tvnthw3oXGV
         2DUFwJl990XM0ZdC3ZMErTL4l/crMcHZPfPAV1ywj3yvxNiYhBvMg35by7b9VGxDDvQ9
         z319T7QiufYfj08xMpBgI2r0yerE7hs+N2NBe5hw9irWmHC6c7UecDYgOeUhLZRf9pLt
         BMO3+18RdxdSTKS/lEKcj6OKmpsi9tt/FGg2bokhPUsHp/sdi1XIw1b7cgIz2hRHgsr7
         JlXJ/xl1NYNQd/jPPDNRkI84h6q7vfGkCmvlfATrVsJFvgWR6iaIM63cY4gH1sfmrKt+
         Fk9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869489; x=1756474289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2Ul2W0BQETQWNbcAlwTY9yoNAx48v1oZv5jnDd27cw=;
        b=IdT/+3dOY+2+x3+1veltDugIOMGnoHiZYlwD90pxnFSBUS3Kj3WxzE220n7Pp2BbST
         MbK3TFaKyxdbbkSTZ+cChQlgfO2Gbpo/ggxs4w08dbAOQELdgjr8WlZO3HEudhChnbV9
         m+0SBoglgR1JCSDLrbKW1Rczh/orwRy7DLLqXbqebo84zfq3LxVr8XHReQ0DJ8uyS+Zk
         Nt104fhHOBFspokoeyY3Upv5p46pyabssK9ha8AJHl/wdx+1JpCkeC5q4Cd3ISnMHuoG
         TDQ0zCTwsxZ6rXKiD7N1e/VBpy2j5AikeC4cPB1h4zyo8yyffLq0ugwNLSGsqsebEy28
         BMYA==
X-Forwarded-Encrypted: i=1; AJvYcCVJSw8eYtCmH3JGjOzBjI4OnotOYZVJKVA9C3yKukcy4lncQQlR1ZDohs3XxYeeLYJQrBw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwOqdkJ4FLuQa4PkFtLLxb7Mow+FyUI6Kvi/Hkbw/SQsXsU5y3e
	q/EJ6Qwq626by10/pF/4cEsnjQQryM3J+rdZUmvseNFMntTQm1C7o4JFypq9FHseFDM=
X-Gm-Gg: ASbGncuy4lpwVZaWfv5i2kzVPm38YeEp7f0tUAUuBJA94iyiX66jBvL/eEXdNFfCCG2
	dLiUVbRLm7MNCl/P4yiVK4b75daxgMs5BhXTTHQXoXSWJO57BW/OjN/mkX98tWULmLUkTprO7ic
	hTXyLjIWldQo2rf+TEqjzzntEPJTdFIlEiRNihdp1KnfMx27YkDT12/gedBJoHwy/B6il3LaRiL
	J2c5wECoWCkodd/maXzkEP0TUQdnhFGC4dv95itF1dEV46Ed3VOsD5cpcih/NooJwptfyOfrMw6
	kaa925yR69O6MGmDIrA9F1a97QCvAiNRELi4sdAyCSnpNzOXLr/4H2D9ASvDmGvM4Fl7EZ2xNI5
	1p9k5F6/1LIGfxwvFIECPsmrcRhrBGcWQRfmSAzt2cdTaNL2gQw==
X-Google-Smtp-Source: AGHT+IHV78ZxU3iKNd6nP7fZUbBvl9S8fQrvWntZEx4dMBRpAUfAAE5JWDVypBBpJHo8PYXAQs5H5Q==
X-Received: by 2002:a17:907:728c:b0:ae3:63fd:c3b4 with SMTP id a640c23a62f3a-afe2904d606mr159402866b.5.1755869488604;
        Fri, 22 Aug 2025 06:31:28 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:27 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:13 +0200
Subject: [PATCH 04/10] arm64: dts: imx8dxl: Add default GIC address cells
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-4-f1b479da9340@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aXy08N5ASlJt1VGT53iFuQkAElMeDXbRExFiLdVB5y4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEibvRBDJw4yp+gxDajS6PLcrd0nA3hShUtl
 8Dm0nFuyeKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxIgAKCRDBN2bmhouD
 14DaD/9L8xMva9DaFBSQ4PC9biqUYgFlQGRgXmbDMV/uW9ip4ASvFGD8OCb/h2g5ADDSG6hW7gm
 OUeCOa3+yLMQP4eP0gJUSlyVLD+JFjk45RqiywwCDWa4fGnvmDAPMf2eavxTgGll3Kq9Lzlwf76
 UZgG28HmG1rMEz/KyPqBTx/LchefFJOnxbPKeU4iWmpYdNgPQ7ggQlPG1rSIc2teYq4wOTpV/Ov
 X5Cmi9pNXCeQxqgiUt9zZNIZOPodSZq+cPKqEhGeoVP7SLhDnsUHQK84BLFzXyfrQ1oQbobXMm9
 SRnkMRxE8Ilztcs9uhwiOs7wVyXWyprkWQgwdxUkGe2aAqC210k441aZsSVj26lOKVjnmmtx5bK
 02wtbUxMuxWwnsCxkMhUqV1jIhtuQ8oRA/ISwTqdcxGb9R1JgsW7e0DWXFVu7/mnWK8SwGWlfct
 XFshe7VwJA7v3K6mpa37v2JZjifiDk9Lyq7EYaCLDA9W2qn71OxdlhjRhzDN3bITix2YNrbXzET
 vkLRUdrtAnjv34SO3Fp1neixvBP9oDEI3KysCAPbtPk0pJTOMe8BNW6Q/7ReuJRxvmu9/C7k0d4
 P3rt6mILJ69BqKaD6hh4dvVwslFScCPb4evHRO/Ddp+DFdFZ4v7TIiVvyi87YS+qvSVg588Z+4a
 foDRYXgoncHtsdg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  imx8dxl-ss-hsio.dtsi:45.3-48.27: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8dxl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
index a71d8b32c1920bf9d73020ef48eb98fdbe9adc6f..8d60827822ed1cc6cfb1a9369faaebfd711708d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl.dtsi
@@ -92,6 +92,7 @@ gic: interrupt-controller@51a00000 {
 		compatible = "arm,gic-v3";
 		reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
 		      <0x0 0x51b00000 0 0xc0000>; /* GICR (RD_base + SGI_base) */
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1

