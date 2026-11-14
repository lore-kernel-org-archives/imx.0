Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794615538;
	b=xnkhbqrdfjaOTMy9q7Yjy6icGBo82RgUVJHsslSoxDDD6D8zbnFxpJkxEyq6dQxBlMyK
	 uVnmFUeh3DV+YJmrMNqkVqeQdvV8tvG4IHV+nY7wXjF/kT/tidt1McRxcGCC3hvQ5UpXH
	 OFVKP+/8ALfbnxMSLcZCBJuBz7D+2cY1wSjq1RVYMInGoBl5WHYdlbOBi3aF0nUfONaFM
	 BMvh0jNfgtchHQD6xv9SBs2XEnfFS9yoF2Hyb1phxYm3aGQoGG44dZ0NUZ2oXje8c94u1
	 JUOCDQ9UgWuRpEWlwv5AZrCM7kSFgA9Rrm70hzwBeEQZHBdZr9T0cIhtZUC1GKfjr1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794615538;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=DbYweoBpLl4boR3F2YSCZ+f/7ZwlJREZqL4oFlSlCEs=;
	b=nK77TSFi+hyaArqeuQxg2u+9yWTTEzk7LRcOiBC7BQxRRQK6RbMlLVEI/0SzefuNEGaL
	 s9oDqE7iFG03hGnPIAcQ4Gq3mb9iBHH43Vrf9fFw36mTIhkuVtU7YiqbJcYOAA+UE+aug
	 ozClbMIB4xltoxd3Q4F6B7VXZYxmWrTQaBnj+QhqwkSR0XgowQgckAJzEAUnNbWBGvgMK
	 ReZEbUHaLTUZzYKB7KIzwFpgqPsu+oZyEpUruWI6TYmInMFsGnldiVssz6Py9Fh476/0G
	 P1XYJAxjesL4PQ6Xb1Fbo7AdTH9UR4euRpXlxXZuJS26O4G62465djJd43e1paGsg5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=hNhKbdAk;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5424E606A329
	for <imx@lists.linux.dev>; Sat, 14 Nov 2026 00:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5424E606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=hNhKbdAk
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8B7B10E90C;
	Sat, 14 Nov 2026 01:18:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1794615531; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=DbYweoBpLl4boR3F2YSCZ+f/7ZwlJREZqL4oFlSlCEs=;
	b=hNhKbdAk4wxqYGAkBPE3sYS0dLg5IQotUjNWcE9Sh00ctDgyUDdEVIm5MQL0O8LM//vVs1
	fQXtjb9XvloRCwXk5p9fBjmoCXUIm++xSCCRklvizur0jX2JDaB0y2i6ZHBrvGcid+S1gc
	y3kAfKl4KOBrP/vDWpcU+Lap+22zxN+GaHzYv/RUhq55B59+GDTRccvL+6HQ2uOODZzgHP
	IGdYFRaOMDtXxbjQKvUkR7Mb+98WXvizsglUV0MhZKgand8xbpver7ExkXYClZ57AjpQ9d
	BhsVR8Jdy6WmPqU+1YNDtcr1SYPUlspsvarkQSHAm+9BMu7ySdgu9YzFFnX37g==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/2] dt-bindings: arm: fsl: Document Data Modul i.MX95 eDM SBC
Date: Sat, 14 Nov 2026 01:18:25 +0100
Message-ID: <20261114001844.30606-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
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

Document Data Modul i.MX95 eDM SBC board. This is an evaluation
board for various custom display units. Currently supported are
serial console, ethernet, eMMC, SD, SPI NOR, USB host and PCIe.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-can@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
V2: No change
V3: No change
V4: No change
V5: Add AB from Krzysztof
V6: No change
V7: No change
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 36e7a325af5ab..d40af695bc7de 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1579,6 +1579,7 @@ properties:
       - description: i.MX95 based Boards
         items:
           - enum:
+              - dmo,imx95-data-modul-edm-sbc # i.MX95 eDM SBC
               - fsl,imx95-15x15-ab2       # i.MX95 15x15 Audio Board V2
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
-- 
2.53.0

