Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3951F307AF2
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 13:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869501; cv=none; b=t1pcQ94pbBKIoFszaUy60BKBnGcS8ikHcB2HJykpc9HSXp8Kt0UES/9beCyia29NEl6LgEg/9Kiy6b52fRhJKCaMrs6Ev2J1zgeLhD3CY9SZQVUMkprn2BRa7H7EJ9yfjgni5JRkGxleIdaaDl7L0PFyEo9isMu8KyGFv9ji8j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869501; c=relaxed/simple;
	bh=ZgO6eUDKdzkFk380nvHSCOPF+LK4HXHq8MSxWowHtBQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hNwt+vd55oTTQUCduA5b8xgoz4L/vYxTEbXjytkL/SA/bq6v6vCAB4uXzqAAcZpEdiE0zk7MsvoLGAIYyHlrRbfWUnp2DTeSYVeWSgoHma1gC81gxcZQjazXItemxi3lvBf+HHbWMMSCSX6NVSl1ppxTetuVN4wIeP1C99fRSZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=exsa4Zzd; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="exsa4Zzd"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-61c2874224cso38708a12.2
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 06:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869497; x=1756474297; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X/I/B1Xgl4R7nkzvCP7ov1Z9+wk36ipL18Hy/fu/bOM=;
        b=exsa4Zzd0C6+NATGVvflgntEnvBrB4t51ZhkLSsfyY0/FBMTqE/MEBhBc9u4ol3cRV
         Q31u+HWbS884kT2VrDf9RD9N0AaPNnGvH8u/X59HsX6ADn4awruTzfg7SHu1RISCljx4
         G769LzkVA9hBnc6z823y21mB/xr551OlJzoROb/6/GKjXbtQbS1OpsR24RSeS4dysO5n
         p5I5PdEnUtPuwX1/0xrY2Kxhhcz7qfO6ZDGaEVr2kKJpHe3W+SwBjLRD/g7PmUJR6qgL
         zeDK3lwQC3QxxwIoxEsBRoxgoIPyHkBP9zaoOM6RrKS74eqBG1CbOhYiqB6h6PIItKcN
         kZiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869497; x=1756474297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X/I/B1Xgl4R7nkzvCP7ov1Z9+wk36ipL18Hy/fu/bOM=;
        b=TJ7pGmPTqZagEhCiu/oIhrT7modx6D5FUiTxZrJvgXGLzuc3ISpHF+iLCz3reegM2U
         27d4kvMsyXppzt9cPi88yG0YfOTw374lPdKyCZ8nbgT34wKeOIyR/m+19HkNiule/vOd
         p65hxb5nQ2yCiIw2TZcWIh2jhmSdtoMzH8g6iuhw9QttoyNitIREgJE7otsdxVi0zMeC
         yo4tZdETlQwoZ4jLZJEHh6hLNCa19RCLPljNRzufOh6uUWy3LbPm5X8588rBvwnz9sI4
         bunhjCgFXT839UqyCf7YsBmL/T2TVpxU3em1PRBGdbTKABLQ8OLtJM6bs0vjvSj17c/A
         eXUw==
X-Forwarded-Encrypted: i=1; AJvYcCWGCAB2uSb8eDsBPc+w3JhtJOX0Pm3psiz93Q8fEKp3ctQsjVDNYj4p/aEAhez4dO5G2dQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqjKaTrsca9yZzElhwMEbURKQDq5PMeGm0q9p8LXoo1HudTaDV
	saB6wmdWSxro7mr4ZyBvBu9/jo5YPXWIDVDCjo2ZpSO1EUT3SUYJGQxvTlbXzIsMYf8=
X-Gm-Gg: ASbGncsWJg6glSFKZJ2glt+eh2fneZqxkxINYWQ8KgVjMsico7nvi0KnN3TzV/quLLi
	uoLJ+pL+iPDVrTl+AFWhFnqE7PSpPLiQgVpJl9NsZPaelNvojs1tTRmelg5xIKTMTTWqXrhW6yL
	m6k8k9+8ZROQxc+bGF50L1UGOsj8zJuz9/RvHgmaeVLZq3qTvS6Vuk0tqXVyJMA3KON1zoD4LNK
	zgNbYPomWcTyaGPXC2FTCaWe02B7rEu68p9ivNy/0kepj8+SZKAmpCm3MX8K8YEUwewN5l45cE0
	T1zqYi+/xJJIgcEzDYAlUNmoQBU6sshyn4wwxBumEFL0PtlCwyjMLRA/uEP/eITtykLhbrpJrjd
	ekCsvE67ZSGHCzh99LwNDo0xHpd1U5nQqNymbviE=
X-Google-Smtp-Source: AGHT+IEyDwCsxl5L5Q6zhJRuvce0siTKlXqOHugCi96LaphpN2o879tF+yGlsn9uhsI+1vutjC60fg==
X-Received: by 2002:a17:906:c10e:b0:af9:5903:3696 with SMTP id a640c23a62f3a-afe28ec8575mr159462866b.2.1755869497446;
        Fri, 22 Aug 2025 06:31:37 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:19 +0200
