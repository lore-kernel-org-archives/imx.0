Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F1224290D
	for <imx@lists.linux.dev>; Mon, 29 Dec 2025 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767037554; cv=none; b=N94SWNcbqMAFRw0KV33EUb6wh3DfF/D+Zfu5s83sC5B7vrACdquLtBQoCTzOkkuOV1TkpN3nv5+q+weUWBfyCB/Ppkt/sYGP80xNyRsaCatVo4LHoxrR3aGDmekbEiMcwMl2nkIVL4jrNlje8ZEssbO638zI7NV188FeKZAu24U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767037554; c=relaxed/simple;
	bh=sbIM4YlH1nh7EUjxjo+Wy36IhEegUNyhGZHXH5sUGvc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hfM9WSb1EB7/IUHni5b/ldatVEtLtAudHOaqclAFzw096gcjb1aKmI5n7+9Jco4USdP5PgQQedJCj6uMUsfAFxDr+hbFgRPnx3xPyW3CKeiPGnzDBAPDoAn9YbtqOYye1khIwweV+4nY3kl9j7/WDYgvbObifIBbfHRDUN+lXxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Igk+UkBf; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Igk+UkBf"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81F3710C945;
	Mon, 29 Dec 2025 20:37:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767037063; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=dlBkIkIwmLP4XaJLbd5cT08BMuNuxJZeyyiPyluexDg=;
	b=Igk+UkBfE/uGQo8BqCGV4BGjDzVaWoYp9+4kijhlLKRiyJPVwZJrD7pXeTty3DuUkw2Bwp
	+DIkgiY3axR0idIcMn6iYDdn/EnncE7r4c2icNluEBFndFu3P4aA2ecDgTm3v+tnSGgp3u
	iMn6DGlrPjFbyZBR4sZa8bfeKHid327H2w/1i3UJEh/hYQiCnjRNrCD236+bor0kGpBXkv
	06ZsutgtCCkhtQCw91ReJ0Rtakin9G74xIdOGNIxJemBSG9xoYNd/6+4NG+DAuxuxeaiJl
	Uw3GNehfT88it9Z+2Tn61BhQp+hGDgIS35m7KsSNvekiXv4vhMFofLKDsYsB5Q==
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
Subject: [PATCH v2 1/4] dt-bindings: vendor-prefixes: Document ifm electronic gmbh
Date: Mon, 29 Dec 2025 20:36:40 +0100
Message-ID: <20251229193706.73564-1-marex@nabladev.com>
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

