Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAD41F130A
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 10:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737455461; cv=none; b=RC8vAyx0hBMEdWQ9csfJxnAKwglGQ3Inh1SjKpZlmpO1pfzKZRDW4Ih9UAZh65BwvQVSB7quJrdI62uUGy7dpW72ZHSC6J+5nm1qs5ajqmK5xh+9F0Z353sBxRL9bmc8gv3qXwSudjBo6iDUEfcK7yuEdNna3uyKPYLxJTLnhlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737455461; c=relaxed/simple;
	bh=LWprnAAoIOUVE1mMEjIQ01SIFP6EYiwvNG6P+BtphSk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UcxlSj+IhXZDQv1eieojF+TmsWVRp6TD6IlFYnzINUQMY4+P9a/bCFgX5nlLj3StMbJla8PRBKV2YL0lGJJBOY3dErZsKXhUuQ9Q7cin8Mr8x7eHkY5PwMQAURVHs1hoWHPN+uCSkQ8yXLwTjDxbi2iFFc9UwE7oySG64nM7ZHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=fWf9+gPe; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=pvi5DQ2Q reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="fWf9+gPe";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="pvi5DQ2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737455459; x=1768991459;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=CNv0bdqgihLs+3dJEXQ4VCvcN709eYzEDKFFDKkKou8=;
  b=fWf9+gPe7M4tfPzEyY47b1TJw9SpIWcOY27m1t56wdZuXq8GSN73BHCK
   zT1lR7fECWvyKJEWFAFYBMC2roI43lZ6Cybvp2IbWW+uI1RWU3su/OuvH
   CUIv9Z+kaLD/5GrUr+cLJ+oeFWJoeaAHpXX0Sur4tCsQ4r004/nMAtI4I
   ex5mz5J4TcXKUlYRQCF50DLufn8OKE21FDvK99nHjySIC2J61dnGh/Foq
   Dd1BldYEud19GryFGRDSXkP/yQ4EzbBSlqbmXJztQUbIl0RazxPh/VLyb
   ZvcZKH5Sfd+Tw3U7m61I2uSgzID6atbeuaWHQFuWCI9G4e4x3dsv7ys6K
   g==;
X-CSE-ConnectionGUID: h9VXRqlFRHesILkkOxDk8Q==
X-CSE-MsgGUID: CqtNUPzRTbW4lB+l/ZkQ2Q==
X-IronPort-AV: E=Sophos;i="6.13,221,1732575600"; 
   d="scan'208";a="41196383"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 21 Jan 2025 11:30:58 +0100
X-CheckPoint: {678F7762-26-1CE016C0-E589DA3E}
X-MAIL-CPID: 84DD640C611EC28B46A80462C05FC8C6_1
X-Control-Analysis: str=0001.0A682F1A.678F7762.00AE,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 953E2163990;
	Tue, 21 Jan 2025 11:30:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737455454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CNv0bdqgihLs+3dJEXQ4VCvcN709eYzEDKFFDKkKou8=;
	b=pvi5DQ2Q+5w7jwkfUCTZ6vu0Kj3nmluWqQ0JcSWpi/oPA7b4t8DNg9mEp/rrThjEgbej9F
	rSbPWQDiiBHBsN63F8NHL4Huqz6qtGwiUIpelDNKKXXTDqAEW0LRXwapmamlPF1Rc7F/L8
	ocLVNKK2NbwTUdRq5vAyFtKvhqgBhdmUsIpsXWehcrgrZ8bkFocU4FqcivzwO9NtJyTwfi
	4DvWZVCQANMBA002HbizP7vMG+t76CZ5q0G7mpseBelRsdFep/rBTYckwhUmcnMftEVJAZ
	3ZZYVKZ2aogeWvgM9SWr45aKJGW/bi6QwyYIn/QeI7q9N1zLuTYBVJQKrlXUxA==
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
Subject: [PATCH 4/4] arm64: dts: freescale: tqma8mqnl: Add vcc-supply for spi-nor
Date: Tue, 21 Jan 2025 11:30:25 +0100
Message-Id: <20250121103026.1404856-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
References: <20250121103026.1404856-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

(Q)SPI NOR flash is supplied by 1.8V. Add the corresponding supply.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
index d9c7fbc16b855..1d23814e11cd3 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi
@@ -67,6 +67,7 @@ flash0: flash@0 {
 		spi-max-frequency = <84000000>;
 		spi-tx-bus-width = <1>;
 		spi-rx-bus-width = <4>;
+		vcc-supply = <&buck5_reg>;
 
 		partitions {
 			compatible = "fixed-partitions";
-- 
2.34.1

