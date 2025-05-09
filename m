Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2367D28FA91
	for <imx@lists.linux.dev>; Fri,  9 May 2025 11:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789702; cv=none; b=hqEpxBNo2BFEhAGt7rzJ0D4pbSVbqho+lnKCKEDApMFq3lghTVtXRwUSkqQh6wkLJeBfQcvWO7QWCTjxFk6O1OqS8pogJNMiG1a0OMNRckN3cqSLRDK4rT+Tv1MqQccy7RzlanmSC7khZT0JX6bszv+fy2GxqBduHZgXC0Z6SJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789702; c=relaxed/simple;
	bh=s66Afxw8a3xMB/SBhQiPMSJcaB2YeSJGVtDWMjyFv0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PXfT4X1tFPV0ulJzVs0AdR5Kew/kFhFEKD6cSkF4dies8aHyZR38qjgEDkTPmfKzrAwupBjdMaTQVSoZAs+lYXwxr6nrwH9Y6pOsGz5koWKLasWrZZGdDhe9rZA8YDF4XEWNAq9OZG/Ed07zKiMI3FCdOMG+X5wtZRVZkejukA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=avKi3oNu; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="avKi3oNu"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-442cd12d28cso344095e9.3
        for <imx@lists.linux.dev>; Fri, 09 May 2025 04:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746789698; x=1747394498; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oKYrxiUxy0npi+Mk4ryYuieCR3b8bkKwTBnIOJMWofc=;
        b=avKi3oNuMhjQvK+QSCFWt9bgJQ/48skT4+nDzIP/vVnNfnXvZu8TQ/vFymAnnaRB7X
         KMsKw/wGXz7Xj3HwU/t2iGseJSmIE6kPBWZV/UXDo8EGHFDV2AZGam14e6Ao+2yA2t14
         MUKX2D6u4NShxHETBVcBTky4GVFcqi4eKA1L5O4Ju5pxTqW0oirAu2dq4BPS1ihHy+f1
         PzeEpeBIoV5Bga8allYQ2GGFcxEVRD3QYOiTglQevnB7s76GRMHNsxmF5kvBVES8syFE
         8wHLv9iteohOQ4K9Qv5p3ZsAzuzMoGPx3xHaRgO5dhNsBBByRbDd6VkELOkdv8RNcm0X
         CtlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789698; x=1747394498;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oKYrxiUxy0npi+Mk4ryYuieCR3b8bkKwTBnIOJMWofc=;
        b=idsn7bsy4Z4A2pnscXI+Ir+RqR21pUHD+G/CGCGYC5vypYTrh77yIzisJ/6ULhJABD
         53gFeBxoyp/OdAcn92pXPudT04jQvjiOUkx4KoEwi0gwyWS/ASjJEHCElfkThS1UFsrR
         sutRblWhInj5XVVhJe+p3oNcoW7jPoX13UyudaqZ0tFIlfi1gJ/4Oh9xdVBCap6kSjVs
         m65e00TJCmoqz0K5uY1y0AT82w5D3gEUPLOPPyllb/mEiIQ5ZkisUHvY1V5LJw1iw2im
         dsx799+3cG40qOCvz9ci+GLDpPRuruesSSx62PFyYkgATKADWIG/F5uU+kJ41L0pH+6Y
         1noQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIxSH7/ghBojicBRURDKWLl8lUmvBgWYbjICq5Ytm/6w1uxz4FD0A9Qd8r+VMvuA6t8O8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxbQAAHCIkoWGqb5KlNljXZhj8pswif7qNjIazJK+saYTtLtk4A
	keZ+b7W6YFLhcVTs9nixGfojQlytCRv15auLTQw0d0FZi4hruCw5UOOGREmZFIo=
X-Gm-Gg: ASbGnctjaQhP6dCs7rkIv7hppEfLNXvfZ1RBMNCnGQgW3H0Vvar+9D7HUc+A5smnWL3
	8C5GdD5O4g6oQ9vPH/Ry2weZevYTjyPaoNxbwhReMYG/tXw+QIbfnUtEbGIpJFzU+LYUrB+jd5h
	c8c13mguWz0cyi/Tkb8GDSTc4brGgcxJusdqvFGx/NT1iB6ygYw+rWA5wI3mzUquPGoh+YrhBTx
	2ATcCbwCTtlUPppXxqQZWALfU5UgSy6Ro71pyWziVOrj5NGwDO/dsIsR/YlS0sj1b7G59xfImvn
	ZPFs3lAdU6y9l9t5r6304I5cno+MQjD4FFE231tNJjehVCjumn9SysH6BxEd
