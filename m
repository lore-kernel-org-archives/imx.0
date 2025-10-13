Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1202EAB66
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 20:52:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388737; cv=none; b=sEbviblrdV2nx+Kfc8jV9SDzt6opzeVkpn/tjQt7M/az/Z2PfNh5EacupXZaZwUz3GEbAHt6m3PKOHrSAwEnlUmi6Tcl8l6g+BIXquVKm+8rGGCIDRHXxHpEoHo/x/bDRoZxV/yq3XJJoV3zgyXgmqeh4mYwAXtiXEgLTGzMeiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388737; c=relaxed/simple;
	bh=NiYf8HpP3IzLaBb0elE5gimWCZ4+UjLZTmvs7wOi0Pk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tUSG3+CypoPeo+xshrGGBJ9OKx2Eefmu//+AYY7YItMWgiT3E5Dhx5eWjcMEI77R6UPejBYLkd6x2AweGHXtes8SICsjY66ZN0wiRYbBdUPkwgRsGLQs0vwoXTVpSrCcYN49Hkv7GAK37cU23dzeCtF1c16G0roTVN9t8SyKovI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhcBn1Kt; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhcBn1Kt"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3322e63602eso6228747a91.0
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 13:52:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760388735; x=1760993535; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lCJT5qJRzoYDN5HCSmFRUGhqrxSLVQWaebjounZZ2/g=;
        b=RhcBn1KtlRi0/EDJRKU99WdyL9XwlUh2qHUFRTMToUcefNKxGfsIUtebvuKo55DxNs
         igXPtjRE6Y2D6UpnG06jjOmsVgL5r2HJHcl5BdbdetZTzU/7sKFsivMDQ7O+DS9wLK4d
         XzYnlMhDxa38Crq+qzr5GnGWsteQQuh5zeEBOvOSXZdAcDP6mdJAFtTKOid8aNljc9QD
         zmWBxxJJ/rsE6JANKA7L/S9nYYEijXF75JGEoW0kYYu/PFx4XNTlcpHAQdCqXsq+/VDl
         eYb3xTvC4KxEFkit69W5N4QwsCLqJV/WoS7k+ZXC3Hxn+qpnT8kOPYGsw2OULril3JI9
         w2+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388735; x=1760993535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lCJT5qJRzoYDN5HCSmFRUGhqrxSLVQWaebjounZZ2/g=;
        b=UvAR3+MSYuOp/w46TqOTF9Rxtz+WVZFxlZrwLskxZrU4kKzME5LIbqKxTrE5zbmDD5
         5VKzfCSwVh+I+NIHZb4LSrmIhE6uiT2pne2Bx0a7ToAmkRC/A2zxDwW3clSwLBKwL0oh
         y9tXZ5Ng5sANJsssz07VKFV1V+PU87gDnM7c5vE+aYl9ki/MaEsZq5hIFa5ELsoljby6
         25WYg1bNx2QCORf1fHYEv0G5x8ZOnpwbYOrgqlvknd+5oOazg93oh2/lmJNwsxv2CHyu
         Nb1Mqu6rpwVbkrk6U3jd7jr8Rm+x5pDRqqDhD4aP1vkmTTS+0ovv4zC+zYlfSdVZJtEn
         X/Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVActvlbaP0Yvy3zWhT6iSBUzj+A+mPRPmyZuBAsRupENXO93hfMp2heaRQS0DHWqlHlAY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwvbqiFtbQmFn/bPbZ9xFecIfldcsw/1i5DgU4DUFVSFebPsrm
	1q2f+omFCKEEX6X5OT6JUgy/L+6PS8H3BJvVr90xo2k/9wfyQEniTcem
X-Gm-Gg: ASbGncslDY6pemfRXedcd/meCbysn2OtgQTpcegb6NmIeNLa0OreL49I1EtHMBt95v2
	rrmVzfYb/Tx36NsTFifqR8KxqNyLn/0DMb+eaaGjNBL4mZkIJLW+ZMut746+XCM3D1PAlnyimuk
	Uf5kCqhMVeI2XspuBuYno5IaRVG/1faUb4RnrTk0OFWTjLJXSaQvJg8my+XU7COsps1oNLSHPg6
	7oMT/4saKppTsuhDS4QvBsW5DUIaaBuXrygvAmYYGNEOc2AhGFg3UnTVNOnRSKq/FMdoTx9i0Zr
	Fz5TZDGza5V5AjOcn6cxyf3dLOteER1y1MGuyHt11Z5FV95BlPwmYSKNqyz2dVLCRtLr6YgreNo
	csWeBGF9rFRy06pzPzgw5YXJY7XZ9vhvpF4lOwYr+JHte4HuEcZSyyxT4rs7v59TDZA==
X-Google-Smtp-Source: AGHT+IGSiJ0cJsM0+QkIjYTOvMW3PPxd74LrG+PyQSmnXQ1wow4hy7WMH7D3pl2v9plOVEqf1jvdHg==
X-Received: by 2002:a17:90b:3b8d:b0:332:5349:279 with SMTP id 98e67ed59e1d1-33b51148b30mr30740786a91.3.1760388735130;
        Mon, 13 Oct 2025 13:52:15 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cc82:37a1:ecfc:e51c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61acc413sm13445147a91.20.2025.10.13.13.52.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:52:14 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marex@denx.de,
	stefan@agner.ch,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 1/3] dt-bindings: lcdif: Document a imx6sx-lcdif fallback
Date: Mon, 13 Oct 2025 17:51:53 -0300
Message-Id: <20251013205155.1187947-1-festevam@gmail.com>
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
Hi Liu Ying,

Could you please help apply patches 1 and 2 to drm-misc?

I got several Reviewed-by/Acked-by tags on this series, but the patches were
not applied during several kernel cycles.

Thanks

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

