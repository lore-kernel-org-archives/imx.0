Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9E21E884D
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 10:02:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729504981; cv=none; b=tvBfKBMGUhr8ovvBC5qluA1wZgKppEkGp/ESZLJARRNJnP/nxhK5SknUe8XeLyZAV5+5mTm6D2+UrjN4rccVlUu1Y52AUmPxzD3yPR92INNKC9c5B+cydzUkisTBGCUgRYH7z4vWL53bNlymqGdmVv43ca5rkakfIijqlnfsenY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729504981; c=relaxed/simple;
	bh=6GUTLhMxADC2p7D4IaQb2D1OfDYEOadNM0bWrkEZ3CI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=m5s4YYe1oHvsWwphbuAdZaKLXxVYUBwP9cWg2TAwp0azEgeuMZLMHsW1ZqssLtC53kQmWED5a9PZ0lNTtSfb9BwurUKLPPQ44Ifj6UfaDG/wl7Bz0AcOefhl9FOHLBQHdXqEJ1HQhIRwSqb4eqR5yJfgOt1KHE080SKxC7+qozg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=OY/Cdub3; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="OY/Cdub3"
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id AAD9B88E61;
	Mon, 21 Oct 2024 12:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1729504972;
	bh=L9t1eLCCSP1DToTmoQEkq5og456j4kSOQ7rvbEPgzzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OY/Cdub3llZbGCtguEur0MhT00i0/cuJCL92aifJYo8qVWCSIkyRl9OvfDpd5jZz4
	 ALbh+zhm4YLBYAgEgtVJFsOJe/G3+TwuUgVrBc12n/LYWaTMKM/qHERz/XOvlJEz5Y
	 x4QR0xPrNClyVfWj/3L7Mnghj3N0O0c59iFs2xL0RQtU2gUYx5mefQXE9Rr0XR36lC
	 Lh6Oq80dAHQQdfvBf0TxAA4zH7n2Iseehv/S2aj531/G6fEsNoz7mO9F4Xg+x6SADg
	 U90vHzbQS/cRsJou+g+TLjoIAqypyOdfinukWWVGiZNl9f8S1TKXzIZsBZ/zqCtsjY
	 T90z9+CBkBgmQ==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH v9 2/4] dt-bindings: display: Add powertip,hx8238a as DT Schema description
Date: Mon, 21 Oct 2024 12:02:22 +0200
Message-Id: <20241021100224.116129-2-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241021100224.116129-1-lukma@denx.de>
References: <20241021100224.116129-1-lukma@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

This patch provides the DT Schema description of powertip,hx8238a
320 x 240 LCD display.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---

Changes for v9:
- New patch
---
 .../display/panel/powertip,hx8238a.yaml       | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
new file mode 100644
index 000000000000..7b4557ef6b74
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/powertip,hx8238a.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/powertip,hx8238a.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Powertip Electronic Technology Co."320 x 240 LCD panel"
+
+maintainers:
+  - Lukasz Majewski <lukma@denx.de>
+
+allOf:
+  - $ref: panel-dpi.yaml#
+
+properties:
+  compatible:
+    items:
+      - const: powertip,hx8238a
+      - {} # panel-dpi, but not listed here to avoid false select
+
+  height-mm: true
+  panel-timing: true
+  port: true
+  power-supply: true
+  width-mm: true
+
+additionalProperties: false
+
+...
-- 
2.39.5

