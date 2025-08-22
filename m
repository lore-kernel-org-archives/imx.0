Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36A8302CDE
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869490; cv=none; b=Xbf5z7PEY5kEnY/Fc4frLWPBeRDZR+v83asHVFJhhoBfqCPv5BY/WJb0TANAzWSIxpSRFhhdYhH5JbkauUtKfDNXuQdhRmp7KPGRliaWE31edoXbDou/OVRvMAUA784b1U/yjUkYvEODdagaiCCNL5puEryvmr40qkTAZrOMd4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869490; c=relaxed/simple;
	bh=LwVTDYBupuAcHM+FBGEUCmwg7FAt9lhCXjGxqLhE3Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ADnBRoo773+/vjhXcB2GiGEmDtxH0XsWs9OhCABVjJUGpunhYuCVHD0F1ZPtgnboe/hlXDGX77oJUTIpXGRZ+JUlCY+OfEdeXSnwDKuHYoTtgcjP6kjPIdBZtTV7UPOm5DdG8gosGqLaIS3H4PhansQFiVMb1DUYxtwv+rFNvCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SCIkjZ6e; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SCIkjZ6e"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-afdefc9b005so33614166b.0
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 06:31:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869487; x=1756474287; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3dmXcSmUeGXx3nL3phdW0mGHdFDemcCiAs4uvRov1PM=;
        b=SCIkjZ6ePvaurlc3bX1koU2FHJjBbRKf3BNulDhgcjlnDk63pRhfUieXK7aJx1Y7d0
         5h1kKim1i3ilgMnzTLRhoECVbxNyquGhte18HAtRU6NIpVTjiNguMoLwna1cDQKUtvgI
         AUrUsIUhPNPtbY818QfFFb/LputSuz93D3D5gIEq61LKtdiI6AK/3fFVe56nmk96+bAB
         P+PEHwH9fT3Pmi81gDsGobZHtcNd81kS7qGIzC1VyaoKBCbfBcTLT30yHdNF/jZ8+5Gd
         Xy7jN4GQCTF6dwnk5b55LaQaj0tXgOWOh55TFe9UiDk4dpNcpMbp4UTqGDy1et3R4rYo
         990Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869487; x=1756474287;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3dmXcSmUeGXx3nL3phdW0mGHdFDemcCiAs4uvRov1PM=;
        b=AKhhUw3olFbfMWXqOCbMQeUcSCD8k9tHCChpCfgl2vMAzDLPs1gcnHXiwueOLgtNkw
         4LVNwoVIxDaDRGne5kOJr+YcqjNalAuBKBwoS7uTEtwVOOEYbRPjciU9EM00Lt3qRc72
         L8lvFPwmXzUuA2fYtQhkv6YWR6qvCvEr+kvKQYQuhicO12Q6W2sAiGC+UiZ9/56x8M2K
         H1N+lkZrgINAf+kv0eDvnVKvBAZXtNQk/Jzmu8AjR0ml31s1mbbQfXkSxf7ERhKBKnzn
         7FXscwKdyz5BojddJCArlqG14Jqfn67JOezqtw+P4HXqP+FCtc+DyAKycAEZPUI2A6go
         JtCw==
X-Forwarded-Encrypted: i=1; AJvYcCXBL8fI/dwMYyxH40JTomIjzCsv9obDylfxshbqo+Hp6d6MO8dexecfSrqgoYGLXFaLGYk=@lists.linux.dev
X-Gm-Message-State: AOJu0YysOQPZbmxYsCceY8Eie2Eh3XlCypJaatSrbZ+csTPliebmB7qx
	QJaviiKYmwXTBTR3DHTTQTpo94ELGXyYleUmUCUUXkAqP0jGIq78DljQ2eog8xbxFKQ=
