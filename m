Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABF71BAEDC
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 08:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739953094; cv=none; b=aQZp6wl++UXaUMABDqA1O5N+aOXUCmTKlCX9xfXP5jAvS4fQibtrnBRLQmf4VBql69cxNd1O9MAdVszKUYkzSQnmWdr/N9TYaYQr13MdFIVqPfsgvMvilE8KtYhQMAmqWEF7O1WpTaMhbZkp2alAYl6BHLv1ELz7Qi3T2gwxlpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739953094; c=relaxed/simple;
	bh=FgK32og4F4FLany8zADsAth/vrk/6UqyRqg/3jnEALk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M1aDmAQog0NmxISgJI3AE0F/dQqifmPGH1tcNgBp1j++pbsd5Ml/Wsmgwd20Es13fOAeoFWTZj+FlZ7C/V8+2+x8bExsuNA8HPSumUrl3cVyv2L3NTFIS9jOt+c/Ln5cIihxlLcSTQQiSERsawvz93YLA1LXByeFWOzhbMQzZsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=TyOGTT9I; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=B4WuRgD1 reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="TyOGTT9I";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="B4WuRgD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953091; x=1771489091;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5J2XktkVZupz+grzl0L3lVM8YCbDvKpOyQ/u9CNoYZs=;
  b=TyOGTT9IIFLBxuUN5xrpof3ffI+03ShizTTzCN5SkNC4inz7IHYeYi6J
   gTL8dMd2uPXewiewT/7xrqeaj4emY7PA06JLLScFoJ595uE5rKHd2GZFL
   Qj5f35AnJISaWpYbuMTFBJ5ElHNElFeBmpyxptiyRckALW0NpLwapGunI
   +EJ+wwy260z+mZ0CtJcLcNpGoUHvoHfOdd0zd/d6L8wVwaORlrK0XEsV6
   98DxyF2ZxRNnRgp0Q8MUCdzSNIv8Ef98XVYO+8wo3EyoMoAPd60/gZe5v
   3PEenbVXmFgL49wgBwiN3LvsD40FCpFQ7fudnsCAK93dvuXhopCR0MjII
   A==;
X-CSE-ConnectionGUID: /IX5oq6pRaGVwxOo+5u4vA==
X-CSE-MsgGUID: x7HDVl4ESXacCfgnsd69jQ==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945131"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:18:09 +0100
X-CheckPoint: {67B593C0-30-F75C4246-F0BD6D90}
X-MAIL-CPID: 11E601656B77042673F6C9590D4249A0_3
X-Control-Analysis: str=0001.0A00212D.67B593C1.0074,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2D33B16D33A;
	Wed, 19 Feb 2025 09:18:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953084;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5J2XktkVZupz+grzl0L3lVM8YCbDvKpOyQ/u9CNoYZs=;
	b=B4WuRgD1onDLsR8yVDsSyD7ZUquLG274RIqM9VpHZOc8AN2KkgKxbl6zgqMy8zhQj0TRYp
	StTqkH8kBHSKRzknLcvOwrtq3/4nnqjRWfK3HII5yVYeO30gsckK1igPUnyTbnzXKNFWqp
	oBOko5Ni8Ua32w2I/quw9N55KgiaRy8bPErS6SouRsk1yh0NWJmCp5OI+zsxDz7RNKXEdp
	hqUqrcjszganWqJJ0HtU9i14c90l9A8/NBbWSL+vH2V8gmJqKOQyTjuBhDcDjm7rpl0FwV
	roBXzr4wOkjrdClv98+nBaaxL6BGNcj9dbwnyEESpzdc4le7DwQHoiGC3XdqBQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: [PATCH 2/9] ARM: dts: imx6qdl-tqma6: limit PMIC SW4 to 3.3V
Date: Wed, 19 Feb 2025 09:17:37 +0100
Message-ID: <20250219081748.1181507-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
References: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

From: Markus Niebel <Markus.Niebel@ew.tq-group.com>

This is a fixed 3.3V rail supplying several hardware on SOM.

Signed-off-by: Markus Niebel <Markus.Niebel@ew.tq-group.com>
Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
index 303def00cdfa9..68986fb3b8df3 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi
@@ -119,7 +119,7 @@ reg_ddr_1v5b: sw3b {
 		};
 
 		sw4_reg: sw4 {
-			regulator-min-microvolt = <800000>;
+			regulator-min-microvolt = <3300000>;
 			regulator-max-microvolt = <3300000>;
 			regulator-always-on;
 		};
-- 
2.43.0

