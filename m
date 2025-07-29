Received: from outbound.mr.icloud.com (p-west2-cluster2-host6-snip4-10.eps.apple.com [57.103.68.243])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5AA1E521A
	for <imx@lists.linux.dev>; Tue, 29 Jul 2025 03:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.68.243
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753758891; cv=none; b=Ti0R4gpkZe+TE6bYEmw6ZOP5/Y5u0iTCeAQpQWSgVDqJCtOdbQGhs1FF0ox5c3V3yzDs+vs4x0RZcgDg6RomsR0YGmXj6jTKXA/DHj9lujVfpF39a1m3vO/vf46bdArVm8UHi5gk1hiwVgIg126Ihcr0vf2Hu9aHRaGmrSDXF30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753758891; c=relaxed/simple;
	bh=4R8GcsJVqMbfH31bY9lzK2ZgGNRxBxNlJXxDWCGgKYI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ugcx4C4fS7FojNVY64KKWONjmCBfzgNyRGvtsJ+kOactclcXwYUkS2dHXmOTbqIFaPYYgf0ONmMnF4d/KseoXKAVBscYsoYD9CygbZ1S1ua1qOlNbyLvngzHgJnVhe3yx7OctatNH8yXgsCvrLAPMKQBbJ0HvGBM0g4RlzGtJfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=0gPJpvq9; arc=none smtp.client-ip=57.103.68.243
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="0gPJpvq9"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPS id B8440180024C;
	Tue, 29 Jul 2025 03:14:47 +0000 (UTC)
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; bh=sC97MWLobOh/S2qDxEqJvrCM9xsOzzvzOwHMArgbe8c=; h=From:To:Subject:Date:Message-Id:MIME-Version:x-icloud-hme; b=0gPJpvq9GIWB9lQIYyyY7S688ynFOZ8bBLnWcYnrLFzqZq81T5ESHgzIJMXttkTQdm268c7dtoCLcXaSNOls5DW5GLsouSlTHPC/Y4/3B3DEM7cJ3UG8VpiwFksQJSV6DMOD4wegUpB+EuJaZ75m0RajIb4m7tlbecPfpCMik3bVIG0R2DXPMtfd/GSprOOeREy9wtabsVQZo4EyOeXCeyKerTIaSo98bXS3aRgCUMMVsoL17YWeVbIK311ScZQgAE+8ZM2CiOsQyG9Jjj8Vif8FRGY1UKHFV936MVsidqrKl+Xx/Rb76ujeUpGxwdsE5RDvivtry75ke30g5R03Ww==
Received: from localhost.localdomain (mr-asmtp-me-k8s.p00.prod.me.com [17.57.152.38])
	by p00-icloudmta-asmtp-us-west-2a-100-percent-6 (Postfix) with ESMTPSA id 34D6D180027D;
	Tue, 29 Jul 2025 03:14:45 +0000 (UTC)
From: WangErQian <WangErQianY@icloud.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: WangErQian <WangErQianY@icloud.com>,
	linux-arm-kernel@lists.infradead.org,
	john@polyhex.net
Subject: [PATCH v1 dt-bindings]dt-bindings: debix-model-a: Add bindings for BT and audio
Date: Tue, 29 Jul 2025 11:13:52 +0800
Message-Id: <20250729031351.3875406-1-WangErQianY@icloud.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDAyMiBTYWx0ZWRfXwzx+dO4htl4w
 AhrHQ4R3N8JdKVBf6l4vhOGp4E93H7+OINGlzTxj8zUCiZoGuxxCj4y4zaFOSJpBM3l9nuPNWCm
 SeSGnxE50hTvzkQtsSZfB4TxObXPVushzfJF9fPygyIOLZZlcuxJ3Wj5ssKLkfLvfB+DHMIv7eG
 9wNTGRk2HCmYHYS46ufPHgU+jDx/IlfRbcBP4c+sl0ZesBzeQ5IDQ6Qyki+Roowh7EMkp+jdPpc
 KkXyN3l1cENhKukZ0EmbLSd5xwzIxnEHytFX/75FGs0WBVAkBITcoWyG+KHJm/D6HDBfC2qLI=
X-Proofpoint-GUID: akMr2Fnscu99z0MYAZvhzYhSlFvXBvn5
X-Proofpoint-ORIG-GUID: akMr2Fnscu99z0MYAZvhzYhSlFvXBvn5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_01,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1011 mlxscore=0 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxlogscore=999 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506270000 definitions=main-2507290022
X-Apple-Category-Label: MTEwNTIxNzAyOTk6JGNhdGVnb3J5JF9QZXJzb25hbCw=

Add bindings for Debix Model A Bluetooth and audio

This patch adds device tree binding documentation for:
- fsl,mxc_bt_rfkill.yaml: Bluetooth RF control node
- fsl,imx-audio-es8316.yaml: Audio codec interface

Signed-off-by: WangErQian <WangErQianY@icloud.com>
---
 .../bindings/bluetooth/fsl,mxc_bt_rfkill.yaml | 70 +++++++++++++++
 .../bindings/sound/fsl,imx-audio-es8316.yaml  | 88 +++++++++++++++++++
 2 files changed, 158 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml

