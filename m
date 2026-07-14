Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED133432E99
	for <imx@lists.linux.dev>; Tue, 14 Jul 2026 20:05:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784059544; cv=none; b=HDDQohyg3dmPaufGjftOj2b8S9vrOdPO791iag7leP0snpS+s4itAfIEMZE6PjglPHLLGEWldvTW+8rvlQUUKOPKCDm8UhhvDoeRBbM1+eOhexP2CoupfnUDXF8p2RAypmdOBgi4k+RIA3Ch9tpMzRreiEmoe5yOV66476OgEUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784059544; c=relaxed/simple;
	bh=YAr41Qh5cEcbszQriRLCfyjOuqs9uogE8Alk+L/ecgI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=f8SUTyOOkXVj8VehM2lQ11y+uvSReJNw5BXgh71X8dnhXBAAUuvVjycq2gyY3kItyj2akPOHv/Dgq+yAloJqvqhvgPEmnJaIV3rTg5yNGho2ErdpDOUgTvnXKMZpyMp89rqo7/ouvah/KN0r1Vo//eYochZQnntUZpWI6jXLhSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I1Xo68Ug; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I1Xo68Ug"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493ae59eca6so7844715e9.1
        for <imx@lists.linux.dev>; Tue, 14 Jul 2026 13:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784059540; x=1784664340; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MH685CMALDyk401jc071KaqStgWKFdqRyeyPqDFwC44=;
        b=I1Xo68UgF2bwGNhBHWsSST87fVDOl6wRFCGtjVGM109ztIOtfOemOgt/gABBnXTLi2
         z8SeSsLiOO1QYQXGIlKIw1cmPpO/41RE7v1T8hMsN7UA6/5kUEGnN56KaDKcYEyEMmq+
         XgZ3oHCQvVLrN9109joAhmtV9S65yG/xC8VTYoJg/wm81JofvCbV97It+E2hj+bNfRcX
         u+Xzz2ay3834NhIbmIb4hqsMTSy0RDslV5VwfLTdZe5BTuyRj3ZZqyBtJgctzXs71wcc
         iEvBQ+NJ/DqPSsGKdNpnyoL4/TgxQrtVnQqDM4OT5S6J7tVxDPCdUqO1ldjyA44CLNm4
         Cstw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784059540; x=1784664340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MH685CMALDyk401jc071KaqStgWKFdqRyeyPqDFwC44=;
        b=D/zhDSg1t1B4PtTCejIEngVM6Dym3ainq05Iagpqb6XGXbBGxPKn98eSajGJpqZcPT
         e5LLpDxijEP5Rn+t8Y7cmxKuuLDkHBHjuZHkRjeSQiyWpXVemBlatJIv8ADQTd/kt3tL
         BDFPgDuvTOD/4TCxcZv4V4vzi4cYBif2dZ0enpA4cF3L+myycdUp3BNbKi0YgWh9ufre
         5QWcsyHCWwxsEWX2uFDkIm0sL9w484HBPQLJurA5/GCC77J+RdZH9F03qCgr4tWaYfHW
         PG91Bw5HutEMv7vXuLhpDs14EKyJ5SUh1mL/AIGNtLeTooj6CINeS8Lqr68jS4YzS7tG
         Eang==
X-Forwarded-Encrypted: i=1; AHgh+RrjGNQ0wonD9GE8IFHbZr4xaDbkPJrtX+HKPs+1uFkLBDP2DXFPUwHhbq2lav7OyxgRYwc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/Q0NXrD1ZVDv1sN/wh8bRSoNJCM4ckeEg38+8rLtEl7Llvmkn
	/POKOO4CCK6kBr96u/W5/mcmpjFq7GaPqCIQXexwe/XCrTqcXp3aM9WJkUm71bP8
X-Gm-Gg: AfdE7cleAD7z+324ciQUMlEOnFj5gAHTtavB/dl0fxB0sdr82a6tFCTCdpEMkX7RaH6
	2wY5p3I+s6sAOeOXpHTI3olTPI1qHX8JSYazkHSmDtakWyIA1dbVfVf8tpCImk/Jf5Vf7frfB4l
	SglIgA8iCfkdkV8KrBEX5YckVO5UnpCZgcP0oHjwXJWSiWf+dwfLACR2KziW0PVqjYOZmfTWJIr
	tcv2wJyodN/p/xoh/qW0qUtOASC6RlNfUgGG61UokHXMaOddWVeoLfLnhkr0huR6xxPnR7Srzcx
	loXiTVNkHlhkRGTY2D6g6eJQwWkfa5R7V6TxQ8Rp8WISmX7FJQUSBGOw8LxMufnD73CjMoWgpHJ
	DkOzUSej9xU4Zyz9+SALc45sWoT3NE29zqftaHvIsc0hYm1yRY52LkVThrsppBgpyfAzmkWWbbp
	q2b0I5+oytVgCZyOA+EzYFnE76OT8eHpLMlhy0Nmq7BashxQ==
X-Received: by 2002:a05:600c:4515:b0:493:d21f:8f98 with SMTP id 5b1f17b1804b1-493f88375dfmr149562265e9.36.1784059539231;
        Tue, 14 Jul 2026 13:05:39 -0700 (PDT)
Received: from GLaDOS.station ([93.66.5.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464a9879sm11669797f8f.22.2026.07.14.13.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:05:37 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX8 QuadMax Boards
Date: Tue, 14 Jul 2026 22:05:19 +0200
Message-ID: <ab828fa11ee190cf703cf6a422c43fc2c2d60a60.1784059139.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784059139.git.stefano.r@variscite.com>
References: <cover.1784059139.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Add DT compatible strings for Variscite VAR-SOM-MX8 QuadMax SoM and
Variscite Symphony development carrier Board.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e..532e4308dc46 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1381,6 +1381,12 @@ properties:
               - fsl,imx8qm-mek-revd      # i.MX8QM MEK Rev D Board
           - const: fsl,imx8qm
 
+      - description: i.MX8QM Variscite VAR-SOM-MX8 based Boards
+        items:
+          - const: variscite,var-som-imx8qm-symphony
+          - const: variscite,var-som-imx8qm
+          - const: fsl,imx8qm
+
       - description: i.MX8QM Boards with Toradex Apalis iMX8 Modules
         items:
           - enum:
-- 
2.47.3

