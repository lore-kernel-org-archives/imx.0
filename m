Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AE5D14F9FA
	for <imx@lists.linux.dev>; Tue, 27 Feb 2024 22:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071502; cv=none; b=T3Y9vmoBSMjdN7NdcJU9/6hxw1Frq93ioKh3ZVzygTt/gZjCYJfkBg2qi8wkY4LiD5LLJwgJndVK6XXrrZxBTgi7TJbs1Q4poNO81Ww/tSW+PIl9xhQsuklDehHgVXQ8LcXryvPQWqCxpoSHaIe9Scl7RDAIsiSaEzgS/uFPOuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071502; c=relaxed/simple;
	bh=XgqOTJb39qn6qfwvzC4Xjd8T0w2B1vbycueYW2K2slw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=a93i4upOVF2YWi1gBKd2s+Xhau2tB8VwTJQ3mcCOI8b/VdB7LeEJqiLncVXFGvoK1O/JxtiVIQmjdRcEJGf8zZQl3dEvKXidPD71niCLUSEHqwGvqC8/jaYziSezeM2Pn4nU1bzn9o8oak+wtMR9EcJimD+vw1YKxMjjCdC2mnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=muFAemec; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="muFAemec"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6902947c507so5835556d6.3
        for <imx@lists.linux.dev>; Tue, 27 Feb 2024 14:05:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071500; x=1709676300; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENJCVwViqySP78QQC22e16vdfpVFUmVF6XiIGfyzNm8=;
        b=muFAemecxrerxV34xUnDFFZ6821IkVqlOFhBEKVaQVVhgb3NYWk3SnYQ4n4/qUSMtC
         LMrzG2l/1gzDFZF7OlR0xk0buJ2F/BfNxRrTde1d9vu69qxkW+7QM3x/ORX1wSQuAOtC
         I9qyj7XXfUXg+KPv/4l7LL7iD1jER5KFQxu2nkBipSDRyX5NmE3ElbV1YyKNM87eEFrq
         uIwrokASoA8uIznW0ZvuuOiGxC5ezbWtBqD8VuQL+sozbPJyu8pESHFiKnpgvI93T46Q
         L8XMhBGzEt6k9WBhw/JsLwX95U49OwWXPywQQKEpyOgXP7NzVV2tkDh+F1yNPkpoLqEU
         vXnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071500; x=1709676300;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENJCVwViqySP78QQC22e16vdfpVFUmVF6XiIGfyzNm8=;
        b=j2MaHQOcTsGpJ1t3PW54doSbrcouq8SVGtwOhXNd5tIp8Xz7iRKegWlZTWjTV9ym4/
         NHgNNWrBp/9fbE+Ln2p91P3bPZIv4rOT3+aQNVXhyK+7sHWxxvqO21H3XI/LntdT4mK5
         HFlAtybT7ZxAbh8Ph83CWJTzwz9jQiM4dogWv+kl1m1o+dzRrJJ1tNYk3R/UoiJrtBBs
         uOCGiSIetA+DQ4HMGED6yXQeuoRfVFvZckx8Qu39MI21OUqochdUXIqJvS/StCKR6ELS
         cN4LBZZCKkd9Ors+s90rQvoVdV2ELOZQcfB5BXbN+RdyN711+Evuq65qepKtJnZWqsEW
         kM0A==
X-Forwarded-Encrypted: i=1; AJvYcCVOodgA9Zp0Z2EUCkq6RPVCcC+Fe5rYNjie3qXXlTwTh2kNIHz4cBOf1VdJRNLQUzH3N91Z6gWtAZfV/xjObPxuPrnk
X-Gm-Message-State: AOJu0Ywbm6cu0QhC2JPKKU2sBia+SMZ3g90zqMzC72dw7owQFpZ1zYC/
	4vIohE9XCpPZEiAEzbX5WCXiOxKxKZICZtur/Fmm/HuHDOfO3hZd
X-Google-Smtp-Source: AGHT+IEpZQhtRi5w5yIbBlDmAdFLeORFRaXPwFhoPznALYLBHwR3eVYMv/pDmm9JMFJsmDcE9UXAiA==
X-Received: by 2002:a05:6214:518c:b0:68f:fe7f:abff with SMTP id kl12-20020a056214518c00b0068ffe7fabffmr3307878qvb.19.1709071500273;
        Tue, 27 Feb 2024 14:05:00 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:9ee3:b2ab:6ca:180d])
        by smtp.gmail.com with ESMTPSA id c12-20020a0ce14c000000b0068fc55bcf6asm4569556qvl.119.2024.02.27.14.04.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:04:59 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: aford@beaconembedded.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Adam Ford <aford173@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V7 1/6] dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
Date: Tue, 27 Feb 2024 16:04:35 -0600
Message-ID: <20240227220444.77566-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227220444.77566-1-aford173@gmail.com>
References: <20240227220444.77566-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Lucas Stach <l.stach@pengutronix.de>

Add a DT binding for the HDMI PHY found on the i.MX8MP SoC.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V6:  No Change

V5:  No Change

V4:  No Change

V3:  Removed mintems at the request of Krzysztof and add his
     reviewed-by

V2:  I (Adam) tried to help move this along, so I took Lucas' patch
     and attempted to apply fixes based on feedback.  I don't have
     all the history, so apologies for that.

     Added phy-cells to the required list and fixed an error due
     to the word 'binding' being in the title.
---
 .../bindings/phy/fsl,imx8mp-hdmi-phy.yaml     | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
new file mode 100644
index 000000000000..c43e86a8c2e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mp-hdmi-phy.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/fsl,imx8mp-hdmi-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Freescale i.MX8MP HDMI PHY
+
+maintainers:
+  - Lucas Stach <l.stach@pengutronix.de>
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8mp-hdmi-phy
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: apb
+      - const: ref
+
+  "#phy-cells":
+    const: 0
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - "#phy-cells"
+  - power-domains
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/power/imx8mp-power.h>
+
+    phy@32fdff00 {
+        compatible = "fsl,imx8mp-hdmi-phy";
+        reg = <0x32fdff00 0x100>;
+        clocks = <&clk IMX8MP_CLK_HDMI_APB>,
+                 <&clk IMX8MP_CLK_HDMI_24M>;
+        clock-names = "apb", "ref";
+        power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_HDMI_TX_PHY>;
+        #clock-cells = <0>;
+        #phy-cells = <0>;
+    };
-- 
2.43.0

