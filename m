Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503CB2D193F
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 12:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468140; cv=none; b=BelVrkBtw5SP0ISkavKcXbxF0xNySnkKDwNwZiTbuqA3oNex4chH4CY19WhVNlJC0SRVDMTboIyd/cRiXtD2xpLSgGCzB3G+NWdLH8kDUuCdyjF1kE8lqHxXc/Z1cLN9M7eRn2j2hcm+uhFbD8tM2lde6kQuzdPm6Y4idZ5Ez9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468140; c=relaxed/simple;
	bh=Y32RvbFr/af/pdHIXN823cFtUFTcv8dp2NjgtWyB0Zg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g0J1qfVQvSJAtGk+84EH0xqalgpMammr7Wn0QK/GBb+sMRquyAtYXhyE8TghO8UgEXMlQC2juEhKDpSgQhj6BHknWXDeaouZ4a1/g98M2bTGLKjR1gwLmKL7NLVerrTRpBUCOOMYKjsyZy8K1dhMn/XYu1aC32imbONBXPdU33U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=bQEsztg6; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="bQEsztg6"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 691AF10A4DE;
	Tue, 18 Nov 2025 13:15:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1763468135; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=smDkM+qnkx77goobsmgyagOx751WJE7WAfknYflgUnY=;
	b=bQEsztg6GSwWEDqVmlDRAkMDvjkPSlFK7ey9Pm6WyC+bsVg4RUVKQa+Ur2DsC0QKZpzwtH
	9aOSj2eRBysrii3G2iVp7ONqM8nNwzXJL9khqLdwQZvHsvAGSRqwrsRJfzb1MHUTKl/4CA
	OdrvS3ymoOhTdnWjZPMpqnh3RVyvAfmAYJdeRTMLwZFh1BKPHLco1jOAR0PMF0PTjp2KqA
	iEakO/XKc2Qiw9HFxcmNOX4o+bbAvz+DgRfLZp5L39Ow7UmwHp/UYBxpgsgQLf6vWew5Zx
	BeB+CQ1NFsFDWGY2qBcbiKAYM9oiCgPSIZnlSki/Z/RNdEN1IkKCUab1LhKQLw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christian Eggers <ceggers@arri.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Markus Heidelberg <m.heidelberg@cab.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] dt-bindings: vendor-prefixes: Document ifm electronic gmbh
Date: Tue, 18 Nov 2025 13:13:11 +0100
Message-ID: <20251118121513.88352-2-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251118121513.88352-1-marex@nabladev.com>
References: <20251118121513.88352-1-marex@nabladev.com>
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
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 42d2bc0ce0272..375682063f53a 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -749,6 +749,8 @@ patternProperties:
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

