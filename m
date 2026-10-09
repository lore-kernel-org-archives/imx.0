Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E62464FB9BD
	for <imx@lists.linux.dev>; Fri,  9 Oct 2026 18:16:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791569767; cv=none; b=K7lL+4uQXf5ds1ScbindjG/CVjbX4abGOXdBnBHlMkaghNgEugLpYNaY+rNeXvP8+L7NRrRiRste2Lj95XJPWsoC6hquNE6ZNllvtpNtzT/mHCtuNc3gCyFY/NtVeYeaNhTlP5ZQ8CmQ6Ks0RjFS0f9wAGl8sw3fipT7C/5f5wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791569767; c=relaxed/simple;
	bh=zLRDG3GNbs6bp94VlSFWJOwlHr0OIvnaInxOZOYNNcY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JTdyxUUjsPnJk9vLFS4HULcAE8qpTFZSqFkzEYv0CY9t3/p5xvasWKoElegruaywJG5L1myRxLDPE9D4s+Io+IEZ4SXPAxLUPq/RATh+KZrgbQHsKw/J4iA834ZTeVmNKuXi746tuYHBR2ZWpfOIfDYVyejoW2phbt6blzPztCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net; spf=pass smtp.mailfrom=gmx.net; dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b=gx4QCzWq; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.b="gx4QCzWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1791569755; x=1792174555; i=wahrenst@gmx.net;
	bh=VL+JsfKPh+UkUX1blYvor4RNDKUDnUCv/jDf6izFtiU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=gx4QCzWqYLCiyaRP0N9S6G7KbLLXg8c6rkpVxl/h2H/3IL47N1yqoAZ4mOj0MAq3
	 gnLcn5S4J32pNZuTtMsqTx7u9z4K7HJxFybvsbToZcFdE66eLgfkjkjGXefgiq4oo
	 tmTiNeUeQWbYyqMPm6imtQ2s2mOr45yLKWdD6q8VMw1uKnxspAhbXXYCXlu7S/Aun
	 VJwX3KUOxtNXAAyD+X5xAsYZm7YCRiqcHLsAUUhl7NqcD7ChwPv38Tw3mJAVdpAGK
	 PCc0/2i53zjJdBtRxbIGqBq8MttDpVkXxFV29UjaHYLamZQUUKZ3pnVhDhOgZIb+V
	 BVvMM+beEIpoKXydmA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MacSe-1weWTB2HYQ-00pMIo; Fri, 09
 Oct 2026 20:15:55 +0200
From: Stefan Wahren <wahrenst@gmx.net>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH V6 1/2] dt-bindings: arm: fsl: Add chargebyte Charge Control Y
Date: Fri,  9 Oct 2026 20:15:50 +0200
Message-ID: <20261009181551.6478-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261009181551.6478-1-wahrenst@gmx.net>
References: <20261009181551.6478-1-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uRQjVsosOF9a1WKLTAUNb14JbVL8uWQb7wmpuZ212GzB5scbVAO
 QIxuJ1ZM8oBdGOKkTKcuB8RvWQnZi9JdUL+2KdYfCSnRly5xAmZqbclNTsUdHeZBUS7QruT
 Gj8M+LRftCbx+8a9L6QfQq+7xfPRw0QAoerUWDaauIJOW9LPvtUPzzfISHiB8bO6onbPsuu
 NPW60SeL9UOVSqsBykWaw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:9ieqDGLdc1s=;WxP5AGcK6NGJfRy25UBbmvmqWaQ
 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
 =

Add device-tree bindings for chargebyte Charge Control Y board based on
the PHYTEC phyCORE-i.MX93 SoM (System-on-Module).

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
=2D--
 Documentation/devicetree/bindings/arm/fsl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentatio=
n/devicetree/bindings/arm/fsl.yaml
index c8290a83205b..36e7a325af5a 100644
=2D-- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1722,6 +1722,7 @@ properties:
       - description: PHYTEC phyCORE-i.MX93 SoM based boards
         items:
           - enum:
+              - chargebyte,imx93-charge-control-y # chargebyte Charge Con=
trol Y
               - phytec,imx93-phyboard-nash  # phyBOARD-Nash-i.MX93
               - phytec,imx93-phyboard-segin # phyBOARD-Segin with i.MX93
           - const: phytec,imx93-phycore-som # phyCORE-i.MX93 SoM
=2D-=20
2.43.0

