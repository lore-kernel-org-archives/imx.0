Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AEDA6BFAA
	for <imx@lists.linux.dev>; Fri,  1 Mar 2024 08:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709282448; cv=none; b=bqxRuVb3Vze1sE5kr+wVrgnbN7bEsS1TOWKvDuC5cRBF0bdGElG7tlxZswdf9Fvmbgsv44aOt72QN1LKopYybY26L2rXfFbykDhuOGmMFnPpCQO6buOsajKhFGD5eFaM0w1efgLMLr3CvXS8jEzmmnq+U3UXYKNh1QfdJhoq4KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709282448; c=relaxed/simple;
	bh=5krobUKFPQVFM6DCDoevYZXMR+ogvs911v6NfUuohVg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gtUUshZxbGpIuKXuhsZbTQ5n7vAy9i+kOjlBbD2pf8bxaZzKFUZZ0vgUGWvlfL0oi1Hfx5x9zEnjrz5p0TyqgJ7XA4SNRgQXrE9SvqQ0hmS5lWg6oKVhb9goLbgOCB048KEXiEyklH02Y6Xbsevc22GvOFdG2xwjHdJwstcx5Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=T33ijnoo; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=VF4EUw2d reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="T33ijnoo";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="VF4EUw2d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1709282444; x=1740818444;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=roDEc9/Haw8V4ko75VQ2V+i9NSA1sqHboyikroeqvpU=;
  b=T33ijnooC6sT03EzSmqjaieB1Gxy+biIgzXXvwND036+Szb7OaFoepV1
   KiafU0iKKrRzWOoV99nWRdVj+wEWSXxXQXdaGlUKvDKjePWJsYXQg5eok
   IWBtrIqKSPW+Ty+43bmkM9YXaGczHThiyZbhEmGMrilnpxQjr+C1oV9t2
   T4XR0o6OJNiiOSlxeeb0BnnE+xXobfcOOsfLd2Gkc/prowCC4O81bMWJN
   qw4tSPKoUxRu8KZg8fGJ7WadnrrdTYLXSwpOe8FTvgoidcAA51vlJzmDg
   SqrdFkPNnQ/CxA/m6+wI3Ez5q6GBt3m4pBvEQpPwTFLXOKJg2nZV3jKky
   g==;
X-IronPort-AV: E=Sophos;i="6.06,195,1705359600"; 
   d="scan'208";a="35680482"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Mar 2024 09:40:42 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2AB55172297;
	Fri,  1 Mar 2024 09:40:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1709282437; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=roDEc9/Haw8V4ko75VQ2V+i9NSA1sqHboyikroeqvpU=;
	b=VF4EUw2dWOvr9Az8Mz6MvLM1QNZJPS4oX42yBYbsCY+DuNqooHtriFos2IqGagQkAb9es8
	Y5Daiq4Qrz7y4znauxYqGWeZ+oqHKPXx4h3CIVPI0FQ2j8LCQdoxQcJWIKyoQAZZ7cHmge
	DZnFYBxnjv1YsJAwzxRZNgTJBhD0O96GzUSHtVerUQnI5bMMIM7MF5gluzToL8yYK1IfJM
	AAYcf/QWDysRtdy9hbfZfvx7012YR7H2S/X3X1T+5hc19pVGp3jhH0kVLz7HYsqBq+SnFW
	SXxAMGje8zBpKAqGGJ1YUtOUQp2slkWaccKUV9kcI7HmeXMK7YjSJepxAV8f4w==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Sebastian Reichel <sre@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Ricardo Ribalda <ribalda@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 2/2] media: dt-bindings: i2c: use absolute path to other schema
Date: Fri,  1 Mar 2024 09:40:08 +0100
Message-Id: <20240301084009.3030753-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240301084009.3030753-1-alexander.stein@ew.tq-group.com>
References: <20240301084009.3030753-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Absolute path to other DT schema is preferred over relative one.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Squashed patches 2-5 from v2 into a single one

 .../devicetree/bindings/media/i2c/galaxycore,gc0308.yaml        | 2 +-
 .../devicetree/bindings/media/i2c/galaxycore,gc2145.yaml        | 2 +-
 Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml    | 2 +-
 Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
index f81e7daed67b6..2bf1a81feaf47 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc0308.yaml
@@ -15,7 +15,7 @@ description: |
   They include an ISP capable of auto exposure and auto white balance.
 
 allOf:
-  - $ref: ../video-interface-devices.yaml#
+  - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
index 1726ecca4c77e..9eac588de0bc2 100644
--- a/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/galaxycore,gc2145.yaml
@@ -19,7 +19,7 @@ description:
   either through a parallel interface or through MIPI CSI-2.
 
 allOf:
-  - $ref: ../video-interface-devices.yaml#
+  - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
index 60903da84e1f3..0162eec8ca993 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx214.yaml
@@ -16,7 +16,7 @@ description: |
   maximum throughput of 1.2Gbps/lane.
 
 allOf:
-  - $ref: ../video-interface-devices.yaml#
+  - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
index 9a00dab2e8a3f..34962c5c70065 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx415.yaml
@@ -18,7 +18,7 @@ description: |-
   available via CSI-2 serial data output (two or four lanes).
 
 allOf:
-  - $ref: ../video-interface-devices.yaml#
+  - $ref: /schemas/media/video-interface-devices.yaml#
 
 properties:
   compatible:
-- 
2.34.1