diff --git a/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml b/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml
new file mode 100644
index 000000000000..b173de7a4102
--- /dev/null
+++ b/Documentation/devicetree/bindings/bluetooth/fsl,mxc_bt_rfkill.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+$id: http://devicetree.org/schemas/bluetooth/fsl,mxc_bt_rfkill.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX Bluetooth RFKill Controller
+
+maintainers:
+  - WangErQian <wangerqiany@icloud.com>
+
+description: |
+  Binding for NXP i.MX Bluetooth RFKill controller, managing power and wake signals via GPIOs.
+
+properties:
+  compatible:
+    const: fsl,mxc_bt_rfkill
+
+  pinctrl-names:
+    maxItems: 1
+    items:
+      - const: default
+
+  pinctrl-0:
+    type: phandle
+    description: Phandle to default pin control configuration
+
+  bt-power-gpios:
+    description: GPIO controlling Bluetooth power (active low)
+    maxItems: 1
+
+  wake-bt-gpios:
+    description: GPIO for waking Bluetooth device (active low)
+    maxItems: 1
+
+  wake-host-gpios:
+    description: GPIO for host wake-up signal (active low)
+    maxItems: 1
+
+  status:
+    type: string
+    enum: [ "okay", "disabled" ]
+    default: "okay"
+
+required:
+  - compatible
+  - bt-power-gpios
+  - wake-bt-gpios
+  - wake-host-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    pinctrl_bt_ctrl: bt_ctrl_grp {
+        fsl,pins = <
+            MX6UL_PAD_GPIO1_IO06__GPIO1_IO06 0x13059 /* BT_POWER */
+            MX6UL_PAD_GPIO1_IO07__GPIO1_IO07 0x13059 /* WAKE_BT */
+            MX6UL_PAD_GPIO1_IO08__GPIO1_IO08 0x13059 /* WAKE_HOST */
+        >;
+    };
+
+    bt_rfkill {
+        compatible = "fsl,mxc_bt_rfkill";
+        pinctrl-names = "default";
+        pinctrl-0 = <&pinctrl_bt_ctrl>;
+        bt-power-gpios = <&gpio1 6 GPIO_ACTIVE_LOW>;
+        wake-bt-gpios  = <&gpio1 7 GPIO_ACTIVE_LOW>;
+        wake-host-gpios = <&gpio1 8 GPIO_ACTIVE_LOW>;
+        status = "okay";
+    };
diff --git a/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml b/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml
new file mode 100644
index 000000000000..35f13d656caf
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,imx-audio-es8316.yaml
@@ -0,0 +1,88 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+$id: http://devicetree.org/schemas/sound/fsl,imx-audio-es8316.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX Audio Interface with ES8316 Codec
+
+maintainers:
+  - WangErQian <wangerqiany@icloud.com>
+
+description: |
+  Binding for NXP i.MX platforms using the Everest ES8316 audio codec.
+  Defines the connections between CPU DAI (SAI), codec, and audio routing.
+
+properties:
+  compatible:
+    const: fsl,imx-audio-es8316
+
+  model:
+    type: string
+    description: Descriptive name of the audio setup (e.g., board-specific)
+    default: "imx-audio-es8316"
+
+  audio-cpu:
+    type: phandle
+    description: Phandle to the CPU audio interface (e.g., SAI node)
+    maxItems: 1
+
+  audio-codec:
+    type: phandle
+    description: Phandle to the audio codec (ES8316 node)
+    maxItems: 1
+
+  format:
+    type: string
+    description: Audio data format (e.g., i2s, left-justified)
+    enum: ["i2s", "right-justified", "left-justified", "dsp-a", "dsp-b"]
+    default: "i2s"
+
+  hp-det-gpio:
+    type: phandle-array
+    description: GPIO for headphone detection (active high)
+    maxItems: 1
+    items:
+      - description: GPIO specifier (controller + pin + flags)
+
+  audio-routing:
+    type: string-array
+    description: Connection mapping between codec pins and audio components
+    items:
+      minItems: 2
+      maxItems: 2
+      items:
+        - description: Source endpoint (e.g., "Mic Jack")
+        - description: Sink endpoint (e.g., "MIC2")
+
+required:
+  - compatible
+  - audio-cpu
+  - audio-codec
+  - audio-routing
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    sai3: sai@40031000 {
+        compatible = "fsl,imx8mp-sai";
+        reg = <0x40031000 0x1000>;
+    };
+
+    codec: es8316@11 {
+        compatible = "everest,es8316";
+        reg = <0x11>;
+    };
+
+    sound {
+        compatible = "fsl,imx-audio-es8316";
+        model = "imx-audio-es8316";
+        audio-cpu = <&sai3>;
+        audio-codec = <&codec>;
+        format = "i2s";
+        hp-det-gpio = <&gpio4 29 GPIO_ACTIVE_HIGH>;
+        audio-routing =
+            "Mic Jack", "MIC2",
+            "Headphone Jack", "HPOL",
+            "Headphone Jack", "HPOR";
+    };
-- 
2.25.1

