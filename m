Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4B2433D6D5
	for <imx@lists.linux.dev>; Tue, 18 Nov 2025 12:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763468139; cv=none; b=SNXeHwPGAgdQ6C5++hDb8b4H2VUSatiNwReaeFCcEwEDmfmO0IInQ9NN+46O1Ga78MTo4zVO4kqqUUdt9MLMJfH24NaGcDyPFz14XoLyM8Eq5zBQjn1ltqaUcxWSZsgP0o502W6odhEHq6tvtBcXRMCHnE27hB4Dq+tGZzsuBgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763468139; c=relaxed/simple;
	bh=KmfCJ4nG6BTW7ees9zJOTpmLw8Y9fFNPqxadb4oaQ3s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cyawQT1MYOxC4O9/hqOzyePTK5HOvGgP0lyp1y2PJSJMlMBbyegl7A4d+v0fCNsJwz3eTMTB7i99+j2qNrUko7uuwucLQC8q4FZlF0eGPGo/k5HJStMOAcw8PvTcU5J8PVpgiG2rm060cAMHiIeBniI622a0B+1Xtlw5OZt/d+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=cM+IEsiF; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="cM+IEsiF"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49A8B108C89;
	Tue, 18 Nov 2025 13:15:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1763468133; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3QJ1mTk7kGA2Mq/qr+t1f9JBo1ERwQoZHJ3mtEtKdkE=;
	b=cM+IEsiFFxyPJrmXrbZfStiEXUKUwtHgZZ/o2gXEuujrADPdFBU3USY8tz0rzUQfn/ESCS
	+f6JpVmalPLjCTBEo7b93zLKIp0a3XVRokmJpvgyffxbSFslRSQ9GEAA2cuNa3XDI52kfk
	nZm9CCZWxdSonPRz4aFNaaJIaE9nssn4CKupE4ginl0QpzuKPx+WH76xoBwSc6qiisHdtX
	RyE8ToD5SVVsYrGzmVVticwiFgvkC4Hfyf6zhjMCMtnmvTkWfqHA0bJxmLEjj7VbY928F9
	HMxC03mF+vbrkvrXeUhKHNbK+iEGbIKgMWykPpGlMnCtjeMBDvfCRMdlxilXlw==
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
Subject: [PATCH 1/4] dt-bindings: eeprom: at25: Add Anvo ANV32C81W
Date: Tue, 18 Nov 2025 13:13:10 +0100
Message-ID: <20251118121513.88352-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document the compatible for ANV32C81W 256kb Serial SPI non-volatile SRAM.
Although it is a SRAM device, it can be accessed through EEPROM interface.
At least until there is no proper SRAM driver support for it.

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
 Documentation/devicetree/bindings/eeprom/at25.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at25.yaml b/Documentation/devicetree/bindings/eeprom/at25.yaml
index 00e0f07b44f84..e1599ce109165 100644
--- a/Documentation/devicetree/bindings/eeprom/at25.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at25.yaml
@@ -25,6 +25,7 @@ properties:
     oneOf:
       - items:
           - enum:
+              - anvo,anv32c81w
               - anvo,anv32e61w
               - atmel,at25256B
               - fujitsu,mb85rs1mt
-- 
2.51.0

