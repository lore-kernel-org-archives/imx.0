Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58D0826ED37
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767130453; cv=none; b=uqhbSRnm/GbM32DRFnzgasT99OEmjFc4CnTsCLqRPdXT+luKHbbOd0YpPzD3kd6lO7bUTGd8QlPsWxech/eWxfL7OX12L2pn6b+jiNT2OPBsg9EsyruCq9/U5MAJOv8CPxBC3msQE1iX7oLsQyhIWpb/u6JIcVXxj3TEC8z5Xbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767130453; c=relaxed/simple;
	bh=jZUl3fqmiRvTbW1Q68eJ4lmHW9cp3mOJ4Q6Tz+yk7/I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hytglVm+zheYgM9e45tNJp68StOi9sjz+F2pl5uvzb2PMTYXqGT7qWv/lOSjS/PUoxaa9wKqQ9LzEwSws0rSTUvr02uK1Sd5GQgiVLY1wVJJmbOxwOrk2FzRzvB1G/HmPA+8OVKPspF/43Fbwo2sxbunNZ0/UVej2CPP3ha3hL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=feCyRv8g; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="feCyRv8g"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0E06C10CE10;
	Tue, 30 Dec 2025 22:34:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767130448; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=/Gjn3oqy9OjFO4s5fRfwjo9zSIrIF7mEfoAx2CsF2kw=;
	b=feCyRv8g5EkrySN3oN+JxpI/pWsJeFp6Jk8jH4aUwgpnjfziTvcDGABcUVPJsgOxX7ZVGz
	ERSzCRBS8s/fHEgY41wDlgzDNjZAbc9fLEAtBCoxvtjZO2Q3Ja1ibJ1qkYvLXV8RjLfwx8
	IqGY+0yiXRZqGvZj37VFwYLSbvMyoIWX1XJTnfAiWJkWDRVfIp/fMr2pOKGNjC8zfKsjtB
	9jJoeQysxkv5RFlVxt9EyvKdl8s9vuNMDOXJs1cAtjG3nfyxY64FENKEuLPrM3mFz2tEvY
	MdhQu0qfigJyWiBrMzRTkuK1V4NoYYsS62bn8SyYNJc+JLdZhbJvm75Y/NpuUw==
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
Subject: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Document ifm electronic gmbh
Date: Tue, 30 Dec 2025 22:32:31 +0100
Message-ID: <20251230213401.219808-1-marex@nabladev.com>
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
V4: No change
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

