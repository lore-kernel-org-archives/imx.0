Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0083DF001;
	Mon, 13 Jul 2026 09:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783934384; cv=none; b=rAPM/Punc+AgmVl5QgLjcE0ffSYRZf5MKpmN9OR6oIsQWSF4ts0vSiDN7VLTul68uFIxTjOm/j7ltzhs7F7g6amLJHHZz6UFlE+y6JN/h6KVFg9t5p+q0w2EIuTxRFsoZUu4u8SeAt+j+gUdpY5K48iOaUMAPooywcsyiFLUvhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783934384; c=relaxed/simple;
	bh=7bQDH/OZ23fOmfWvFy1z4i4nRSQhcF9nRPCTaxhKRaM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FllJFbSSoHgmY9y4GHbRfva/DE5oOmLb7ntgop0lLHQu7icxWc96THXd2K/QEQwosi62W1wLqXqM9FNkUngJkTHpfVd6qppf/wJ6zVIHmeA7cpa7MTkJtKIEA7+g3LHZupT8EA2mrabPsq1f83MqZiMQXEPruHpEZqSWwQNBYEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=QGAnsDoO; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="QGAnsDoO"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=z9Ce94XR2IBdMohRvs8y69ajZ4JeAI2hb4QUuYehro4=; b=QGAnsDoOm0yhaw1y81UbA5kH0O
	A9SLOzYZVLggRrrbHKx+ZpNF6jyeLdTTgV5jQ/37iJVfr0BfoT9qpwyhsXu9+L/9Ww7M37eehDgHr
	W7AkDc2YvBetW/F3F0CFJfGc0qBJQM3W+vVNZ2DmYt2kD3vU6ynewcxo9tHF6XHCPYrzyxyPNBA5n
	nOb/HJo4zpKGW8Wmy09niLZH8dXq3lAR2tAfyDTDuSyxXPyH8Jgp4jEYetKk1NMeWXyMLmL0fllf4
	A7IePrx7Q1yf8fVR5v+VzGm8TmdUCrUGETV6W0eoYRBmgZTKZxr0uRhvIoGjv0sBLh47hlOV7ZACE
	cD6b5BKQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjCp8-0004Rx-1w;
	Mon, 13 Jul 2026 11:19:38 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wjCp8-0004Bh-0f;
	Mon, 13 Jul 2026 11:19:38 +0200
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
Subject: [PATCH v2 0/2] Support for TQMa91xx on MBa93xxCA
Date: Mon, 13 Jul 2026 11:19:20 +0200
Message-ID: <20260713091924.2319674-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28059/Mon Jul 13 08:25:07 2026)

Hi,

this small series adds support for TQMa91xx, i.MX91 based module, on
MBa93xxCA. It supports most interfaces similar to TQMa93xx, but LVDS is not
supported at all. Wake-on-LAN works on both interfaces.

Best regards,
Alexander

Changes in v2:
* Fixed commit message on patch 1
* Adjusted description in bindings
* Fixed PHY irq type (-> level low)
* Collected Conor's A-b
* Link to v1: https://lore.kernel.org/all/20260707091424.1702245-1-alexander.stein@ew.tq-group.com/

Markus Niebel (2):
  dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and
    TQMa91xxLA SOM
  arm64: dts: add devicetree for TQMa91xx on MBa93xxCA

 .../devicetree/bindings/arm/fsl.yaml          |   6 +-
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx91-tqma9131-mba93xxca.dts    | 937 ++++++++++++++++++
 3 files changed, 942 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts

-- 
2.54.0

