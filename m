Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125DE3064B5
	for <imx@lists.linux.dev>; Fri, 13 Mar 2026 08:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773392292; cv=none; b=GeWqLwN4I95f3svqmHvfUnuZiX37pYaScDGSRb5BPAqf2cEVc0jfZsHuIvfubdA5WWlKIuhTOT9hmsxEtOG6OnCUoOdro3GHsqkP4vna39Ea+ZbtKt5U6qfnTcppM1wGWhJBzuxTOSZijKKxjfwjAkbskZ0RYAlfoQIYn5ZaKfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773392292; c=relaxed/simple;
	bh=fIp545uC/6s05hgZyyH4DAcj/j/E7s0ZlK/E2cI6R/s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ctFpLK4XXoI0OlZx+IgiH7e9WVshwH+POXK1tYJdxoHM/xmXzX+spSkH+hoB/xdIIC0zswVMHPtrsllAz/IXc1juObeldWA/8fU16Y2hYpRHC9lg/R9LEFgyn541jGWg6ihkF/RggPy26+DhRCjw2QbGbIF3AqKe5+w4RmVUcGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+rl/S/1; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+rl/S/1"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso17374395e9.2
        for <imx@lists.linux.dev>; Fri, 13 Mar 2026 01:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773392284; x=1773997084; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpK/7gAydfr91Prnv9s4l0pBpjIN4z4bMzbmgBzMg4M=;
        b=X+rl/S/1uAhZiOS35rbaMItN8yqBltDM4I7+P/jMYuL2Tx7kFWdZfr9gCpRjzxwJCk
         d+m3yoZcY9Klw57ZAqi1LsjLorRLWAyo4Q6ysyA0mWItJ/0eBz7I2c8m4H+auqBnTjaB
         eBUAetM953pQgoCuvyZWtP6mbIgABycCXwfYcoUatW67dfEM25wmMcjLC75tbdolzFCm
         A4w+Y+m7BgyQp1j72HUQnlYeNd2VtGapIrNNBKk3XrpRgs/KrMwNU5SpaYK2tG4l/dH0
         rKL1strmTrfsKmKz5rcZlr/k5d1zgd0SYnWzWa88d//I1u6lCDPd6v9zlEiihpEccQTb
         /zLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392284; x=1773997084;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NpK/7gAydfr91Prnv9s4l0pBpjIN4z4bMzbmgBzMg4M=;
        b=C7O86SaP78PaX60SrBfTfPagdkuEhpXJBc8GvzA9c2NSe3omSJ+9VoSs47b8pVZGn8
         Go0qPbwwEpeLAXm/j/E24OhuH7mZIZsfEZRN2/Pi4XpXNOBm/iND7GeeMEctu1VqyDSJ
         cemycNqjK2n5DfxZU6fl1ObijM9L2NL8prDjkF3MF9WqjDbVSEkrJ4wCebLf84+68Db9
         DGDEm15itq+8j4KaP7/eZYuMvJ54C5bdEHPsbMRy5rutDez1b4cJbb+NyEsLx/+PMGOi
         z99DInPtxonI03OM/a/GTA5g9FokqboVJjbBVcaq+MtFqqEikL7lqJjiHMp+zn0g2o44
         Pk+A==
X-Forwarded-Encrypted: i=1; AJvYcCWCqQ7zAqtZRNQIBKsAiP1i/KkIglkRIJXb1WoDyD92sNI0iLttbEx98wsXsJubISN0Z9w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvB+uv5r7OhVbjVPiYrg6vLXLi+M48XzUSgr2kzLNRWj+9FPNh
	UqC7pIVK6BVJKU6nwcr8EzBEY0Cob1a6yaXzlth+5UYuDs96lrEH38hy
