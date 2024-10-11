Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0901CEAD1
	for <imx@lists.linux.dev>; Fri, 11 Oct 2024 20:17:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.248
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728677839; cv=none; b=KHY17BKJ6k6daEhHleeKhdjRSJviicjhAZYn+drr3ejQzg4KT2Ve7G/GcLnztR25QSqVjoPTAP07c4ZI0UaoO9TQTqJ90do9pITGY+o889j62mfoszIeWWwi3EBdkcVGvDP7VVRSjwk0bu3WlmOYOahcN+QDwHAPzSRXeQ0dR3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728677839; c=relaxed/simple;
	bh=stLoQqO8Cd+PyhnH0MVB+z/fey6dor2CcmaPnD/Sw/Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JhqqUw3UyKAxBUGPJYJque+vXhnPMXfUHBhc98t69JVbTVetzdwTl0rh9Iru0+4lIYMbijfIGi67Hv7hmHpzbCllV1PbzrywxAyd6YGrSraqGvtFDHaPhN2aCgH2UJ2/pcfASCpPTrruJjcvCmijgphu44ZA7Sdi+XVYEGzRWQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=MTE3Z2/H; arc=none smtp.client-ip=198.47.23.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="MTE3Z2/H"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 49BKGmqN107265;
	Fri, 11 Oct 2024 15:16:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1728677808;
	bh=P6d498xP36XXy4X2j2XNBIV3J80KTeTFWEpSStPLVgY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=MTE3Z2/H9J1hM1nGJ63/FA2Pl+xBH8pFr7t7GLEZqprqHMQQa+H3Tc26zQkye5gFi
	 nnfQGkrWXjZG73ZdDDYVvwWY3NuhW766mab00wrKSa8Nd89D8jhj25bqdlMzRZcU2+
	 j1PwPZdUV6aYR8WqO4DuzttWngIboTfm5ZzMUIuI=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 49BKGmpi028953
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 11 Oct 2024 15:16:48 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 11
 Oct 2024 15:16:47 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 11 Oct 2024 15:16:47 -0500
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 49BKGkCH102075;
	Fri, 11 Oct 2024 15:16:47 -0500
From: Andrew Davis <afd@ti.com>
To: Andre Przywara <andre.przywara@arm.com>,
        Russell King
	<linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer
	<s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian
 Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement
	<gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian
 Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <imx@lists.linux.dev>, Andrew Davis <afd@ti.com>
Subject: [PATCH v3 1/6] ARM: highbank: Switch to new sys-off handler API
Date: Fri, 11 Oct 2024 15:16:40 -0500
Message-ID: <20241011201645.797394-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241011201645.797394-1-afd@ti.com>
References: <20241011201645.797394-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Kernel now supports chained power-off handlers. Use
register_platform_power_off() that registers a platform level power-off
handler. Legacy pm_power_off() will be removed once all drivers and archs
are converted to the new sys-off API.

Signed-off-by: Andrew Davis <afd@ti.com>
Reviewed-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/mach-highbank/highbank.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-highbank/highbank.c b/arch/arm/mach-highbank/highbank.c
index 5d4f977ac7d2a..47335c7dadf8d 100644
--- a/arch/arm/mach-highbank/highbank.c
+++ b/arch/arm/mach-highbank/highbank.c
@@ -143,7 +143,7 @@ static void __init highbank_init(void)
 	sregs_base = of_iomap(np, 0);
 	WARN_ON(!sregs_base);
 
-	pm_power_off = highbank_power_off;
+	register_platform_power_off(highbank_power_off);
 	highbank_pm_init();
 
 	bus_register_notifier(&platform_bus_type, &highbank_platform_nb);
-- 
2.39.2

