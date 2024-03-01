Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D1969D2C
	for <imx@lists.linux.dev>; Fri,  1 Mar 2024 09:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709284468; cv=none; b=cTjOM/NBDpwc78JX2+gDaodk2Fy+yH2esvfYcAO+bevXJW/XFYKMI7y9Aiqg1yyahLcn31KKzL7P39THHBfx4sj2fugdZjm0YBbraksHzQcLZAuIKJzzyde0h5xJXTb1bJDICAY4T3iyJlMKPyEx6PcEDccfyEpajgbSfTeRef0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709284468; c=relaxed/simple;
	bh=9iM2bu1u6XMX/Yg0FXpuZQl+3476RIQYzgQlICCm004=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=F/tjvcOGTKAM7+CFSmmqCacYGZaGNaH5o7dYDTaiHjmfMunEe/TY6V10kFhCmBoHA0PQ7CdFSS/jme/s94BqrQoX7/fN1TEG2o6nhyPvXHJly4qFN7F74i6LA14qIHvh4fa+fZCPPW9/r5GHpAQ3adCeCF4iJMteWIvJM1X9dTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=jSRzeYfJ; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=fSxtikbA reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="jSRzeYfJ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="fSxtikbA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1709284464; x=1740820464;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=P8svfQZtYemDwzWHFSATYN5ZAeYKM9GfycB0sFipewA=;
  b=jSRzeYfJJITa93fjjGlbynF5vc1jyIYNFkvpGDRvlv45QPzW7AacJ6G7
   RLoMfcG1ayfLrq2h8KvKLShn8h7vc8RqBinW+fPCmfawzTGVx6Ouhjhyc
   BMuzW/Ccf+3P28OJw033NmYShG7CVhC2625PuLR/8l4lr9bDh7IUA5cS+
   RlhHhCY2NAW22EIsHDlWhZy9QaEEvA53zg9gcCEHV2Du4phnDOKrs9MA8
   xn+X0lwSe8GG6XFgS8XM1bamqKTwGKfcOAnnzkGFcVx+cpBiXJ4CmpFJX
   tO/fOhr8M57fiXtX2/zLM4ezkB3yHmWTB36HRb6Pm/6TYVSFFTFyNeGCZ
   Q==;
X-IronPort-AV: E=Sophos;i="6.06,195,1705359600"; 
   d="scan'208";a="35682423"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Mar 2024 10:14:22 +0100
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6993017343E;
	Fri,  1 Mar 2024 10:14:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1709284458; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=P8svfQZtYemDwzWHFSATYN5ZAeYKM9GfycB0sFipewA=;
	b=fSxtikbAqRRAXD1t65u7DIqtzTMOovELAHPFiRm9UN5Vo+naKkv7aXbSZds+n6PjIgj8Iq
	9kxlRfVE1DW9urdtHMSGOF3LqMA2vUlt0wLe74t6X3usLW4BCp2Ci8WGwYmJWy3rdv15S0
	WmiewnhOl1n614GRE/VlAkLMIL+51+4Sm4lJ0er3aPG6+uMd3uFK13FUOnYPm5upves96Z
	B0MTsHj2Oheqb7/M3GpIY6zQuuwe3hopbF1D9uYuHAYpMUCiaZBl93wKDbmAU8DduF5NYV
	XcPr3iBHXx7VfJlcYd6viA+UGFbgCixnkwxFrTNiE6vUYlTFqnP80ElhTKhdag==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com
Subject: [PATCH 0/5] i.MX8M add DSI output endpoint
Date: Fri,  1 Mar 2024 10:14:08 +0100
Message-Id: <20240301091413.3050689-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

this series was initially triggered by dtbs_check warnings. Despite [1]
rendering them invalid, this series still simplifies the DSI OF graphs on all
i.MX8M variants by adding an empty output endpoint.
Each board enabling DSI connection can simply reference the label.
Patch 5 uses applies this to MBa8Mx board.

Best regards,
Alexander

[1] https://lore.kernel.org/linux-samsung-soc/20231122-dtc-warnings-v2-1-bd4087325392@kernel.org/

Alexander Stein (5):
  arm64: dts: imx8mm: Add empty DSI output endpoint
  arm64: dts: imx8mn: Add empty DSI output endpoint
  arm64: dts: imx8mq: Add empty DSI output endpoint
  arm64: dts: imx8mp: Add empty DSI output endpoint
  arm64: dts: mba8mx: Simplify DSI connection

 arch/arm64/boot/dts/freescale/imx8mm.dtsi |  7 +++++++
 arch/arm64/boot/dts/freescale/imx8mn.dtsi |  7 +++++++
 arch/arm64/boot/dts/freescale/imx8mp.dtsi |  7 +++++++
 arch/arm64/boot/dts/freescale/imx8mq.dtsi |  7 +++++++
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 14 ++++----------
 5 files changed, 32 insertions(+), 10 deletions(-)

-- 
2.34.1

