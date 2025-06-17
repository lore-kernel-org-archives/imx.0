Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B2128C03B
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 13:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166732; cv=none; b=aooiPQeUB5g5p4zhsEaTmMTV099rmJnR2fnspQLhhWJ9x9ksYpUgtMABwlKPhYQfwcU9TGfrl7ea8t9/4NObsV+q7tOSjk1G8jS7/53xA+TVuBFweiw4unXaLj2/KqgCRVqT09xZ7nGbwofProHVSNes+89GuYTpr7jf7wLdubY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166732; c=relaxed/simple;
	bh=C7u2HEdoCzfwHVxcovppiUJv1u62o6XhC9gcCwFeaqs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q69woAyF0v93Xfr2zsFHue9NyJBtxddpJkDcjXRIMWmnT/+91/mjRxavuCdeq7oKSYnxPMIV12PXszDAwhZP4N6NTcOnabnHX1RWq7lqXS5lvoiojo7bbZvK24mltyb7ngFmvJ7kU61/uv76ETIvL4E6GKxWAuDLwCeNjw4leew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=none smtp.mailfrom=hardanger.blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hardanger.blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:e3:7f3d:bb00:e2bf:c3f2:96ab:885d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "bjornoya.blackshift.org", Issuer "R10" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id 0EE6866ECBE
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 13:25:23 +0000 (UTC)
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id D2E6742A7C2
	for <imx@lists.linux.dev>; Tue, 17 Jun 2025 13:25:22 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 7B56242A7A2;
	Tue, 17 Jun 2025 13:25:21 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 69428842;
	Tue, 17 Jun 2025 13:25:20 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 17 Jun 2025 15:24:53 +0200
Subject: [PATCH net-next v3 03/10] net: fec: add missing header files
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-fec-cleanups-v3-3-a57bfb38993f@pengutronix.de>
References: <20250617-fec-cleanups-v3-0-a57bfb38993f@pengutronix.de>
In-Reply-To: <20250617-fec-cleanups-v3-0-a57bfb38993f@pengutronix.de>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Andrew Lunn <andrew@lunn.ch>
X-Mailer: b4 0.15-dev-6f78e
X-Developer-Signature: v=1; a=openpgp-sha256; l=939; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=C7u2HEdoCzfwHVxcovppiUJv1u62o6XhC9gcCwFeaqs=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBoUWyxA7p8Skd3j//ggtCM07WHKIXP/je/+RrLe
 bpDnhZsKHWJATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaFFssQAKCRAMdGXf+ZCR
 nEVoB/4vxWTm1tswfGFHCBBNxBj63PhMZ/h5EBu+CwuwkQzlGttfy+3z98nj34UkX4i0713Gqtn
 6KkysiSKiV7jgbx0ADByTkdTQBQooFJ3awqwuhlAdrveuLkcA3dWH+i6Ppz2pewV76/CLDY3Muy
 aOlB/QfUpaJZxTHz1xnH4IcBLKDUtPRrS1clMTvOvcwhTQ3o3PGued9N4rbfHh+FCD8TehsIYdM
 8PhLM10YysvZqFWCOlJFNhudmJsS5b28wUvt2FJbGeugD/i9uz9fHbN4h3AaqApFaKuNVxm4mb/
 0zRlKRsnHYAt/i6APnFH1to41newJ3sUgP5qXPbsmKeoaUjX
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54

The fec.h isn't self contained. Add missing header files, so that it can be
parsed by language servers without errors.

Reviewed-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/ethernet/freescale/fec.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/ethernet/freescale/fec.h b/drivers/net/ethernet/freescale/fec.h
index ce1e4fe4d492..4098d439a6ff 100644
--- a/drivers/net/ethernet/freescale/fec.h
+++ b/drivers/net/ethernet/freescale/fec.h
@@ -15,7 +15,9 @@
 /****************************************************************************/
 
 #include <linux/clocksource.h>
+#include <linux/ethtool.h>
 #include <linux/net_tstamp.h>
+#include <linux/phy.h>
 #include <linux/pm_qos.h>
 #include <linux/bpf.h>
 #include <linux/ptp_clock_kernel.h>

-- 
2.47.2


