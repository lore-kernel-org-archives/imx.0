Received: from mx-relay71-hz1.antispameurope.com (mx-relay71-hz1.antispameurope.com [94.100.132.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADA9355034
	for <imx@lists.linux.dev>; Thu, 18 Dec 2025 15:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.132.236
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766071326; cv=pass; b=dyTQ5N3pracgdkp/pnUGqvPoMnGgw8ql7LceUNyTKk3zyhkcX2vbx7xzQbJ3oWJteNj/XossG70Lk34lpjvH2WGdlOIN5V5xigG0h+QeEHOigNzB+BvWXHUiMsjil1asPbDPZJ/dh2g02J3vComevBihu5v4gX8IoblHMhfPmoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766071326; c=relaxed/simple;
	bh=0QtQfNoo5zcJjIoBusJcUUqMqAgbQeNJiAM30UXwxcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IuizQ2boxI7JReklTm07cRU68BRPAcbe3/pmOpfUkPKjar19XCic00OInxCl/77j8PkefSep7Vd5wunlRlwsRelmltqUOgxvm4Rswei3tufSL/WD4zHSMtcn2H9IEl5Vi+4I4M04mcm6gycZA8KDIgjrak+x4OkQOnoPE0rnoHw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=f5NYVAVn; arc=pass smtp.client-ip=94.100.132.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="f5NYVAVn"
ARC-Authentication-Results: i=1; mx-gate71-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=as5iP/T6QACE/WGZ2DiCfgIsqDrXsPJYZSNB5TgsWqQ=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1766071285;
 b=JR6BKxX0W3cKbTLjIbHMZOKErFiVXdYTraLj2uv5NrPAXeRbfsURkR2LGxVgbQQGdTlNFa/Z
 8nYFFKCL1GbkIURvCmVATVjVwCaqnOiYTVvFI7OV5MxtsgurpvieBujDKjjD7WEwZ5sIF4AHiWY
 p4l5GL5a5lA6SGUb4rif9jyl9tDsraP1zei/dhmr59zqNpm1k8UKq6+FIGi9M6kQtguILb3DD3M
 8Xgd1mXhtRgHPLDgOdsJtl2ZyEyJLQ/2ewU0h/gYZPtH+Hp5NJVu6mMbjAz11MSZRbUbTlJ4qKc
 skMNBwPm+qE0w0FIGiqU+WifwHXgwe8tQgCUTdLqYS9pw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1766071285;
 b=VQ+Pvbv6ucHaKieQsMsoH5SnrVqRiIfHX1Nd3Oq7l33G5x+2OVEx87NyZNXAhBknFNv0t+sx
 FHOySmjjKOiGMtSSDg5I3qzeXZGls8mdPwHRCmigR2cEeqMGiF7+CMmjPEx0MSuPiG5PFSd1bPP
 dTLIBfdhk5Qk2LnnDIl4FF+Y5Q3uBxc9er+6XltYuWaGyivhpTHuWgvgjFlz3I7iZGqjLBflo2X
 3vcUsC9YM76ZAfgkQJtln8T9XmWPnTfDdTMfjpzluGZ4fafeiX8HHyZKn2HHfp5ejQ5HDpG8rWx
 ByITEEfhWOPMhrXj6EA5kxLRiRldV8qoQ7PajKolYTLBQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay71-hz1.antispameurope.com;
 Thu, 18 Dec 2025 16:21:25 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6B138CC0D7B;
	Thu, 18 Dec 2025 16:21:10 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Peter Chen <peter.chen@kernel.org>,
	Pawel Laszczak <pawell@cadence.com>,
	Roger Quadros <rogerq@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-usb@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@tq-group.com>
Subject: [PATCH 4/6] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Thu, 18 Dec 2025 16:20:51 +0100
Message-ID: <20251218152058.1521806-5-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
References: <20251218152058.1521806-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay71-hz1.antispameurope.com with 4dXDs34QP3z3fwGG
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:66d9300a35196336384c9a16144f2bee
X-cloud-security:scantime:2.419
DKIM-Signature: a=rsa-sha256;
 bh=as5iP/T6QACE/WGZ2DiCfgIsqDrXsPJYZSNB5TgsWqQ=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1766071284; v=1;
 b=f5NYVAVn/zzftT9scpaC2BOYhZb1GxEA2ZasN9mOaVdqmX4YojVQjxkwbU7uPAlfCqRif4WM
 IErgfel1ySErgf5SrOm3cyIlw81DBzGOD+mPk0AaggEz2fnQUHEYQ+eStCHVNBhS4ExQrrzWaT/
 +Sl6uSa/UmCr2wRIWbF6/9H7eWvZTK2/Jk2FmjSDOEXWDdzHIpUu3l9MBX2HaIUHfr9DcxajYDG
 ka2qtI5xqwcQ05P7sZ0xBX8CSW9v1vlzEnVQpKj/t/n4fBLMR7yx07NyVDkNdSYroCSyUfHT3ye
 5cI4D/T+0CTDomLOTzFTedlOv5eE+3a8ZcdhbQavcvV2Q==

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index dfe9fa5c4dbc4..6384b36b6f385 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1401,6 +1401,16 @@ properties:
               - const: tq,imx8dxp-tqma8xdps         # TQ-Systems GmbH TQMa8XDPS SOM
               - const: fsl,imx8dxp
 
+      - description:
+          TQMa8x is a series of SOM featuring NXP i.MX8 system-on-chip
+          variants. It is designed to be clicked on different carrier boards
+          MBa8x is the starterkit
+        items:
+          - enum:
+              - tq,imx8qm-tqma8qm-mba8x   # TQ-Systems GmbH TQMa8QM SOM on MBa8x
+          - const: tq,imx8qm-tqma8qm      # TQ-Systems GmbH TQMa8QM SOM
+          - const: fsl,imx8qm
+
       - description: i.MX8ULP based Boards
         items:
           - enum:
-- 
2.43.0

