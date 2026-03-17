Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D192E372EE2;
	Tue, 17 Mar 2026 11:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773746243; cv=none; b=dIZvH+VP8GT0DusjMFveaxEcjMB72MOwnC0in3PKcoOT/nsqsxn09eChdyviA9BafgOCPgXT1nu9ANWXgsoXWDdsV9jPy+y4RxYzoEardSfZgw2cdG8/J5kNmxnbWjvr7KXGSw+CKMQOfsmnsImX0uYklQ7Eo7H86mX4Yp1KKMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773746243; c=relaxed/simple;
	bh=GZw8+B+r7XHcl1ZhynndIAqOtmGsttTADzy8NiQjyOc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H5H3WGJwYyGADmxgMrAtRvvtDr3fP+1ezER9sv2L1BKnz40T/iXta5LKHq7Wf7F5yjN+5+z2SPLuQhqHpP8aSyZXJ6aw+KFwHgtjNVi/ZvEPWXvoqOxyt8jaFeOrGG/fBSpCoMrOByFdFnvHKYOAgUfR0FoU/PyUImNEHztftmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=q1G5tA1H; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="q1G5tA1H"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=avvawqzpw98eGlOgQgfT3HyYcAovbaWbFswynfXll9E=; b=q1G5tA1HN7SUP59QF3c0RomN0+
	9UuDvzSVdYfhjzllYzitf+bi+v0ITmyDTlTFmtJJBVE6K9cMOwGGrUiJxkoTNgdC13gUB1cYp0aPj
	a1eVtPNK4EVFJInhhuG2BnFZOsKDKq+kd3l/zb26vpwjFv9cjfBtl36z3K3AdWYf0jar79SKCbDBk
	BQfGKxZ+Q1VjCn07wg6GsJa8tLMG6FMD0jHl9pOS8TdVPtYCV+LcYoTZbLU92mfB4Y5uwsr6ENfE2
	pFK1GjUzPILWylPnpu5VNydXcneEatDA7Vul1Sdmjzkh2OUoARbWWknr0M/9ylp2ulEGIS5iR4KWJ
	rDOmo5XA==;
Received: from sslproxy04.your-server.de ([78.46.152.42])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2SQJ-000923-1i;
	Tue, 17 Mar 2026 12:17:19 +0100
Received: from localhost ([127.0.0.1])
	by sslproxy04.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1w2SQI-000MCw-2H;
	Tue, 17 Mar 2026 12:17:19 +0100
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/3] TQMa93xx on MBa93xxLA-Mini support
Date: Tue, 17 Mar 2026 12:16:59 +0100
Message-ID: <20260317111704.1075938-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/27943/Tue Mar 17 07:24:09 2026)

Hi all,

this series adds support for TQMa93xxLA on MBa93xxLA-Mini [1],
a single board computer board in small form factor.
It has a reduced feature set compared to MBa93xxLA, with WiFi/Bluetooth and
WWAN applicaitons in mind.
An overlay for Ezurio WiFi module is added as well.

Best regards,
Alexander

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/mba93xxla-mini/

Martin Schmiedel (3):
  dt-bindings: arm: fsl: add MBa93xxLA-MINI
  arm64: dts: freescale: add initial device tree for
    TQMa93xx/MBa93xxLA-MINI
  arm64: dts: freescale: imx93-tqma9352-mba93xxla-mini: Add WLAN/BT
    overlay

 .../devicetree/bindings/arm/fsl.yaml          |   3 +
 arch/arm64/boot/dts/freescale/Makefile        |   5 +
 ...3-tqma9352-mba93xxla-mini-ezurio-wlan.dtso |  35 +
 .../imx93-tqma9352-mba93xxla-mini.dts         | 637 ++++++++++++++++++
 4 files changed, 680 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini-ezurio-wlan.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-mini.dts

-- 
2.43.0

