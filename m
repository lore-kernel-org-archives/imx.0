Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A8422040BB
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 19:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730229409; cv=none; b=kMIfEZT3BKE5z72WrZd9dMroGMgYAE54qAhwUjk1Nrpt3sW+/6OcSdRDlgP4mMimkd0HWzytDfw+KFpDNUfiTus7/rzBSvRTCs4J7sAni7ZEUc6vs21dh5QvRrRJW3Xb/TDq1uQbX4nBvfZbjxkmB1BGv98bHWX784UlZPkTvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730229409; c=relaxed/simple;
	bh=CHgcuFeC0qfAvMlVioIsx9CNUcHO1RyImg+Jv/lsX5E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P/dxZKfmHJap+jli5r7TWtk1/2nreDA1AV/OMdhWGZey4cOgWm8SboFiDLyPZBs0elIqLuh6+0nayMQz7gyVX+b1p5d1v2v1YOFQqWIdGb9hyvlGuuEd0PUnUAmSxIzYX4sUlgaI9A1Iryal4b+Hqz8j6tpx12zNdYHEw08pUzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FQ9FURvz; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FQ9FURvz"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-20c693b68f5so63411635ad.1
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 12:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730229407; x=1730834207; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HYm6/tVCLa0IRn8QK44VqcJkbGs60MVOw3b3ZJUZb70=;
        b=FQ9FURvzGGBIaRPLXykGyWQFNE+OZcsvZVRXAE4ZUlzEb6cFqlJlfRMa4i9hBYWlrR
         eSfKsPdJr2WyjhH4otAEYRIwT7bGIRYsdo4D+PoPTe4kMo3NSfd23iwdyr1XILQwMYjR
         IW18PHJrBJoRLDe4D8yefSiklPGm58gkkLuLAVKNdON2iV8tHdoZqsSi9qCWFwoWacYg
         yG/vKUMNY40vVSwrMDuoJBXLkkTU0HEOpW2BPA1H8bqVFq1j9evyqgs3CjyCwEOYBZBu
         6+zXbEVrQEmbPGaFPt50Hfi53jerTfKS0pRRJZq7LedeDDs/knH/7gSzSRkgHXepiW09
         O04g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730229407; x=1730834207;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HYm6/tVCLa0IRn8QK44VqcJkbGs60MVOw3b3ZJUZb70=;
        b=SvKguzMsp885UTqBTs8J3/7z7y0g1kA/slEN3Ivccg2Roj1AR80uAUBFV+2M2FkcaK
         lcX49new2GU+LKN0zBRhsrzX6X/1aAd+wYOzsLWWRUz6EMaJJd5DC9GYXhnazNQa59cb
         sNjjQk89ueYswARNP94jjao1sQwHBpOBsf7YbPRaz43TzYs+ig81dPUh2CPNVLOZFetA
         3P6aFZlBz6r6kEP0wqEpSZuHkfQfXvVzT92/BOMFwPvJkXShh7+/KJxhYlEXwAvRv1NM
         UkEM/ufvIcuYvq2TgSb/1qiF6fDjje7XhgBk0e45roJB7ZSO+CAm4gbz1cKU7573iBmj
         P5jw==
X-Forwarded-Encrypted: i=1; AJvYcCWHDnysFvoby6+nonz7sh9HJ1nbfaho70kFmh5/CjS+m4SKxn8dHD2K680mNfUi3SpUGaA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yznz5wLfB0iXjJXXL/X3LHQnu1I1t4yjv+AaZBN/KoMSNvywyCq
	gAmh6GRm3n3HEeTnbJzOrZ5GxIyKN0bRVVGwOScEvfbzAnjBA5QH
X-Google-Smtp-Source: AGHT+IFflxdhOOdhlw0WMMCci3BlMlyqQZ2ZA9xv59ogXANUwG9RzYtz7JlPEFXLPDfj8fEW5WQ+0w==
X-Received: by 2002:a17:902:f686:b0:20b:8ef3:67a with SMTP id d9443c01a7336-210c68744a1mr195187515ad.7.1730229407280;
        Tue, 29 Oct 2024 12:16:47 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:190a:1425:254d:1e7a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8661061sm7842346a12.17.2024.10.29.12.16.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:16:46 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: marex@denx.de,
	a.fatoum@pengutronix.de,
	andreas@kemnade.info,
	kernel@pengutronix.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v3 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Tue, 29 Oct 2024 16:16:38 -0300
Message-Id: <20241029191640.379315-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Only document fsl,imx6sx-lcdif with a fallback.

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 8e3a98aeec32..ad0cca562463 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -19,7 +19,6 @@ properties:
       - enum:
           - fsl,imx23-lcdif
           - fsl,imx28-lcdif
-          - fsl,imx6sx-lcdif
           - fsl,imx8mp-lcdif
           - fsl,imx93-lcdif
       - items:
@@ -32,6 +31,10 @@ properties:
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
 
   reg:
     maxItems: 1
-- 
2.34.1

