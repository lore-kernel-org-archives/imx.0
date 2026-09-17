Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDFB299A82
	for <imx@lists.linux.dev>; Thu, 17 Sep 2026 06:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789626365; cv=none; b=mPp0ch0e7r4tUnDWKVXbpQpHlsAE2drX9GguG0KS45VU8jMGQugNdX4diYr4P1mJgNShJRLnWSQ0laPUW/0jesxqr4QC0nz8WJRBvNSxwLSTwvrNbXOocFWk+/0eUwTr3U4vroyQgmLYkKlG/xF9SVEnFSQEMrSIaaB1lxw2HVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789626365; c=relaxed/simple;
	bh=ofqk9Cjcwp68M2ueWT12b02Eqx391FU8wX3SZNxyzFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=swG6EkeSzd3ChLAhpJyo630Az63Q6NNQ5PMcs+AHdV6BWhANVsJLB+xDJSmGFL3ti6dwFy1NAmwjJ4jqtXe5F7ZTCVOCjo4HQ1bykhoG9GvHbUd1Ko5GJgT9Mm/hUJwrZ2ZAFn5i1U0M30ay8HsWUyb0SKEW46geBrNoTyggikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=NRMm0mdV; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="NRMm0mdV"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 631E810495A;
	Thu, 17 Sep 2026 08:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1789626356; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=WZr02Qzw3sfGmjvh/YhABnvJ7slWZFf+ioRB9n2BCzg=;
	b=NRMm0mdVum09o00mzFAsSeQhh0cds/67CJEKvsa2d5inLhjpTfgfhrbOyyC4MhLuyDn33O
	RfYpc950L9/v0f4yFzQJAJfDYm7OkD9Tk80SOs+lGsIco3/6pfCv4dRuC3p5Do10y61ujj
	rzDA4l+/VADkSRedUOfA7SWwVIsMFUXkNpafvDWOD9k/jZw4HDpAa/XEUKVgbvy+/V/dEa
	F7GcFGtAaAhzWtMiI46T4vMJRyiuHbfpyYfUHFS0mkGT6OnJAj8zL4Bfdner8CBOkzgmez
	oqDWPPIrcuwQh0CbUNABfLBCmuXB6TDCGS/5XJ2WiwEi8RtUgBiEkBlGa3QDIg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Aswath Govindraju <a-govindraju@ti.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-can@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindings: arm: fsl: Document Data Modul i.MX95 eDM SBC
Date: Thu, 17 Sep 2026 08:25:27 +0200
Message-ID: <20260917062543.534416-2-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260917062543.534416-1-marex@nabladev.com>
References: <20260917062543.534416-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Document Data Modul i.MX95 eDM SBC board. This is an evaluation
board for various custom display units. Currently supported are
serial console, ethernet, eMMC, SD, SPI NOR, USB host and PCIe.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Aswath Govindraju <a-govindraju@ti.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-can@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
V2: No change
V3: No change
V4: No change
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 36e28e0e4ad99..04abae2018043 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1548,6 +1548,7 @@ properties:
       - description: i.MX95 based Boards
         items:
           - enum:
+              - dmo,imx95-data-modul-edm-sbc # i.MX95 eDM SBC
               - fsl,imx95-15x15-ab2       # i.MX95 15x15 Audio Board V2
               - fsl,imx95-15x15-evk       # i.MX95 15x15 EVK Board
               - fsl,imx95-15x15-frdm      # i.MX95 15x15 FRDM Board
-- 
2.53.0

