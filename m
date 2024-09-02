Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38702178388
	for <imx@lists.linux.dev>; Mon,  2 Sep 2024 07:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725263549; cv=none; b=L5mTY6zFN1WhU/SRw0ZE+Y4Cp2GJNhB0aYFNsivx2VYJ18p47K/d8f+eWlQgXd2a9EAXculs5qGcF/zf/vx6cFFokNcdV4Aw+5+iTMS3mRV7xSshySGCBdh8RK9fLg5RIxvv2IUspG2HzBJcEgC8EVLqgJq8pkOtL7Eqv2Dusyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725263549; c=relaxed/simple;
	bh=VtLOYfIjN0uBhjbISwMXqd8736p/pJMKe+ytQyFy1dU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=reMA4gXSoD59W458GL+SijaeebCD7zEA/HHm8Uwi4qNST2qFr9DeRyiJt7NDwmTL/fWW27pnQlwgZLGjtSoTWsHPejVbXWm0TN89OArhXRlGNznMjCs+53Zi5T8lvff+shKuBKoh8aIzM2Hm/jySNPQcIhpF/u+YD3mx2TZHcSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MQjOoPgE; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MQjOoPgE"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42bbbe94b88so3883955e9.3
        for <imx@lists.linux.dev>; Mon, 02 Sep 2024 00:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725263546; x=1725868346; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yDHe7Orx+Th2PDmF7/6guu7StnLFN0wqEj3VbhImekM=;
        b=MQjOoPgECq7h2QT5UIUUmUjzS3rIyv5gnSv3WmsSG3H86EtueZ7TF5KYHSmAPl05jv
         hWSia40V+L4iu1LxJK7CP2oRfSVXhh1FP6rKAZzuz53IDfOiStBQuJNmhE41CYRJfRXE
         5cCEnzrZcdynRqBpTNrx9qvN8Af739YYy7Ay5dthmdmOsqDuGql6ApiiNF12j0iZslQq
         zxh7atfdaJxg6LD/pf4MXOHprm+PwZj4IE1VzystM6QmiEHgc20ZTsQUU0UAf4zyr/0Q
         c8c7n8mPs1hjVZVnsOhcs3iMEx9SxJqUcQKDVZNEHIkWzTfv1BxkYzRt71D8hfV/24hc
         98AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725263546; x=1725868346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yDHe7Orx+Th2PDmF7/6guu7StnLFN0wqEj3VbhImekM=;
        b=YX9PPs44HSn/5nU3OSg5VF3bVsJ0smKIlrZCCh9yH7ABgP3zYb8S+NUaOfbRgedxI8
         EB01UmvQVfb7g9YCMlc2LoBUxK58qTEj3gDGVtgRRmCKZbv4RsDmUwWHB/DEBUwFOYdh
         uRDSsEMwf5WQPfGpqWrPKhvP/eGYUu09wvfrsWNRYWeJWeLbhi+ZLKJL5uETnpyw5ZDa
         pqtv6FQjspknBk23XUY8fW+IKVWkhYxdT1pTJefpV0aR3w8BKWnhnyPZarHYdZokP0Jy
         nMwvuUVny9IpC1z76zW1AQHbfNtsxg38FEuenPc2gQ2qX2uSiDvmPe8EKbSiMggPLNPn
         X+ug==
X-Forwarded-Encrypted: i=1; AJvYcCW/wtGfI51yxu5YqWsy9sWgYNNlRIFaqR1iXbtIgnhf4alsFEniTzvv70R1aXbqMj0K7S0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUuYa6K5pZdeN+YhNX3ygW7rX4j8inl4sm5aunG0WLKWZ+zOK9
	vhXwWLoLXbJXFvNipqWXs9OFxZHrvfbuM7aqZQ2gNXgr6JmkFF1jYd96TOIYZSs=
X-Google-Smtp-Source: AGHT+IFT8sUGSPYAj9NIAeo7nipApgLXpvIfSZw4LjQwp9teCQB3AmXKax7EgOm2S5MSgixPp9Akew==
X-Received: by 2002:a05:600c:46c9:b0:424:ac9f:5c61 with SMTP id 5b1f17b1804b1-42bbb43423dmr36953945e9.3.1725263546383;
        Mon, 02 Sep 2024 00:52:26 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba641db12sm164768265e9.35.2024.09.02.00.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 00:52:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/2] dt-bindings: arm: fsl: drop usage of VAR-SOM-MX8MM SoM compatible alone
Date: Mon,  2 Sep 2024 09:52:20 +0200
Message-ID: <20240902075220.27971-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240902075220.27971-1-krzysztof.kozlowski@linaro.org>
References: <20240902075220.27971-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Variscite VAR-SOM-MX8MM System-on-Module cannot be used alone
without motherboard, so drop the usage of its compatible alone.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 1abdeb804468..e5f982fa750b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -953,7 +953,6 @@ properties:
               - toradex,verdin-imx8mm     # Verdin iMX8M Mini Modules
               - toradex,verdin-imx8mm-nonwifi  # Verdin iMX8M Mini Modules without Wi-Fi / BT
               - toradex,verdin-imx8mm-wifi  # Verdin iMX8M Mini Wi-Fi / BT Modules
-              - variscite,var-som-mx8mm   # i.MX8MM Variscite VAR-SOM-MX8MM module
               - prt,prt8mm                # i.MX8MM Protonic PRT8MM Board
           - const: fsl,imx8mm
 
-- 
2.43.0

