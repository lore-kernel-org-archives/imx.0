Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4072918C7
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788835; cv=none; b=FBD2K+84++HqkeT52gGh2KGrf8JaQ5A42ywfyMZCl3jB8Gn9AsRfT5zqe3dwzPCEOQGlhDV6z8BVGpXag1TSJl2kq5GHXzbgt05qIyVYVEbWmpD4Iss3993uL52roD7cbhTwko7WHVX5fyCl/oSb20xFjRhE0PFHdgIefXnF974=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788835; c=relaxed/simple;
	bh=mx5u03b5TB/f2q1YQ3KCyV5h99vYZyaZPDhhfpjU5fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p0C/73qzOyLJ9F11WGxoYIyiq0hDHgz2c/jQzMw8sCEBNn029UHnXejpCUKCbaZ73yGhG0sN/N09fHTwpVWqhcSAA1qvFv+1Q93V1ZiE++8wx/6y6wNp6OuUqjsoX0vMqRsO8MMcx3+UlbTEdEknPX1nbBTTKHztaj6TORN2O68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YNTQWhZd; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YNTQWhZd"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf680d351so17700205e9.0
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746788831; x=1747393631; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjvkkMIUxErk/9CbtL8I8hETKTjq9Ni1Xdc4V8HrKQc=;
        b=YNTQWhZdpbOpmPDgLNbQzVR5rtb9nqJFz/end5J5LAESbO/k8m58s+vfrRdQxwwdel
         sbCc3j1mksXl0JaXC3okhJ+fC1vSnk6d/BGQ2ah6QLaQ1Ex3g/jrn/dNyq/UNA+vKdl9
         Bqm0YHvUWxw/QIotcW1lmAanHGKTy/pwBfs1+QPF+VBycxvWzlWg+qjqnY574M5EJ8e2
         bmI+AeZihbzqrAwdlIQf9M/ir2EP0t6zuOot822JTcwyWGcF8pcQW8mRO7y6e/FVcuTq
         8f47dJIvtHVX+gPGwwGBXlBoOVKY3+lcfwS/wpNwg5Tuw11wn+Et2kxKJrqx8GqtjLCL
         Pafw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788831; x=1747393631;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjvkkMIUxErk/9CbtL8I8hETKTjq9Ni1Xdc4V8HrKQc=;
        b=wALgIk4wT/5Q15v00F1/YGwd4EDr+JpJ5RcZL0ogVBAwsLzTIh9ApoyeepximcGtsn
         W07OKBqIDd2UyQYwgsveWyu1gnldwG+eCS2dTLvZxrQIHBh13JHPUYzf0WBL91mv5VWi
         thyJ/mbJQ3pk86K0o9kSYIDpD6D39zOc1MWAgfnSmFyWejd4pm9d4ks5hEPJEEc/D1YR
         RCkxnn9rd7y7ZXv7Zy9lpDj90Z+EbLtok4CDLHczxSzHdLmj6VbtGfHKnN7FShFr9vcp
         j9XK99iywxS32DaR66K7FthM6VcuewNjgXaF4F3J908m6t0XFlvHFWbmj/mGgrroYWcm
         VpTA==
X-Forwarded-Encrypted: i=1; AJvYcCVbXPi+pbWhLVHvYcOFQQRA+2boeOhKkZe49OtbtIHbbTvjYAxGUfPHVYrSF+cH4JrgX/4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyFTUpRrbzH3El3VP5yegmR0qQU+7F6lZQ6rNtT5VrioeQ/pwrp
	c65HV5FP0UveJCetJnE/BHuyGV5n4b+IUB9lXW9m7YQxp9E0hpnnNVV746eLtoc=
X-Gm-Gg: ASbGncuZm25a7M5fcgCswvsPq9VNGh3HAFXcG+Rlfe4Q3VGRGCnI3XVqxYuTm2qn775
	N9L2dAOQUIEILBAn8/lJ/pQcNFUfrNGk+/tGxhEuHcP3Fa53YvdGQhJeY+Wbv9Ot13e7LH/Rn98
	l+X5R5Wup+9EglFDCWo5xwVwNpEh0OlJkbfCUZrQOxl4qhvuFqspa0j16spvDijRNU2gQn36qDO
	ixI+RmrbsilgjlCWZ0748FULJwibcYJcnL1wvblKcxiaa/zIrJd4UZGtAEiZ+ospvXXRPMhuY3N
	Hjs7r3wg8WEYW3gRn2QURHHbTlysYqoKWu3Y56RM9YqS+wQ=
X-Google-Smtp-Source: AGHT+IGJvDt+LaY1QQLl2SlTRe/DojIZ4tpeJAXa/uWwNzG6xIzfPYcQgejyyHruKfc7448qtaeZfA==
X-Received: by 2002:a05:6000:228a:b0:3a0:b8ba:849f with SMTP id ffacd0b85a97d-3a1f6a0fc42mr2727736f8f.4.1746788831370;
        Fri, 09 May 2025 04:07:11 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ecadfsm2914797f8f.22.2025.05.09.04.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:07:11 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 09 May 2025 12:05:59 +0100
Subject: [PATCH 12/14] dt-bindings: spi: dspi: Add S32G support
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250509-james-nxp-spi-v1-12-32bfcd2fea11@linaro.org>
References: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
In-Reply-To: <20250509-james-nxp-spi-v1-0-32bfcd2fea11@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, larisa.grigore@nxp.com, arnd@linaro.org, 
 andrei.stefanescu@nxp.com, dan.carpenter@linaro.org
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Ciprian Marian Costea <ciprianmarian.costea@nxp.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

From: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>

Document S32G compatible strings. 's32g2' and 's32g3' use the same
driver so 's32g2' must follow 's32g3'.

The SPI controller node in dts can define both host and target pinctrl.
The selection between them will be done based on pinctrl-names. The
default pinctrl will be loaded first and will be used by the host. If
the controller is configured as target (spi-slave property is added in
the dts node), the driver will look for the "slave" pinctrl and apply it
if found.

Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/devicetree/bindings/spi/fsl,dspi.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
index 7ca8fceda717..b5fac0bb142a 100644
--- a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
@@ -23,6 +23,7 @@ properties:
           - fsl,ls2080a-dspi
           - fsl,ls2085a-dspi
           - fsl,lx2160a-dspi
+          - nxp,s32g2-dspi
       - items:
           - enum:
               - fsl,ls1012a-dspi
@@ -37,6 +38,9 @@ properties:
       - items:
           - const: fsl,lx2160a-dspi
           - const: fsl,ls2085a-dspi
+      - items:
+          - const: nxp,s32g3-dspi
+          - const: nxp,s32g2-dspi
 
   reg:
     maxItems: 1
@@ -114,3 +118,17 @@ examples:
                 spi-cs-hold-delay-ns = <50>;
         };
     };
+  # S32G3 in target mode
+  - |
+    spi0: spi@401d4000 {
+        compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
+        reg = <0x401d4000 0x1000>;
+        interrupts = <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&clks 26>;
+        clock-names = "dspi";
+        spi-num-chipselects = <8>;
+        bus-num = <0>;
+        dmas = <&edma0 0 7>, <&edma0 0 8>;
+        dma-names = "tx", "rx";
+        spi-slave;
+    };

-- 
2.34.1

