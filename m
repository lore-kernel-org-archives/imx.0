Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8438F158A30
	for <imx@lists.linux.dev>; Wed, 24 Jul 2024 12:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721825961; cv=none; b=dL7b7fApUokFzTUUB9GYdqYWAOhE2mg+Sd4PMROOama0fmFx56YAJhndNM77wEWXIjZZm9hsuCFqxLq3cpEv49X18lgLPzce0tizBAT/aQTL1+qSc3KR9iinThV50YPTa7dRf6D5iANYRPJ424U4rGFqPysjnO4c8v9yTCtDzxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721825961; c=relaxed/simple;
	bh=vSAyqclaYxQL6eCH630sIRll4sNmJc0dKMf/A2e/E0Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CmzuTYFoAL5Yo9FYJFvSw8R6z2BTf4G6qLHec5muG61459Cp+5twUcmNZAVolKSTVMDWKTBYha8z3Il+H/aWSimCdhlFD4Zd4cojRuaXHxfokjzF5sTSLQA8X0x6GagY9ltPty85auJcBcNPXaYT2fIk2FWTXKrLO4mbcCO0GHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=JOfHcXfJ; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AFy3ibBt reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="JOfHcXfJ";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AFy3ibBt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1721825958; x=1753361958;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yqCNFajQDQd+zXZXqz/8Ixz3vyweij8AFvjzAkiEM0s=;
  b=JOfHcXfJoKWym1jpbePTt0lbopUTqAMyLjqrvS5BfIPcINkuQSJAOE4w
   9tdtYVcLLjwPquYrdbhlKd4uB0EDv0uOzULPUUl/jlaGTEsrDRxNRuRti
   guon2n1LOcqYqu/L2HUI2szPYqs1NMCVccMKQx/lXiOnOMm7sd84vR6Jv
   I4Qj+p+rfx5nOnFeVDxEbrI4vXQRRpEPC9Q9hrJ5l9LLAzPmN3zKZMfze
   C9TKVCrgiexG6Md4eWdRxBXzJVov8bJKxe1SwQGDpFDBY26yTi1+QIiN4
   mX8Q7h1H0jq3qwr+GyaI/pRNA6FHvNjG6/FJO0+71PAjoDgqS1eqQKjBJ
   A==;
X-CSE-ConnectionGUID: ZkwaJkfEQmWIKXEZzpsGSQ==
X-CSE-MsgGUID: LQL069RmSQCsr7AWyIxShg==
X-IronPort-AV: E=Sophos;i="6.09,232,1716242400"; 
   d="scan'208";a="38058821"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Jul 2024 14:59:11 +0200
X-CheckPoint: {66A0FA9F-13-CA1431AC-CF855369}
X-MAIL-CPID: 86E2DF9262DCADA7F5A9205211DC4679_1
X-Control-Analysis: str=0001.0A782F17.66A0FA9F.00E6,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E61D316380A;
	Wed, 24 Jul 2024 14:59:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1721825949; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=yqCNFajQDQd+zXZXqz/8Ixz3vyweij8AFvjzAkiEM0s=;
	b=AFy3ibBt6PVeNv2PBKSdtU9GnmaAUSg0tOyVJd/uc0byTT8E0AaYdzk6Ft8hIbmVgnI0DY
	uucGcGiH05jjzcq2WlsJpFdbZ3uVEwL2rAkBvFr4yOAKKhqtgPiqwxrm1sFMRVDgKifvf4
	+NHT/C4VDmfkjGYCkvwDps8HwDCd3SPDxugoOPhwuves1tvIxgFHe95b5tJ9DU9GE6TFa9
	WFRa+rvM4TlbhtCw+awzCGgOjUPX2sQhKLQHdEnnRC1FS0eZFcvWqjqOIOaLfoz3LSTzMU
	E89P0s68Gjz4PRfeyN55cu/ah26AHsT032h2+Xha9h2A00jDW+LWNmaawC0lZQ==
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
Subject: [PATCH 01/14] arm64: dts: freescale: imx93-tqma9352: fix CMA alloc-ranges
Date: Wed, 24 Jul 2024 14:58:48 +0200
Message-Id: <20240724125901.1391698-2-alexander.stein@ew.tq-group.com>
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

DRAM starts at 0x80000000.

Fixes: c982ecfa7992 ("arm64: dts: freescale: add initial device tree for MBa93xxLA SBC board")
Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
index edbd8cad35bc..17ccf38ebd56 100644
--- a/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx93-tqma9352.dtsi
@@ -19,7 +19,7 @@ reserved-memory {
 		linux,cma {
 			compatible = "shared-dma-pool";
 			reusable;
-			alloc-ranges = <0 0x60000000 0 0x40000000>;
+			alloc-ranges = <0 0x80000000 0 0x40000000>;
 			size = <0 0x10000000>;
 			linux,cma-default;
 		};
-- 
2.34.1

