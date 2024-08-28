Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C193716BE1D
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 12:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724847616; cv=none; b=tVMeZJ5M867T9CgT7zaFh1+HkP1XgsbvYQLWWIMNiPeC0+TA7x97kRGWP/3YQXhpQXa5OTqA3PPEqCbiiIr25GtB7T8LkjtxmKcOyUGtair9lRlGOlz+HqzONQ0ojepq5iFWoiqiCU47R0dSKNXWzjGYFqx/chPpM8QRtIDOE5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724847616; c=relaxed/simple;
	bh=u1F7dYq+fRehlbCnymFLel1aEswtbQM811MczGwAVkU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tzCu7QMHMBFVaWhDbm0Md2iVFQ4fZd/4sHWGj84K+XliH/51E05hkLOII5s7iynq8/78R5djqx4O+TWapgt0IRAfoLF2uOH42S1M7UaOAZYEwQXs26c2qHocvQv+yXVOvOjJ9RJSa4syFXxhruWLl8fqtl+k34hqEmRHuA/uACU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=fv0oFoRH; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=rokjMLfq reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="fv0oFoRH";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="rokjMLfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1724847613; x=1756383613;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CES6bj5DfCnAd9iJmgi4F8frv22yMf+H12Cwul7UCCg=;
  b=fv0oFoRH90AUhZZey1EURgTO6euyH+O8P+ylavG4pyWS6SBHhUraylvF
   Y9nXiYc+17GOwz/9RXk3Lj22NClH4BbWngFJwki51oQG/3tNN51IsUfWc
   6h91KHPYWM/UoEjd33praCwpOXGEudPT5vQ7sr8vZZemWLAq7Kxl8wlPg
   i+X0STz4gpiq2ocWKE53lPnsX3BwSd0xEL3YfCCsQ9Jncbjelomny7TA/
   XcYvy6Ecb5D53W3iQ56qVGagRpjkW2crRtGyWycapt+d7P/ZdxNhZtKdj
   cuuPenPpYgrMAtvfAwUeY6cCZHx5Ql3jGdR6vjsPLNy40zvXAP76uA2F1
   w==;
X-CSE-ConnectionGUID: ENC9enOnS8GUPLW//VgIgw==
X-CSE-MsgGUID: Rr2IA8JiTNCTY7exyBoGxA==
X-IronPort-AV: E=Sophos;i="6.10,182,1719871200"; 
   d="scan'208";a="38635569"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Aug 2024 14:20:11 +0200
X-CheckPoint: {66CF15F9-20-C661815F-E221238E}
X-MAIL-CPID: 4F31DEAC1B6E8D7C5AE5EB53C3BE0F43_1
X-Control-Analysis: str=0001.0A782F1F.66CF15FA.000C,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E02C01613C5;
	Wed, 28 Aug 2024 14:20:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1724847605; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=CES6bj5DfCnAd9iJmgi4F8frv22yMf+H12Cwul7UCCg=;
	b=rokjMLfqOl5J7oeWyde7N+uaKuE3u1EW4+XD1S0p4GfP4c8O/GquUABN6VPPM5bA1dZhUW
	hXkehYdZlXvODgzW/OHGsR8lAWHg0B09pj09tYFtdKURCxS98ft38jVECrduBG4OHujaL7
	z0P0bgC7TTKzL+F5DF2lglH4jWigXPwT9NxRaiI5+hiZMhQDSG+lNmR7/EyzxpZLAFutOC
	3IJyOErPa0l5fat2P2FyQJMLC+f65jsadh5+uuIv9Xf8YRUUi6zyAbki0IHdA91iBAj95a
	uX6kRH2nuIwogE8MNS9UPLJjc7FXu3Ukuz/vOcxomC0uhSJTaEZgoIy6B5bVHg==
From: Markus Niebel <Markus.Niebel@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH v2 0/4] TQMa6x / MBa6x DT improvements
Date: Wed, 28 Aug 2024 14:19:55 +0200
Message-Id: <20240828121959.1268463-1-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hello,

this is the 2nd version of the series

Changes in v2:
* use uppercase for ARM in subject lines
* drop "ARM: dts: imx6qdl: Rename USB hub node name" due to
  open discussions
* no changes in remaining patch content

Best regards,
Markus

Markus Niebel (4):
  ARM: dts: imx6qdl-tqma6: move i2c3 pinmux to imx6qdl-tqma6b
  ARM: dts: imx6qdl-tqma6: improve compatible for LM75 temp sensor
  ARM: dts: imx6qdl-mba6: improve compatible for LM75 temp sensor
  ARM: dts: imx6qdl-mba6b: remove doubled entry for I2C1 pinmux

 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi  |  2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi  | 11 +---------
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 14 -------------
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  4 ++--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi | 20 +++++++++++++++++--
 5 files changed, 22 insertions(+), 29 deletions(-)

-- 
2.34.1

