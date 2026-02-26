Received: from mx-relay50-hz3.antispameurope.com (mx-relay50-hz3.antispameurope.com [94.100.134.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6774540F8FC
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 15:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.239
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120384; cv=pass; b=nfzpdYw4hs0/vqgYWgy8tkHd6qm4cNe8+23HMHvBjEVVqRScn1b4/GCcYLyPhxlbmtFlgHcs/7Qoffrk0XMpgpQX8gS3wfHEdyjrZrKq4tuNI15QRhyY4aha07Ra+7Z1hBFuKQHwKG+ODcf7OBSMxCnn9t1484HodLZEGamIJmM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120384; c=relaxed/simple;
	bh=8xptqJuqr6y/XZ8cnubujeOx86XkzhzmPx/rVf1SSn4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aYpm2c86VsMpnqV9PgVhPeqaeDmMHDEV/qTvJTKQpj9c6DAk7Y/m73DGnISudsY3bpatfBDXUaXmTT1rpjeAARhmWeQx4JG3ConhwHpVCDdQTzwtXXpiLak9vrIyJcOWTrtNmdZbUnOg0PGfXNHpfNptEvZw0+Qzwc46Tw8q1KE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=OKYzMGu3; arc=pass smtp.client-ip=94.100.134.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="OKYzMGu3"
ARC-Authentication-Results: i=1; mx-gate50-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=EG/8db4PuO6Ccr1+6/OtMXqyxNl4kd3+f1XyzIZeMRg=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120354;
 b=DK3V1Bny7HpTQfMy1U7d0uCsayJB9MBb0cc2mzuFxxGJF1nSFZmNzlQtOM+7WzXs/VWkSw9y
 RCdD+CfKpIYiVzBse/gJg9QIpleK+cWmev4BXnRvaBUFAwedAngytd0xN2XJm4B2AikqrkEpuYr
 2X7SbPr/nGm3dpo4lPD2/HKh9pZXcDX92nY/7smnnON8CMmnAaVg79OVeHFyFiqynN6Jz2abtFv
 AElgDl8QVVEFUxXyc1AdS0ZDu5+njPjX2ghRxVipsS74NG7D+OD49K0IOyiZgVsBBrjnYW0fQ3+
 /PEaa7wgmN3eDTh8PUkp0pcFhscQhB5L8KnOV7DnU2bqA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120354;
 b=MSXwtWhlMNMVJOfJ1YVryG9yeY3bCYwaCIy1DA/VJjO+cbaYlixUciuZ6o95u3Rm6SxUpXS6
 MCNCHyMvTsClL79NJD6s6KauVf/7t2Rde4Hf56V8ymWBtbZbS4rUgmdmhC9uPITqm5mncHnlRrs
 VqOGJTG4zarJ+RzrNXJm9ZK25SOVnJczNgT0NB4SVIxTONy7cJRqkuWmpOx+gRZIJemvGzUP0P9
 XzBRVCuh/NvHh2/r0Zr2flKGxG32VjOhXHI7EZcba9vBX4ytrRMOZLhHl5JfUUa6pTi7HZ4O4aS
 ncfA8dOxC5lCHe4DhGpYud3yzc+uCG1Ok9xo1Ep1KVjGA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay50-hz3.antispameurope.com;
 Thu, 26 Feb 2026 16:39:14 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id B4D43A40F28;
	Thu, 26 Feb 2026 16:39:02 +0100 (CET)
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
	linux@ew.tq-group.com
Subject: [PATCH v3 1/5] dt-bindings: usb: cdns,usb3: support USB devices in DT
Date: Thu, 26 Feb 2026 16:38:50 +0100
Message-ID: <20260226153859.665901-2-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
References: <20260226153859.665901-1-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay50-hz3.antispameurope.com with 4fMFxN1L01z2nGBP
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:99766f1dadc9c0fd76839a32754897e4
X-cloud-security:scantime:1.750
DKIM-Signature: a=rsa-sha256;
 bh=EG/8db4PuO6Ccr1+6/OtMXqyxNl4kd3+f1XyzIZeMRg=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120353; v=1;
 b=OKYzMGu3YAEuyvde/DHPxNWPcPfnyGk58Y2sBsSCbdth2bjFtM/fMR9Ae1+tWI2LdbDOWQW0
 ZytjQvf2yQ2HKAPyVaIymYZF4WtAY0lDHBE6T6gg2UrvWlLFcPriQ5AHhBOqFF2V5/4TZhy5W1z
 /Noc5tHTWgXKMzqot7Sxq5AVUz2TY4T6DZc1OC83PLO9UzO+q0lMUp65yOZsHpkPuBKEmfWuEKA
 SbDI/iqMyQ6yp/3JmYmcrJRrANdZQEZWlaoT3S0g2/JmXx3kKaD0bVo3nzUXVS7zGdvafAaiLdm
 xjcLtrTd2rRbqdkkNmHDoCBb3Mf4z9uQjbcGrZag5nTdA==

Reference usb-xhci.yaml in host mode in order to support on-board USB
hubs.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v3:
* Fix commit message typo

 Documentation/devicetree/bindings/usb/cdns,usb3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
index f454ddd9bbaa6..a199e5ba64161 100644
--- a/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
+++ b/Documentation/devicetree/bindings/usb/cdns,usb3.yaml
@@ -85,6 +85,7 @@ required:
 
 allOf:
   - $ref: usb-drd.yaml#
+  - $ref: usb-xhci.yaml#
 
 unevaluatedProperties: false
 
-- 
2.43.0