X-Google-Smtp-Source: AGHT+IFlbI/ktfksQQOpGjeIwbwt/o9L6Xz+ipgRzNOoWeXM2S9UxEpNqGKoq6dMD0VJeqXmsLSN+g==
X-Received: by 2002:a05:600c:4451:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-442d6dc7d2dmr9532715e9.4.1746789698392;
        Fri, 09 May 2025 04:21:38 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd328455sm69946945e9.2.2025.05.09.04.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:21:37 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vladimir Oltean <olteanv@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Frank Li <Frank.Li@nxp.com>,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] spi: dt-bindings: fsl,dspi: Fix example indentation
Date: Fri,  9 May 2025 13:21:31 +0200
Message-ID: <20250509112130.123462-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1380; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=s66Afxw8a3xMB/SBhQiPMSJcaB2YeSJGVtDWMjyFv0E=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoHeU66+RBLo+l0lSwvGSnhzCY2cPM9tZGuIQ2p
 wsaUNeN9bOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaB3lOgAKCRDBN2bmhouD
 17OnD/wKNyvGnBHJUSNZxdQlvkRO2cr4Gton4WSAWbZ2wKtlwLfNMdH+g91UdqFkXbytN2611vW
 RcWUGYGRpoCMqelb2OjY+fLEfn5HIJi2Wpxaxyx8h8fzjCUKngY7dfgLJDqbaFa/hLkmkCcimnG
 g3sFRdTXd+scm6fQHI++SP+ovsyGOHo/zHC60TCcusbm8CL8lweGzKuzVt+jdkbd3KYoSWsBH7X
 paH2jYlUqunABAf3g0XH6ay4Ib2CnW2dO9fdfN18DuiOl972ClrhYBKBcYYnEyaW1xSOl0fhaDD
 dVgvsd2JoQd0OC9ccfzCTSX9kQFZbR0zE0lTP5IBahHEut7bhUbr5tvGdnxYQK0XQvSMUHIXhNZ
 X8wfIDUGWRuygCbj0BdrLv6+m0OKJBOJjhjJo38KGkOW3LpqwmAd+47ottvB9ofZQoHfmg7DBvA
 HtyZ7r8C2siQqDa+N0Z2XYWKyB/ugPh4pw22tAOfJG+kZ72V8RksiGAFEIwuqzGt8ddNm6DE9SI
 BeSDarp7Jaqomm5eoDAYnxgff9GlYokHuol19yq9RDrFM37tvykY1ArwU2VTFPXs6vyf6MXUO1l
 xaSpQNs56nhvSp/MYbpZ7JfQo5ml5GGRp7mktfDKpWKJazgMpdteFiS5DRQwZpXgnPhC3L+e5oX iiM4xKX/3xOH2bg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

DTS example in the bindings should be indented with 2- or 4-spaces, so
correct a mixture of different styles to keep consistent 4-spaces.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

No functional changes here, but saves some comments during reviews of
new patches built on existing code.
---
 .../devicetree/bindings/spi/fsl,dspi.yaml          | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
index 7ca8fceda717..bf9cce53c48d 100644
--- a/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,dspi.yaml
@@ -105,12 +105,12 @@ examples:
         big-endian;
 
         flash@0 {
-                compatible = "jedec,spi-nor";
-                reg = <0>;
-                spi-max-frequency = <16000000>;
-                spi-cpol;
-                spi-cpha;
-                spi-cs-setup-delay-ns = <100>;
-                spi-cs-hold-delay-ns = <50>;
+            compatible = "jedec,spi-nor";
+            reg = <0>;
+            spi-max-frequency = <16000000>;
+            spi-cpol;
+            spi-cpha;
+            spi-cs-setup-delay-ns = <100>;
+            spi-cs-hold-delay-ns = <50>;
         };
     };
-- 
2.45.2

