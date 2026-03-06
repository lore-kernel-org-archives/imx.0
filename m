Received: from mx-relay16-hz2.antispameurope.com (mx-relay16-hz2.antispameurope.com [83.246.65.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CBEC2F1FC7
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.158
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772803865; cv=pass; b=fXx2HCg+XYtiZdVfs12b97mZ7jmQlcDVZD5mVCx9caSK4e431WQUXn/sXXnoXjAQNScyBW+GJW9lQztpZudYhgaAqaVWYgIzgNK74KpAxaWStNXwE4dQLE6ejzjZd2IgJxbYmyWCQPJeQuCBHCm2FytzC9UyJ6mV3pu73TpO+yg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772803865; c=relaxed/simple;
	bh=B/SKEbLB4NeJQ0DcfcoWtnek2upih7gnEx/OxsXc/+o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XR90M9KlvvpaBS3ZjJJ35ipldsIbqqUJpdsd8gvqJS0NfOWq4lfB5w6/7EOgSLpbRyTdxaRy7sBIJ0xgINTDoZeLHYR4+MoDzsY5HhpXSMGSf9yrtml+NjJy7CTicDZ/okAPf5hhP8xjvjmbfND6nDUiZvgwvJSfP/FC2W5DN+k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ew.tq-group.com; spf=fail smtp.mailfrom=ew.tq-group.com; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=B4IP5iQc reason="key not found in DNS"; arc=pass smtp.client-ip=83.246.65.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="B4IP5iQc"
ARC-Authentication-Results: i=1; mx-gate16-hz2.hornetsecurity.com 1;
 spf=softfail reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=fail header.from=ew.tq-group.com orig.disposition=quarantine
ARC-Message-Signature: a=rsa-sha256;
 bh=gMn+Wn5KfqDQbXMRtFszp3dqdpP1E1pimM9ejWQhJD0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1772803826;
 b=GcjUzyPlG5U/BOlgr4KrSRhQY28hNCGrf+YJ1yLBAYYRY6i2llywtgdzsJ4CBdwFVDGF34e/
 HQQCl+aS1vbieDP4cKE03lMOCVfsKwmSGrZC7f4KglWp2Kx0+WAtN+sUJ8WX6uElqDyn+/tPu6d
 +2rKr69/mpvJ7oPkLqKsMpxAI72q5WJDQeNEyDzN60uC8sbjlCF97ay1SkDX9skqZ22Uy14D2tk
 6pebot50ImFvbaYgOmf+pj2W6ndOhd20jxJ7iYqWGpxm/DSdpBDiRkmUXuyzCqp9ENumdonN2DT
 ldJTdL1KxPzUrodVrLi325MyJEzf2FzmYs+QgmNU7tD7A==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1772803826;
 b=OP+0cfP8TvyU1B6kWsy92CpJxZcMar98rFviHnpdLdBZexLOsX5v8/ewZKId5L1so5YqWKwf
 b1AkjuHiup/s0bSNChZVOJAY/crXd+AF/Nj0t2xFVQGn3vS3VAa27LCM9aAqXIIAUgMBM34MDPk
 +dskXCK7rP8DKVaKZ7ib+kKONkEVHDgQNZeVBf5W47SxZRQ6KrnYYNGcmhSGfl2jo6QAU3HvmBq
 xImK8CCIz6BlMaOTZ7L4ojZ/y+MrmHM73vRdtZwqN81MsQQw7uTlo/Tk0BXE8ZuyombDQlAmxSc
 uuizVNhXg/vqnNSnlSLVKL6rOoUcZ+a3zXY6B//SoWIzA==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay16-hz2.antispameurope.com;
 Fri, 06 Mar 2026 14:30:26 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 51FE65A124D;
	Fri,  6 Mar 2026 14:30:19 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] thermal/drivers/imx91: Add hwmon support
Date: Fri,  6 Mar 2026 14:30:16 +0100
Message-ID: <20260306133017.3189979-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:imx@lists.linux.dev
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay16-hz2.antispameurope.com with 4fS6j80YhXz29jgJ
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:61a3c465b03ebe9e8bdf6da1c36a1fa1
X-cloud-security:scantime:1.357
DKIM-Signature: a=rsa-sha256;
 bh=gMn+Wn5KfqDQbXMRtFszp3dqdpP1E1pimM9ejWQhJD0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1772803826; v=1;
 b=B4IP5iQcE3yqya0rgy5r0oSPf7I0MZZkvQNRVmdf2wW/9sg8xQMmVjBOX1tOLwiGH3dImqbi
 cIlW/rfu/7BQrR4ZBUzQOHfkwyZ4iDwg3BnKNDHR64VvWSuxxCdtPaIUFjwXEZOR2E4eagy6g39
 5XArpiK69RoWwqebJHjOsxQMOSxCIkWdToSqPt3vgvl4xpM3QLmxU3rrgrBl806CdiWgKRGI0d6
 TR3fn7Sb0+HqFaU51jWgMGm+V0Sp457vuS8dvMIopzEFgSkiQ9ubojMiPU7QvxJhctvShNoUwxe
 suL/55KGScl3mOQQInaafNorrs65KzHOXmWoMHijqFuoQ==

Expose thermal readings as a HWMON device, so that it could be
accessed using lm-sensors.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/thermal/imx91_thermal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/thermal/imx91_thermal.c b/drivers/thermal/imx91_thermal.c
index 9b20be03d6dec..25915bb702bea 100644
--- a/drivers/thermal/imx91_thermal.c
+++ b/drivers/thermal/imx91_thermal.c
@@ -17,6 +17,8 @@
 #include <linux/thermal.h>
 #include <linux/units.h>
 
+#include "thermal_hwmon.h"
+
 #define REG_SET					0x4
 #define REG_CLR					0x8
 #define REG_TOG					0xc
@@ -318,6 +320,8 @@ static int imx91_tmu_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(tmu->tzd),
 				     "failed to register thermal zone sensor\n");
 
+	devm_thermal_add_hwmon_sysfs(dev, tmu->tzd);
+
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
-- 
2.43.0

