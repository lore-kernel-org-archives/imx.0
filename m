Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20535159582
	for <imx@lists.linux.dev>; Wed, 24 Jul 2024 12:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721825965; cv=none; b=VJ78d1oLP0fsNaPOTw8NnqqiDRPf4BUl3Qm8tYbSlozymTa0R17SLvBU9C3K/wFMgX86yb1DPlx6CDOqhQTi7dDh0RDw72YqC5rsnjUDJeNGRWJxeyJZ7oPri8IY/8sWhrmOJUxEN8XQbj9g4Z4Zmujk7p8JAYhET6pVsLILEf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721825965; c=relaxed/simple;
	bh=iKFRngR6bThsEBbutoaXpO3mxP95Zn8Gje/10gYVFpA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X/l0qE0Oyn1yNhw5uV1k3m5Nj7WCkTi1SJRt+tHHrNam9dG0QR7fbC2JCzOWi4s/3rvNl0zHCuhO10NMhYGxy7+ioRBFwQZCZ1kTwqMKK9nr5VoSl206qonICL0s5TcR9gRB3xXq+pe4ve4dGjFwR6+rjRpvp28ljcqRRMv033g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=aXY1QCsQ; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=I5n/aCOj reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="aXY1QCsQ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="I5n/aCOj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1721825963; x=1753361963;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9OLRQGJNATFibYThPw0osnlP1Zm7Dk1xUzPqw99xy9Q=;
  b=aXY1QCsQGsKf1Hon3LHBvzOtePodZLebH+ku73vnPa+ltVJ409UQA/qB
   FTVk8H+7wtpknX2BE/ErBjcboI13+td00FL3m/xvb2jlK26UEMel1PHr9
   oPjsFQMvYOB+Y0gbzvLc+xIeJQK1b93GhudqO3Otwy6mzfuw7Lq0YzWEb
   rW9lidR3CjJ4jybLIm033yFQKp22RFays86RUNH3U6xY7kVybWns59c2S
   LMduB6piq7NyKuWHw84sApdxVRi/5fJmt9G+c/Zhlldsy64V9o2sWwDZM
   Zv/X/B72mMLaCQciHTRZTUNXCdEp+DOucywcdF/cNTT3RC22+hA+WRFc1
   w==;
X-CSE-ConnectionGUID: EAIxDSEESnurwhCms4vuJw==
X-CSE-MsgGUID: dzVjTKC/Rp+OEJOnNB8Bbw==
X-IronPort-AV: E=Sophos;i="6.09,232,1716242400"; 
   d="scan'208";a="38058827"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Jul 2024 14:59:19 +0200
X-CheckPoint: {66A0FAA7-F-E8EE7C4B-C1098986}
X-MAIL-CPID: 779C293507690D51FF07B18922B41836_5
X-Control-Analysis: str=0001.0A782F26.66A0FAA7.011F,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 54F631637FD;
	Wed, 24 Jul 2024 14:59:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1721825958; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=9OLRQGJNATFibYThPw0osnlP1Zm7Dk1xUzPqw99xy9Q=;
	b=I5n/aCOjiQEzfuxDwMG/6xbJ3LiAkU2hnH85F37Y+g1DhEbl3ilo6voRl32P8g3llZ1I12
	v3vJMDtffI4xkN5B4BHSgO2XHmi/bkOixMTI5cyYQ6LtxcGyCfX4HA2EQhmrL1x0NLLX4+
	EBDRRRrQOU3NE7Y7acgQy1xt34aUE9/jqRUAGzYXqLNQB28RBSHVMXVUhsDqUmiGe0wDV1
	IPkCTRFMMjMGF8XxoZjgE4jCRpU9YCaKx2eE+a5HT2vRuelTxNkTGtEho7t8sRq5cn3d+7
	vtPhckej4Kn0teqDPkzg01QhYyjfhXs6XtGUo45ouEekd2EyNH9z+o69Aq2phg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/14] arm64: dts: freescale: imx93-tqma9352-mba93xxla: fix typo
Date: Wed, 24 Jul 2024 14:58:52 +0200
Message-Id: <20240724125901.1391698-6-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240724125901.1391698-1-alexander.stein@ew.tq-group.com>
References: <20240724125901.1391698-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

Fix typo in assignment of SD-Card cd-gpios.

Fixes: c982ecfa7992 ("arm64: dts: freescale: add initial
device tree for MBa93xxLA SBC board")

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
index da8f19a646a9..e2ee9f5a042c 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352-mba93xxla.dts
@@ -499,7 +499,7 @@ &usdhc2 {
 	pinctrl-0 = <&pinctrl_usdhc2_hs>, <&pinctrl_usdhc2_gpio>;
 	pinctrl-1 = <&pinctrl_usdhc2_uhs>, <&pinctrl_usdhc2_gpio>;
 	pinctrl-2 = <&pinctrl_usdhc2_uhs>, <&pinctrl_usdhc2_gpio>;
-	cd-gpios = <&gpio3 00 GPIO_ACTIVE_LOW>;
+	cd-gpios = <&gpio3 0 GPIO_ACTIVE_LOW>;
 	vmmc-supply = <&reg_usdhc2_vmmc>;
 	bus-width = <4>;
 	no-sdio;
-- 
2.34.1

