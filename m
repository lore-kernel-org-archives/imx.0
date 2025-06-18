Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A48A28506F
	for <imx@lists.linux.dev>; Wed, 18 Jun 2025 12:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750248034; cv=none; b=bO0OAkUupocd29Ry+4hhSnlcuqee5Rl+enoBRt2MaQ6u+sMPh8oVRVNWcIf9n2mFO0ZR6ggPVseyha6RB10CgMN9pXZ54pl94C/qoH3vm5Lx7WwFPT/gsbENKwuWsAPYJM/izIAW1wvt0F4eCsE42Nak30BttoNUl9Fmgxu/kGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750248034; c=relaxed/simple;
	bh=2iqO7eQNAV+YgDrv6QeqkeUmG4rDnaxv9v7CVkxZzwk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oOGALk91jQAjaVjyfR2oXq5zoUnqnAcsTyd9rLZWP6Vko9E84HyYy8IOzjNLOChZ3rVqtPoVXzhaqWsgAALP7eqJ4fq7MdSybJaGxtdUTBe71riw9s9SsfNAdhldD8X/qriW8Od9M0/DGL8IVJCA4OJLNaiSrdCDAkCEtPMkqaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=none smtp.mailfrom=hardanger.blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hardanger.blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:e3:7f3d:bb00:d189:60c:9a01:7dca])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "bjornoya.blackshift.org", Issuer "R10" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id DB6BC66FC0E
	for <imx@lists.linux.dev>; Wed, 18 Jun 2025 12:00:30 +0000 (UTC)
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id A618842B532
	for <imx@lists.linux.dev>; Wed, 18 Jun 2025 12:00:30 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 29EEB42B50D;
	Wed, 18 Jun 2025 12:00:29 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 560da31b;
	Wed, 18 Jun 2025 12:00:28 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Wed, 18 Jun 2025 14:00:03 +0200
Subject: [PATCH net-next v4 03/11] net: fec: switch from asm/cacheflush.h
 to linux/cacheflush.h
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250618-fec-cleanups-v4-3-c16f9a1af124@pengutronix.de>
References: <20250618-fec-cleanups-v4-0-c16f9a1af124@pengutronix.de>
In-Reply-To: <20250618-fec-cleanups-v4-0-c16f9a1af124@pengutronix.de>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, bpf@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>
X-Mailer: b4 0.15-dev-6f78e
X-Developer-Signature: v=1; a=openpgp-sha256; l=913; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=2iqO7eQNAV+YgDrv6QeqkeUmG4rDnaxv9v7CVkxZzwk=;
 b=owEBbQGS/pANAwAKAQx0Zd/5kJGcAcsmYgBoUqpIOh+pePAfrUw9h11M1LbpjtWPktc4wOq4A
 eYyf2THEs+JATMEAAEKAB0WIQSf+wzYr2eoX/wVbPMMdGXf+ZCRnAUCaFKqSAAKCRAMdGXf+ZCR
 nCVWB/0RELPYGv01SjxvDftWfmQ9L9dLEyHXry0UNyxoHcG9pWCxLMD5GUyHw/bewdnSLMlAd4q
 Jr6Obc8ClsM4S0JBc5LPvR4Zx8i8OPPvl+vIpKjpyLvk5gnny61k0M7pPNZgFi9s7Co8IZf7RN9
 eekfj0AkzClDDERXhKbO+vQCvHpcTkOjNJgUdWTa+tMEbpNRLE0yj3PQIOdaLc30GkCAJpuY9Jz
 RYubuwtKmOit3B98Ybe1FTnCN3encL8lwTziXIo/r+bcAqdfkZaiXBLKhNv68bg5RVJACtkFGhm
 lQj6efYOgI9WW2h4b6AGvlE+qPyOt8wnh9xXko96/C1juOXP
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54

To fix the checkpatch warning, use linux/cacheflush.h instead of
asm/cacheflush.h.

Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 drivers/net/ethernet/freescale/fec_main.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 17e9bddb9ddd..dbfc191bcde1 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -49,6 +49,7 @@
 #include <linux/bitops.h>
 #include <linux/io.h>
 #include <linux/irq.h>
+#include <linux/cacheflush.h>
 #include <linux/clk.h>
 #include <linux/crc32.h>
 #include <linux/platform_device.h>
@@ -71,8 +72,6 @@
 #include <linux/bpf.h>
 #include <linux/bpf_trace.h>
 
-#include <asm/cacheflush.h>
-
 #include "fec.h"
 
 static void set_multicast_list(struct net_device *ndev);

-- 
2.47.2


