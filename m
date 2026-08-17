Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31BDB3603C0;
	Mon, 17 Aug 2026 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786955729; cv=none; b=INKp7P7eVHPgIcZo16trgTHGy6VjeIRfZjuKBehvlGbWzm61T7pWdcor/zB9tG56uD+NP9VOl1X4Zam1H73b7CF6ybAkjKrmnQtEhjOifrqNnq4Qf48AJOxcQsyfM7I8bqzd5bHHlWvJO74oGZyVDI7NoU6n7t1PHB1NLKMa6qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786955729; c=relaxed/simple;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bKDRp6TBxexGTrc3GWQAH1JDcmG4QdjDKYGvCVJEep20UscqcUmZMRYgUB5LSBKp6lhs0RtWXle+Di8GmIKCqIR5jNSjDvjMw66FCzcwh8kv39LMAgtxwlBWFFmRacunp/hdTbbVEAewAEBTS2Ry7eWNNqE5cvYtGWy8jzjuZGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIIe0gr4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIIe0gr4"
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDB48C2BCFD;
	Mon, 17 Aug 2026 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786955729;
	bh=WweNHDHiElH8o82jk8npSceeFRcm3zMBKegXgf5E3CE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uIIe0gr41Z0bHrPg/bX40kzkJ8x2RCyNfjo1GKzO8CwRxB8dc452Fo2AqLLH0swp7
	 Ohw7N+S71AzlLQTrK4f72F5x+ql9SxqToaUGe7ri5ww1Yb8GV9qaVJRhRK9MPiVOgv
	 iUgdcoLn1MVkPuG++b53BGQEckyKOeCJ6Kn0NzC3/jo0ilbFM3rgleGjxDuQym0/mG
	 UoDWzBEDe1FZp/51bfr/26JxJnE/wXkBXDk6qLHw++yzt58qgEL7ulfws6mjMU/d1E
	 3VaKUlqCHccPG0QXTkJ9DZ9/bhWWkdpR2Ff9LllzafriwKO+0wAWqBvRkrxs3LamGW
	 Gd0zOPNCnLPvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1E25C5DF77;
	Mon, 17 Aug 2026 08:35:28 +0000 (UTC)
From: Pankaj Gupta via B4 Relay <devnull+pankaj.gupta.oss.nxp.com@kernel.org>
Date: Mon, 17 Aug 2026 19:36:00 +0530
Subject: [PATCH v36 2/7] dt-bindings: arm: fsl: add imx-se-fw binding doc
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260817-imx-se-if-v36-2-45c42847bfd8@oss.nxp.com>
References: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
In-Reply-To: <20260817-imx-se-if-v36-0-45c42847bfd8@oss.nxp.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786975564; l=3245;
 i=pankaj.gupta@oss.nxp.com; s=20260817; h=from:subject:message-id;
 bh=T+yyPOpdxzPdIuNJ+imfCdmSEVDwuOuBb/dhiIQRNpY=;
 b=DL5arKrrRlPdjtHO9ygrtrOcZaBktrSRa3wqJx5l8lMCxp8zwHQtAP8quVJC43glcvbwY19Yk
 8j+/3TlSEhZB03JlWYahEY3CZh+zkfWcVyHy2lTHi/q9S2svSjD1xG+
X-Developer-Key: i=pankaj.gupta@oss.nxp.com; a=ed25519;
 pk=g4ZgzIWbpXnSxRsoH+l6PWLP78a+Mzpl8e6RQe74d5Y=
X-Endpoint-Received: by B4 Relay for pankaj.gupta@oss.nxp.com/20260817 with
 auth_id=955
X-Original-From: "Pankaj Gupta (OSS)" <pankaj.gupta@oss.nxp.com>
Reply-To: pankaj.gupta@oss.nxp.com

From: Pankaj Gupta <pankaj.gupta@nxp.com>

The NXP security hardware IP(s) like: i.MX EdgeLock Enclave, V2X etc.,
creates an embedded secure enclave within the SoC boundary to enable
features like:
- HSM
- SHE
- V2X

Secure-Enclave(s) communication interface are typically via message
unit, i.e., based on mailbox linux kernel driver. This driver enables
communication ensuring well defined message sequence protocol between
Application Core and enclave's firmware.

Driver configures multiple misc-device on the MU, for multiple
user-space applications, to be able to communicate over single MU.

It exists on some i.MX processors. e.g. i.MX8ULP, i.MX93 etc.

Signed-off-by: Pankaj Gupta <pankaj.gupta@nxp.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../devicetree/bindings/firmware/fsl,imx-se.yaml   | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
new file mode 100644
index 000000000000..fa81adbf9b80
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/fsl,imx-se.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/fsl,imx-se.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP i.MX HW Secure Enclave(s) EdgeLock Enclave
+
+maintainers:
+  - Pankaj Gupta <pankaj.gupta@nxp.com>
+
+description: |
+  NXP's SoC may contain one or multiple embedded secure-enclave HW
+  IP(s) like i.MX EdgeLock Enclave, V2X etc. These NXP's HW IP(s)
+  enables features like
+    - Hardware Security Module (HSM),
+    - Security Hardware Extension (SHE), and
+    - Vehicular to Anything (V2X)
+
+  Communication interface to the secure-enclaves(se) is based on the
+  messaging unit(s).
+
+properties:
+  compatible:
+    enum:
+      - fsl,imx8ulp-se-ele-hsm
+      - fsl,imx93-se-ele-hsm
+      - fsl,imx95-se-ele-hsm
+
+  mboxes:
+    items:
+      - description: mailbox phandle to send message to se firmware
+      - description: mailbox phandle to receive message from se firmware
+
+  mbox-names:
+    items:
+      - const: tx
+      - const: rx
+
+  memory-region:
+    maxItems: 1
+
+  sram:
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - mbox-names
+
+allOf:
+  # memory-region
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+              - fsl,imx93-se-ele-hsm
+    then:
+      required:
+        - memory-region
+    else:
+      properties:
+        memory-region: false
+
+  # sram
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - fsl,imx8ulp-se-ele-hsm
+    then:
+      required:
+        - sram
+
+    else:
+      properties:
+        sram: false
+
+additionalProperties: false
+
+examples:
+  - |
+    secure-enclave {
+      compatible = "fsl,imx95-se-ele-hsm";
+      mboxes = <&ele_mu0 0 0>, <&ele_mu0 1 0>;
+      mbox-names = "tx", "rx";
+    };
+...

-- 
2.43.0


