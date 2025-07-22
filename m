Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF1C2E11C9
	for <imx@lists.linux.dev>; Tue, 22 Jul 2025 10:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753180640; cv=none; b=MyCnQhWA8EOjPWZS80sgDrNkT4MhtLyZXpQEeXW5phePFRjkDVuk9zwnumzwtbz7eY1HeO4u6xp26Rl3cKW4540g6KFCdrmS6SlSpvB2cnCE06lrqMJfNbHiCwQU3lSx6hU2pEps9qCLc4E95eJYB4TlgnwXJ4AIjhwvz0RdYvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753180640; c=relaxed/simple;
	bh=6DM9dMZAtcwlDKvhQvsmdFJDn+355Evyd4COdeLDukI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Whl+8B2kVk2MpI9QoFTXosQTFQRCa1UHm9QvqTklGdnno1H1Kl0qEZBH1brfdTTRXBHyyC273hWUdfxS3x3yNyv4VTTJzREUTsWrudKrAGdz75v3tlnVmemfdcxjGl0EIqIznZO46OV9WJ8wGV7aVGvFai436pWkTkDV4kA5Eq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=ZU4hxJ/G; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="ZU4hxJ/G"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ae0bc7aa21bso1047329766b.2
        for <imx@lists.linux.dev>; Tue, 22 Jul 2025 03:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1753180637; x=1753785437; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=ZU4hxJ/GCjXOR6gz9hxFJoeZupaYCc+fPDUIy96lHBBfPiSVOc0pKqZ8swctGrjIVB
         HTbZNM/ymP+n01bPLd1Fz69axbGGF1sj5Zs2MqJQwX/1+N7yd5qyzZEfzjC4c5vCi4zZ
         xbekMBLq4JERwTMuaeNdA4oy5XV/zd7wTwE1k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753180637; x=1753785437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GtY6xQODciaFQXT13QEjMt2xFfxEtt0WYueluTMBhAE=;
        b=YuVnSkbbI9F3JY0dU62yJFZf5fHkKSpAF2s0uoOzdb/GsAvcIttXzCmR9H31qNjtyu
         cZX74GDkj7PAWvc0Bbbz1V6sBt5ox8RPAVQPvMPuQd/XrqarzdzJchwLjUZgvwLd/Ywc
         7iP0l/akm1yRT+DrjyRjYz9oRjmrYTj4W7/6M25fJumQyeuej5p7xQ0nOs89jYfQMsKn
         yEDmTJ2RGvFw1exxa94Sew/Z9V9wPwK3umCb8Pz5pGNgem00HXm8LvwodgGlluAtGZXH
         iYUKz3O2iynGgsQW3dYNuMOauOFH1+X9Yd9qPyQSdXKY8c/ZJ8DWH2tIv6CXDWo96bVX
         9vlA==
X-Forwarded-Encrypted: i=1; AJvYcCUzcjxJFbrkdwKQt8+3Z5OjSkVO8O3U6EPIULIaYdiyCSabmpbpqivuGobVj+C3Kkina2c=@lists.linux.dev
X-Gm-Message-State: AOJu0YzhLQVHmbhe7djUm6uwCKck57tFZMoE9dCgsKf/anxnrP/UaSsU
	dGcFhIJJPkUdKk5MAD5dhW+SLseppYXE76Z0RYv/KXiWy4Bjq7bFIM+rFZasX/45UiM=
X-Gm-Gg: ASbGnctIr35FLwdLPUIZRzYEoK1aY99E36+1b1+jDwrzFPxe+h5sOmHvd9ySRQcGLhl
	0hWle67XPNm69h+l1VWyBaT3jgreBAzvd1/TjGM2xS4tCYNMhn/lj7MnuNJpoG8vSCprIpN/1dE
	EVaCoyf6uNEVw51IJt7EHflPuzn9PkmSj5oJwB5+d+uapzxPss36ndAQ99E8q/e5vWwa1HJ3FHQ
	uBUpB/NpQ128T2El82XoBhKsmOwtN3vWbYEwRBnvdj/ASW4mr5twhLFGPdNzwNzQg3KuA/XsKSB
	9+l4TKUOYus1c2nRP5coJyyVfK+egveqhpaZVGjnNFQIH7mSe8KTvFMl+U86gm2hVIGQRYWhBDD
	Y/ouhyqjedsVu2KD/nNv0DEq9KjBMnNVrVaDay1u4f8S4MWzMxMfZupI96XM=
X-Google-Smtp-Source: AGHT+IGaHOYHJrE7/OlnHeCdJT7X6M+1OGRNxK7Jx2o38iPchbY1YGECx/VXRXtQUdO2o2c/K0RoAQ==
X-Received: by 2002:a17:906:9fc9:b0:ae3:cd73:e95a with SMTP id a640c23a62f3a-ae9ce0d2aedmr2549138266b.36.1753180636628;
        Tue, 22 Jul 2025 03:37:16 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:2bba:d7b0:8e79:c982])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca310e2sm844568766b.79.2025.07.22.03.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 03:37:16 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Haibo Chen <haibo.chen@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: input: touchscreen: fsl,imx6ul-tsc: add fsl,glitch-threshold
Date: Tue, 22 Jul 2025 12:36:16 +0200
Message-ID: <20250722103706.3440777-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
References: <20250722103706.3440777-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for glitch threshold configuration. A detected signal is valid
only if it lasts longer than the set threshold; otherwise, it is regarded
as a glitch.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 .../input/touchscreen/fsl,imx6ul-tsc.yaml      | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
index 678756ad0f92..2fee2940213f 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/fsl,imx6ul-tsc.yaml
@@ -62,6 +62,23 @@ properties:
     description: Number of data samples which are averaged for each read.
     enum: [ 1, 4, 8, 16, 32 ]
 
+  fsl,glitch-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    default: 0
+    enum: [ 0, 1, 2, 3 ]
+    description: |
+      Indicates the glitch threshold. The threshold is defined by number
+      of clock cycles. A detect signal is only valid if it is exist longer
+      than threshold; otherwise, it is regarded as a glitch.
+      0: Normal function: 8191 clock cycles
+         Low power mode: 9 clock cycles
+      1: Normal function: 4095 clock cycles
+         Low power mode: 7 clock cycles
+      2: Normal function: 2047 clock cycles
+         Low power mode: 5 clock cycles
+      3: Normal function: 1023 clock cycles
+         Low power mode: 3 clock cycles
+
 required:
   - compatible
   - reg
@@ -94,4 +111,5 @@ examples:
         measure-delay-time = <0xfff>;
         pre-charge-time = <0xffff>;
         touchscreen-average-samples = <32>;
+        fsl,glitch-threshold = <2>;
     };
-- 
2.43.0

