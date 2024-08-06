Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ADA1BDAA6
	for <imx@lists.linux.dev>; Tue,  6 Aug 2024 10:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722940720; cv=none; b=YbYa5kFazL7Pgsp8Jb9jEUgknzpegjt6yclFOagsuTLlAvjVVwZQwkIa5amXPmgNFzY8MtVpCNR7sRf+ihINdnHHRSsO1N0mQ1PbW/RRZM5q8pHq4pnsC8dj2W15AwFPQiWr2gjr1XagHX/pqkPIA5KdDaI/ptT8+nAHxsn+ty0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722940720; c=relaxed/simple;
	bh=05YUjKWcS8QjfXQkGcpwUyF2jmITRUMRuJ8V9/VtX4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PReEnwBJ4NkuA3uj6LSTvnwiaQmUVkx0bVSX8Jehp8v6YC8SocehkYf4M5E4oMTXv0ZuuzNfhd+FBVl6I7UAT0XVtGh9v5R4YXmv1EnBI8X6OLvbrKONhas44LYTyGc9idmCf9PiMvz/jsxqzvaAcgM2mFiKnGmtpRn6uxQJRto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BBepCuLQ; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BBepCuLQ"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7b0c9bbddb4so458379a12.3
        for <imx@lists.linux.dev>; Tue, 06 Aug 2024 03:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722940719; x=1723545519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lBE9cbqqy9E10rFhHW0Wgihe2/UchPViyrmjttfLQ6E=;
        b=BBepCuLQM4wtJwRBq+jLx83U4WVVULvNaTkWfuCAqL3WBgQHKaF+Pk46GB4UyLv65Z
         cBuV0Do4xAlkKYEmWJk0ZRqVMgrvyPYS1002EuqnZyNdrXHsI4VNB10+Ue5vKZUCoRs8
         iWQH2R6FRL5yppnSFACAmvswkYa5MBG+gG5SVB+wBhfLIBXiFTRsfZ6HNV/VuV2AiQLt
         KgU+JzSoFuHZ801RyA5omOXwIoeOxP5c0RwW/fhjGB9GOtcQ82O0plyln2++Fj3dVXwT
         DGmr8SHxLu8UPB0dwMVGe78Ejqw+G/my9QyeHnywARoImZ/xkqWwSA96fErNVFAz99P7
         0xTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722940719; x=1723545519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lBE9cbqqy9E10rFhHW0Wgihe2/UchPViyrmjttfLQ6E=;
        b=K3cmcf/bym9M8/+2UK5vOchdA6wPp7z8xVRkbj5f8h9LWlA9TDZLzNY3zNrKI2bh4v
         3B82KU6qyzIdV8lqMEtgA34owFSzOiL9ZvA3xulr1ptR/PE2QrfAZqeGzJCL9nQh2pDR
         IBUm3MIUa6KMT2uYVFgs7L9ah37FATF9dI+p2PMiKn72TUxcyhMVxnuXbja0pz1S+zle
         Kcy1CvQfg1PYtyQIIAWG0E9DlUec/K2okEqV62gD2S2gCgK8MY40JXhaYkufo+3PesOB
         w6cAvM5gCEpu+7qRbqRDQAWzegPLY1qro3AMlTuHc2fahcCTXRR/1HMWnGHBJx1+9YRY
         aChw==
X-Forwarded-Encrypted: i=1; AJvYcCUDUzUrwSSDCY3XF59ziQ00wb+LPfNWsV7GcM6yWTpH2QfW3HQKTh5ccYV17EdP8IpwBPLlWXbzKSSZn7/2mbjCx0P9
X-Gm-Message-State: AOJu0YzjtoJtX6R87iVOMicHKngwtG3sFtmaEuqTqHg7uycMJTw+M2zq
	sFe8IDDgMCC0ThF3WLgSaEdmB+pr1yi2IhdfluTYoZg2F10UnTvn
X-Google-Smtp-Source: AGHT+IFeoNZTBJIcwXObcpVFY6Q7EaDDvgDY5rZpxHnHyuZgINHleuwM7ffl5V+qHwaBw6XGBqXTEw==
X-Received: by 2002:a05:6a21:6f87:b0:1c4:c7ac:9e5b with SMTP id adf61e73a8af0-1c6996605e3mr12075324637.45.1722940718410;
        Tue, 06 Aug 2024 03:38:38 -0700 (PDT)
Received: from localhost.localdomain ([115.240.194.54])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7106ec4169csm6775561b3a.64.2024.08.06.03.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 03:38:38 -0700 (PDT)
From: Animesh Agarwal <animeshagarwal28@gmail.com>
To: 
Cc: Animesh Agarwal <animeshagarwal28@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: watchdog: fsl-imx-wdt: Add missing 'big-endian' property
Date: Tue,  6 Aug 2024 16:08:16 +0530
Message-ID: <20240806103819.10890-1-animeshagarwal28@gmail.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing big-endian property in watchdog/fsl-imx-wdt.yaml schema.
This fixes dtbs_check errors.

Cc: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Animesh Agarwal <animeshagarwal28@gmail.com>
---
There are 12 similar errors related to this missing property from
different blobs.

./arch/arm64/boot/dts/freescale/fsl-ls1012a-frdm.dtb: watchdog@2ad0000:
Unevaluated properties are not allowed ('big-endian' was unexpected)from
schema $id: http://devicetree.org/schemas/watchdog/fsl-imx-wdt.yaml#
---
 Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
index 36b836d0620c..24d47b1701a7 100644
--- a/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/fsl-imx-wdt.yaml
@@ -48,6 +48,8 @@ properties:
   clocks:
     maxItems: 1
 
+  big-endian: true
+
   fsl,ext-reset-output:
     $ref: /schemas/types.yaml#/definitions/flag
     description: |
-- 
2.45.2

