Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09974257821
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755765068; cv=none; b=pjps0IDZ2X/Haqs6xBo1K6L+OHi1h0ONNbvBXWcXv7/YCAzA49qWXUqH3vCEToOidl9p+ZsCmlRLD60qRgWVIrLfxmqHS+w0VcrCSUN26sm7YsUr/vsUjuxW1cx7W+dtab63rs2o9W5Rk63FLU/ypOOVVjzu87SeC5fkQpvWHJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755765068; c=relaxed/simple;
	bh=iqqc9H3kVGDEO4owcMh77Y6V/4jzKjChKYZ4/hBrnt4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjElpQRhiWRtB8GTArHgOBc2hba29ReOWGwf27AB/vQoiNTLzmV1CaOggMGxtdqsGLmVP7kWuxnukN0rgpvLSZ3FkZj3vbYnwkRWZrgJ90GkX9d0GcobUV0qMr5+qlq9hezWcja1rnF3ZmA6VBZV3f/8h5/QNsRzKICG7vi4PyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QX4YUuj6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QX4YUuj6"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-afcb7a01426so8301666b.2
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 01:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755765065; x=1756369865; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hh/M2EwfSa9FwHQzHqRzfiw+17/lHcQFKbZckUyEnvs=;
        b=QX4YUuj6EFufghV6IF/AFK6EuQMkHL7C8NP5J3ZkIDJtuyBV94NF4GziS7v8p5tTzd
         TAyr3FGGW/db4y32gb/EqdpnoDc4gckI/Q5gG0lvetxczq9UgxV15YywEqWFqKm1TPDf
         h9E+eaZD+Nk5X9VP9gSjFXEis7epYpAK1Ev5Ctqorjan42EeJnU3er+hWGdB8kV0ybdj
         n4ZD+94BKeuCGh0eJ3MwMYg9SFdWRMnpHk1VvAAECV78hFrn+yAdc89Psz9TcBe9tw9O
         gtGqRZ7LKPg+MYIAFcVhXk00g9PwNIu57poSWx55rHRT/55k6MSVRwqY6N2t3cwEQS9c
         b//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755765065; x=1756369865;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hh/M2EwfSa9FwHQzHqRzfiw+17/lHcQFKbZckUyEnvs=;
        b=B+S1vGQOyngfOE91SAEpqkvziYGkg4rg211cr4TWxzsz8y5mdp/bl5M4w8m+1fzgEM
         4LY5zrR6Y8ei69EdBW1xWmTxHhxinRT1aGVAoISky+k/j7xP20UL+epZXsVpOUxccQAm
         Hmzb+F1QmnT/w0kHUNt19wXcer1OTdbIgDAzeagXnkFGG3rSwsQ5nu+vNN6uK0694wJo
         boT5sJduqRFkMdw13JXUdtCCpAGQZaJPmXshicXNZ/m71U44sY420IxyAGHv6+0Gtjdp
         JhMl6/G2jdKL8Qg3cQF7hdsSqdwkxkAJhvCr0rvpkWUTY3Tb80L4E8SeAS10KYg9ZUw0
         lpHQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYmMRDuqD9GkHlbMuPKBCMq+FhsMCAkxGMsvRHhexyeQNobWOSpV3GtPr5XRHtW08QuMA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzFCRf6H2B3xaFcU24bJb+XFRJuLHlFSg0JEFOmynqrPWAF2HIB
	SHZ+eh8MvecIQOvEHQNDobe9DSSOxpm4Mm4bqwIxbsoTfImFnFqoOxGaFAogSq/2Wlw=
X-Gm-Gg: ASbGncutuU5yZ2YFPOGg80gCGvk3cdJMGoaeLBI8wwtCxxDfHGw1pAirozDykY4+bTR
	wBA448GO3APUIIaUsmV4T+PefIrIGb4t5eqILxC7uY2F+FQikpMnE/JoOETf5e7f9I93lXIpIfb
	TkA+QIfFSBChYDM5ux28D94VhZFP0qGSulIodnDIot6Lth/lWLzuOJC/rqVwHVXlWzhiqPSgggV
	IKZrORuluQswYcwKqG5dO+XNP6i7gFwvV886Pss8A6VaFDNvuNrV6RFXLHeal7fRTIgBj2x5SR0
	bnJfOXkJgHogUV6veyaz+I3Gmdc4j2RjXLI1tKzAp4/44xJnrZsLs8w+LHK8YuG6H3/iG2mV6zJ
	tnkrEB/sRbQpbHnkLfqRAv+QhJxJMEmuVMw==
