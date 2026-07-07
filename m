Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1013AFCF2;
	Tue,  7 Jul 2026 06:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783407121; cv=none; b=uLJpvzxKnk9uIc/dHtszO4Y6zc7P9kV2qMobW3DbDCHlW6hj9ZDufU1PwPsCqPeGocKQTLwx0JmCnu5VGeC95taN344E6YT5DxPsz6oMVfqsSpRa7glFUBTBiYh7C4sdKt0n2AFkRqdeyw6iBDDVf0HrdECBQFy18+5Sm2MK0p4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783407121; c=relaxed/simple;
	bh=LiZ7BdpZ0tX494b+gYoJDeJN2mxrcEbgaHv1QkG9A9I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=g3YX8Vxi9u1XwT3y/Nws323Yy4Ku2uBfdjFehq0H3TlXLsq6rrrpivvhBd7p1zGGttaPNdn0mIPLqBazX0AjSpp94DD1W+93Eta2dpvdyEaodt4Vv2Ccq7zgXTY/kIHwAJXmWff3kntWP86yeVTEtnsDnqjFm2rdxzHSx6rGdLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=lyh/YVEB; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="lyh/YVEB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=XELhEOkm5vooBREmPpclMRxFV3AkBs4ju5W5TL0lEvk=; b=lyh/YVEB9iRtD2uzwUFFtXTCFC
	/owA2bTUOU0E/fMPBEmM+yxo3b4vwCrLpw+r9piuhC4uhV1SqDRISiT+R6eV/j9JZ1PNglTQRow7H
	yrS7TUq69khPWTzG41CQ2WPsZG3F2xVzB9XPC/VLp5N19rVNCX4jheVJSadqelfAwFFmHgrzn+Pbt
	lJeSnIWqDeEmrtR1Bfgp8k29F6G18tuo3r7x+NzdoiA45HJZ2ry2dB7AiF1APy3P38ihHbRE8+N0Q
	CocP7elPi95Fqwfoj4r/6rmiSSEo3FcniHviMguQG8B7A+B0vd5bvR65KRr5f/ai9VRsdaeKiHru4
	XD9u/REQ==;
Received: from sslproxy01.your-server.de ([78.46.139.224])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wgzes-000LgH-09;
	Tue, 07 Jul 2026 08:51:54 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy01.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wgzer-0005WX-2l;
	Tue, 07 Jul 2026 08:51:53 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH v4 0/3] TQMa93xx on MBa93xxLA/CA/LA-Mini LVDS support
Date: Tue,  7 Jul 2026 08:51:46 +0200
Message-ID: <20260707065151.1079667-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: Clear (ClamAV 1.4.3/28052/Mon Jul  6 08:24:35 2026)

Hi,

this is an new version of the series for LVDS support on TQMa93xxLA/CA.
Now that the LVDS bridge support has landed the final missing peace is in
place.

Changes in v4
* Dropped all patches upstreamed already
* Adjusted for new imx93.dtsi node names
* Fix clock settings
* Add support for MBa93xxLA-Mini
* Reuse DT overlay for all mainboards

v3
* https://lore.kernel.org/all/20250304154929.1785200-1-alexander.stein@ew.tq-group.com/
v2:
* https://lore.kernel.org/all/20250224142831.485159-1-alexander.stein@ew.tq-group.com/
v1:
* https://lore.kernel.org/all/20231020130019.665853-1-alexander.stein@ew.tq-group.com/

Alexander Stein (2):
  arm64: dts: imx93-tqma9352-mba93xxla: Add LVDS overlay
  arm64: dts: imx93-tqma9352-mba93xxca: Add LVDS overlay

Martin Schmiedel (1):
  arm64: dts: imx93-tqma9352-mba93xxla-mini: Add LVDS overlay

 arch/arm64/boot/dts/freescale/Makefile        |  6 +++
 .../freescale/imx93-tqma9352-mba93xxca.dts    | 21 +++++++++
 ...3-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso | 38 ++++++++++++++++
 .../imx93-tqma9352-mba93xxla-mini.dts         | 45 +++++++++++++++++++
 .../freescale/imx93-tqma9352-mba93xxla.dts    | 21 +++++++++
 5 files changed, 131 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla-lvds-tm070jvhg33.dtso

-- 
2.54.0

