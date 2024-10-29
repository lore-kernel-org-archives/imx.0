Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308052076A7
	for <imx@lists.linux.dev>; Tue, 29 Oct 2024 19:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730229414; cv=none; b=pgYLtuS43g3M7eGZ2Y1iMj9RhjLKZwMlCPnPVFeqooIHOrvoULxKqGP3ypLgCj5gRj4ZXOsa0L0Ye6COAdOoV8DKyKPuRv0dJb34nyP59RncuGRx6nIBwoUcjQv+9snWbMU13zaYspNkyaUOYTys+FtCqaceeh1mOvBfkstHSE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730229414; c=relaxed/simple;
	bh=gUJIZGPrG1eoF8g+IJQZdm5bRftguLy/j6J6cRJX5ZA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uVs4bFrUPbpLqaIRlK8kCycJAE7OzYrva7S2Xp4UgLQQk1AMWFipnv98P+ZNzMyn/oPHT8ObKwolrUvVcEAas9wC0XqvTMQnaTZELyDKM01WnOjuZf5EV4Iicq9mbvP31LWmNXbtLG2eIFZFCNPkFjEzWufCdE+DHmQYbqRdC3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J9U+w9dL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J9U+w9dL"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-7ea68af2f62so4648884a12.3
        for <imx@lists.linux.dev>; Tue, 29 Oct 2024 12:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730229411; x=1730834211; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Go75F5WGin7Ix/MZ1KEJuNCfk0dx2TFxpmOXy5zXdWs=;
        b=J9U+w9dLLaaEkJge/vupokjfVWvMWHsXn9SVDbMw+NzNHV1Pq3sVBT4y7uPGTyVqvm
         WmDXTaLdAFiumszCkd1+ICGxPStcLbacmGb2bt3Ib72D8+znbQe5JL/Wx4bg71OLy3sA
         Xfs5zKOAfZqwUBbGN7BFYP/g7ptF2NlroY8ml2QcszYLyr3cyKoWZuE11VwcWCF6FWdR
         iqbM6+RWdA5JJug9Uuo/RKn9ljB0TWIqyt7MWqR2b1F82PzRv9B/96cnIEDTIKDLjRCq
         BQsVBYHsI0uGWj1J3zRYJS4yicEpwMefl23W20eS8335wc5WZbS5Oo8fI/hAY2HLgFb6
         tM4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730229411; x=1730834211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Go75F5WGin7Ix/MZ1KEJuNCfk0dx2TFxpmOXy5zXdWs=;
        b=lPM7Ruqj+BsbFLxU7E+42Hj0iDegy4Q6radoS2m9Kf7BhBavxdKmjQ7kkYmzkJAUxo
         HfcYnUR8Bg+Eo5FAzQ7H4OFJOHgmWQ3zYAi3nnmXSO5NrmsPAe+yAAsDSAMWaSQUgZwp
         TSZeLRZHChuyxZ+zZFWFMuzzbkb2pd1/wBuuZK9h40f3yuoUPfxNpk5SO3Wubf+iPCnq
         ZLSlbaTv9R2K/6IJh1500PGrXMKLA1athY4gK5oAASY7r/jX25M+OGAhhNTSpe1QOzzz
         4jlnJYiQgDrkbDVueqeduuUebmaceqOv+k28WSiDtAk4QvkCJRQpEm/ZgV4HC4jTl5Y/
         nw0g==
X-Forwarded-Encrypted: i=1; AJvYcCU1xPv/x3ROgIj7SNi6E2usEy9C4BToOnhxZtH16yQr4eMkmVv5VFH6Pw7GPF3Cp4moG+g=@lists.linux.dev
X-Gm-Message-State: AOJu0YwU8+F61gMiiH95k3h/oyIxFc9FKm8nlJ8VAdK/yGYRWSnNf5el
	b7NAC/Y0/LdEPzQ3ZfaWn51q4NmAkZy9ZsZ1/4xhhoTlzkKYpD3b
X-Google-Smtp-Source: AGHT+IFenngeaT6t8iIEBhKoMZoPByKBmWfPEehMYTOwuzAHWbQ1Z6ZF1XwcmALtKo2mLUrDVAj/Zw==
X-Received: by 2002:a05:6a21:3a41:b0:1d9:237a:2d56 with SMTP id adf61e73a8af0-1d9a8512cedmr15070567637.48.1730229411268;
        Tue, 29 Oct 2024 12:16:51 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:190a:1425:254d:1e7a])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8661061sm7842346a12.17.2024.10.29.12.16.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2024 12:16:50 -0700 (PDT)
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
Subject: [PATCH v3 2/3] dt-bindings: lcdif: Expand the imx6sl/imx6sll fallbacks
Date: Tue, 29 Oct 2024 16:16:39 -0300
Message-Id: <20241029191640.379315-2-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241029191640.379315-1-festevam@gmail.com>
References: <20241029191640.379315-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

mx6sl.dtsi and imx6sll.dtsi have the following lcdif entries:

compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";

This causes dt-schema warnings as the current binding only
allow 'fsl,imx6sx-lcdif' as fallback.

['fsl,imx6sl-lcdif', 'fsl,imx28-lcdif'] is too long
['fsl,imx6sll-lcdif', 'fsl,imx28-lcdif'] is too long

The imx6sx-lcdif programming model has more advanced features, such
as overlay plane and the CRC32 support than the imx28-lcdif IP.

Expand the imx6sl/imx6sll lcdif fallbacks to accept a less specific
fsl,imx28-lcdif fallback:

compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This helps keeping DT compatibility as well as using the more advanced
lcdif features found on imx6sl and imx6sll.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v2:
- Make the three compatible entres the only valid combination
for imx6sl and imx6sll (Andreas).

 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index ad0cca562463..72e509bc975b 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -23,14 +23,18 @@ properties:
           - fsl,imx93-lcdif
       - items:
           - enum:
-              - fsl,imx6sl-lcdif
-              - fsl,imx6sll-lcdif
               - fsl,imx6ul-lcdif
               - fsl,imx7d-lcdif
               - fsl,imx8mm-lcdif
               - fsl,imx8mn-lcdif
               - fsl,imx8mq-lcdif
           - const: fsl,imx6sx-lcdif
+      - items:
+          - enum:
+              - fsl,imx6sl-lcdif
+              - fsl,imx6sll-lcdif
+          - const: fsl,imx6sx-lcdif
+          - const: fsl,imx28-lcdif
       - items:
           - enum:
               - fsl,imx6sx-lcdif
-- 
2.34.1