X-Google-Smtp-Source: AGHT+IFNk/pJFnDs4lRHPJnbj+R0+UoDvHoNWBUQnniqvKfqWInUDOjeDP+OKC+piYhF74oUFSgD6Q==
X-Received: by 2002:a17:907:972a:b0:ad8:8c0c:bb3d with SMTP id a640c23a62f3a-afe079e2116mr74283566b.3.1755765065406;
        Thu, 21 Aug 2025 01:31:05 -0700 (PDT)
Received: from kuoka.. ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded2fc568sm346436166b.38.2025.08.21.01.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 01:31:04 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: Minor whitespace cleanup in example
Date: Thu, 21 Aug 2025 10:31:01 +0200
Message-ID: <20250821083100.46340-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1541; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=iqqc9H3kVGDEO4owcMh77Y6V/4jzKjChKYZ4/hBrnt4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoptlEzToO3Ku+DKnz2vaPiN1ssj2RVk8DjRQKc
 Qtcz+MExfyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaKbZRAAKCRDBN2bmhouD
 1/4tEACNYir9uMarV45GanTEgmnE4LFISWmgKJwbLjhiKVj51LWYivtWPj6mF04MOvmQ/0uO4oC
 eZoanmeV9/UPVaCWfsvGdXfIwkF8G3ezVQSCFHL8s/VzedE9HUpJUqTU50rc9jZtZKhZ4ACtsr9
 Ci2yCUbRSaoDyloZXA5YI0ImHjPi8QXHCa4TJQnoQPrIiTUw8QupgbCttoCDPzrcZWBpsjb7EIq
 aKun5PQRfFRYgBN1V6bl6v+1XG8GLHEfxnvFMEF9Hd5ve561qriEMBuzC3tYaSmfaAr0KTMgJOc
 YKJr6lmLHAPCZcbiIpVDFAx8/dtmHvuayFfFjuFmf321cHCUYfdAvLR66Fe8hfBpeI/xEOEBDCj
 7bB6b4sPJLZRCH9KSRHud0IaFOZGC6bukzBRVc95w0EqFIYgpcIDzA9mq/GIfUSnKSj4XWFqlBm
 DRmXsOAnThbF2L5ZDfaux9b2woTITUBSKUwcSCEYiQqNJlyBkja4nfOJ1rQfvIC8WqEu69gV8Ku
 +hCx1Dx6/lkn0FJwJs2hDLlRczw//7mZonnGXjdaEWslBwqK0bAGEspxUG9wwEDfMtYjJHRQzWy
 ovcuxx5q9cnEdPmVYf89/0u7owD8QmBimSmPtg+UCWVkkDMeYcatGhMRTur/sdy4OZU/I9uri1D Q1A603HnLHhssWQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The DTS code coding style expects exactly one space around '='
character.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/fsl,easrc.yaml    | 2 +-
 Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
index 8f1108e7e14e..d5727f8bfb0b 100644
--- a/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,easrc.yaml
@@ -104,6 +104,6 @@ examples:
                     "ctx2_rx", "ctx2_tx",
                     "ctx3_rx", "ctx3_tx";
         firmware-name = "imx/easrc/easrc-imx8mn.bin";
-        fsl,asrc-rate  = <8000>;
+        fsl,asrc-rate = <8000>;
         fsl,asrc-format = <2>;
     };
diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
index 85799f83e65f..c9152bac7421 100644
--- a/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,imx-asrc.yaml
@@ -176,7 +176,7 @@ examples:
                <&sdma 20 23 1>, <&sdma 21 23 1>, <&sdma 22 23 1>;
         dma-names = "rxa", "rxb", "rxc",
                     "txa", "txb", "txc";
-        fsl,asrc-rate  = <48000>;
+        fsl,asrc-rate = <48000>;
         fsl,asrc-width = <16>;
 
         port {
-- 
2.48.1

