Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C754D204037
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 10:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730197365; cv=none; b=ohrsZ3r5Wn1W9xbyC6uUoyQtIgt6yI7z2fCXnV2gPc5A7Pl70mKKu0OTHxnxK2PbToL5MTxNTfNwRyVmikTZlPKqD5QZ/aJPsH2Qh8siX4XiGSMKBWNrTB3yUlsxEI1Pt6k86VC18X5KB9kiNP8iNIe3rmXuWksvnb1k98Dx/v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730197365; c=relaxed/simple;
	bh=u/UBRbNPk2JvFCs/uUQ6y7UKEf8R+AmrzDHohRXqamI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dxd0Rizy9fmMPrkqp6y/MIfIb0aNrvwpvsUYRSz+h6bn0OpirNDildFOIvQYGp6aqNJcDjKjMMtUOUbTDOeCZozzpuIb3wN8S15hauSL67F80m7WUsvTS/SniQdybMJeZHVKe5WiRNq+sg677TsWmq7zz1XKHUC5ZW9HDqtOigs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YFq9fXEJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YFq9fXEJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-37d47eff9acso3840732f8f.3
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 03:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730197362; x=1730802162; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iku2aazVoaifn2qwZ8do62mCbu6cZo7YQepKnixIbc4=;
        b=YFq9fXEJ8xoMcvM8iso1HbrbNfgRmlN/VUnbr7hSPTw9Mk/X+SujLavWSNM/6atV2I
         q8zl8z1i/B1We7X1b5p00ot6BZxX31RkNd7DhNYANL7P7IwpcdxYFecK/tKKN/5G88Uw
         ujFEBbDXTtTd/E6EgUP0kNv/T7oseELy8AsGoE8QSf4kyvWtBcT7JupGZKtECG/uy+rT
         /eaAQjkMilLsGtqk9TqYJRP55mDG7O7GVNS8i+LD7nrsJIKrnf4gFuGFT3T1fvGOPNR3
         7d/9hdX8GfVhnJCtQr8qBKYkEt+p7renO2+uYBbUC5chid1E1y+PTvcnn38+SXmG4Pzw
         XvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730197362; x=1730802162;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iku2aazVoaifn2qwZ8do62mCbu6cZo7YQepKnixIbc4=;
        b=S8K7RhjLXPOHeJR3RKMIIVhZpKMXcVH8VOGIwh3pV6JH95NuLu2OwQ2mBLxVOprlHK
         5QEIIuN4T7V1e9/uiLS589GQIcL8RCFCC+D9FGodpPavX5P0MFZt5oNN/vF9E0wSOgIG
         6Kw8WO26w+4tRM4BnYSOJQlWr+da9awWdIm8s0dM16tooHCU3XzdNCOIXrNxCWvWeg4R
         yfT1gqEX+NFnbBStkfCF81YtAaI3ti5nOhen2AZnoiKgzOXr0lONf7iePeG9xq/tt6kh
         QWzf/WG1g1TDWzNt0jZp8hfaXQG48TbJBLUPE8gQ0zvn8vq2KMNGFcTyVLv8RDClIz5W
         yGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEpsIKdUcbBK9t67nOVr6GJllaPul9rGNdZ4M4ke72+8USCMlBelIknqcDpJHbdHILDLc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxkQXWDcvh3IIDpOIhbtEyw0fEt2PMCkOQAg2Se991a+qdK87hb
	4utFsjmnCx6mFVghZSb+kYtYa7WIrnDu+982DMAomqYulmG3xlvNAZLR/80iC7M=
X-Google-Smtp-Source: AGHT+IFJA0rf9yL1/4hL0/WSC0JKP3mxHD/OdeY53wfOUkq+NYJEyeFtfI5Od5uPy5TfvM1U2qN/+g==
X-Received: by 2002:adf:e38c:0:b0:37d:47e2:5e30 with SMTP id ffacd0b85a97d-380611e715dmr8476087f8f.42.1730197362162;
        Tue, 29 Oct 2024 03:22:42 -0700 (PDT)
Received: from tudordana.roam.corp.google.com ([79.115.63.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b47a86sm12084498f8f.53.2024.10.29.03.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 03:22:41 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
To: peng.fan@oss.nxp.com,
	m.felsch@pengutronix.de
Cc: pratyush@kernel.org,
	mwalle@kernel.org,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [RESEND PATCH v4 1/2] dt-bindings: mtd: jedec,spi-nor: add optional vcc-supply
Date: Tue, 29 Oct 2024 10:22:37 +0000
Message-ID: <20241029102238.44673-1-tudor.ambarus@linaro.org>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

Introduce optional vcc-supply property, SPI NOR flashes needs power supply
to work properly. The power supply maybe software controlable per board
design.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
v4: no changes

 Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
index 6e3afb42926e..335f8204aa1e 100644
--- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
+++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
@@ -96,6 +96,10 @@ properties:
       If "broken-flash-reset" is present then having this property does not
       make any difference.
 
+  vcc-supply:
+    description:
+      Supply for the SPI NOR power.
+
   spi-cpol: true
   spi-cpha: true
 
-- 
2.47.0.163.g1226f6d8fa-goog

