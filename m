Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45065421EF4
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 07:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693634; cv=none; b=MrUlDkS7OYX5SLRFGFJj4jkHpZJdZ9jjCGT1Dr1sEr4r5j88vA+6CTf8u+KR/D6EydqC1CtIMksF0GZabhd96Uaizd5E41gob2v6i0FdPyjW6g0e9m45OZs655E6k1pjNUK8DPlKH+TgnetDYCDiFFusEgGHdo2gCvVj8WMKS8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693634; c=relaxed/simple;
	bh=5hx4UJmto0lkskh26+QnsuW5IA/b08Z/iE0weO3VEF0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ojO6QK4PflpQm3L8d5n1MGJIhr/XENpnOrLpoLCPJjDDiQTa0K/olcr+Xup5PWXvufsKpsoTWKwKzSYP0tm/6vqPw3Yclk7xYplAd+eZbyk09N6FdiCtDFxA3Hzemtjoljd3MWTK/pXrfQK6VrtiDEvmc7CjmwyFWQg9FsrkxQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pA/6kINz; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pA/6kINz"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4998590d392so7486545e9.0
        for <imx@lists.linux.dev>; Fri, 14 Aug 2026 00:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786693626; x=1787298426; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W5336+SrGN5lpWmSppcc7MRbo0dB/S5DAQkLdylUDNM=;
        b=pA/6kINzlSR8mBlrZH5ZPHap2NIoaxfK5O9ARdCZbQxMej6dDiwrf9IzOWKECwrvXu
         faze7QyiS6Uwn9nslzdhOVbO+aLVW1066Z4ivPnzedlOusp19ScaEQs7OYY5d9rz5lQz
         ptszfkKGkyUJvh1b0spgX5wU6iezSP2rImAhxc7+zYEesxGbV1f3m19s+dTIfZfeYQKF
         2MEoApfbk2j6ETQnos0/nWPIkvI4E3y+WCoyHowENdn4aroYQAKC0ZrdYDO1F8Ad99UP
         ze7KKhaQkhgqz/NSQiXBzI/y8rIjgtKcQyA+noqgGnYk/0BcQlvRFfFu8iy6+RVK1PQE
         yQNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786693626; x=1787298426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W5336+SrGN5lpWmSppcc7MRbo0dB/S5DAQkLdylUDNM=;
        b=WJlV5PyIsDZ6Hi/2DAC0EyXq52zX8WZmcydAlXi+R6cvxQuDZqT73jn/woxLovmrDr
         TiX9vAzaHGO9rC/bCZp3w+ZW941W6eF7hpTiKOss+h9Kb2BHI/Nwpwp1a0M1ZROgMaL5
         d6XB6rW37kgy05ZuHuom8wdLh6dA931Wc+P3H5tONkEY/yRKRteYg/PdIu+gtZvUO/WC
         G5TnwPZGnoG8dehg3/pOCBx/zryCE1BC5LGnG5T3xLjKQj9mUJyQkzOSrN8M2XRTAyen
         SQd32qH+4CDG4TnhVgEBz6AVgfEg1y6tdqibDPrnJPD4kmor2KABSv9F+z/cN3iJTEXb
         un0w==
X-Forwarded-Encrypted: i=1; AHgh+RpQlQkQD4R5Kfq2mtH5mvl1ywDII528QczgvOdCD8gbKQY37aq4kWeqCyyYT2pRoySqLB4=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywu0xqwrF4ZM27Vd82CUcplkchYS1SSgXLieLw5cVshh6W9w/GH
	HMxkLc6k2JFeCtZzd9jduoyzj8P+xrzJ1JHjDGtA6enzuQis8tkl7YfoI/wq2HtB
X-Gm-Gg: AR+sD129V+QXld+r/7stQZTDM5VHHZKt6PrE2GfvBzk2kRVGmnqndxGEm7qslDCppB3
	984t+H2ND9r+4pfezRB4JQ6Cg8EDC2Zlg2Bi2Y+rLXyJ2//HdGK1/OZrcVD7gAZiVdnmxQx0T4C
	f2taf4WMKt6/qD0K9D9KNtEF6w4Q0E4ejkVjYYk5ApoecAkszU3qChecPPrhMbClIRg18R1EJkt
	gegoN8wxI0lXlTmhhpwli7+xsh3iRimRoBED0DpIps/gV5RF3rTmA0iSs1b9z7YcLE36JAxgYB0
	4vDMIAe0juOQEJk5JtTZBtDYNQgsr4hdjsx/4HDlFu6ZV7S9hYjsOZ27ZOgv2EU5LF5lKvBaDs8
	fzgBhKnBEMewtrCNxuFNn66wRtGPCBNdbKZCDmLR24GWVRnipvk3wSNvnUunCO0dAPOYCY0tXyx
	8rMRyBCAfAHRLPNy3qp7WFClIQI0XLaLyNDsqeY6MW4Ji5JyqE0rIpLSK24hkiC4y50lClL/IQo
	Cf5
X-Received: by 2002:a05:600c:1385:b0:499:5220:db3d with SMTP id 5b1f17b1804b1-499879a50afmr38622825e9.16.1786693626273;
        Fri, 14 Aug 2026 00:47:06 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499899b5f86sm8172825e9.5.2026.08.14.00.47.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:47:05 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Frank Li <Frank.Li@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Stefan Agner <stefan@agner.ch>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 3/4] dt-bindings: arm: fsl: add the Colibri VF50 and VF61 on Iris
Date: Fri, 14 Aug 2026 09:46:59 +0200
Message-ID: <20260814074700.2491256-4-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260814074700.2491256-1-mehmet.fide@gmail.com>
References: <20260814074700.2491256-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

The Iris is a small off-the-shelf carrier board for the Colibri
family. Extend the evaluation board entries with the compatibles for
a Colibri VF50 or VF61 sitting on it.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 86876311ec59..6f95c17b363c 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1705,9 +1705,11 @@ properties:
               - fsl,vf610
               - fsl,vf610m4
 
-      - description: Toradex Colibri VF50 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF50 Module on a carrier board
         items:
-          - const: toradex,vf500-colibri_vf50-on-eval
+          - enum:
+              - toradex,vf500-colibri_vf50-on-eval
+              - toradex,vf500-colibri-vf50-on-iris
           - const: toradex,vf500-colibri_vf50
           - const: fsl,vf500
 
@@ -1719,9 +1721,11 @@ properties:
               - phytec,vf610-cosmic       # PHYTEC Cosmic/Cosmic+ Board
           - const: fsl,vf610
 
-      - description: Toradex Colibri VF61 Module on Colibri Evaluation Board
+      - description: Toradex Colibri VF61 Module on a carrier board
         items:
-          - const: toradex,vf610-colibri_vf61-on-eval
+          - enum:
+              - toradex,vf610-colibri_vf61-on-eval
+              - toradex,vf610-colibri-vf61-on-iris
           - const: toradex,vf610-colibri_vf61
           - const: fsl,vf610
 
-- 
2.54.0

