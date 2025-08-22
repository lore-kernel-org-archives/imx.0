Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1093074AC
	for <imx@lists.linux.dev>; Fri, 22 Aug 2025 13:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755869499; cv=none; b=j6eSRXpQKSGL+CI/2/1LgYPI6iJp+cR5AX0+0ed9SDj0oSaCP7wHPQIqPFYZnKwPnbIiPQ1Kb37vcqO2TRnGaBf6mLlv2zm47zShzTXVKunAGk4Gw2WKor3pv9R/f3JvTKr5/Qtlj/CZP9fd+i9M7uU5e4Tu+eAPktgMFvz2f7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755869499; c=relaxed/simple;
	bh=7H+O5W6Cx7TFYYHg0yIa4CMl+T5Jth/7El/WrcKoQQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e22rMmQ/A9o2e8AddmEjBMJQ+5oRZohba789ZRj0NEQZzjcbbS5SnIl6jD62E4EZ299bWoBi/+8sLsoZZimDCSFyonuo0Fn0dCV8Uqp2gDHBaZ7wrK9yIwOZtsvQf2bu8TE79dRG0BUYkAMqMAf1DPv9En/o3pzodFpsHowfQxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JFW8SWDg; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JFW8SWDg"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afdf393978eso31565766b.1
        for <imx@lists.linux.dev>; Fri, 22 Aug 2025 06:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755869496; x=1756474296; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x1oPHSZs3u7U8KvICqkGflwd8yraABLSs55oPMk26ew=;
        b=JFW8SWDgigrh1Geq0P/jek3yi5XVSGcCrqLmDNQwLePJ5o0QERXsI1oYxQVmXcMw60
         LrnFh4hK0/lIS032QtUwN1Cts4wqk7FN83Q8H8N+qsvGS0/ASoKhoW5A7OpoqLu7lr7S
         CCl4zW5sbw9wH/AQHULHEHMh+OPFAJjlTpvg9WqhZ6eNW5p1gCbQu+YzrZnTYUYqfquo
         kIN76RzENvNK7xCBn3gybNHfBx5eDtND8MvhsYs7CIhitzVUtFhaZgFg/t2bqih7rbUh
         oQbu7mwzNdlrK0yxCL3O+TPXHcU+4hr8CT9Ji7A23cNF+NelYFvpfmULNM6QBo4wFMfN
         kKJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755869496; x=1756474296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x1oPHSZs3u7U8KvICqkGflwd8yraABLSs55oPMk26ew=;
        b=s8F8D2ut1RlS44e68JWZHbXHKz5wnm+n3FOCRiUZBvCcKs/9/mLfUD09Y/xv62cxTT
         BCjV1RxbygunxL/HDRt0QvgAuAOwmZWeDpVIoJ23sbrd1IugwTnHuctVkyWt1JiLjBGi
         Nvn9gpry15FuDcgHANKqRlKKSUGo8bK5aB6nmJ8gRbKTUjCn3HR0zzUU4Q+NOClanVks
         2D2e5no4jc1JVhfbFZ8+77Q/AHzr+7zdjR0uDPl66dhO9iydRcY7bN5hlA0md4cDwHqQ
         xTwXSt3a6mGfPdM9KDIXo8GhnN5SOgtDIt/doA0X89fWbsiMqbRSQFx5rjrkGyMVowRP
         chyg==
X-Forwarded-Encrypted: i=1; AJvYcCUrRXoMTI4j96MllFkSVpF9K0rH7oyNQy5ITgH3pWUVFy6Q5QCza+238pDY2G5FdX4hACc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmxADGRde69Yamq5r/9o74885e4LGQYESN0mpA0SN78zjE5E4B
	7ixto7CYUaFfB+BP7BWfteTJeNngQzfCDDxIpBRZVoEE5GZn0oYX1521dQiOWgjWxQs=
X-Gm-Gg: ASbGncuIuNyxS4rZ7mepMLwhT/Ab3eMA7y+OeUhItSnCdqxCkt6SpzR863ebgivhEuF
	LkRSMzDW+MI/kSSvJf90JbE3ScvmXbUGEQEHrbW/W5uFhFlDT3V1knAyNPpwisJsoHa77kUdx6v
	1ZH5UltpSSFG7zH5XciX+vOjmBm84hVBfxwg1vyEZZ4SKYAJ8chNvIE6FPpWTjtWS6rojBhP4BO
	c8s9eYkxm7CZVp3slbRq8lYEGzJtSpLbA3S2Big3ohzZMhrYRvoODPs6sWCBEMpyUOLE43AEC9O
	oTD3IIUw1F1DzvM6b5MjOuzTfK104fKej+raOq5fG/FkqFKaIYSvJostJcoLYDmyABb99QvLalU
	puuAEVI4GrXhdIlzLkbdhrDXFeoGxVyg6XfGyddq4wv5bh6UqPw==
