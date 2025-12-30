Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939DE26AA91
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 18:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767120108; cv=none; b=Jcv0katVrDNj4mBG2iBS2R8MPpw4fh1h1K6CTIhkGjr47ZkWxrB/iFw3YBQOYzAR1Pl86NIg3AMDRobTR1hQfsJhXlEcf1I20HDHUWlPFjXc42/DCbvZgwMcOMvYdplUF+A1oImbyBzpQGRjjn8uw4gS/xxTcdL78cPQ9a4J6Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767120108; c=relaxed/simple;
	bh=4FOk74l07LXX4/V04gZ20LkddsRNplTWWyIGECDZOt0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sjpnfKrPm4eIuEKh8gehQMrG/9FLH41Abczpw2YGcLCKpTo+syu+sUs24/kaoqIK+AilsrfbcLadHaqsCmq6Gs2LHWboyO/NkMsXxlDjqSWeBLKDgjhM0FBYVYe17+GbjySIukOONAbtakx6mrelPfrd5bxlyi0OmNngMUdeqG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=EQYva5jp; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="EQYva5jp"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AD1310CE0D;
	Tue, 30 Dec 2025 19:41:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767120100; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=sKAWQtiI6fcKK1CPnFf9r2mhvQELHnMUqqWwuv8iWHw=;
	b=EQYva5jpfJaE03ZI3iRv26/FbNQkkRh1c1HF3VtffnmS50TfqNst9ksOhUW34tCcs6s8C8
	/sh9NNIG1Q9+rhi+ZkYU30HlUawDwB7fkoQkBi4bCTaRfDNgoNYlBB/7exMO3EYI+GhQcv
	UsveXMrOVpr62cqg3vJsuA86JuzuEk9ca1CitjCfkJbJ6NyMKzTLQrYVeFIEpzLD+uD3E2
	hOOO7Of2iBbL9M8+uY+CnZGlUr8oVqPJM8ihvDZhJw5cWg8mlzKEz+x4usb8X/E9bWu1qM
	pHqS1KAFTDlHhSlHyNEYwG1tyWL/B2WZu24Q2W5eR3ZlX/hvKcXHkXVhopYOhg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Document ifm electronic gmbh
Date: Tue, 30 Dec 2025 19:40:58 +0100
Message-ID: <20251230184121.52635-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

ifm is a manufacturer of industrial sensors, control technology and
automation solutions. Document their vendor prefix, which is already
used for ifm,ac14xx and other powerpc devices.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christian Eggers <ceggers@arri.de>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Markus Heidelberg <m.heidelberg@cab.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Add AB from Rob
V3: No change
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index b7c6c528e0185..70d99ac01aa34 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -755,6 +755,8 @@ patternProperties:
     description: IEI Integration Corp.
   "^ifi,.*":
     description: Ingenieurburo Fur Ic-Technologie (I/F/I)
+  "^ifm,.*":
+    description: ifm electronic gmbh
   "^ilitek,.*":
     description: ILI Technology Corporation (ILITEK)
   "^imagis,.*":
-- 
2.51.0

