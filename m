Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A5B184529
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723473297; cv=none; b=cxaW+spJ+SOYLFcVbg+CJAZizWBg74iuICFwYdQXbTNT1sJRUO8+YAr0MQ/UyHrsw4LNQ2M1S+s6uwTd+XLR1u7FvN3WA5p3l4/kyHQFsLr/nv1WgnxmKFScu+lygFygssQsgYvvd6uwQZJfru5wcvB+FP3GRO66ZQC0EAZ8jwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723473297; c=relaxed/simple;
	bh=unCLAr90LFRPxa8iYW53qq+ijgxPy33i0GA/ckYq/xM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=icrjNSVQYZs30fdeYPg5CQPLbqZUrMCt8BwTVqgTzw4lAuOVlFrmR3736eMJkVdN+tmPGeLTmcld7R7ky2nHm7gANar2I8DAH0Xmor7UL1r1N1zk/xpJ+cFdAn8TTwPz5ijPQC+71Q5UmbiTg6K7mLaE2n+RMoj7+AX0WIDmnig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=N8F0M2zI; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=smODH/lR reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="N8F0M2zI";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="smODH/lR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1723473296; x=1755009296;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eghM8hUwT4/I5cQZwq2gxvLgN3Js+MPb2HK+BYmg+gU=;
  b=N8F0M2zIoQUZlCRH+RwtZ/xwbnIKPA808avVcuCAbBfB9UsmZHPfndL1
   ZVTLPD7fyU5harDkqYwECf6InaDsMOKqqSMfQUOX6N7HT+Ei7SOe1Cpor
   uU+7Bvax+Sarnd5G5NLEnCS/mVNE9l0K7pBDpPnGyIc6B+eU/lnAbG9qJ
   GbVBhyTP8bKILX+mb7X8ce4B9DjPAvNMdX4okga+vMd6s/t8SZt3PhshS
   DH+7FqX2/G/flb6roYN8VfDmZAmCKu5GRW6Rtl/YiEY4glf5KLrkRkLpR
   2pgte361lLI9vEZ+1knWiJ+LoBLSTYm3FhIRooP6nNCu5qAuAPlg5was+
   A==;
X-CSE-ConnectionGUID: 9SOPj4v8RdmZNUAPwzFhYQ==
X-CSE-MsgGUID: l7bALpPoQpeuUENzB8reog==
X-IronPort-AV: E=Sophos;i="6.09,283,1716242400"; 
   d="scan'208";a="38365809"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 12 Aug 2024 16:34:55 +0200
X-CheckPoint: {66BA1D8F-A-45EF2B36-F6E28480}
X-MAIL-CPID: 4AED41F6C2D4443F7053FA744FEF28ED_0
X-Control-Analysis: str=0001.0A782F29.66BA1D8F.00F9,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E2903164635;
	Mon, 12 Aug 2024 16:34:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1723473291; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=eghM8hUwT4/I5cQZwq2gxvLgN3Js+MPb2HK+BYmg+gU=;
	b=smODH/lR8VNa4dkmniiocmcT0HhFCFgXZ8b49zUcMiCL5Q1HKwA9B3cc7kOV7JFz6qxFjP
	y78bGaHA3+zceiBN35p8Z0ZVAKtwbcgtI2z8I2hjy1N7uBWMK28yjkMRJ4gnLADcJgCbBg
	1LgicU3sDOUlnrU2RQjDcPlVklmnxXW2Xqh/w7fnwYVcLxhzVEFLRRgW0itWAz4lxqDyGA
	f/arxbCda/tCAhx3hxDGas9TdhnT1y1EwkTUeVMwC9lDejEFPe5rUTZiOcs6HzFc1x1ElD
	XechDgAVlhr0jRY90eRCwo+s0B8UlXpvFm09P50/U/cNmzDfHr8tsYSLRav/MQ==
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
	linux@ew.tq-group.com,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>
Subject: [PATCH 3/5] arm: dts: imx6qdl-mba6: improve compatible for LM75 temp sensor
Date: Mon, 12 Aug 2024 16:34:29 +0200
Message-Id: <20240812143431.98323-4-Markus.Niebel@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812143431.98323-1-Markus.Niebel@ew.tq-group.com>
References: <20240812143431.98323-1-Markus.Niebel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Use national,lm75a to specify exact variant used. This should cause
no functional changes.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
index 807f3c95e3ce..aca320ee8f47 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6a.dtsi
@@ -13,7 +13,7 @@ &fec {
 
 &i2c1 {
 	lm75: temperature-sensor@49 {
-		compatible = "national,lm75";
+		compatible = "national,lm75a";
 		reg = <0x49>;
 		vs-supply = <&reg_mba6_3p3v>;
 	};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
index 789733a45b95..eacd230b97d5 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-mba6b.dtsi
@@ -23,7 +23,7 @@ &i2c1 {
 
 &i2c3 {
 	lm75: temperature-sensor@49 {
-		compatible = "national,lm75";
+		compatible = "national,lm75a";
 		reg = <0x49>;
 		vs-supply = <&reg_mba6_3p3v>;
 	};
-- 
2.34.1

