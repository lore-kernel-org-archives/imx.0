Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.251.229.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348368;
	b=gfHpmTlhAfImE7DKB5iGrY1jALMzsGJWR1mpdiCqpjuRETMfkzhYidpOPIdMWjFN7oD1
	 O8BtgA4fg7zNcfNYOoHhOmuZCntFWjt8dupIxS5l8Yv1NwewpaPTFvkMYlcLRYaMrZor+
	 TQs9AT7TtfbkFepP70XOx6vHQyLra9Lri5B0dV0ClWkOt2CNLa4GULwyRuJpWxreZLwkr
	 mxD7sMOd8Pr5x7cF6aBYyqrM1HCVJtxuWHotOV2NhExVhmg712W8fthvavpjbSsldjDxZ
	 tn0Hk33K0gcZoY43nlF0mVA0aXrq/dM+KaH0MGcMuUqsyNjojtYRtnFHkI7O1ySLQjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348368;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Last-TLS-Session-Version;
	bh=2SEJFh+LRxwXXlyrTQik91s/Kz05ep2+6P2vUZ4sEQY=;
	b=KVxfwBGJe1py7psY7VQ3nG5EPszCDDEbb56QSC/zfalfKAgb7+BHTawTr/HQvNEFpBBt
	 Q614fujWoruhcMKNvT+CnuLzajl0SzEzg5pcFLP3EDWu9llXai7OdeUqbH6GbhPBYzD7G
	 Dsu2RgUc6QytLhB3TefqyPD+V3md6SieIpQEg/FIsDWMD0f9rmdepWAqvHD26ISm5SAn2
	 MWVFHfw6BlqoZAb9oMF5mEUqy2gpJjrHhHOx2AARQxqq/OTKcF8JNhxJ7peo6EU7DLjL5
	 HoMIhT/0d9pgQw9lj7GsQUWX1cwVZdg5fKbEnqbpR0GgKlSrT7MPyxscO66WLY8NHRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nabladev.com;
	spf=pass smtp.mailfrom=nabladev.com;
	dkim=pass header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=iGejnlw9;
	arc=none smtp.remote-ip=178.251.229.89
Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531F0606A31D
	for <imx@lists.linux.dev>; Fri, 30 Oct 2026 08:19:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 531F0606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=iGejnlw9
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92B7D10BE43;
	Fri, 30 Oct 2026 09:19:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793348355; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=2SEJFh+LRxwXXlyrTQik91s/Kz05ep2+6P2vUZ4sEQY=;
	b=iGejnlw9tE4nldq8GEJwD76geEShEcplvgy2j5ywp1hc95+TEFevLKorMIWO7eoy379ABq
	e3iWsHctftr8MYZoS7Vds3fZclDKJ4wEXL5yh8Ij8X4H6l7khMvKJrLHSK+HTV9+XzoSO2
	4stRlzKPeJAx0sx1MFc8tbcc167ywRbXGrQxGeJ11pRRc+MI4aCt0x6rNPI0M+NbFnm4Ic
	MYvEUMbWpWux5r/74m/dksWm/L0XArjH2Tkh2KWLdKKEahH5eD/pQzR4JO+otmu7Tv0eCD
	dPP5bcaT8ENwD2bRWiYLlUOVMxolRroMz5e1mrUqYugATKELCN/2DWSFXikBtQ==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] drm/mxsfb: Update MAINTAINERS entry
Date: Fri, 30 Oct 2026 09:18:49 +0100
Message-ID: <20261030081908.324212-1-marex@nabladev.com>
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

Fill in updated email address and imx@ list, no functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Add the imx@ list
---
 MAINTAINERS | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 75ef3d1aa9d6e..4476471b58445 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19168,9 +19168,10 @@ T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/tuners/mxl5007t.*
 
 MXSFB DRM DRIVER
-M:	Marek Vasut <marex@denx.de>
+M:	Marek Vasut <marex@nabladev.com>
 M:	Stefan Agner <stefan@agner.ch>
 L:	dri-devel@lists.freedesktop.org
+L:	imx@lists.linux.dev
 S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	Documentation/devicetree/bindings/display/fsl,lcdif.yaml
-- 
2.53.0

