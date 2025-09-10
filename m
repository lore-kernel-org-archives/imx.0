Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8624C1C2324
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 02:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757469944; cv=none; b=tAQsWhcrk29sx9Eqv/uMqFO2LOWtVsBVrF3t7Dsi7XpW7MtzSZlj5X9I9dDecWcF98gkqSVLsxDj39BPk1cHExCyG5sNeYDh7/vb4nruq4J2o709UyYx4K7/2FwWj607c391iKmRubxq7OWKiVJz/w5DLQLrznFq0Wzbalzpx7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757469944; c=relaxed/simple;
	bh=T8IahFV/lHr040DpC5QvUSqCsPmapE/THpId9dOXi/s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=chxJFt0ud01XrkwD+NqP+xs5tmuZX4BY+1vdUFq4noF2eUSvkPqed0BsnG3Td8U1YBO7GC7AHLJmP8QBWoamn+L3Bf5fxloo54OisCCvsbN9eLVWPXI15Qqvlp79vh7B1rZvkZeHVFBCAWlKKo/HjfVU/K2doYYampspzd89VcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KZlVVpWx; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KZlVVpWx"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2445826fd9dso74894585ad.3
        for <imx@lists.linux.dev>; Tue, 09 Sep 2025 19:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757469943; x=1758074743; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zE+EZUy1vWC0mqe6ZjTgyhTREFlC0ZMwwUZ5vlxwF8I=;
        b=KZlVVpWxG5VVUcEjF06NmqJvQ4zu2GlDHuY8kySYZhfm64MwEBWG1QsSxsf3gQVXNi
         ZaAUuv4IpSrKeub2zNfp8wudzu8xkbkdX6Bcuz4o4NekMqspVKTQ7QrkAppqTMhXGV8s
         OUMbNpvxekyJ+jKHHTDKxUoY+zM6HjTjNmUsqqaxZ+99YO31vxGNDkQHu3GjdVR3yFwD
         GQ4vPecEzs9xaQsVPWhCwHCo5wGE83UfTJj+bPo+2QeJdWIn4MjnUtjsXzFDRqxj6fUV
         j0rD/VSWQ+NEP97oKrFiZrcDdonno5HGEwgOxsSe5ztBzs+7UiPePb04UeZHiN/aK6cZ
         6IAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757469943; x=1758074743;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE+EZUy1vWC0mqe6ZjTgyhTREFlC0ZMwwUZ5vlxwF8I=;
        b=FQpg/sFJtdvud6gnl3+n+W4Ig1QZG7A/c4HQdnXIOSKezfAOBzaYdds9Lz5yl6v8KR
         jN5ggqtvPRPEvlEGbFjM1wmxeyqk3Cglut7AqDG3WLPS7JJ1NrQJZcN9mdIyWtnp+Ty4
         G8/Yf08/E5sEACvbaBFqFMZaBeXE+wbPgMnf51QcsWhZwNHVYKag6KTsRJe8ZxsoO8Br
         FpxDk0pg82SeKSK7OJ4Cl2b7hjJ+cb5c5LOyD2u1ajsVMCdXm26evf826NNLqit/USs0
         xS8djkiTNvZYMh98AG8syUYbHokV5cVGoWizzESWndk/gfJzwPmC8M0C2vPBcs5wLJfc
         KqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCU5pE+ob0QJ1ySVDnx2YIKKrRebcNYZZOXyXQqm+v3sIss2b8bXnSFLdhnqtBO8wsYsOFc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzDLyN9mcMV28cjK83K/TLKXW0Sx1GmGJPPVQvfJIdb2kDJUKWG
	jQ1is8PHsVo71xXbEs4UpNuptVmMLkwgUomQRi0muigcHsgbbl2VVRM6Cl9UWA==
X-Gm-Gg: ASbGncvv7qcgKRx/PCN3YhNI/f0cYaTZCg9Zd+NRhgCZza9b9T4DJeu1Ev1mpfOvUfx
	5eHxZtWImH+1AIHAoTZx+z8sR6s3MWws2oguk9dVv0+uWGSDFfyMBvGAgT13W0yFAQGhEVhtVQG
	NlIbHof9ZqYVT4Yn/MyECYKLv+XJ/mMKCeHID1i23BCBNzFcK57+GJUSo7CK1tzrMm3sWW+9Vg8
	YlLsuLZfUgcJE5RAUNj8VIcYqZMRL9FcYn6QYMhZBBqipzU+eubPYJG++BN69VcyySzZW3Zf5T3
	y72ezlSiTzaGffs9XMS97gqa/THu/l493DID6DYyWGqxnklHcwsVoQpbPH+krrcnD6ZMjBTlJKo
	3Lboj6C+WjdO2YEO1yGnr6CqJhbdnkOhZo8RH
X-Google-Smtp-Source: AGHT+IHfsM+uQNdeDlEV8Gi3sfhH4rxp5TEHRWiyAFDuYJhy1hRqhib9ntEdtEsP9dyG9OLtpdKBRQ==
X-Received: by 2002:a17:903:2a8b:b0:24b:270e:56d3 with SMTP id d9443c01a7336-2516ef54cd4mr178901465ad.4.1757469942906;
        Tue, 09 Sep 2025 19:05:42 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:58b2:c9cb:20c8:e698])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25a27422bb7sm10607735ad.30.2025.09.09.19.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:05:42 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Tue,  9 Sep 2025 23:05:23 -0300
Message-Id: <20250910020525.342590-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx6sx.dtsi has the following lcdif entries:

compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";

This causes the following dt-schema warning:

['fsl,imx6sx-lcdif', 'fsl,imx28-lcdif'] is too long

To keep DT compatibility, document 'fsl,imx28-lcdif' as a possible
'fsl,imx6sx-lcdif' fallback.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 2dd0411ec651..ce31b873fb95 100644
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
@@ -199,7 +202,7 @@ examples:
     #include <dt-bindings/interrupt-controller/arm-gic.h>
 
     display-controller@2220000 {
-        compatible = "fsl,imx6sx-lcdif";
+        compatible = "fsl,imx6sx-lcdif", "fsl,imx28-lcdif";
         reg = <0x02220000 0x4000>;
         interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
         clocks = <&clks IMX6SX_CLK_LCDIF1_PIX>,
-- 
2.34.1

