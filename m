Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8544E302CA8
	for <imx@lists.linux.dev>; Thu, 14 Aug 2025 16:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755187639; cv=none; b=P69dw+jqJPE3gjBgRf1KEy9J8wrzTcLdr+qjMU1+Mlk1VhAMDfkAgUS39UlsHeerr2a12rsizPQRiQtAfUuxKXwxbwb7SratCLTWhqRpLEmQDS+jx8869NBa+t+OqwzcHLO5ZTdSQ0SPCObTMZ0LQRjslUvDK736jTwQIwenmT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755187639; c=relaxed/simple;
	bh=+rq+9BGDr8wJ7iR/RwIfiOewQa5sKFiC9C2659q5u04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VNo5wmRIzQ3AqSEBpu7mawuI4yceJLUeGIT0uVks/+QbaFELEJapwp+PlLHknGzmZ+CKpvVlybkIKA/h1vUfVP9mKQPUeXKXX0iN8ci4CalHgkLjHIP4GWFSJMkKRpCNLP5IuZ77TzyCGD8Els73Fm5XrsSwI9HwyCSYtZ1ulIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o26duw58; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o26duw58"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-45a1b0c82eeso7634485e9.3
        for <imx@lists.linux.dev>; Thu, 14 Aug 2025 09:07:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755187636; x=1755792436; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DdsFgMvzLev3pjfqMcBF4MpZ0JDQWqKgzuICi66wU9g=;
        b=o26duw589AiIZSdH5wFx4Ruwb2OCqT7viriLW410ycDCb2gXr9P9FAnQc6AQ5aSa0R
         tN4aObVMBdEGdaZL71tJIr6ITee2VpSwPoxxOf7WqwP19xVfopjRjmBrjTE9K70y5PRg
         4+1gmlKabXlEXvsQ0zTMNjtVZH8Faa5Pd/fPIIGT8caLWK8hBtfnjGn2t/0GJr1rlwl/
         yC6RxLoPHPREun0VyYH9GMC3oLOVlLq69ZQ1Nhdm+tSpY7SHNalBPgGuVeHtrnPitMKF
         Opko+yn8OS+VOVtcvIdpz4gz8n/JUSh8wop0oW5Lp9s2SpYIoKdRmBKZ+JvtfJjDRqwt
         E5Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755187636; x=1755792436;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DdsFgMvzLev3pjfqMcBF4MpZ0JDQWqKgzuICi66wU9g=;
        b=vmd4S/DiRxWgQAv+mcpMPSBOrRPopFXrzVxLi8QeQWMyYiPYdmUdPcX8Hlqj1Qw0Du
         IwSE8OGhA7KaK3kIpmMWV6KRnz/NOYqRysx6mp/IeNVxUF5u4gXxVpiZqyDsU1cCjhzk
         Bo1lI7+T4iXBnzvoSQQAhcgFuLseuws7AMgMmR0NnYkgGXbWVYrilpb+PcutCretOzLz
         opQnqXq8dDVLp10c72IN4RTnDo/oRMm6rJGxNuSGxRaAvcwz+GjDaUvi6BygsZPZX94P
         Z9frs+RhA+o9fM6QawyWrG9jhTyHHPkUgDYBLLV4pVqYeYOvFMHVOFkyNs8C30FUkqV0
         DqIA==
X-Forwarded-Encrypted: i=1; AJvYcCV/fnsXjBaAKdaact7rWtEpdT3mdHb3zKXMpNbra81xTTneNuP/bLP/zvixJk9P6Rj8FlM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyWxw5d9b3VYUiks8zJbESn4B/oVq2Js1lpsD0a/wB5cQwMcUfu
	vsSLrFV6ts4gCwXUegsCTPH0i1RVT4uTRpOZFC032TQiNyUpFnGhkhokM/ZWiiGxm6w=
X-Gm-Gg: ASbGncs3znHoL7QMtGWL0jRfvvb+yCNenZJunlruQYMHnvZBi7UP53GSHqtgDDV2Lye
	3A/j5I9Z/EdesGIf+jHOm36U9kmEYV++pBOxjDKXW+EwjtIqug309GB42ljdykFdnTAzjlE/LXX
	YdqUMmccfiFDjE/ACRMcW4EZ2TjRE1tui3pP2y/ZHZ/n0cHIwNdW8u3LrsRyW885/wrMh8JmZsz
	ttBwBINhu+NKceTpkynUa2bMMDDe0v6QywPU7Ts9HQoQOHNksPTWb4pEA0JUUOJ8JLBMai+qVj9
	yiYHdf7Nei96QwodUD3QsTdq+Pw+XhCWNEgmuRKEQAClwfewmOGWiObuAtvnSPZjR3PN84fHD8Q
	cDjwkqvMwHB+BJ1tcfxuJ5Z40iinfxS8=
X-Google-Smtp-Source: AGHT+IHYk5C7hCYyM8ADnaIqffGtiumP8f9Dmz3RPTAWKY3pFIZH3LXw+Mpypp1GBsMLsBv+UgnJRA==
X-Received: by 2002:a05:600c:8b4b:b0:456:1006:5418 with SMTP id 5b1f17b1804b1-45a1b61eaf8mr35450955e9.13.1755187635781;
        Thu, 14 Aug 2025 09:07:15 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1c6bd172sm28363495e9.6.2025.08.14.09.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 09:07:15 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 17:06:52 +0100
Subject: [PATCH 12/13] dt-bindings: lpspi: Document nxp,lpspi-pincfg
 property
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-nxp-lpspi-v1-12-9586d7815d14@linaro.org>
References: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
In-Reply-To: <20250814-james-nxp-lpspi-v1-0-9586d7815d14@linaro.org>
To: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Clark Wang <xiaoning.wang@nxp.com>, Fugang Duan <B38611@freescale.com>, 
 Gao Pan <pandy.gao@nxp.com>, Fugang Duan <fugang.duan@nxp.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Larisa Grigore <larisa.grigore@oss.nxp.com>, 
 Larisa Grigore <larisa.grigore@nxp.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, 
 Ciprianmarian Costea <ciprianmarian.costea@nxp.com>, s32@nxp.com
Cc: James Clark <james.clark@linaro.org>, linux-spi@vger.kernel.org, 
 imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.14.0

Document the two valid pincfg values and the defaults.

Although the hardware supports two more values for half-duplex modes,
the driver doesn't support them so don't document them.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
index ce7bd44ee17e..3f8833911807 100644
--- a/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
+++ b/Documentation/devicetree/bindings/spi/spi-fsl-lpspi.yaml
@@ -70,6 +70,19 @@ properties:
   power-domains:
     maxItems: 1
 
+  nxp,pincfg:
+    description:
+      'Pin configuration value for CFGR1.PINCFG.
+        - "sin-in-sout-out": SIN is used for input data and SOUT is used for
+                             output data
+        - "sout-in-sin-out": SOUT is used for input data and SIN is used for
+                             output data
+      If no value is specified then the default is "sin-in-sout-out" for host
+      mode and "sout-in-sin-out" for target mode.'
+    enum:
+      - sin-in-sout-out
+      - sout-in-sin-out
+
 required:
   - compatible
   - reg
@@ -95,4 +108,5 @@ examples:
         spi-slave;
         fsl,spi-only-use-cs1-sel;
         num-cs = <2>;
+        nxp,pincfg = "sout-in-sin-out";
     };

-- 
2.34.1

