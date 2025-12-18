Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B848D34D3BE
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 15:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071317; cv=pass; b=ofrvwHDVmnN8YPjlOX2M+oFyUZrm0m/+HEbF8EtXZn9hm14OjQ2GsfW0B5j4nEnD+DXvM9SWp3IXDM6sCYOLe5mZQZ+NgD98T99r7jMzKBfo94FWzKmOuYT9oJCWn+p94sNbzJiLZqmnCLYfZvNc8+vxFYoQpIE+j26nUP44yo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071317; c=relaxed/simple;
	bh=HFFh/0R1q/dM407ncnP63bQTvfvE8hZuOCGo9ES6MnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pRLFVsKGsdoF5kPIK8SqPsPKco7qygAJiDKXEF2nkc/fCGZCVhLtC8YVE57ipWGAHdYBi82Cmm66+J90YwLkZZzfgMVgCm7kvp5v2ePvZOuORdpwbPfOgfEFCkMtRH55UB7OVXUUOkvYPfPtL6OCNoHWARsTokFF4LQR3ySHbQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Ik4t2Wtq; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Ik4t2Wtq"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=k3AM7QmqkPS84tQuQ7++sP3E2X2hsG+zkS1II3xFrLY=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071280;
 b=B08m3OQi/2NvHVqPzSH8oPoEgzDnL55ZDU7pSIfay2ug586LZqOtnwGAV1J3ydvVT+r5DVgr
 SZbWSVRwv9BEskNJ35QPIxMB/MyLJ/Ht14mLvQTDpQ9hUAXZbKaHZESEn1bwvyRpLisleYzqeZV
 Zvrh0NFNR09lbTDD1fmLVCtMSYjayB+YThJSBjpwgHwKvDjqoynMhwE5LtjkAqurNx5dfmj4pHq
 vcF99/rNBaOuetEHruWcxKzJwjiWZ/5Km3HhuBxSjZiRJ9S6d6xYfZOenO4zvAx76jrvbRMRbDn
 raFeaATo9wyVHUZjmXlelzIZ3ncibpQtPj5wKXdURTRLg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071280;
 b=kU8EFn4SZsKdNhJwc1Oi+KKNOXvApTLqW45kV+qbmSF6X8jOXt1iSrYrb7+maFBV43g2Pr4d
 xfCoYi4jamCnotSDnXxq9j/s605/Fnd2VSYwpUKOwMa+65cxgX8cWj0kG0PpSkXeZburYUPw5gP
 E1WHQeXgwiZFZkZQBkaSqWq82+CNowUBmEzcBEKgJJYnQykqh0lmCMdhAyh8l4ZilFdBMKG8yap
 aCqwGk5uGaBWmrVZg2KDnF8lRsv9Lojh+4Xxrn3TftvWUg0kHc+kgPQy5dq+6UWX2d6uhbJN0jj
 XQ2MF/62+/5+dLNCB6VWOLWJtm0XuYgyCkUKvgdHUhCiw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 18 Dec 2025 16:21:19 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id C1E2ECC0CC7;
	Thu, 18 Dec 2025 16:21:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 1/6] dt-bindings: clk: rs9: add clock-output-names property
Date: Thu, 18 Dec 2025 16:20:48 +0100
Message-ID: <20251218152058.1521806-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4dXDry6fRMz3yXl8
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:79e50b13dc320d875aa9306a79dc5026
X-cloud-security:scantime:2.032
DKIM-Signature: a=rsa-sha256;
 bh=k3AM7QmqkPS84tQuQ7++sP3E2X2hsG+zkS1II3xFrLY=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071279; v=1;
 b=Ik4t2WtqGNKVTcPmS9UXP/b+RGNDru9FxdEOEQjiS5XeshCUNNUbSUKAeSn5rlGufbTB9oRt
 VTRON8KdsA/prwEF9g7ZJiO04NRwQW+HnapQ9B3qM5dMqFXFdKO59lI81LJqDmcQbOH75WF+i14
 +LDKKwnL7Slf1ouJgt2j6DRW4yaXcpMuTViKyUSaBCVrATI8LGkNjpKwSziw+GQRRDp8i7N9kBD
 g93meus3GSyLwLhkfbXYyEwmmJRvoZxdIW1fp8gUPtFYIAsL/0BX+2/pYR/Cj0+AfiSJGjYwlCu
 nh5AsAM+urjjG6/VRd5ZP2NOVJP7wJJAUMaTXltcMgz4Q==

Add "clock-output-names" which is a standard property for clock
providers.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../bindings/clock/renesas,9series.yaml       | 37 +++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/renesas,9series.yaml b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
index af6319697b1c0..5590f04147612 100644
--- a/Documentation/devicetree/bindings/clock/renesas,9series.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,9series.yaml
@@ -52,6 +52,10 @@ properties:
     items:
       - description: XTal input clock
 
+  clock-output-names:
+    minItems: 1
+    maxItems: 8
+
   renesas,out-amplitude-microvolt:
     enum: [ 600000, 700000, 800000, 900000 ]
     description: Output clock signal amplitude
@@ -83,6 +87,38 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0241
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 2
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0441
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 4
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - renesas,9fgv0841
+    then:
+      properties:
+        clock-output-names:
+          maxItems: 8
+
 examples:
   - |
     /* 25MHz reference crystal */
@@ -101,6 +137,7 @@ examples:
             compatible = "renesas,9fgv0241";
             reg = <0x6a>;
             #clock-cells = <1>;
+            clock-output-names = "DIF0";
 
             clocks = <&ref25m>;
 
-- 
2.43.0

