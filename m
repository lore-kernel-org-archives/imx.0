Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729421798F
	for <imx@lists.linux.dev>; Tue, 15 Apr 2025 13:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723998; cv=none; b=cgG8OISkfYo88G9DcmqQDrUUG3ZuqIvdyvFVuXUuA3wexPpmmyxdEnoOyMKtKU/CxxTPvkJX4bR89+Pg2jn8rMNpbD98+YZs6fuJ5FsJESAPTsuE7S7VifpPKy1XwC/K2JoWcO2kXEZqYuH90Cm0r0DmLjk81rpBeIUBGIvM6lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723998; c=relaxed/simple;
	bh=IBF9J0ep9cjAC9XCYOJFD2EZwlaLg4Ku/1yVlWlYkPg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=u5RgGWQUPQ+4g3qFVoWl7KSYCtkf4ybCnC2vYBiKz2I7RhQi7u0/FB8bt2zqW5mSQ/hNCxksifiJEz7EWLgZfzpZoKGt9TOMsBdtbg8ieO/CBhWnQKR+YkmVOqEVnmrIJntRoNvKnfr5CQaMxtChNWuQjaxQ+1LvxUZLOHwYk3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=ceg5bTcY; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Aye+2S9O reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="ceg5bTcY";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Aye+2S9O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1744723995; x=1776259995;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R2SZvhgWOcXu74APsWOF5IGVz2bjc0yiT34pBzEhPzg=;
  b=ceg5bTcYesywIzUgP/ZBkAo63ySh2Eqpcdi/IdOfTB2bOMNnufZZCqhA
   UqBZPuVGIBZvYbYelmHuR15rb1bmTNeTK6jy1UzZ/FLizvJ2T9NBab3fg
   mnU3bCiIHsTM0rQb2bBTSpoutjgCFHIVZOfkogyYZQV3p/HHZX3jKOvcq
   D0Kpk3EYkHr/QK7LmMu/chggMdkhv7aR0im++uryTkT15iRb67hySlCHL
   C1JPuk63A3fdoY3+8cxkGxj0o7YvAyhpynw/SRa4b6iDdYgS7nxuBeAkV
   UDbMnH3RVzIsPlKTBADQwI1MN3vAjsKcu483YJ5jxeHfddnSYJ+6tQqUT
   A==;
X-CSE-ConnectionGUID: FzvENSeBT/eNc8+aXFsG1Q==
X-CSE-MsgGUID: iKjBA6smT3i4jVEC3eJDkQ==
X-IronPort-AV: E=Sophos;i="6.15,213,1739833200"; 
   d="scan'208";a="43543921"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 15 Apr 2025 15:33:12 +0200
X-CheckPoint: {67FE6017-19-903EAEAC-E04C76C8}
X-MAIL-CPID: 41A4BAF9440150BB2E011C50814F7D8B_5
X-Control-Analysis: str=0001.0A006397.67FE6014.0029,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 072EA16352A;
	Tue, 15 Apr 2025 15:33:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1744723987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=R2SZvhgWOcXu74APsWOF5IGVz2bjc0yiT34pBzEhPzg=;
	b=Aye+2S9OSazLcxSrARooQIIqEveTec8F0AuUZg7N0qxWL4N3rFbkLV0m/aKsaWjujxk4KJ
	iVbqYFijDFu5vULgJ3uzsKQI6FeOpEV+cWnb2ocKKBc5EYWUGOftgpoXCUhRPcaDbvOTQ8
	QLsngYPwAJDruKTEh2ffEyatPXO17Cl4Swmi/H9PpurvFivHiuUAWLQ1YwVThexqDYj+EP
	B+z3T+aXfrcaWgSvHxXSrsx/9yHiC8dit59WZCd04ziXxRkpJFSD0cyA5qDAfrAe5ATeFG
	o5cx6e2F+E7h8wbwrElMBJo0vtNblnMYym0EF3LEpGkZefwH9FNGInu1HGsfsA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Markus Niebel <Markus.Niebel@tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 1/2] dt-bindings: arm: add TQMa8XxS boards
Date: Tue, 15 Apr 2025 15:32:58 +0200
Message-ID: <20250415133301.443511-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@tq-group.com>

TQMa8XxS is a SOM series featuring NXP i.MX8X SoC.
They are called TQMa8XQPS and TQMa8XDPS respectively.
MB-SMARC-2 is a carrier reference design.

Signed-off-by: Markus Niebel <Markus.Niebel@tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index a6fd347de03fe..1c5fcd69e93e6 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1333,6 +1333,22 @@ properties:
               - const: tq,imx8qxp-tqma8xqp     # TQ-Systems GmbH TQMa8XQP SOM (with i.MX8QXP)
               - const: fsl,imx8qxp
 
+      - description:
+          TQMa8XxS is a series of SOM featuring NXP i.MX8X system-on-chip
+          variants. It has the SMARC-2.0 form factor and is designed to be placed on
+          different carrier boards. MB-SMARC-2 is a carrier reference design.
+        oneOf:
+          - items:
+              - enum:
+                  - tq,imx8qxp-tqma8xqps-mb-smarc-2 # TQ-Systems GmbH TQMa8QXPS SOM on MB-SMARC-2
+              - const: tq,imx8qxp-tqma8xqps         # TQ-Systems GmbH TQMa8QXPS SOM
+              - const: fsl,imx8qxp
+          - items:
+              - enum:
+                  - tq,imx8dxp-tqma8xdps-mb-smarc-2 # TQ-Systems GmbH TQMa8XDPS SOM on MB-SMARC-2
+              - const: tq,imx8dxp-tqma8xdps         # TQ-Systems GmbH TQMa8XDPS SOM
+              - const: fsl,imx8dxp
+
       - description: i.MX8ULP based Boards
         items:
           - enum:
-- 
2.43.0