X-Gm-Gg: ATEYQzz2VzrP/p2GBK8qioLseSiC7xmGO0dnvVvsZhZQRL2pMzBY5gwqkwbn1NH4h0q
	kdypKs354KMu3kcLZkqpLzDK5Hr3vS5zAUMRawNAH/rlAholNS77FMslo6X/oj6k9DUFO9a58SD
	N8QrzfZ52qrgPSEew6zW4R/8P3oxSyDejwdplme+43sptTOVF4PU4NilvhFJM1b2TeK6IW6gN/C
	L7P+rhc17TY8EFVDYUe7K709ksCUItTom2yJnvp+YygM4DsdYZtZOTYKDFLNISQZ188iybwUFI9
	6DRc+XTCPRsmFQZCpfKPpkPnrFbGmacfdwaJDj6SEydclmb5YYyGRzE5AxRmci8cvd02rbS7iAJ
	7JAMa296e6Kz/BQBVicoNlAgzRUXn39xhWWtDy87H0M36b+MHE8j2fHjj2yr1wAyyA3+x1yYhjY
	Ug9lOO/b0uje/4j+SI49KDPEKdG+mkGPcdOOMMzxioJIBF5RyEQaS8V6hRceuEpSX473Y/D77F8
	RjLPut2Y18wytIbRcnISPTrLnI=
X-Received: by 2002:a05:600c:628c:b0:485:3b34:2f51 with SMTP id 5b1f17b1804b1-485566c9440mr34176885e9.4.1773392284100;
        Fri, 13 Mar 2026 01:58:04 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43a03cfd18fsm7663718f8f.36.2026.03.13.01.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 01:58:03 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Fri, 13 Mar 2026 09:57:42 +0100
Subject: [PATCH v2 1/6] dt-bindings: arm: fsl: add Verdin iMX95
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-verdin-imx95-upstream-frank-li-base-v2-1-bd488be7c699@toradex.com>
References: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
In-Reply-To: <20260313-verdin-imx95-upstream-frank-li-base-v2-0-bd488be7c699@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.13.0

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Add DT compatible strings for the Verdin i.MX95 SoM and its supported
carrier boards: the Verdin Development Board, and the Dahlia, Ivy,
Mallow and Yavia carrier boards.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
Link: https://www.toradex.com/products/carrier-board/verdin-development-board-kit
Link: https://www.toradex.com/products/carrier-board/dahlia-carrier-board-kit
Link: https://www.toradex.com/products/carrier-board/ivy-carrier-board
Link: https://www.toradex.com/products/carrier-board/mallow-carrier-board
Link: https://www.toradex.com/products/carrier-board/yavia
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
v2: Added Krzysztof's reviewed-by
v1: https://lore.kernel.org/all/20260305-verdin-imx95-upstream-frank-li-base-v1-1-823fad02def9@toradex.com/
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292c..f0701143b237 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1477,6 +1477,30 @@ properties:
           - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
           - const: fsl,imx95
 
+      - description: Toradex Boards with Verdin iMX95 Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-nonwifi-dahlia # Verdin iMX95 Module on Dahlia
+              - toradex,verdin-imx95-nonwifi-dev    # Verdin iMX95 Module on Verdin Development Board
+              - toradex,verdin-imx95-nonwifi-ivy    # Verdin iMX95 Module on Ivy
+              - toradex,verdin-imx95-nonwifi-mallow # Verdin iMX95 Module on Mallow
+              - toradex,verdin-imx95-nonwifi-yavia  # Verdin iMX95 Module on Yavia
+          - const: toradex,verdin-imx95-nonwifi     # Verdin iMX95 Module without Wi-Fi / BT
+          - const: toradex,verdin-imx95             # Verdin iMX95 Module
+          - const: fsl,imx95
+
+      - description: Toradex Boards with Verdin iMX95 Wi-Fi / BT Modules
+        items:
+          - enum:
+              - toradex,verdin-imx95-wifi-dahlia  # Verdin iMX95 Wi-Fi / BT Module on Dahlia
+              - toradex,verdin-imx95-wifi-dev     # Verdin iMX95 Wi-Fi / BT Module on Verdin Development B.
+              - toradex,verdin-imx95-wifi-ivy     # Verdin iMX95 Wi-Fi / BT Module on Ivy
+              - toradex,verdin-imx95-wifi-mallow  # Verdin iMX95 Wi-Fi / BT Module on Mallow
+              - toradex,verdin-imx95-wifi-yavia   # Verdin iMX95 Wi-Fi / BT Module on Yavia
+          - const: toradex,verdin-imx95-wifi      # Verdin iMX95 Wi-Fi / BT Module
+          - const: toradex,verdin-imx95           # Verdin iMX95 Module
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:

-- 
2.43.0

