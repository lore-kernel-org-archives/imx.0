Received: from mail2.andi.de1.cc (vmd64148.contaboserver.net [161.97.139.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96D61F8F17
	for <imx@lists.linux.dev>; Thu, 24 Oct 2024 14:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=161.97.139.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729779756; cv=none; b=hPiEYhsg3SDVZ5lTb8J+KmjRHiOjOgYU4hTMxrH2GTyJolx/TCSk3YMi6W+94E+joEeF4qGAB/BakGhT1iWtrhW+lGueXe8S041mEIzq+Q413YRHQNdmH2dTzGwgzE8Co3FOiKhEdh6VOuu2NFPjOquCSpBdmVL8wvzzX4abY7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729779756; c=relaxed/simple;
	bh=lSSkp5xhn1ep7DpC4QCQhnlkJVwxLQXovx0RxkamEbY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZHLGht7CUnLDZW8VKHKkFJnHUWasPEaBwQlpSaXJwr+0bMAyhjbrbH7wklD8CCuSVneF6mos7G56pg7C7byA70LW2IjBVsy7/jd/vkcAyHZ59uulc7wtn04MjcXrrJxV7EN4303zUPNCGfaSANshVjZW/ayUaQI8mJ0ddKl9JEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=RoNog+vZ; arc=none smtp.client-ip=161.97.139.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="RoNog+vZ"
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by mail2.andi.de1.cc with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <andreas@kemnade.info>)
	id 1t3yjL-00AA68-00
	for imx@lists.linux.dev;
	Thu, 24 Oct 2024 16:22:27 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=FXyL3DypPFSd8TW3PTO+e+7t9NOqRV3fsU3dmjBNp60=; b=RoNog+vZgh1KEs63CuEqNDeTWm
	Ju3NcZl6g7742fjGZOxocU2qZHW87b5JOzqVr78nK4QhJ7cokr3R7nzmGQAingZdmdFyAwVXFwY86
	fJ4WPJN/ch1HgH8p92ymsKaxy79DSDIUa8hZKjc9Ro5o9qCjUKLKfUDs3/6P5GZ9qJw2IQdxrYXte
	Yo2C01u7Vm1uLZHJutWzXv/MNX+qJauU4EFsusYoc+KSHpGzWfb9+qnOQvRAx0HyUx6KuieV1RY/S
	OLykP9XyLzA53xm3BW1oYtpngA/LDL3SY+QUf8bZcqSUalDbL9vtSwco1ypAvsOmOjBjF+QG/Lk7V
	AusCS5tA==;
From: Andreas Kemnade <andreas@kemnade.info>
To: Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev
Cc: Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add compatible strings for Kobo Clara 2E
Date: Thu, 24 Oct 2024 16:22:04 +0200
Message-Id: <20241024142206.411336-2-andreas@kemnade.info>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241024142206.411336-1-andreas@kemnade.info>
References: <20241024142206.411336-1-andreas@kemnade.info>
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

