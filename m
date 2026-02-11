Received: from mx-relay95-hz2.antispameurope.com (mx-relay95-hz2.antispameurope.com [94.100.136.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE3C2E62C6
	for <imx@lists.linux.dev>; Wed, 11 Feb 2026 12:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.136.195
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813365; cv=pass; b=iSIUcfaG7iRaIhhNSi3oVBVd1N989g+85a8gLS4e93SwJyeuS1UDIs376S2tMpCwRSl83Ph8+502GQCbRHk1xDS0ZRn686KAVJ1hlTgKZvFMVxjIDtZXXd5OcZ+mv6yZayB8sweKKTZTsIXigPs63TsbqaqEwQCKzGYgEO57YKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813365; c=relaxed/simple;
	bh=wJazHtN9709bx5vXU3VSNca9S8moIeQOsgpt1xQauOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z3mnOrp6D5WIjlv3hd8oSnMjZ+FaurwKA/iVQnzUlnq8SBVy3fj2NlRjYUxHH1Xzr3qYQsh/5jorAUbEDVOP2CJI/Cd8dJXWuJAqhNkhdX7sqeKxVzUX5g+x/CIxiYjCmrAKMBLW64sZZhpKCE8/HSwPaw4LHYbykTKK+QPl1EU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AP3ZoV8b; arc=pass smtp.client-ip=94.100.136.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AP3ZoV8b"
ARC-Authentication-Results: i=1; mx-gate95-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ls/S0m9WGUgqWCy8vJncgSdsx/isbkuq3kh3sRBurJc=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770813299;
 b=H6mQdM9V0Q+TcG48KgnfwCYJTciEO6iPnI6R1WRTJkW1BoKz6kgJ1KVJC0LG5pfoRvPiI233
 vWrKF1EKAaHDiNpJ3Xik68elv+jPj8sTo2jgrJxwNxPT70N3TRv+VX+PW5Lc1TR4taCgGkiOSvt
 m7Wdu32FsP6vM6BbV4Mj0fSaXLYZAr5OI/ADVB30dE5TZDxd3c3pFbT6+MFtT9G5ImSPjsnnSMo
 OktRndxLOO8emYFlzfmpzBtWfVFBGgGlC9/2JemOeg9ggbtS+lymv6NuRfz3Ve0HnFxZfkL5j3o
 NihCv7OpehtPzPCSjI2+/hQ0rQL7aIMmRWmqHtkzr4LZw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770813299;
 b=QKQEvO5AK7QboXq+kEPCCm8pS0vWwIoYWCDSJAV/niySDalrkpelFJ5u/5CdCkLCwy+79+OQ
 GGK6TW0aUv8KLCU1QIRvR3OJ0uE8jTSbSBPdKvy8TaodRiAQATlyZH3ym608vo43bH4NR2rVRGT
 zREjhNhIKWMPM138sIas1EK7O8G/2hU2/UZJs7dUwFIcOC3Obeq5nSqIQVSROUrwdAb0nwphsOZ
 ZR2eLFyPjNAZSNLN+OzWp803rnstqO7/qlmNrBqe8CM029M/vfvsJzBKlQQizv/VGBxc5qLEDFC
 S2mh6Ys3IhJYBmsY72CxU5GFlWlduaVgfgz7kBEBdJKQg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay95-hz2.antispameurope.com;
 Wed, 11 Feb 2026 13:34:58 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9C0BC5A0F22;
	Wed, 11 Feb 2026 13:34:46 +0100 (CET)
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
Subject: [PATCH v2 3/5] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Wed, 11 Feb 2026 13:34:30 +0100
Message-ID: <20260211123436.1077513-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay95-hz2.antispameurope.com with 4f9yYg6lFBz2F1Th
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:ddedd737b3f16a1ef86df4ac688a2a62
X-cloud-security:scantime:1.584
DKIM-Signature: a=rsa-sha256;
 bh=ls/S0m9WGUgqWCy8vJncgSdsx/isbkuq3kh3sRBurJc=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770813298; v=1;
 b=AP3ZoV8buc7hN4LVHG8Ucsry2GQGLTyuRUc3XEA1S5HLIe0yk54l5D/NTBQdTErKQ4TMSH+8
 u5+YyYPt81s5P8PB+Zpmb89fd+xe2pUbWnEs4qJoTrNrjPgEadeDlu0DxbzcjsnGGm9HMOyYCal
 DrkyRaTTwe9OKkx5AikzkbCz36uNq0Oau/A346RkpONyq1Aa+//iFXCiy3ySwxrDL34hoCny7uI
 lD6iPc5ziV7ARDCh0Qfofo57X8/ySzz7pp2FsIsmh4t5Nx9P4QJczig92hASJ4pRjEeG8PBEd+Z
 megF6jBVO6IL330UQM3AutQbhuOSbiMpC4RHoorLpPonQ==

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v2:
* Collected Rob's R-b

 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 5716d701292cf..ad6edd75c4ff7 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1420,6 +1420,16 @@ properties:
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

