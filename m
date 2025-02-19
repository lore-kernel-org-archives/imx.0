Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D321180A80
	for <imx@lists.linux.dev>; Wed, 19 Feb 2025 08:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739953090; cv=none; b=Yj1fBPyJVu+RKj0ynGKfAOnGkWkh6aEKfVxCrSz2cF4/ed5nsBBeQfdQllrZtjCuTCKo8jgv/8Tjd/3ffEQdd2JHgxVLrZa0nUdKALTzsZM5SCG29vIjidLn0VULejkihY09XijdLKJmxV+5BVgCccEGAETp+eTGwkQO+9OOing=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739953090; c=relaxed/simple;
	bh=vpAIVpzd9OWt29yPFoglHU6zTWF9chogs2LZMYQsgHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=de8kkjAa3osDnAtHqDyS0/ya1v4ZqbVZfHqSm6V0wyck23FJlmovcE0MZxI2Ob+fRujU47+UV8ysOHG5Ybc37EQ6jhvPov0Ac/ncRYzTEzlTntGFUkYYO0fDZ4QlfR/fXm0Odr3yk4OucxamNdtZyYg1GNZ+5m/BsGXeBb1uUdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=nMGWunGq; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=KAtWtUNt reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="nMGWunGq";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="KAtWtUNt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1739953087; x=1771489087;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GEle0AMI9TZnPmLqLtWKOxCiEdnYwNG8Oa2g+WyN29o=;
  b=nMGWunGq58jQAf0dIAzqf0a+4HDp2syJagVsUClW06SLJUu3aHMchYc0
   5113JgZLFXUFE4wZNJKSdLzkY36hlgG879+gPsFo6j1E9I7Ta6zcEcaIw
   SRirmX0qkRevzB+yKVrlykvQ8aZLS1SkXUZnEFDj2BFBsWjYweGsf8rfO
   kzgWqQMO0F1pYlV1kgRRCILTonFvKltTAMsSoTUFiCozZesfrMX/+ol5R
   temlCCHv8IAyU+oi8pxtvBQOq6Ums1HImQFFFwoLp/7R8k3DkvTV0ksH4
   bzSdn2VWDk1Zqr5yLMheV7IIMrjBXHrXM+HmshWFIOzm5TRPoPq3enIjc
   Q==;
X-CSE-ConnectionGUID: HKVTftLLQnC0kMdqN0dFGg==
X-CSE-MsgGUID: xT5G+t3NRH2NJSZh7QtJ5A==
X-IronPort-AV: E=Sophos;i="6.13,298,1732575600"; 
   d="scan'208";a="41945124"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 19 Feb 2025 09:17:58 +0100
X-CheckPoint: {67B593B6-18-C21CC984-D1047F1F}
X-MAIL-CPID: C4A40FE5FEDCBC6ADCB4AA86A878E99E_5
X-Control-Analysis: str=0001.0A002118.67B593B7.004A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 552FD16CA0B;
	Wed, 19 Feb 2025 09:17:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1739953074;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=GEle0AMI9TZnPmLqLtWKOxCiEdnYwNG8Oa2g+WyN29o=;
	b=KAtWtUNtsuyZdaPlUXi9fjG4KmDJRl1KiiMc05jZGPB+ECUYwJjFMoseo5q+SsENHxLa2F
	kkpWOLasZ9KLzvdBFL+E8Tb2SIFhV5rYt1AAJvhrr4cQfkhDiQW6Ir0DCcuNPP+TT/2rjS
	PMsAlUtrjJAj/OeYQqtCxzvgiSvpEKuKZmZFutzYEuEwKujO6jGksMXoaPwj+moSEDMZxI
	rCsf7oC/o0iyGfTH79a/vxMPsT0NKX97AilFPjQ240nA7Iwtx6rUs136DWQGy+A55u71J/
	mvc/iJaYCQZR3Tcngki+7MPbv0doJEQXsOd+4sI46Vxt5US+vf60/GScwTSiSw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] ARM: dts: TQMa6/6UL/7: DT cleanup
Date: Wed, 19 Feb 2025 09:17:35 +0100
Message-ID: <20250219081748.1181507-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi,

this series addresses some DT issues for the TQMa6x, TQMa6ULx and TQMa7x
series:
* Ordering of nodes
* Limiting PMIC rail voltage
* Using PMIC rail instead of virtual regulator
* Add fixed-partition node to "spi-nor" devices
* Adding vcc-supply to "spi-nor" devices

Best regards,
Alexander Stein

Alexander Stein (4):
  ARM: dts: imx6qdl-tqma6: Order DT properties
  ARM: dts: imx6ul-tqma6ul: Order DT properties
  ARM: dts: imx6ul-tqma6ul: Add vcc-supply for spi-nor
  ARM: dts: imx7-tqma7: Add vcc-supply for spi-nor

Markus Niebel (5):
  ARM: dts: imx6qdl-tqma6: limit PMIC SW4 to 3.3V
  ARM: dts: imx6qdl-tqma6: use sw4_reg as 3.3V supply
  ARM: dts: imx6qdl-tqma6: Add partitions subnode to spi-nor
  ARM: dts: tqma6ul: Add partitions subnode to spi-nor
  ARM: dts: tqma7: Add partitions subnode to spi-nor

 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6.dtsi  | 25 ++++++++-----------
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6a.dtsi |  4 +--
 arch/arm/boot/dts/nxp/imx/imx6qdl-tqma6b.dtsi |  4 +--
 .../dts/nxp/imx/imx6ul-tqma6ul-common.dtsi    | 11 +++++---
 arch/arm/boot/dts/nxp/imx/imx7-tqma7.dtsi     |  7 ++++++
 5 files changed, 29 insertions(+), 22 deletions(-)

-- 
2.43.0

