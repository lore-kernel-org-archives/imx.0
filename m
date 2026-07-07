Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4DA390CA6;
	Tue,  7 Jul 2026 09:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415678; cv=none; b=BW9PGyTrzbB5R5EyfXuOAou1LLfO0mHMwg5JMzuuroqPlymTIjajBuzGlsIwOtZxx87jPzBgW8sL7qy0aI7qvL8h3Ruq8dMAnch99ouYRvEYhhLKTSofNIh1zf+m33y36jlkUtskdgveK808zb4EIpimeRgvz9wPtC7se/BjxKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415678; c=relaxed/simple;
	bh=X4qqLegQ2ZWN3f/bqT+PJ7jGn94bZBik7I13aHoM4W4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YdkKWZPlvIoplwnNrQU++Vtu55UW0TLHdInPm9Fqd9U85EJXU0UfYOZMMYekUWUDtFo6sXEHon56/kSYtJN19YOnmGwTQ/+GupzD7nr/cEXgYp9nUzic+LwjYya7//XVbptL7T4xd1rUcdwdR33XQXxq7vMN9RiFhjDUfBPn5+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=XWWKKBJR; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="XWWKKBJR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=1ZshjWd0kJcUSqebGRSVm1D+j5Ff/mTaOm+FBxEe4Zc=; b=XWWKKBJRidLO+EW2C/2X92Jg45
	MVLI7h2eM+5uTQbkvICSGkdjnbzbT39TD5pZblYFCGnv/CGVRcQBmpORMxGnnZ4yHueLwKXCv7ZFD
	CFzVL4R264jZ55v5ZLqfyTMKyLyqIM3B1Lcpde3FuW7Oz3sgltfFxHTDugJJoOTBnmH19pf+wOivR
	WYzbYNRDs8enlQLGPg8BIWpsbyEN9GXXUF+CvZnXKffQsQr7mbtgUfmXw2nTqkaXOVkvjO91p5CQI
	7cVFcZJlUfAWX2xQBZocKhqDm/G7MBAbkIjZmHCDMHfLsYjIaEFqDYrgqcGoTQPkd6szVB+pZOYXP
	xCaawn8A==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1sr-000Jpw-0R;
	Tue, 07 Jul 2026 11:14:29 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1sq-000LtS-0o;
	Tue, 07 Jul 2026 11:14:28 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and TQMa91xxLA SOM
Date: Tue,  7 Jul 2026 11:14:19 +0200
Message-ID: <20260707091424.1702245-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260707091424.1702245-1-alexander.stein@ew.tq-group.com>
References: <20260707091424.1702245-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

TQMa93xxLA and TQMa93xxCA are two series of feature compatible SOM
using NXP i.MX91 SOC in 11x11 mm package.

MBa93xxCA is a starterkit base board usable for TQMa91xxCA and TQMa91xxLA
soldered on an adapter board to demonstrate use cases without display but
more interfaces.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 6237fb2ae50e6..aa5ef0299a8b3 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1603,9 +1603,14 @@ properties:
           soldered on an adapter board or for the connector variant
           MBa91xxLA mainboard is a single board computer using the solderable
           SOM variant
+          MBa91xxCA mainboard can be used as starterkit for the SOM soldered
+          on an adapter board or for the connector variant to demonstrate parallel
+          display and majority of interfaces while MBa93xxCA starterkit mainboard
+          is focused on communication interfaces without display support.
         items:
           - enum:
               - tq,imx91-tqma9131-mba91xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa91xxCA
+              - tq,imx91-tqma9131-mba93xxca # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM on MBa93xxCA
           - const: tq,imx91-tqma9131        # TQ-Systems GmbH i.MX91 TQMa91xxCA/LA SOM
           - const: fsl,imx91
 
-- 
2.54.0