Subject: [PATCH 10/10] arm64: dts: imx8: Use GIC_SPI for interrupt-map for
 readability
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-10-f1b479da9340@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3812;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZgO6eUDKdzkFk380nvHSCOPF+LK4HXHq8MSxWowHtBQ=;
 b=owEBbAKT/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEo8ebRuqypCpa68Mh2v7d5MUvPuEcsRySCX
 9cVV2D5SWeJAjIEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxKAAKCRDBN2bmhouD
 12G3D/j2os04TAukiAzO4cVt0bZ4ODbfZ8ElQZZugArIYddeU7K0aLR9h7anhmfB246YsCfa3/C
 5/XJ+YY/5EqzjywJxDY+IH1cSgK4UBy86W/JdbBkCLBkBxlu9qJp/LT8itKBaX6u1BwubCI0No1
 tJXCN/v+RPVZCs00QXh9ej1sXS/U9bbR70h8TETqgmc1mZXdVGxXBRml0MJ5BfUnreCl+i1+uK6
 Cp3MtFnsapo66aWskhohC+jcv//WLG/6LHJ2PKUzzrRI9YYG+09NPABlEwXy4PnoHMUjxXNm1Yx
 F8vCgZOmZ0dPAbxz2vZa7ibb9vV4JZz6RYC8OvZU5p9ZUTC07odvybnVT15f7m3kOMUIX6lE64b
 P5XCDPwwi40TIlKH/OKgAJmY/1gk9BU9BwD/8W2oSbaQseb/yPhhaRrJyKVoS5OeNduIsUjRkX/
 oBaY0EREk9kNocGp7kQ0V62RzkaD3dmSUFZFjxpWh//WAdH4XCOvjNxOF6BdwKfW79i6nKULuXs
 2plT0/ALA4dCbqEpE+9KQYQXPFRBAfp62NOFq2+vdDr/8qKyowWrbc/INq82kPAt4SCsNVVKPb0
 E+36ERJGOKX3vyRKxiLDo2EIh4EypzaCmh6079MF0qHBrG0+5gfPi2B3fxPoKL30U8I/MB0IlMH
 1XEuQclU7/FOi
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Decoding interrupt-map is tricky, because it consists of five
components.  Use known GIC_SPI define in final interrupt specifier
component makes easier to read.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi    |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi |  8 ++++----
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  | 16 ++++++++--------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
index 9b8b1380c4c2bb25f691d72a0217915cf3824889..469de8b536b5866ea83cc0542941039996ae5f23 100644
--- a/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi
@@ -68,10 +68,10 @@ pcieb: pcie@5f010000 {
 		clock-names = "dbi", "mstr", "slv";
 		bus-range = <0x00 0xff>;
 		device_type = "pci";
-		interrupt-map = <0 0 0 1 &gic 0 105 4>,
-				<0 0 0 2 &gic 0 106 4>,
-				<0 0 0 3 &gic 0 107 4>,
-				<0 0 0 4 &gic 0 108 4>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &gic GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &gic GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-map-mask = <0 0 0 0x7>;
 		num-lanes = <1>;
 		num-viewport = <4>;
diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
index bbc6abb0fdf25b650dacb8dfcbbbe5dac9ed5cce..ec466e4d7df5467803243404795a9a6a1da890b2 100644
--- a/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8dxl-ss-hsio.dtsi
@@ -42,10 +42,10 @@ pcie0: pcie@5f010000 {
 		#interrupt-cells = <1>;
 		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-names = "msi";
-		interrupt-map = <0 0 0 1 &gic 0 47 4>,
-				<0 0 0 2 &gic 0 48 4>,
-				<0 0 0 3 &gic 0 49 4>,
-				<0 0 0 4 &gic 0 50 4>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &gic GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &gic GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &gic GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-map-mask = <0 0 0 0x7>;
 	};
 
diff --git a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
index 50c0f6b0f0bdc2bd6fd3a19e08d1b7a723353783..bd6e0aa27efe90d3489c16c705d508028b268ee7 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi
@@ -30,10 +30,10 @@ pcie0: pciea: pcie@5f000000 {
 		clock-names = "dbi", "mstr", "slv";
 		bus-range = <0x00 0xff>;
 		device_type = "pci";
-		interrupt-map = <0 0 0 1 &gic 0 73 4>,
-				<0 0 0 2 &gic 0 74 4>,
-				<0 0 0 3 &gic 0 75 4>,
-				<0 0 0 4 &gic 0 76 4>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &gic GIC_SPI 74 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &gic GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &gic GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-map-mask = <0 0 0 0x7>;
 		num-lanes = <1>;
 		num-viewport = <4>;
@@ -80,10 +80,10 @@ pcie1: pcieb: pcie@5f010000 {
 		clock-names = "dbi", "mstr", "slv";
 		bus-range = <0x00 0xff>;
 		device_type = "pci";
-		interrupt-map = <0 0 0 1 &gic 0 105 4>,
-				<0 0 0 2 &gic 0 106 4>,
-				<0 0 0 3 &gic 0 107 4>,
-				<0 0 0 4 &gic 0 108 4>;
+		interrupt-map = <0 0 0 1 &gic GIC_SPI 105 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 2 &gic GIC_SPI 106 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 3 &gic GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>,
+				<0 0 0 4 &gic GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 		interrupt-map-mask = <0 0 0 0x7>;
 		num-lanes = <1>;
 		num-viewport = <4>;

-- 
2.48.1

