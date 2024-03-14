Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78EE96EB6E
	for <imx@lists.linux.dev>; Thu, 14 Mar 2024 15:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710428406; cv=none; b=L8CQGihE84Hgzc7Vt7+1LCfPsT9oigOoFWxD7NCUyfaJ5glh48dx2N94D/eFsO5spM5QHjWZJMzHJY51THVUJLfOQh65jubxLXpxikj1kHaKcNjfhmVUIvEP96ZdloYa6Fg0DZP+chUTnyjaTQ4Ig4OTLYLwy5s66VmjT1Hqo7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710428406; c=relaxed/simple;
	bh=5mrcYhUAuS8aHhbp+4i2PfKP1o71+XwEUwhBGn4mANw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DISLOm7xsMxB1qGn7OFSoOST0cN4sZxMdszoHGumxMkAbgRUXU4rsB9IZ1g5OcuL/McQA9fdxEh2++LeP8OlOrG8JUUEmA7kl+W6AUM88LWfH0C4FbDY8qVw8CILapAg7PeJD6wFpHjFPr9pB5II2KYMIE1Sla9zt/ajIPKXruc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=gSyslYjw; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=hn+BT1yA reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="gSyslYjw";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="hn+BT1yA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1710428402; x=1741964402;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=X86tydP3lQzpr8Ze9mLK2TNuTfB1VCl0UWZMPMko9c8=;
  b=gSyslYjwrvTRkKi0peFUOatnsHCfH1+IQQ5EvWe0ScK5D4ECcJELIdZk
   wAnf3VQTar3rUgMy3Qr+1UUhpz7zX1WkPBbIYzmu4eFP6zmW/hToP1YmW
   Cb0GdIOsd55f6SdxF8tTIDbP1SY67e51xpP93YBE5zrXiijv7CfNQdaNa
   PQDH0evNMrjBigahI+LHV83pJUNTRXyytmOH91AoE48h/CSks6PPv4oQg
   zT/RHo7YNhEUjf94YEpYvCRCmPnUMbyOPUtL7QovNz36JLGbKIBmNYp8K
   caTKHg+Rqj7dHthl71JX3btraptl/PmKACd6q2Gr72TRD7Blq/Xb4f+bf
   A==;
X-IronPort-AV: E=Sophos;i="6.07,125,1708383600"; 
   d="scan'208";a="35916670"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 14 Mar 2024 16:00:00 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72D0116FB2A;
	Thu, 14 Mar 2024 15:59:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1710428396; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=X86tydP3lQzpr8Ze9mLK2TNuTfB1VCl0UWZMPMko9c8=;
	b=hn+BT1yA0G4BV4/sU+yZ4GiwUyBiwwnNIGDOjgGdJb5KHAtP0ubJrUwEqyG/8e6w9G3nsZ
	26lqIJLLfEDp+l2cwZWlMAuP4uzthvGYt5X3F13M5FMY7FIA9S5/f/L6qPWYvIEZRzh5Mm
	foCuNDfYgU8O4jj/dJMEJ4IM3X87fI+2IfyTPXj3JxDR+0xp/sfuST4UltH0LGwjucsrk8
	H1l18SWE8fJ1sX5Ur74Kf8JWjDS5nPAJK+VzFwudvIabGIzEnfGR3G0t31aZUWoITUYIsT
	ZJsQNZS41oCTipaINvMADsawJRcwhAV35wHL/fNtj8zWpxwXb69fEhssqBt/cw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] dt-bindings: soc: imx: fsl,imx-anatop: add imx6q regulators
Date: Thu, 14 Mar 2024 15:59:53 +0100
Message-Id: <20240314145953.2957313-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

imx6q has additional regulators compared to imx6ul. Add them to the list
of allowed patterns.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Commit 465c7756d1ff ("dt-bindings: soc: imx: fsl,imx-anatop: add binding")
only added regulators for imx6ul. I'm not sure if this warrants a Fixes
tag.

 Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
index 5a59e3470510..c4ae4f28422b 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx-anatop.yaml
@@ -43,7 +43,7 @@ properties:
     $ref: /schemas/thermal/imx-thermal.yaml
 
 patternProperties:
-  "regulator-((3p0)|(vddcore)|(vddsoc))$":
+  "regulator-((1p1)|(2p5)|(3p0)|(vddcore)|(vddpu)|(vddsoc))$":
     type: object
     unevaluatedProperties: false
     $ref: /schemas/regulator/anatop-regulator.yaml
-- 
2.34.1

