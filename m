Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C01833D669C
	for <imx@lists.linux.dev>; Fri, 27 Mar 2026 09:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774602552; cv=none; b=cFhcQCMuGZAdWl/45J4vHgFWUJLDrC2RfMdeVgJykZ8G2PPZ5DNaWysEERbVsCSWe2lkDRYxFN3kcDtpWaBXpfRr++5Iby8j9k/8mO29Sh0kyiqu/mnJTFAqcn3aWxsxu/aRyqeFgzPcGqNTihiJ9zDh/T/OAR/JSnU6B6e+jO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774602552; c=relaxed/simple;
	bh=MD+LJmBuapYGYohmFCM34XC+PHUdVk47oSaXL3c7eyQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RKSBjwobgez9BhIZXI6sKykWlfmNLAMktVEDV6uG3CKQnCRaq6vfzeztDZ312TiJxTV5b/G0U3AC8XCcAgerlnZHqb9nhvFbl8mmqF9w3BW+1dcb2XEZvPp7AsnPLlZbOqq4bER/4Dl2v44tzJiQyG/t0Mz6TunXNRgAQzo9Pgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q10EBQuM; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q10EBQuM"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so22541765e9.3
        for <imx@lists.linux.dev>; Fri, 27 Mar 2026 02:09:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774602549; x=1775207349; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQP/mqBm6pLUk7vSODYInQlhYdEaAULpvRRTT+kVBg4=;
        b=q10EBQuMlKqbX+nQo95t5Swo4YB9OWHJ64hL5fhWWbkYa50qoYXWLyZBXnefoAFSaR
         Po2N1WKRhmVWiDz0/U4WU+cfI6PGEGdgXB5DTnEjF3YfI0lH5UXAknao6MlzdOBPWN0c
         Tu6ljiJYxRCSLSd+p+i2EZpgME1uelyCYarnD5dHpKFAwlzts4ZL/tejynehYq3YHDPq
         ocUkUwzbDUd8OzGiq6/7QsL66PFeEsxF1SU27q2inBRFh+TjJPi1l7JlcEispxQzK68V
         x1AKLpIJFQAIHI08VpHDhbesUqF54SNWO1ghdcS0CxpuQAfdaU2h3VfDoSClP+/WYtYv
         NHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774602549; x=1775207349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nQP/mqBm6pLUk7vSODYInQlhYdEaAULpvRRTT+kVBg4=;
        b=MvUoFRQqpyqQx+7tSfhXD4zlRSp3lxiNHU4N5lja9HrsT01rgUxcML3mWqoV2BpxvT
         QeFI69NBycCkJ6XeYQQ7kPJ17QT+pBtGDcuzxnQYsW+Sw2Lgt1StuDZraIXDeKuths6U
         VLny+Q3PAfacKL9ZmoYvLUR8BE9j79c1EvYNdZlwNgW23yG5khf0LFMGqUtAn9RYY3Sz
         mA6o2PF0JC/PwcYd0wqqeYIg4yw2ywa1F8Z+uGmUbhH4HZLIvdqyg89DTEyR/8BzDuSz
         zAbm/tfVB4kubhzA/stMLWkGId72jaRtdTgvaVEnWofrfIsOw3kwvvoHD/W7EVnmQDb9
         wOrA==
X-Forwarded-Encrypted: i=1; AJvYcCXGo8Crk6cAovlKN4KuxQOs8N58lAf5A861pHrWUZgnkuX5NI7+wJ9lNGroO1FhzHmTuDo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzCPvMzJQNzF/Sh/uoMSOxkVT9TrwTcuWOD7Zw9qiyaasCiHJXy
	h7opaPk4gO3+DyopgRnDG3Z5OSh9a/xNt72odcW/awaJvKk28MFpBxtM
X-Gm-Gg: ATEYQzxDzl+Z1L+fhHUGGAc6rV/ysSYm7LWIbLLB96+G60m74DklGs/fmWcvVRQhKDU
	rImbtfpN5nZHP/4QiDDOpwTkfTwbUhZvuX0iIB/OzF34vtM09L8ISRk0zPfkfynILxILm4TnR3w
	6SD8peiFP/cJd3omWPvMDlSHIGvYCGXWVCP7GCCjf8T1VHmS2DgUUNVkc4NzSIE+tqWWcDELKMa
	pvf1qbzqRN0KCyoFH/JMLkxiQj7Uft0M41J6jNtUqdWmnCzKSN//DZAjESXypmJTGDzTzQXc7nf
	6cUR6boVldjK1EUg5aELbaaS9NkbigRDvRpEJHT1gMejnH+R2Gr/XwJ2uFIA95RhO6/dMGZAQJn
	dBrSm3+rD7FxbkRxSBAubrVh45CLXK4OR6mxfTn5VVEZ1rIgsrHNnEYOJwDy3DgduPqS+Io8cSb
	V/AwCo0zgzFg0oGSNnknKUID8Sfw5EgdWoCWrgqDV3xPBjzUDxjsa4PM1tRvLvQb+zvbi4Wbr7+
	N+3v1tcq6wehAA5IOYetN2XX5/AaJ19DWR9BVWpqTHlYAHI
X-Received: by 2002:a05:600c:c8f:b0:487:21c7:2885 with SMTP id 5b1f17b1804b1-48727d45a8emr27743245e9.5.1774602548846;
        Fri, 27 Mar 2026 02:09:08 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487271be661sm11252605e9.35.2026.03.27.02.09.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 02:09:08 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Josua Mayer <josua@solid-run.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX93 Boards
Date: Fri, 27 Mar 2026 10:08:54 +0100
Message-ID: <e87e34976e87ff22e0739fbf978ebeeffaad175e.1774601806.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1774601806.git.stefano.r@variscite.com>
References: <cover.1774601806.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite DART-MX93 SoM and Variscite
development carrier Board.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index da2be7114f64..77497a261fd5 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1587,6 +1587,12 @@ properties:
           - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
           - const: fsl,imx91
 
+      - description: Variscite DART-MX93 based boards
+        items:
+          - const: variscite,var-dart-mx93-sonata # Variscite DART-MX93 on Sonata Development Board
+          - const: variscite,var-dart-mx93 # Variscite DART-MX93 SOM
+          - const: fsl,imx93
+
       - description: Variscite VAR-SOM-MX93 based boards
         items:
           - const: variscite,var-som-mx93-symphony
-- 
2.47.3

