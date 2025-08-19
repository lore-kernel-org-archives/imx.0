Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71B027A121
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 12:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755605633; cv=none; b=Dh1aPWNRkNqquH4zweOdn+88eWyNypGhKg9k8JEibVMMDf0BdQ0sU+EdmPwJqU7KpDs9SHMxhQCpyYkaFu3ModfgPnNeOEES0ICZoZu/bFvETicUdjpzloS+RMFCjOeQWc0rl3qaqTUA0n/4dlexpUfp15TPnaiD8T2c27RMbus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755605633; c=relaxed/simple;
	bh=96sKCN8W6iUHDL5PYlpPkLIhOff9a+rkHfCdGHmVmME=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gAOk/LSwSUte2pQT70nVe0dOSubej3L30q0GdRS4JVVqu6nKrIVSBP0CZFjOyOl7Aga/OnJrCCvrBAXx6SyLiN0AMH5ilf5IoVbWLTJ1915cbY17GcqwT2utd/iRYl97w+uRsQos5o99TyPJNo0mCVgep+cw1OFJTSzAJIVnAj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HliUOU1M; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HliUOU1M"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-76e34c4ce54so3910972b3a.0
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 05:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755605631; x=1756210431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+2vHRKnZiVaVmCBqGixTtB2tdDEbO4XCSMQRrv7sNME=;
        b=HliUOU1Mql+ZoxZpV4G56+mAXwi4+5nsz04lxf5Q2OGfxfBVdunh9dCKyHSKNs4FHn
         rt8J8l1SecGu+Xlpo6m+TvWWtSmvpecp2N1VYohOAe+xOCHRcmz0tPO/zEFAZ4/b6tCp
         duAyNOR3FYvWV3JScnY1fUhqh/JlIxm/0Ee8jhGbP9lPiLLwNDLRqHTvkC2M+97VlM02
         VfaapPvHZXkIaAwnOmbOboi24PId/0gamOlLSL/BI2u1SGgVAqYaigzZQ4V7HAKVZ1r6
         x02+RBP4BjhXL73KIBn3DVDD9ZOu9JiZHEiruwGO552V9aYDyi5butp1miYk+fhENFZZ
         743Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755605631; x=1756210431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+2vHRKnZiVaVmCBqGixTtB2tdDEbO4XCSMQRrv7sNME=;
        b=qNwl71ORdmU7pZZWCJMEdOpYRFYlHXNrPqBeEAkyC+R/N84XszL33yeXxdiQ+k8ayd
         7aFPheyvMKKH63+eSqam/sBNhdzKB+T2e5n/uhjxZ8/1n/YbZMq+LEL5Ojn+xdN2TH9Z
         AN+6+UJ+BEVBA5+2f1AbqmviJc3s4L5qTmfzYLV+qFEpiFAag+Jm8auogvCsgb4xaffF
         looDzEbEwSidql9Yfr2thB/KpxrBD61kyA76jJMn++K72yUz02zdUaCsrwel2YGLEoaf
         QTmtRkb7wT293eYEmzH8y3j5l64UbHS0apHfqFef0ULWytL7ug1dEdBsAASlbwiFYi4O
         hjwA==
X-Forwarded-Encrypted: i=1; AJvYcCW2k/zkry+2Lx7YOeFP0OhFQMRCeLdPJ9GiOSp1PPMDyx0Z2770JKciDw5shiA5l1+4vrQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3WbV2kN6ZMOZH40mNKY/o8H6vlixDR/UMY+Vl2pFNsipRKnpT
	J+KW7SKtJNvATKL3w/sT9FYt9HeKQ+C1Doum2B4QZWEiDQdXgGgLRJkP
X-Gm-Gg: ASbGncuVx5MscX7SkoOGiAE68Vdywsvcb4URyEi/frib5LLg9JHcAm3QnEu+vZ/KayG
	G4d70QU2xjpC3GTK3b3+Sdh+omALWffeDaFR+dE1S5Kt3ilKtnDGN7ZcKKi9j/3rvy3llfC4eSe
	28EUpnNM2G+hGWivPulP80Qg3fJUfA4eimVHGOguUrnLzFNs241f7xWIh/iMg9s1cWVEPIddexz
	JqoiIdd/JMCw+rphZ1abmTAk/AgD77/66n4hTJ6TEPfgL9pPTFJoB7z7I356AA3RlupdExU20lH
	orMrapRZjue+HRRVLQG2pvROUYeJJbVDRUZVkmcOPmhX40s9nfqjlBf12O7rcXtS9yzbq2lTGHN
	4wiFhvlJUXsszt0Srioqnk/CyyLylIsYq0YsD
X-Google-Smtp-Source: AGHT+IGZFSssZYv1wRJsBAbY0eJGGeYf5A8byIZ2FDIdrF+L6FkR/CXYK2tWDqXgLnMk3q0JBd4YNw==
X-Received: by 2002:a05:6a20:a104:b0:243:78a:82cd with SMTP id adf61e73a8af0-2430db1ad7bmr2688715637.26.1755605630788;
        Tue, 19 Aug 2025 05:13:50 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:3ce6:43aa:f6b8:33fd])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76e7d0fbe95sm2352749b3a.25.2025.08.19.05.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 05:13:49 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: krzk@kernel.org
Cc: robh@kernel.org,
	conor+dt@kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH] dt-bindings: w1: imx: Add an entry for the interrupts property
Date: Tue, 19 Aug 2025 09:13:44 -0300
Message-Id: <20250819121344.2765940-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is an interrupt line connected to the one-wire block on
the i.MX51 and i.MX53.

Add an entry for the interrupt property to avoid the following dt-schema
warning:

'interrupts' does not match any of the regexes: '^pinctrl-[0-9]+$'

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml b/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml
index 55adea827c34..2c1bbc0eb05a 100644
--- a/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml
+++ b/Documentation/devicetree/bindings/w1/fsl-imx-owire.yaml
@@ -24,6 +24,9 @@ properties:
   reg:
     maxItems: 1
 
+  interrupts:
+    maxItems: 1
+
   clocks:
     maxItems: 1
 
@@ -40,5 +43,6 @@ examples:
     owire@63fa4000 {
         compatible = "fsl,imx53-owire", "fsl,imx21-owire";
         reg = <0x63fa4000 0x4000>;
+        interrupts = <88>;
         clocks = <&clks IMX5_CLK_OWIRE_GATE>;
     };
-- 
2.34.1