X-Google-Smtp-Source: AGHT+IHGf4gD2l54dPuZnRQTNE5elyH8zGFJB2EjqQyxv9TE0M0n+7dSm4Zf9PSmnmp/pw/J1tGJgw==
X-Received: by 2002:a17:907:728c:b0:ae3:63fd:c3b4 with SMTP id a640c23a62f3a-afe2904d606mr159430166b.5.1755869496058;
        Fri, 22 Aug 2025 06:31:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afdf24bc40dsm554863066b.109.2025.08.22.06.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Aug 2025 06:31:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 22 Aug 2025 15:31:18 +0200
Subject: [PATCH 09/10] arm64: dts: imx8qxp: Add default GIC address cells
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250822-b4-dts-interrupt-address-cells-imx-v1-9-f1b479da9340@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1428;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=7H+O5W6Cx7TFYYHg0yIa4CMl+T5Jth/7El/WrcKoQQs=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoqHEneKEpVbA628wFgsw9V2z3aggP1pLeaWTvt
 DKf8bFCN6CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKhxJwAKCRDBN2bmhouD
 12XrD/91UKSwZcFLucZM7856sWnxIKl00ZUOGNPinv9qCyfjYCiszDUpqIuPvf636lvjnr6iTLD
 swRjLqBQvVrHKb9eZNHvNuvojmT/yHRRkUUe2o0kvr6dEJ6Z7ytdDpUFtvka5zIqi8kMk5Qq6Xg
 sz2uyWs71KBSPGwNGy6umMAMuIm3HzHRifN6mClsn0V0F8mVsfDyiSy8UejVpYvcw7i+fpRoX3f
 +MeM8Zv/QUoOnWGJXssrjOAPyN9l43eEvBXv1JaChihfwuao3gwjyMxuc2+KbtgBHEGDH9iLwLX
 sqq+cKMcqXWIDkMM5g+UW5TiYrV4KYhjWsw4GsX/ptj7fXwpkxdQNbzxbf7KaBaUmknrJcvvOlz
 jDAHL58ZqIebI0iTcO+wqMG9WFl/lNtFTALjDqSh5HhjrYqmy2RdRoy/X4xE4aAQwJYPB09Pzsp
 DiYd1b6O27dht2Z5CFA87Wanr/crWfUlAYKueeYQOc9cP+hSZJis8nS4EZzGf1t5qM7XfVBZHRj
 6ipvyaq/k8qC1SpD2AcDZdsc/86cgIcDno2ylCkHxr3pfUj2vuTz/qv+jBWHSW1RBXy2ttilZOc
 9R862LdCsnKXsa11wUa1rs5qgiOEot++kWuFs2iIrk80gMk1GeAHv6yL4ERreH4cmAMbMdBoyS7
 jrSf2RWVT3tJsPA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Add missing address-cells 0 to GIC interrupt node to silence W=1
warning:

  imx8-ss-hsio.dtsi:71.3-74.28: Warning (interrupt_map): /bus@5f000000/pcie@5f010000:interrupt-map:
    Missing property '#address-cells' in node /interrupt-controller@51a00000, using 0 as fallback

Value '0' is correct because:
1. GIC interrupt controller does not have children,
2. interrupt-map property (in PCI node) consists of five components and
   the fourth component "parent unit address", which size is defined by
   '#address-cells' of the node pointed to by the interrupt-parent
   component, is not used (=0)

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 9e46e16a8dc06448c6eb1796a3ffe70acb09374a..95edab058276bcfc87b9bd85426b999d1ab32360 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -159,6 +159,7 @@ gic: interrupt-controller@51a00000 {
 		compatible = "arm,gic-v3";
 		reg = <0x0 0x51a00000 0 0x10000>, /* GIC Dist */
 		      <0x0 0x51b00000 0 0xc0000>; /* GICR (RD_base + SGI_base) */
+		#address-cells = <0>;
 		#interrupt-cells = <3>;
 		interrupt-controller;
 		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;

-- 
2.48.1

