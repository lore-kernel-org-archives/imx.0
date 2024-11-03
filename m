Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A1A189B95
	for <imx@lists.linux.dev>; Sun,  3 Nov 2024 13:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730641947; cv=none; b=ruDQr9y/032/5rAbXFXozDzn2VeT8QNte1j1UtSvSxDXzfHDtplncWPPjeK50ByGouwAWMreplKQ1Fbm0DaMhAILZMpka62KAxPdo8/4CpFsk54yEOo7vcytkUHuE3f/HXLg7KJ1wXWb1aXhpkV14dCUn91xko0sExApc+MCEEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730641947; c=relaxed/simple;
	bh=lSSkp5xhn1ep7DpC4QCQhnlkJVwxLQXovx0RxkamEbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OpNSMYtVfwpxAcwzGxMFcxvcBr7L6wEioCdbACFB2OX5ahJhxcoJesiGZG4PJIKZlEKneRu+F+DP+RCer3dghkSE7z8nOIz7X+sWLkVhFd2+48gpEqXKeLrhOgqFsIXVL5RGt/PHw9kTyKpbqmOB5PYMH4d4u2CirWlmfF/tVTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=wPjR2JAC; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="wPjR2JAC"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t7b1e-00ATEK-0A
	for imx@lists.linux.dev;
	Sun, 03 Nov 2024 14:52:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FXyL3DypPFSd8TW3PTO+e+7t9NOqRV3fsU3dmjBNp60=; b=wPjR2JACrGzZdBWXHI+2uj6Y/h
	92Bj7fzA+Ikn2UlxUvPsddwMwKWyV++5ags+iFSmQMcc0UnK6A11945fcZziQyAsZuyBGPshwmsuQ
	OOirA+1fO92NfBKEZTY7zp1EmnPA7Ats3KMoSJkaxjI4J4OFC+oTYLm8pwmSQRU1M6Lej3oR5jh9m
	O3C7dD36SPHFwyHrm9Own8/8cSOn6Cb78hCuy6s9w5xMmLsRAoJI8clUTq92dUj+RhxyIVi4e+q00
	CTYI4b/oCHLW6Vu73uwnzw9AM80e4RUl88j3NUkvYlspz0mnKSeAihINYR9IbApXV4kIf196K48xQ
	rmLgjhEA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Matti Vaittinen <mazziesaccount@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
Date: Sun,  3 Nov 2024 14:51:59 +0100
Message-Id: <20241103135201.25615-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241103135201.25615-1-andreas@kemnade.info>
References: <20241103135201.25615-1-andreas@kemnade.info>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds compatible strings for the Kobo Clara 2E eBook reader.
There are two variants differing in the EPD PMIC used.

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b39a7e031177e..a78903076269b 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -620,6 +620,14 @@ properties:
               - kobo,librah2o
           - const: fsl,imx6sll
 
+      - description: i.MX6SLL Kobo Clara 2e Rev. A/B
+        items:
+          - enum:
+              - kobo,clara2e-a
+              - kobo,clara2e-b
+          - const: kobo,clara2e
+          - const: fsl,imx6sll
+
       - description: i.MX6SX based Boards
         items:
           - enum:
-- 
2.39.5

