Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D205139F
	for <imx@lists.linux.dev>; Thu, 16 May 2024 20:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715892091; cv=none; b=SxeLmRP5dQFUubovdPc5ROm6M4soohd9OfO/ezwhxISvLf13+8ySPmcbPuNh2gyTN0DTtAVrdO4+6KQ/zxhg8E4PnOjVIq5sq90d2bw2NFKi/uLTmlac9F1eStPGmfASaagmG+E/DPly4WcVoR1SjG8uhoRquBQ9ydqC6UEzDIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715892091; c=relaxed/simple;
	bh=gvMfQjhb/VOFUmjKkAioFSe9h2iL6RMf6plv37DH/ME=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jQ3LTMt4/p4Pfp6G4Wb4tLGq+DckFzV0r74AAUkQKez6k7c182AfRvKV/FMx6x4yYwMIGUdRuajo0udRoOxdgOvqPax0PVLAqXdjUc357K0LFOiLISEW8HX/lj18yGfRW05oMrdZ4cPP0neK5u+vsWtJRlxt12zYmc3NBp8/SQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QezEXevP; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QezEXevP"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2e271acb015so16611271fa.1
        for <imx@lists.linux.dev>; Thu, 16 May 2024 13:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715892088; x=1716496888; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9bzG+7WWN+HDoYVZdX4V+PH6WrIzda8p1Pj5+2jjMc=;
        b=QezEXevPhjH5zJQlUB/Wr0TeSPsgx8G0H1jsafG5cXQIQLKJps9vBjXTk+BinTPcav
         hzC5Bx0M8BEJhdPbZ6i5qKcFP/SGdDBkMZJn43geBcPurnSvBmmAa3WQbKvGrlFCZ56J
         CNP9Quw67HPFrLvBHR7nVm7daNP7PnjdDNvmt4G+QxHMGrag0orq6LeocezdpyjUTsHZ
         XWUS0TxgWYQ6N4NGei3rZCs6M3Uvv2elmvYJ4yRpwcQEEFaXXS0wsf6AhAlM1xrL80pj
         Q+zmdENKFEIPIXQx7wQ3dyoVNr95lR9y0gs4I6F8EukeeHvSk2Pn2zIyw+B0AV78DagE
         Li4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715892088; x=1716496888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X9bzG+7WWN+HDoYVZdX4V+PH6WrIzda8p1Pj5+2jjMc=;
        b=IX9X2wVlNa/xUNNR6X9gsYkw1aCpUZQnHN+rCed0q5G7RpPeB6kJ6klG73TDUWUOlN
         3YpzfkRNDMaA16UrhTW28C4U7iTbGwZZvKvXI0wTcg7SvgUrP+XHmehrGzMOp9LkyFMc
         gnRtgZh6DonlattEp9XAmbGEzyDjY7/WJhEEQjS2cSwSODIBBaOOV1p9K/S6viOmM9FY
         AbpPTFYG6HYUb57PL37RcTZ2+fJcS8vamyl8Qys4q2Wh0aZ6v6SOWULTQGesmj3cV7nv
         ix7Cjh4Dzh9BV7Vy0jFS35WeZr6+hWUiCxJBUwfrbGRKeOqEr3cyKi9PXB48BacmHyTP
         jtyw==
X-Forwarded-Encrypted: i=1; AJvYcCUBdusx4jHlbRjeDvkGBLgmR2JiV0QWNfblBPUM4ShQzHCf+JpeDUrHwBMnm80yrm8ll/KkgZYXF+ikmXFR0BCEUKcN
X-Gm-Message-State: AOJu0YxZLLruL94Y49pkd0jnDY2D1N78cZnSVA9V2YDeuBazOh7y+6Dv
	x+1Pz3fitzEhxLmM/JHAYfHxDfOVsokvP4eNethA0aTU/Hqx+ao5
X-Google-Smtp-Source: AGHT+IEFGSc0CnG+tYsSSgCwy/77Qt99fprI3mfIXypzGxDG0oSuL8FcWOgmKGZrcZQIDfuZ2cY+0A==
X-Received: by 2002:a2e:97c3:0:b0:2e1:f253:152a with SMTP id 38308e7fff4ca-2e5204aef69mr137733531fa.51.1715892088228;
        Thu, 16 May 2024 13:41:28 -0700 (PDT)
Received: from localhost.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5733c2b8f7fsm10859828a12.66.2024.05.16.13.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 May 2024 13:41:27 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: laurentiu.mihalcea@nxp.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] dt-bindings: reset: add schema for imx8ulp SIM reset
Date: Thu, 16 May 2024 23:40:28 +0300
Message-Id: <20240516204031.171920-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240516204031.171920-1-laurentiumihalcea111@gmail.com>
References: <20240516204031.171920-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add schema for imx8ulp's SIM reset controller.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/reset/nxp,imx8ulp-sim-reset.yaml | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml

diff --git a/Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml
new file mode 100644
index 000000000000..ec9a5c73e83c
--- /dev/null
+++ b/Documentation/devicetree/bindings/reset/nxp,imx8ulp-sim-reset.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reset/nxp,imx8ulp-sim-reset.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX8ULP System Integration Module Reset Controller
+
+maintainers:
+  - Liu Ying <victor.liu@nxp.com>
+
+description: |
+  Some instances of i.MX8ULP's SIM may offer control over the
+  reset of some components of a certain domain (e.g: AVD-SIM).
+  As far as the DT is concerned, this means that the reset
+  controller needs to be a child of the SIM node.
+
+properties:
+  compatible:
+    const: nxp,imx8ulp-avd-sim-reset
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - '#reset-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8ulp-clock.h>
+    syscon@2da50000 {
+      compatible = "nxp,imx8ulp-avd-sim", "syscon";
+      reg = <0x2da50000 0x38>;
+      clocks = <&pcc5 IMX8ULP_CLK_AVD_SIM>;
+
+      reset-controller {
+        compatible = "nxp,imx8ulp-avd-sim-reset";
+        #reset-cells = <1>;
+      };
+    };
-- 
2.34.1

