Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9822F8EA5;
	Tue,  7 Jul 2026 09:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783415678; cv=none; b=rBJ6dWrAJXcTbkkeXsk/kcRJU+cI57HPRLfpN5udUKCRzWZjRUfJEIp4X/lL3nHfRA1Tz7E7qKBCV5jiZzmujX4LbR8vDaQhIbDv5Mp86auQsWN7KzvEjx+meGzk4FojC0RL4n8Emv0cE20paU/8Vxw5tLj19/YjN3ODLcFzeF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783415678; c=relaxed/simple;
	bh=6j72BxpHYavazR2RqYgLtdoUROMuEXMGfm0HiRXRZmg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FwOk7mi7VJrR8ATCXfkzRezY9PqgRr9ic/2oHmmMW+IfB/yT+pBgJ+r7lgQMR4LjXzyIqfQQFqfS5QAEpZOHG8KnLxDMdEwaNDfn8yS13h7AHlxCT8I9H3jR5E6Ea1On4/me3AJ3CVZ9kkHB5uBFBZimNuI415hZPcNgknqGa/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=DEx43K7m; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="DEx43K7m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=iXQR3WX2zxFM80tdflB+VVDwj3ay9NrpfosqulY53dE=; b=DEx43K7mtJIhw0SJncsQyWzbS1
	WM+cn/hfQkcE6ZnemrccJ/O3H66dameP4KcVCNHefWHoILXqcRJeD34rR4jm6B9JXZT91qlZWEL6E
	g0bsVKT/wny/pmIlht7BEQHJBGTIq1lRvAFXqoNJ+F8cjasZKQkaAHNNcTW9kjjjt1/vxnIADewJx
	76nVVLJScnvnm5sRu1rC8GxCQtPPdXyPB1ooVnf7ZVeyi+6ydPou+5mjtkeIhblZs4kvgwpkQwTnJ
	oGq6DkOanLY7gLoKTD+i6SdQuYvTtn90QLbT+YAO2VA08THtRv1Jw6tjaC6q1SPvKMvfAFRIaAF2A
	G9WMeyrA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1sq-000Jpv-1s;
	Tue, 07 Jul 2026 11:14:28 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wh1sp-000LtS-2R;
	Tue, 07 Jul 2026 11:14:28 +0200
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
Subject: [PATCH 0/2] Support for TQMa91xx on MBa93xxCA
Date: Tue,  7 Jul 2026 11:14:18 +0200
Message-ID: <20260707091424.1702245-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28053/Tue Jul  7 08:24:37 2026)

Hi,

this small series adds support for TQMa91xx, i.MX91 based module, on
MBa93xxCA. It supports most interfaces similar to TQMa93xx, but LVDS is not
supported at all. Wake-on-LAN works on both interfaces.

Best regards,
Alexander

Markus Niebel (2):
  dt-bindings: arm: add MBa93xxCA as mainboard for TQMa91xxCA and
    TQMa91xxLA SOM
  arm64: dts: add devicetree for TQMa91xx on MBa93xxCA

 .../devicetree/bindings/arm/fsl.yaml          |   5 +
 arch/arm64/boot/dts/freescale/Makefile        |   1 +
 .../freescale/imx91-tqma9131-mba93xxca.dts    | 937 ++++++++++++++++++
 3 files changed, 943 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx91-tqma9131-mba93xxca.dts

-- 
2.54.0

