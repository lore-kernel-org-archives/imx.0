Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501451;
	b=wVOS74Un3B6WH1d7NrrRIfdXqTL+DTRMtzW+MbqloHsU9qLViu8paxMuo723uiVp8Q7Q
	 zTR62Lly5v42fMfY4xlLXXCPZtz4RNeX1KsX/1MeKSCrZ8AacPrPisOH1XvGaeChu8dgd
	 7/2CXzbR7bLsDQjakgDsVjqmEinsZtiDofb08YchDAwNXdbRJUJJfVwbFmuC+eE3j8TJB
	 g8S0Jz9uh+kH5zcEs8oJd75W4oXNIUTX/JGof/E5qvHAFIer137BS5m03ItA2EcVBLQ/3
	 tbfeaZwmPXP5nweqpmKE3VlaVDRsi4P1kelWmLbN4Zg6omtD4UNn3QeKHrT3DEIeZKg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501451;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=FqXsbXaCFmPnB64KL5JcY5o6vyw75pQUZ8BpYM+BYNA=;
	b=2bbexvZaBUCUwhXWvEAakn6gpPzBhEZHXXZS3B+/mOl9fpWmLYDtYF6qFBVdik67Rytw
	 M/yGfAlq+5M+OSjK0+RreDMJ6LC3B19X/xCEhMiom6l45hT7hi/N4CzCnbranbzq7e2aS
	 S2ZV67wwbcYPBjW2gYoWpwDS8zqH8b+MWhm+9un9v/qtCIXSIJaNiDHcAO5nbm93M6DAy
	 Ji6hPVABxzVF5pctBiCLmMj0NJ+n8hiNYxLSF5Vau+4ADS2jwl0G3kEctd8mja1IdjKii
	 iNJH5mro0QpPGvQ8qoYCJqf+rrGMmCX178DANocEyWOiymmY7LHnJAB2OYtS2k2x1MA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=hcZ1xmlw;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C86606A330
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 16:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56C86606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=hcZ1xmlw
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4F7B310CC72;
	Thu, 12 Nov 2026 17:37:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794501445; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=FqXsbXaCFmPnB64KL5JcY5o6vyw75pQUZ8BpYM+BYNA=;
	b=hcZ1xmlwW+fEVZIeg8n+iS0iBpSHFgxMMx6Mcg+ba2LuIZoqhUBzXSvrOrEG/17VoyCEZ1
	mAnfJFEMPTAfKCXnDliWyXcuXBNK5qIVzsTBWlkJipsykm5KgvukgPJcLB8nCTIanrUl1Z
	wGAnb+/5MYIf18rcdVOZaJYFAPg8Gbp0LXprRaosky4BMb7IFulrHyIBKLI+oi+rJ01hg/
	zEEo4PG+yYZTRJx1hMi5NyyQaL7GP8BKVeJNXmzV8U2zBRe6UhUg8fmaQVKsU79QqZbsP6
	ePzNbqBnKM+nD0Z5Otk+Y6sKDHTUXsOjjs2JamIsVF0bJwOqzajIDLsnX2AEEA==
From: Lukasz Majewski <lukma@nabladev.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Lukasz Majewski <lukma@nabladev.com>
Subject: [PATCH v2 2/3] dt-bindings: trivial-devices: Add National lm77 temperature sensor
Date: Thu, 12 Nov 2026 17:37:02 +0100
Message-ID: <20261112163703.3358164-2-lukma@nabladev.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261112163703.3358164-1-lukma@nabladev.com>
References: <20261112163703.3358164-1-lukma@nabladev.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Add "national,lm77" as compatible for the National (now TI) LM77
digital I2C temperature sensor.

Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
---
Changes for v2:
- Place the compatible name in correct place
---
 Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
index a8b2b9deade4..ae8f12c83043 100644
--- a/Documentation/devicetree/bindings/trivial-devices.yaml
+++ b/Documentation/devicetree/bindings/trivial-devices.yaml
@@ -375,6 +375,8 @@ properties:
           - national,lm95235
             # Temperature sensor
           - national,lm95245
+            # Temperature sensor
+          - national,lm77
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
           - national,lm80
             # Serial Interface ACPI-Compatible Microprocessor System Hardware Monitor
-- 
2.39.5

