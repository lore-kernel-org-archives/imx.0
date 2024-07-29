Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CB214882B
	for <imx@lists.linux.dev>; Mon, 29 Jul 2024 12:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722256566; cv=none; b=OHrjnxYqtvw+c79HchDHoUpSUNdbfwzyYkE3VL1dAeMGBfzAFLD9uBKuH5n6GFYX4BGGYzNQytkVvelzYi8GrkjITvnJw6vNgHg2EpdP8z3siYJP2i5hHgKTOMA+ZY0j4sLAFt6ST4jcFIxkpxzSvWlI68fz5NvVGJKKG35IPDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722256566; c=relaxed/simple;
	bh=stLoQqO8Cd+PyhnH0MVB+z/fey6dor2CcmaPnD/Sw/Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eq0sPyaUFkvg2UZybihC8PBDOMcOnyvML6iS4yenG3BImI3PlGqQHSKtwHu0B8mbD7t4o1jSYjP8+MRcuSCjIyTsk5+6lICbm5HX985fI4i98VLkb/j0mxlC12NfYTRX6zdCdCuTrDIZ56uxeIILsIhbXu8OB9ZRAcQ93POZ3iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=TmpERbou; arc=none smtp.client-ip=198.47.19.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="TmpERbou"
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 46TCZfbe080637;
	Mon, 29 Jul 2024 07:35:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1722256541;
	bh=P6d498xP36XXy4X2j2XNBIV3J80KTeTFWEpSStPLVgY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=TmpERbou3D6wNmMKA6rD+qvku1gez2o9p2zA4OJr0nIFHxIo5DGwhD5XfvLkQEQv+
	 mUjTaraygmcoyRgHf/2XyduoKDYj3A6+u0peoxrGldLffSq3dYSNibDKbJwvlkSK7A
	 l+2NCCrgn6D7G4wQwAU/IIZHTH4uiWVtPEsOcnYk=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 46TCZfTd017797
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 29 Jul 2024 07:35:41 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 29
 Jul 2024 07:35:41 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 29 Jul 2024 07:35:40 -0500
Received: from fllvsmtp7.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 46TCZd0i128014;
	Mon, 29 Jul 2024 07:35:40 -0500
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
Subject: [PATCH v2 1/7] ARM: highbank: Switch to new sys-off handler API
Date: Mon, 29 Jul 2024 07:35:32 -0500
Message-ID: <20240729123538.175704-2-afd@ti.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240729123538.175704-1-afd@ti.com>
References: <20240729123538.175704-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

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

