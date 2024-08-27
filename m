Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF37417C96
	for <imx@lists.linux.dev>; Tue, 27 Aug 2024 15:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724771791; cv=none; b=p43U0hatFrCR6tkbAzmBzr+TXOyRpHTmhOTQ+mjuumu7QVfc/kHXVYikSq38NB6m8hbG9nKUSFvpvYWYzXibcvSfRZbKwHBX8uRS5UPY5rRp/FuIUlpi6g3j0vu9EQ8lGP7/6bhxDTvV5SLeY3ZODloXbk/vphGECgk4oQnR/3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724771791; c=relaxed/simple;
	bh=5Ojzie+qyKcty2bJRnrtVYfM7dmjj93SCwHh+NFBz80=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ByouGOJXJS7fASM5m6YBlCQd4IpI8hyEevjUzitJMvwRKWbGcPLvNdKk5svGFFWE9PzNBvzOKchdxOGnPYqlUIqEA31a9AapbUTBEa0UDT3f5/X4Z+Ghsqsp/KeKwT293BTB2wBt7vGEoWi4pc1TOnYa+KrZiVJ7bwcwURgEg6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Y5K8yEP8; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Y5K8yEP8"
Received: from localhost.localdomain (85-222-111-42.dynamic.chello.pl [85.222.111.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: lukma@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id B298087FA7;
	Tue, 27 Aug 2024 17:16:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1724771788;
	bh=XrbQYJ32a8CnFchpdahZdNHDXwIROgDJ5nvQGsFAb2g=;
	h=From:To:Cc:Subject:Date:From;
	b=Y5K8yEP8AzbISORBJmAmrl4F48EJ71Aq3Ccf9E41o+ip4wyTBWdLpFTBq/qgC5GPb
	 +2utTLwipBUh1lnFm07w5AURjJlHAE/ok+HUh4mnUCqaybvnZsQ5rK9bHyFToxqbVc
	 utft2puKKRH5mJjNqyMupzfq6uy260K1CUG7UjGPoRnsP4lGXEyEDlq9s7Rg/jEnMj
	 rsMbxMwSuUVE7EM1QGQmpCQtzpbQiyTa7zsE5vx5lU9gIitXT2FcTt3/FPDktwqbEN
	 2b7Cg27hO8TWEG94pFDwukqpUGttKC/KFo8qaEWpxBH9T+aRwSQU/2F0+hfDBFAa0v
	 hj6FudUwbNXuQ==
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
	Marek Vasut <marex@denx.de>,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH] spi: dt-bindings: mxs-spi.yaml: Add clock property to mxs spi controller
Date: Tue, 27 Aug 2024 17:16:16 +0200
Message-Id: <20240827151616.2256401-1-lukma@denx.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

The controller can have 'clocks' property to assign correct clock
during configuration.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 Documentation/devicetree/bindings/spi/mxs-spi.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mxs-spi.yaml b/Documentation/devicetree/bindings/spi/mxs-spi.yaml
index e2512166c1cd..4790d7b37efc 100644
--- a/Documentation/devicetree/bindings/spi/mxs-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/mxs-spi.yaml
@@ -34,6 +34,9 @@ properties:
     description: input clock frequency to the SPI block in Hz.
     default: 160000000
 
+  clocks:
+    maxItems: 1
+
 required:
   - compatible
   - reg
@@ -51,6 +54,7 @@ examples:
         compatible = "fsl,imx28-spi";
         reg = <0x80010000 0x2000>;
         interrupts = <96>;
+        clocks = <&clks 46>;
         dmas = <&dma_apbh 0>;
         dma-names = "rx-tx";
     };
-- 
2.39.2

