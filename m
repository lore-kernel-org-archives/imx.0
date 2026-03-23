Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD883C9EE0
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 18:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774288837; cv=none; b=akbxTR/biTCKavpNar966+p+ZeMQNhKS2FxdzKZwrEmwd89A75oNd88KaGFivgQQ2WeOsqrbdUBTJ3IUXDweYA74nl2370Y0rZg6UTCccniU38UXWKK2ixrmRrlwwH76TvdSFBuzz3coJFnboYmmdNow1jgPWVEnzKnkyHz06zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774288837; c=relaxed/simple;
	bh=LLPiwF7UGY6nyiXVOwJgMlw8Nb26M+J/LVNn0ejXn6I=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRujt/FvGQIVuS5myfZjzD8qjFtnXy/aHF5lokh8W9ELPl0a5L2g3LT6g/f+nxkEUe+fRMAX/oBu0UDf4324N09AWQwUpCn4ko0S2JegVpnbX6qK0tXdsBszm0T9AfQX6R4jO4vqZnW9ArmuZOAZ9VG9y+DgKbkELb1g+zoV3PQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViAMjCmI; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViAMjCmI"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48538c5956bso41614855e9.0
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 11:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774288833; x=1774893633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vg+jkqcoVNFNI7ndmig89tjt/SoHh62XMKbUf5COJgE=;
        b=ViAMjCmI3E+1WqYhXJfkigwOZHyOhTh0r6xmEBNQqgE/GTskqs5JUiZCnRp2/CAfAa
         MMq74snflJpvzsuHbcm3RM/HnKO0c9QtiiyAtUAKKOjn5tfowSg7mztLCrZVIPljhXEz
         hj+woNKoU4rN8TKagf6tanWEHA354sXU+3irnks+Dw2U82aXLeX0Og7YRQClL1tqZCCG
         oR3ljbKEp7YdRWWkQP7YwRNDaucXpx/LIUMFqLBIwndPfTtYePkFylSoh0a1mp0axfJk
         0VS4x4xCfpp1fiLMNHphw8ITnJ1+7Qora9tE09VSa/H+7aNWoJsTdrfChQ3iX00Gq5W/
         JgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288833; x=1774893633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vg+jkqcoVNFNI7ndmig89tjt/SoHh62XMKbUf5COJgE=;
        b=heJB5ey31NC+8dTiCdk1Fdomi2tdccvCibOkH9t9b/cfYRNVOVOzVpk8odrVE5RmUp
         oqgr4eeQFkkO4MFf0EBlLGQFvr5yFgb+Bz1NghgEYwzgXFhN9YxZTpFfbtd1RUBIC564
         aaxtuRBbl5ne78rZCj764kRY0IyAhHKBTxaQCixH/OEqOYiL0/n3mqDyRArXWJe7R3KU
         EvcBJ2reQ7sta2Z/7WOlthCLf3Uy8xmioNdlryBbg5Tev3c1qt298zL0oxV/u99kbFcE
         YkDwp76ToGSD5u6au212fMoVocaJMaFixAn9l0p2Qy3vQqSTVoriXXNm1VN0GQKYnIqL
         9Baw==
X-Forwarded-Encrypted: i=1; AJvYcCXPHIUKWoMWbNO//P+67E/rfHP7y5aL1xNoWhTDf5ZUFLL22zHoa5XtduFZlDhfPMeZD7U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+WTMZ3CsN/eq2ky/4ngm78HwElxibIJQwAEBMjvGAzr0T32A+
	qmnMLQ3LROptTOgWcZ+4pyElYzFEnbmxP3h/kOWZYVVBjA8ySiEeAE/i
X-Gm-Gg: ATEYQzyTKluBp5l0N4XbL8p0NjVISoBJnE7+lv83KLXFrkLvy2PCyYPpeeDN/dHn5na
	41dKq20THz01LI9t8tR98bgwQgvBHCJ4CHrWCZagdqZM/ocyxoNcvFIS2PvsB2qLCFoAxKMeHa6
	v20LXnL1VKBivHaUkVz4aVobwhnlu9BXUMZVCv0XxUma9QrTMd0w0/OLAYCC051kRdUNr06msjz
	FJ62GNOBQSarRnEht1iNYArrJ0PSvjRjOLIYPm2SD9wXdAltV2yPVcg6mCI1pjV6mG48b0eTBwE
	LkjpZi2qM0TF4qNAHkdYtWmseWIQrWG8+ar8ztkAgGkcElEqB6Ql2dt8BXIryzT4bsRd/cY5NQt
	ezceZ90LKFC+l6gXxzXuWdhVcTOPkIGIMQ+JX1vU/eGxv31XZSjf9F+zhUx/QIaZa6NG8AYIXRk
	2oVoIL/4ZmHqpT
X-Received: by 2002:a05:600c:1d02:b0:487:12c:e7ea with SMTP id 5b1f17b1804b1-4870f1f40f8mr7506315e9.5.1774288833279;
        Mon, 23 Mar 2026 11:00:33 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486ff1d3befsm84419925e9.32.2026.03.23.11.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:00:32 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Date: Mon, 23 Mar 2026 19:59:44 +0200
Message-ID: <20260323175948.302441-2-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323175948.302441-1-egbostina@gmail.com>
References: <20260323175948.302441-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the Technologic Systems TS-4800 watchdog timer bindings
to DT schema.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 .../watchdog/technologic,ts4800-wdt.yaml      | 40 +++++++++++++++++++
 .../bindings/watchdog/ts4800-wdt.txt          | 25 ------------
 2 files changed, 40 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt

diff --git a/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
new file mode 100644
index 000000000..5c2541ac6
--- /dev/null
+++ b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
@@ -0,0 +1,40 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/watchdog/technologic,ts4800-wdt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Technologic Systems TS-4800 Watchdog
+
+maintainers:
+  - Eduard Bostina <egbostina@gmail.com>
+
+properties:
+  compatible:
+    const: technologic,ts4800-wdt
+
+  syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: Phandle to the FPGA's syscon
+          - description: Offset to the watchdog register
+    description: Phandle / integers array that points to the syscon node which
+      describes the FPGA's syscon registers.
+
+required:
+  - compatible
+  - syscon
+
+allOf:
+  - $ref: watchdog.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+      watchdog {
+        compatible = "technologic,ts4800-wdt";
+        syscon = <&syscon 0xe>;
+        timeout-sec = <10>;
+      };
diff --git a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt b/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
deleted file mode 100644
index 8f6caad42..000000000
--- a/Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
+++ /dev/null
@@ -1,25 +0,0 @@
-Technologic Systems Watchdog
-
-Required properties:
-- compatible: must be "technologic,ts4800-wdt"
-- syscon: phandle / integer array that points to the syscon node which
-          describes the FPGA's syscon registers.
-          - phandle to FPGA's syscon
-          - offset to the watchdog register
-
-Optional property:
-- timeout-sec: contains the watchdog timeout in seconds.
-
-Example:
-
-syscon: syscon@b0010000 {
-	compatible = "syscon", "simple-mfd";
-	reg = <0xb0010000 0x3d>;
-	reg-io-width = <2>;
-
-	wdt@e {
-		compatible = "technologic,ts4800-wdt";
-		syscon = <&syscon 0xe>;
-		timeout-sec = <10>;
-	};
-}
-- 
2.53.0

