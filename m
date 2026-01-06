Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99D002877FA
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 19:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726125; cv=none; b=qd7T3mBjyn1YzajRRTBHsiDn6WQ8SGsLgUu99qALSS5ltkc41vQBvErzHQvZGli81KwYv41bWjaDENuEkTpsYY9EYf6afFE88ltUs+Wun+wtDf5N9dEfWeTF8EERPoWbbFPQPgbKrjX5DIv4FDDPiN9hQOsSNs4VJTOZjwQA3CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726125; c=relaxed/simple;
	bh=hH1dCOelK9GaWjZVltJv5LlMdnEaGoRbnJpYAzfnPRE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dQKdFWb0pSMR/dpVmjMTixLS6CbZJkZWA5e7Oj9Vsn93CN64/YSB2L0VKwljAlRicQ9bJlWINRv930/hS5wwzA+4GiJLiV0WbyVIfsWpGNP/EofDUTuwjoftUWAuNM1/rX5SdXl1LJ+bIAqJHCLW9h8haRbnSiXqbqWPII/jKJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=NsCuBFmO; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="NsCuBFmO"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC44D10C890;
	Tue,  6 Jan 2026 20:01:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1767726120; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=aRgrbo6n3iOCeuFOYLFvIl5m9rtIDhGgdVRtfMF8jck=;
	b=NsCuBFmOrRrhami+0SZ94rGuFJXk4aW+LsUaTWVqQKcENzGcHzwuiBqywLxb1sMRvxOOdt
	RA8aUPoJ6xA32mAfQiFjSFZtEPiqlmF03UZbqFZZDwxMHT36XwhP2EB4pgvRl+HFyN8UXJ
	mnOUGn/zmIde+saxBFiA5k3tEso2hKFY+7ErXHJe2lwrky3u6XSAN5lNvmhqL9fvmXvPqx
	vVYty5y0BBa0Z1DuFivxkdgFzDlEivKomK3vF13PL1/Pg0yznLw5/J4hyktYWtDBN+FOJD
	LZAp4dK5lqvgScsq1nFmAK7Adl11KeoPAbI6qZ987S2HIQMRnWAh51tAfYJDDQ==
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
Subject: [PATCH v5 1/4] dt-bindings: vendor-prefixes: Document ifm electronic gmbh
Date: Tue,  6 Jan 2026 20:00:37 +0100
Message-ID: <20260106190147.31924-1-marex@nabladev.com>
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
V5: No change
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2de0af95f5e6c..3593467c280dc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -757,6 +757,8 @@ patternProperties:
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