X-Gm-Gg: ASbGncsst5kPCYIJdOCFOSqxW4egQTlN+VNNqOylNEbnt5OkOkCJYYFPw+bEx6qbB3p
	SYte3ZiwrvzFqSR10OJ4J9VkgF3FC5Bbf79cOi4go6JcWa0Hd8GyFcSRkmTC+b/renN2sEnQ7gj
	u4MyX0pB5z72CYGqeI8UhglXaGb4vIX0tk7536JlbK8tfnCLCgNRKVif3rvJqX+0z2lruCUuzCp
	+WTIlH6GpLsTiimquCq+OEei/QK7rN52NU0l2f6PQwrkkoNjq5Pi3SeXad4N0zhIoWtu/4cjcnA
	AqmfLgGA7LqEVNHgFdEBvA+j2WhJJpK+BMyaVll01CWQfbOoofg0XqG3jzFaLp3UVr08bHiaPAd
	+Y622iXYtt0eiT4NzbiJWdLRreZTg4sYQrF/MmBM=
X-Google-Smtp-Source: AGHT+IEuA5sRAstE8e/rjpyTg7g8U8xiEnXD0mREcr+QwaSaZg5p7OuKBV5B9Je9ZcQwkWGnedj8EQ==
X-Received: by 2002:a17:907:d88:b0:ae3:bd92:e6aa with SMTP id a640c23a62f3a-afe2943e844mr157976766b.6.1755869486899;
        Fri, 22 Aug 2025 06:31:26 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:12 +0200
Subject: [PATCH 03/10] arm64: dts: fsl-ls1046a: Add default GIC address
 cells
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-3-f1b479da9340@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1350;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LwVTDYBupuAcHM+FBGEUCmwg7FAt9lhCXjGxqLhE3Ts=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEhPq/IurFRNWgjcOAKuyTeJQ536JU0iROCY
 4b40fpK7iqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxIQAKCRDBN2bmhouD
 1y1uD/4kk4nlwoMPLW0/2dm1wiY+/mE7GCwvrFBlIrva2XGyrDX6cbToe5FoLb25Bfy6A3Jys6U
 xRC1vMKVBeyCpy929fMlpYgZXUTOefH8YMKvZ6m36R9v2DgPl0zzGZ9FY/2Cmh9gOH6qaO6bHir
 z+0SjDDjVhC0kT558Me2i44GC7ROX/vAtwT2Y9dLCopgKRn/qYEC60sYKArtecoARZju8bU6eqo
 F8kymsHBhMGbrg8sU9VVX6AlO5wqZF+UxAt0lffpl+CO2HODEgo/gXAYibZ5Pjdil+NHjbiegNN
 fuNDaYRtAih560jnFASGDXG2dnsUxdsLr+lInNhZtKREG/8RxJTjeppOan/5qNy50oAuWgk9ebq
 P//iH01m/wlBcYzgshF4lS2CZP2LbVKIEgkW7oGaNna9gntA9e1Kin6nGq6VIbajcqmEzRcRqjA
 OINRGwnle1bYltacmy0KQRIkUeCTdwpDLKTaJIobeDlSmiCEEq9PKi8J2l3uyRO5i+v4mMdwY+D
 ApbcqZRbbOkzv+pmyFv6JGcYbxXJXFRxZmJ2CmvYERVWZCLWow9klpHVMeXvtJ0xsPeBju8Qhjp
 oZ8nOIZRJ7fc9Yskwrs1/Cq6bVSWSonHniPvV/4k/DG9m1uTQ5+c7sfrcfAMM5PUBJjOQ781FgU
 a2IfE9ZWXeTaKFQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  fsl-ls1046a.dtsi:334.5-346.26: Warning (interrupt_map): /soc/scfg@1570000/interrupt-controller@1ac:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@1400000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index 4a22fde38bea678ffcaaf44e9984ded687cd2297..770d91ef0310d971d044a1f55cc5e2cb738acc47 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -260,6 +260,7 @@ pmu {
 
 	gic: interrupt-controller@1400000 {
 		compatible = "arm,gic-400";
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		reg = <0x0 0x1410000 0 0x10000>, /* GICD */

-- 
2.48.1

