Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB26529D29D
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 14:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771599591; cv=pass; b=sci5E4BdQIxYbpCtI7cxcvTQBJIdyB1NPFUjWabUk/T6Sympuiy5i4wagwgcL9PgAAcr7Ku3k0dM82F524IAW7CR2M82xlq28Wq9RpF8opL9ywb2IjelkvO9eST8m+um9wiWtyAeOVpLGEP5gCuRET7ioOVD4Lr3tLU7LDWFXcU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771599591; c=relaxed/simple;
	bh=r691UYeG0Jlc5Tl00/OXFUPY1BQ66KXrinx7M4tDdvg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J+V6eL3oesEL8ZGxPwGgjG0u05Y/OBMauwwIKwYSMn6HFzUIJ30tlJenfgVzps5avqYhk5E46luJ5ZIm96aYA2WOQ4g6BUhfqHEofDNjVwJHRw6I2RKc3SwgsXwYyUZD71wAXHASiPigOC8dxPdnsS2Nz6qV4L5m99EoDFMeN+0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=H4BRb1oU; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="H4BRb1oU"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out04-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=977B/ic6AJDBhQi658+RVyXZJ76tjyvN895prl/vc1g=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1771599574;
 b=gieL6EDniOJ7nVgmxaURWJjIMPp9ld5PIuL6Td4a4YTONUJMldl0QHZ1g5/yavMQJw7AZNof
 Ze0lhMyYiKJTTLc0hTp4dbXwLcowTaEzuiVa4vz4KMavbkhPvxWcKJ/TwAw1UDKDSQyiLZeMTZS
 Ns4ANPoOuN9EDPBpBz2hzkZPZ2lwyY1Vy3mrDOwgCWbO7KHyUC7oTDgRO/8ARqJEsnrswSGUoFP
 kxbkiB4yNzGRov5cY3w5+ZQJntZ9GFNzJzPlx+jWSKGNILXTirmEb9FhOm9blNWljI6V5xajKW1
 Zki+lWXdwZmG/bcAD23wbzQ/eQEcPigB+5Cj40SX28Rmg==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1771599574;
 b=sVNRQrYkMPujYNFVpgu0uEpceiP7SVWAAj4UmzFnqlc7lxf4HfP5T7k5wRI69tfTbQFUToQt
 Q/zQ6zmMDWKaLwFg4+stEHTz19E0oXeaQbAnq/EDKLPUeDlP9Zih53TIGjsN0VmXZiQO1P/TS0o
 eOXSbqz5tsizJeqUTlzw1aiQFn6yyskNVy9NXgqT/H5h7jOGf2eYbJkKrGf5H2fR5XDO+se/Zgo
 DT9jWOXhN72TKLf0gfLY3bxMEpd50sL9o4tDfOKHIISiS7WZKNtTsxGFre+gD+KKuG5iGLz+Bai
 h+Ui4n/qdChi2xdxb6V9er4IpdomKj770XJUizkDkngsw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Fri, 20 Feb 2026 15:59:34 +0100
Received: from FEILKEA-LNX-W.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.feilke@ew.tq-group.com)
	by hmail-p-smtp01-out04-hz1.hornetsecurity.com (Postfix) with ESMTPSA id CCF6B22071C;
	Fri, 20 Feb 2026 15:59:20 +0100 (CET)
From: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>
To: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Alexander Feilke <Alexander.Feilke@ew.tq-group.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 0/3] ARM: dts: TQMa7: modify for use in bootloaders
Date: Fri, 20 Feb 2026 15:59:06 +0100
Message-ID: <20260220145917.1797286-1-Alexander.Feilke@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.feilke@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.feilke@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4fHYLK3dnmz3yZ1l
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:534bcfafd7dddc9c5c6fd6b8117fa64a
X-cloud-security:scantime:2.046
DKIM-Signature: a=rsa-sha256;
 bh=977B/ic6AJDBhQi658+RVyXZJ76tjyvN895prl/vc1g=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1771599573; v=1;
 b=H4BRb1oUzvG6wDUFUjY3zixgEsU1uT5UHwvMnLfE49ohNXHy5HJww9jPPWOIk19I6DpiDbeG
 AAbgmjtUq0mRV5rE8cNJPNogNeqT91Gd7AO7/kb87ozIF5xdILekdMmpTWBA4cggg940q6JDEn9
 pzGOxB6Xo7u5ZhGeZx6ZEm3leBAA3xVbFS5ohzte3P+TuGPk9kQ8fAqXmm7L+oCzlgTN1ijsafA
 RRAHmDuP98w0CTS74+r5D7qoS1QN1JIvcKvPuq1Z0jrzNw2b5YXTpdBUQVGLI3hHz5qgIBRezcO
 X3x0IUPoMPoBQgr1vGXkYL0OB37KSt7xZYkT9tKdI3OFA==

This series contains modifications for using Linux device trees
in bootloaders. Changes from U-Boot bootloader are incorporated
directly into the Linux device trees.

V2:
- Updated commit messages
- Added missing QSPI bootph properties to imx7-tqma7.dtsi

Alexander Feilke (3):
  ARM: dts: imx7s: add boot phase properties
  ARM: dts: tqma7: add boot phase properties
  ARM: dts: imx7-mba7: separate BOOT_CFG circuits after boot

 arch/arm/boot/dts/nxp/imx/imx7-mba7.dtsi  | 13 +++++++++++++
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi |  5 +++++
 arch/arm/boot/dts/nxp/imx/imx7s.dtsi      |  5 +++++
 3 files changed, 23 insertions(+)

-- 
2.43.0

