Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F0201548C
	for <imx@lists.linux.dev>; Tue,  8 Jul 2025 04:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751948531; cv=none; b=XKihY2I1gAsLhTi/gyyvJWo5OFDiw4BvY4KbVqBVGfe9QZyyBUpVyr4x16Y/8Nt6wZZDBUrwD0bjsgesrmOxpEkFaL4Xc8Kq53Xqnb8x0ZvqvhG9EL7pjxiRFL67dPkjDVa8i88NNworvbpsJAVFBb39xBk53u65GIinm5D48Ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751948531; c=relaxed/simple;
	bh=wH7kVFdxJBWHzqdNvWRrLLi2+/mmEv22JjDs1P69R/U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lHiIYxrm238VFdvDKqEQG/EPjY6gchbd4Tab7TmvIQp1SuhDAu1g63JbxhBeEobxKZSRtr/6+/p2ZaItEJmpeuwdy8PeQB8Blk8b2JV6L3mnD8anQRK5Yaj0SrsgDAHSH2HHDM8buAJU5VUTDXCTAxOMzgvdmyVmOO2lv0inroo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=Z/YRE85N; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="Z/YRE85N"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VBm2GkJ5uO7wKhQG2Z1jEPSxTV805Br2irdNbqIz7SY=; b=Z/YRE85Naxvw4MzpNJ/26p8P54
	GLOrWbY768uIrrk7OPMrW4QBz1NETiGWLZxcjeVwr8afx9n4Alvs2FbhqpTrjsiza+mN25jxFW3b+
	UClYzGu1AyXILiQZSa8Y0QDDHC1wCPwqJsYJOvX0R2Bsr94TJrDYDwwjP6BGitejvgalZ4LdxNAqA
	WHYmJYAmmY73ZTm75nU0i8UWab1F0BoQPT4oiEui6nfA89QQVfvWKxS+xFLkaOAQIb2S/rR6W6TIi
	jOoLnTwWFz3exkaSN4hctJrRGp7gmsVL3qNQVOAE7+DWTODj0DOy+4vqz6sIWdueoDOQgJSEYo7Ov
	HvwCAJZA==;
Received: from [89.212.21.243] (port=45388 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uYzqK-00GO9H-0l;
	Tue, 08 Jul 2025 06:22:07 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH v3 0/4] Initial PHYTEC i.MX93 overlays
Date: Tue,  8 Jul 2025 06:22:02 +0200
Message-Id: <20250708042206.329208-1-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Add initial overlays for the PHYTEC phyCORE-i.MX93 SoM based boards,
that is the phyBOARD-Segin-i.MX93 and phyBOARD-Nash-i.MX93.

Overlay #1:
 - imx93-phycore-rpmsg.dtbo
 - add support for M33 core RPMsg on phyCORE-i.MX93 based boards
 - applicable to both phyBOARD-Nash and phyBOARD-Segin boards

Overlay #2:
 - imx93-phyboard-segin-peb-eval-01.dtbo
 - add support for PHYTEC PEB-EVAL-01 evaluation adapter
 - applicable to phyBOARD-Segin board

Overlay #3:
 - imx93-phyboard-segin-peb-wlbt-05.dtbo
 - add support for PHYTEC PEB-WLBT-05 WLAN/BT adapter
 - applicable to phyBOARD-Segin board

Overlay #4: 
 - imx93-phyboard-nash-peb-wlbt-07.dtbo
 - add support for PHYTEC PEB-WLBT-07 WLAN/BT adapter
 - applicable to phyBOARD-Nash board


Changes in v3:
- fix license to match base dts
- add Reviewed-by tag

Link to v2: https://lore.kernel.org/all/20250707061101.1194618-1-primoz.fiser@norik.com/

Changes in v2:
- reorder reserved memory nodes by address

Link to v1: https://lore.kernel.org/all/20250619063954.1730231-1-primoz.fiser@norik.com/

Primoz Fiser (4):
  arm64: dts: imx93-phycore-som: Add RPMsg overlay
  arm64: dts: imx93-phyboard-segin: Add PEB-EVAL-01 overlay
  arm64: dts: imx93-phyboard-segin: Add PEB-WLBT-05 overlay
  arm64: dts: imx93-phyboard-nash: Add PEB-WLBT-07 overlay

 arch/arm64/boot/dts/freescale/Makefile        | 10 ++
 .../imx93-phyboard-nash-peb-wlbt-07.dtso      | 88 ++++++++++++++++++
 .../imx93-phyboard-segin-peb-eval-01.dtso     | 52 +++++++++++
 .../imx93-phyboard-segin-peb-wlbt-05.dtso     | 93 +++++++++++++++++++
 .../dts/freescale/imx93-phycore-rpmsg.dtso    | 60 ++++++++++++
 5 files changed, 303 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-nash-peb-wlbt-07.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-eval-01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phyboard-segin-peb-wlbt-05.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx93-phycore-rpmsg.dtso

-- 
2.34.1

