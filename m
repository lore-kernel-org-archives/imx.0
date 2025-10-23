Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED113126DF
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 17:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761242370; cv=none; b=LPTgXUyDFXBG57YGnBD802PEbe4m4H9NZW68vquQjwfjKab4c5ksbUlH7DwIlbs8mOLK79ZxP24swBr/jQEhHo597sV5NU4p+JK3IUarp516HiUIh6REnjZMaKbhzKM9Cga83LJ6xoR1S/G9xs3g1qeMCXuvN6q8pcQONFG2YGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761242370; c=relaxed/simple;
	bh=49BNiaivaAVSLxOrAbQ3jcqUXbd5xtLUlvJhC8tkIpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q2R4yNlTrRpY0s8NDwF8OblozyhIUqD6Q6+g+8ZP6330UBqvnxSPatNKKL9uVLXnJ7JJ3KGplYtfpndFOToMXBpZqsUyqOHebCdpwT62c2WfZ9P/qMWdbXOgaZG/CytQXkqa5tykQQfDSPg58fucusmN4ykjNEiljHwScJob+Jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=piTiW/Tm; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="piTiW/Tm"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27c369f898fso17228305ad.3
        for <imx@lists.linux.dev>; Thu, 23 Oct 2025 10:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242367; x=1761847167; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aSMHyHNn/1vbJ7NUSylLHrrY4cYCxvOBtERxkVz+doQ=;
        b=piTiW/TmgTYBmq7grgNVuvgg/PQxYqrpYPXJ+vY2lKCqhJJ6VIMJqyPhy2KB14707d
         8kkKfgYwS8J9MAq3pRm246qcX9nTZcS59ZDxrlyvZJdh/q08/nXxscOrD7lhlHByEM2L
         7wKprhllG/w5vAlpsbnXCSyKVHjlrmhquIUCJ3UD9znQ/gTBmwH3J9jeWETAi0CWGnvN
         Ju8Zbk8b9iFXHp1fntd7GzOKiQAXNBGlj/3BbEH5zwB+0I1I8tVcj2LCcxhJS70e1fJS
         EDtfvi5/w+DMu34kT9nYvwj4SLmQQDtYMIh/H1f3rBL+pXd45QKd59+VV2qn4im2FE4j
         LvTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242368; x=1761847168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aSMHyHNn/1vbJ7NUSylLHrrY4cYCxvOBtERxkVz+doQ=;
        b=eUuWb9vyNzdmUsJgFzQF8EF+YSG5ND540LM4DqzMarSzgJhxb6WNF2LP1rcNCb30x2
         JnyasozwF9Y4JVXtA9xP3CHSpLpOVAI4S4b0ympSTQiaczmcXmhuiu9Yex9as9Wybhoc
         BBsCOqbTNQ/G1Q9rYThZ8OI3MYZ8plIUuOFq3SGJtcjRZe4dWmtMMMqJ1l9pIV7lwOrm
         OOsUWtT6D88QOclsQi7LctBiqHna42vtQBQ2y8H4sVE/9sGJAuHouf+lNgm1ODazR1Eh
         /1IeMZ6EMnSC/yY8HuDMfzWaTUcWtH4lCkjXM48xSJ894TRlojHkdfVz/HGvEe1q0fmS
         ooMQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8BDAr/QidcTQVf3jMJtUnBSkwVS+Q/wCcJSa/CT2BtwUTYMs5Pn3Yt1PmtSxd2tSIKG4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr9cmLul1GJ2oCJhFLuroiKlelqewfrASXI/ib09XCiwEVjTc6
	MQFamR8+DPRV1aFbibgcE8j9+qGXnSs+npttbNXRWDOn1k2GnQ8FjxHIIgXB2iK/6dQ=
X-Gm-Gg: ASbGncvfj5MscBlvRLpYgKXTrPIlBTS1db3IU4MhPKJ3ZhHsGcqoCAektD57XKuypHG
	NoJr9vr4IdPH9efsjhJegH8CMOs1ve3uA/uT3fspD5S6ZqcUybfB0o3b02WAhEy7IHrf7kU2LxA
	/P5nErW0uLU0JVKLhXn+1F1lmD67cCw/EixT0XEdOBQ/mUtasr3jVXwHogWWp9pw48WInmKKGmq
	M9uUdWKZhv/j1moQ60JEKjOdqSNtRchJv5VZbW4vnfWnSb2n+TqIQkK9O8Daym/wZecAapqoRYL
	iPjC+7ZPpazqbQtFFePIt7Ysj1xg9Xf36pl7oYUHWerg45ZZIEjHFIRUXIanqA8Z6+KEkKv0RwD
	Ju1XCmxAMcakZBjXOlEtDwdeqvDm2AtQYUTlagMC2XDR59Gv4eZOSfMjdQw4V3uohxsI+luIxjL
	wls0hRlcOU4Y/PaFBKEz4jSs3PjGtz/y3J6A==
X-Google-Smtp-Source: AGHT+IG5ODtZ8NpgnPdL8N4UrnSSIWOWkDsOvPyVBDaaByRktns1SQuJqvUf+UP737qEBLe07B5fFg==
X-Received: by 2002:a17:903:440c:b0:264:8a8d:92dd with SMTP id d9443c01a7336-290c9cb8b95mr329120295ad.20.1761242367696;
        Thu, 23 Oct 2025 10:59:27 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:27 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/9] dt-bindings: spi: fsl-qspi: add optional resets
Date: Thu, 23 Oct 2025 12:59:14 -0500
Message-ID: <20251023175922.528868-3-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251023175922.528868-1-elder@riscstar.com>
References: <20251023175922.528868-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allow two resets to be defined to support the SpacemiT K1 SoC QSPI IP.

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v2: - The "reset" property now only applies to spacemit,k1-qspi compatible

 .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
index 5e6aff1bc2ed3..edd3158a6f2e8 100644
--- a/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
+++ b/Documentation/devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml
@@ -55,6 +55,21 @@ properties:
       - const: qspi_en
       - const: qspi
 
+  resets:
+    items:
+      - description: SoC QSPI reset
+      - description: SoC QSPI bus reset
+
+if:
+  properties:
+    compatible:
+      not:
+        contains:
+          const: spacemit,k1-qspi
+then:
+  properties:
+    resets: false
+
 required:
   - compatible
   - reg
-- 
2.43.0

