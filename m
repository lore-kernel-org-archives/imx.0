Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9AE140FDB7
	for <imx@lists.linux.dev>; Thu, 26 Feb 2026 15:39:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772120382; cv=pass; b=Pf7iE6RqUUVNM9T4ixtX7Ip56FU2pQidfh+iFfNFmg37b6BuzQ84DthZDDa5p70gFfwTh+lysH2/KU6NN4LpppaFs9ZWPqwRHeS9wgKrfD7WrC/49E9olv50geOoaLbrnehFJ5DFJMcPlo+QvbwVwopKVCrJl0/E3QluJXJLdYU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772120382; c=relaxed/simple;
	bh=R2v8n89f0c78cnd/TtY73AodxGwbn9p0TmvotZHshjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JEsKqXfomp7wPE9KbqfaT5DAbYy6/gKmPyFTwUZyexwbaCyLA9tyqreBjJlVr3CYfcG8p+YtilxEIPUjts2ZEhoK6Cg7Ez01hy1zijPLZrbmZgiHKw2v8gRKgsIXpHBNukeipUNl3h5kMmL4pY/io48iIhZDtshjsS/FUA16FtQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=HkSNpe/F; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="HkSNpe/F"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out01-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=NjYbXwIQ8PduPQUva1l1y0HvqHmC0aGyA7hHhqtwLEI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772120357;
 b=PbK4eWaVN0633MH0vqkYYX5jj+Lymib1x5OsICtg1X59R6ICMXPptd8J5x48mnDeZE45ERIQ
 AakPGwZOgGAKj6jdYsqRiCQQS9YFtdFIgNjG6Q/zigT7nbhK5NKkNbV2OOmzb8isM9WoatCb0sQ
 MRXpiF7VbW5y+7BzGodvFnlTNo473R3mwCDKIo3hOBuT6Obz1kxubfkH0vfnfz1XXDpQ0Zu7JfP
 Q8AR/ZKt9ic+RGyuTIZWkehwNp1df2glnsV0a7+TzPjR5eNmwC0T/uY0indOfnETvVpG3K7k71Z
 uTDJ4qN377p8vT8+uYubEyfD6c/Iw22EQkAqx7zA5MjCA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772120357;
 b=FGaiWv48be4KNcu2CjHhNKTXvLY32fiLXqChCbNu6Jra2KpvsxKwi78NGIYgysnqzL2DXIBP
 XFSIPyCfLk20HBZRGgLjHyT/ApQNkj2uk4eOySBPSzUjWw8wapJX8l4eS8brmADcBwVqlE9VPsI
 1voIYcW+J0+ps4y0J2oF4ndaFDNFNZqzxYjPIXipBij1jGk05q/+p1PU+Pa1W7hlsFtwH3fD6Jr
 MaWqbtXnUZN4hMOXRM/TQUUFB15cTV7Wm5g1DM8llMEnkAOTgHJFSE4+pFbcPfBD4YQFm9C4y3q
 U7N+fFmLUFlLv7NYN9j2M+GoCddzbJgnodsUBaUFxDX0Q==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Thu, 26 Feb 2026 16:39:17 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out01-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 37772A41123;
	Thu, 26 Feb 2026 16:39:06 +0100 (CET)
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
Subject: [PATCH v3 3/5] dt-bindings: arm: fsl: add bindings for TQMa8x
Date: Thu, 26 Feb 2026 16:38:52 +0100
Message-ID: <20260226153859.665901-4-alexander.stein@ew.tq-group.com>
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
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fMFxR36f9z3yXpX
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:568237be82892e00f1be80080e855268
X-cloud-security:scantime:1.642
DKIM-Signature: a=rsa-sha256;
 bh=NjYbXwIQ8PduPQUva1l1y0HvqHmC0aGyA7hHhqtwLEI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772120357; v=1;
 b=HkSNpe/FF6eIRu4E3HlY336pByfTDLKJf+vtpLxgaqEjUU8AAr5QMmQs0TtlzIayrUP5TFF8
 yPWI2g68Oc2hdPMyGCmzatlPUoJtcwLrjZsPkdr6ajuTgiYI9qJni+etE2JyUCSTzAdnTf3h6LT
 FhWmJW39I5HVh+xukCrSIcuOIyav9nC39P3DxO6dWVF2Vfg0ldK/GcXJplfnlA/7z7SvN1PEtxS
 Sicq0yDfC6IkOsKPQNlJppzakfooxQ5UjCIeXeYkrhytAnepxdqJ/hPk/ScX9nG6EVyhv28yGlw
 7JlkYc3VBk3h7Ulgw4EVKfjhQ02UxhNoj4awSnketV2Iw==

TQMa8x is a SOM family using NXP i.MX8QM CPU family
MBa8x is an evaluation mainboard for this SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
---
Changes in v3:
* None

 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 910c20bf07a4f..2455358c15ca4 100644
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

