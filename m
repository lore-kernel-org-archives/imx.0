Received: from mx-relay31-hz1.antispameurope.com (mx-relay31-hz1.antispameurope.com [94.100.133.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACA7355023
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.133.207
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071325; cv=pass; b=hxU4YI5oZj5mZ/7AvBSVf5AjQoZqJw8Z8+eEoX9+nvAoCu9D7ScuFnzJt2BJ7PyAqkYKEB6Lp2AWLil7f+RGtfsHTImy4U/i2J0mFReRSJe4jmdYeOgHMn4CExjOu+jxWG/sOdIKfTPNrwSCHbzD+QfOkNf/XGpvXaWLOXm2wI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071325; c=relaxed/simple;
	bh=xU+o4EwdFkRdWDIg0E/QjC9yBED5TOlSry1ayU8ef1M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OkfwK8VBt+WEwqE+i8iGPV0rNSYksAfaeLsGgbsYWR1XDFEBKRqljM6PnfgCkMfLqeWWIpjGkFJksdlSFap0qmGuHn4M67yrLvDPRqnDwXTlTGN6Tow4t1uabVjXy3i9sjh+jPC9ai3yShYQeXhSv9wmEbVvOxGx92naFhj0jlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=SAgsoaEq; arc=pass smtp.client-ip=94.100.133.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="SAgsoaEq"
ARC-Authentication-Results: i=1; mx-gate31-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=FI7PYyPGdjJp1gXUMedmlj7NmwLyvXozNGGHThu/Auc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071280;
 b=Ew9mIfrXUFbSCHid7icnKucxMlZke3BEB0IOdyiKpEOCRhAkwEMf+Vj8l2rnEDX0C/SvkOu2
 7QRdRpSyikYjg379mFSEU2+vAHNiu/gsIFYlXT+s2GexEzikPkxEPy6F+u30DTXhKUErOqRMzg7
 9UH6TJOzuhsfUalaUHkVlGgcfVziGCpSl+UleFEtJt8eP6+TCkP1+IFP0+O2oxeeZK8CiBBlfDZ
 NYXsJdSMXXiFs36YRLDOTliLp8YA+8hg0zgx9So+eD8WBi6q6+/BkZoxV+BJpOQASrlSRP/EbL3
 IIYzl6oA3Ex6LA/ZGlzpUFyAJZObMx9lXyK4IJ9loGTOg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071280;
 b=L2NCfb7fJAJpoQtEYPdifNfIqYwgE9f+CEZx/pcnuJWJtw6EGjVV6+cwmQhHLiS/BdnIvPyh
 SSR7gyTSBZ3NeZF3td7Cy8IPUM4Xr9thiEX7PJzR/mt0/UTQmK9JSjXwSxaHSdlsCRsJuj/CQ3y
 rLobFAYUgavvh8+AwOVOJHY9sGe4hIb5TzJMEOWxCbGX74GI0cOL5yj234MpXnE+kvH/Pk9PsCT
 7n+IPaVl9FUFZixtiwj1g2hjdi0NTunYXwDjIpVzzVMzKI5OvkL5lj6TBjQuWfbjKZeXB+FN+k/
 GykducGbpSrz2VMznl3IIHX6/abgJBEuqOCRPUXa4ThwA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay31-hz1.antispameurope.com;
 Thu, 18 Dec 2025 16:21:20 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 54C12CC0D30;
	Thu, 18 Dec 2025 16:21:07 +0100 (CET)
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
Subject: [PATCH 2/6] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Thu, 18 Dec 2025 16:20:49 +0100
Message-ID: <20251218152058.1521806-3-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay31-hz1.antispameurope.com with 4dXDs03JbGz4HPhR
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:4d69e4e769c0d457f96290f5ace7a8c2
X-cloud-security:scantime:1.856
DKIM-Signature: a=rsa-sha256;
 bh=FI7PYyPGdjJp1gXUMedmlj7NmwLyvXozNGGHThu/Auc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071280; v=1;
 b=SAgsoaEq/kziGhYULHmRtVUNGURkPMndMnTIMzg6xrimwd/W+/lEGfkSvnwDctYB3K6o/wGw
 bQfc54SZwHSsM4DR8LN6B6hxfSRz2P3J8U9Fgq72TpVo8LoQpyuElkVEuWOdj7tqdGXuizHLIK3
 FJHp7ZZQqM8Pjb+boxcgLKBxH1jW1pjwxucKjpkiGZo8o/JnByEbo+LhAMWigjyacuAEAhD74a9
 l3F586SBKuj813gD4ZagmscjNVRvgZ5ymvl3Qusm6XjsyLnduis+gr20YvFGoPlb2EkXN7kuEcz
 y/0hhE6mK4toxb4IUJKSpmaeW+4e8Zak0lKir0PURdASQ==

Reference usb-hxci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..1f7f0adc3b1ed 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,17 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - if:
+      properties:
+        dr_mode:
+          const: peripheral
+
+      required:
+        - dr_mode
+    then:
+      $ref: usb.yaml#
+    else:
+      $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0

