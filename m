Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12DC135A7C
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 23:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708991147; cv=none; b=WhHgwxRRso6nb0fg8moZeu/zg1jfi44jYELlI9rXY5PjpRZS7hBNeij5jw/31HVStCEJz/aw8jbw26b4EtUBrV7C9dTnUxk5M8LVDXGQDETop/3KniF7FiVQKLka1SWQKIAK/WM3UiCJaQuVXi8PK6F9GBbQoqZZXavQD42xxGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708991147; c=relaxed/simple;
	bh=XgqOTJb39qn6qfwvzC4Xjd8T0w2B1vbycueYW2K2slw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HjE0/v/AiNy5CkOAFGMuEHlRlnW8rSgrwoVnJezL0XhY0aMO0t0WYhvGwXheQpD5mDOAFzb7O9faG+r5oCt103CvoSihXn+FWQZlhEknXnx7IDEASl0ThH+Ak1GwaQSnrSVo4lQPkfHW3KJTizDT6NZ0rAlDCG7D2Ba79SSRwow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UDAOTvIx; arc=none smtp.client-ip=209.85.166.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UDAOTvIx"
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-7c7ba25e7fcso50997339f.0
        for <imx@lists.linux.dev>; Mon, 26 Feb 2024 15:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708991139; x=1709595939; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ENJCVwViqySP78QQC22e16vdfpVFUmVF6XiIGfyzNm8=;
        b=UDAOTvIx8s5axUvSRookOCWHBJ3euPUQ/mIJ6XcDm+44M/wJiSsKPOX0yn/Ag7PXKL
         lN3yeefzbxCbLm292JU2lsu+LPl+kRpCFqtP+RB9WyIKFOHg0yP0fLaZT+1OjixXpXlI
         Qf2Z9UnigTqVWmw7QaFQqukfz8XZtECElythGry3QHihPUPYz7GgnKho2TyocmQ+TSku
         x9+w5JlaCLu8Vs8X42mNsJtqkkYoV72Nw6QZDL9y8uPXZJGc7M4w68UbK1I5KJdDLfSG
         VIckH3Fnn4c9Xv8P8pK1/aqEKfdN4Mddm/JkRgyoSzyiAOc91Uaespf06fehxMecU8BR
         5jpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708991139; x=1709595939;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENJCVwViqySP78QQC22e16vdfpVFUmVF6XiIGfyzNm8=;
        b=LRHBj/OVDbbVjKnUSIDF4+7/EWfMl+PusR4D5u/NP8igRdUxMo7yktGVPhOrWgjaxq
         qnHSrdJdACIc9mW02BK3l5ByoaQusLSIfsXr9GcHWy/2dev/eGREiE/syiZv9dwHuW0m
         dT4F53jk7L19Mzrl22m+KQj/KakSvZBvNvetijqLjzlzPGRcb8VRjrYCOIEzwcsR3N6O
         JQkYS+EHFhyOEfI/CN6H4VUywnRPIkwQ2pRMsS8PtNcFavKRkX+as8mnat9SmssmzWk0
         QJ3WPfgszMquQU1pXX0HbxLIFiB1x2KwtOZdmNy7fDgqY1CoousrYH/1FfkEpASZOTDT
         bk9Q==
X-Forwarded-Encrypted: i=1; AJvYcCX9hwttC7j5Nx7rFF6wXkwNGoO0hUSeHkA+u7NEVEuB1YQnp3CH7blVge6Oz+92G1BWFuU1RQrveO4uRpK48yk4tCiZ
X-Gm-Message-State: AOJu0YwxrY4PIsFZxWj3RJ/XdUo6ZrqC6eTYym2NomjA4ASbSENWaH3j
	sP7U3aG43QxRcuK4tXmffSvqnN8DkTZ1ALQS32nsmatuNsDN5nkv
X-Google-Smtp-Source: AGHT+IE0Qm5yQ6rNCxa0d3sGukCo6hDILzXZzbUGhgTRn/EM30OHE3gVJrckX3sKvHnVgYCb1ktBmA==
X-Received: by 2002:a05:6e02:1a45:b0:365:4e45:5436 with SMTP id u5-20020a056e021a4500b003654e455436mr5629213ilv.15.1708991138844;
        Mon, 26 Feb 2024 15:45:38 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:9c95:d061:819a:2ab2])
        by smtp.gmail.com with ESMTPSA id c25-20020a023319000000b004741cf1e95esm1545317jae.11.2024.02.26.15.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 15:45:38 -0800 (PST)
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
Subject: [PATCH V6 1/6] dt-bindings: phy: add binding for the i.MX8MP HDMI PHY
Date: Mon, 26 Feb 2024 17:45:12 -0600
Message-ID: <20240226234532.80114-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240226234532.80114-1-aford173@gmail.com>
References: <20240226234532.80114-1-aford173@gmail.com>
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

