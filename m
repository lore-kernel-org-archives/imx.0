Received: from glittertind.blackshift.org (glittertind.blackshift.org [116.203.23.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4664239E9E
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 14:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.23.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738315; cv=none; b=sKT5jU/ImLrGvEGK/3WxQVjEfxgcq9itVsI2dyZUSn08r9K0wmjthkzGt26w07qDgh99JkCCVS2GVlxqhYlU+ZZSEz+jRTYrY9W62hxVYTLHPVxSU10nzDo45oNyDRstTDi8FVAdDsajgUMm1hbM4VHWTH+i8qh9hzj5APNmMaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738315; c=relaxed/simple;
	bh=kCODGNufEATWUsO5X4PzU2baeEaUlG0c2KOVUCs6+Sk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i3+Bkvz+KYri/eEdmRyTVcFdXleSw/JHP1U4lNlseQu9e7UZ1ncmz7gjW6Cpt8bTtzK17EIWFliao5j4hS3S0ftQldZ1xH/Nxtp89xIerGeLulHDrc1DQgtO6L12z2v6PMjqnv8W6wJlHtVjBJ/56NdRIrxaeIQ+x8m2FKRLPyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=none smtp.mailfrom=hardanger.blackshift.org; arc=none smtp.client-ip=116.203.23.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=hardanger.blackshift.org
Received: from bjornoya.blackshift.org (unknown [IPv6:2003:e3:7f3d:bb00:e75c:5124:23a3:4f62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1)
	 client-signature RSA-PSS (4096 bits))
	(Client CN "bjornoya.blackshift.org", Issuer "R10" (verified OK))
	by glittertind.blackshift.org (Postfix) with ESMTPS id DE4F966BB6C
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 14:16:19 +0000 (UTC)
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id A5292426441
	for <imx@lists.linux.dev>; Thu, 12 Jun 2025 14:16:19 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 28B3A426421;
	Thu, 12 Jun 2025 14:16:18 +0000 (UTC)
Received: from hardanger.blackshift.org (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id ff9af168;
	Thu, 12 Jun 2025 14:16:16 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Thu, 12 Jun 2025 16:15:56 +0200
Subject: [PATCH net-next v2 03/10] net: fec: add missing header files
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250612-fec-cleanups-v2-3-ae7c36df185e@pengutronix.de>
References: <20250612-fec-cleanups-v2-0-ae7c36df185e@pengutronix.de>
In-Reply-To: <20250612-fec-cleanups-v2-0-ae7c36df185e@pengutronix.de>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, 
 Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: imx@lists.linux.dev, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel@pengutronix.de, 
 Marc Kleine-Budde <mkl@pengutronix.de>, Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.15-dev-6f78e
X-Developer-Signature: v=1; a=openpgp-sha256; l=896; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=kCODGNufEATWUsO5X4PzU2baeEaUlG0c2KOVUCs6+Sk=;
 b=owGbwMvMwMXIU5J6/+eEiXMYT6slMWR4PVSat90xYf5Ul8XJ6W65P+wbOdcrZfPxHznj+pqrS
 CDJP6Kzk9GYhYGRi0FWTJFl/m+eG+vTV8T/Ec35DDOIlQlkCgMXpwBMxFaTg6Hby2XxApOg96kO
 6hpvJtmbXCj/eu9YzaLpHxhOq+nxfPoQNZdjwpasCvX8JXNto5Y5Tov1mcOsYdemwp3JGFm2Zm/
 C+1Mmcq+dDtlkRfU+Ctl0s4vzxJevnozVxzdETDVZIXBb+3WO8P3mk0slnB3e8zAW7/JRXmD6fk
 1kq3K59yG7nAkczAXJE6bUReqcfWXvL9n2g8eMUSh7qVTf3aqUm65xMZV63Z8POfxgiPu5oumy8
 CmByk8lCueP7HgWy+Up2z87YRfvOjOFNqUPwk+OmsouD3/RErq5yV79ktV0baeLBvo25nuVJHwb
 1lUqyyvnx3xTOFG6fLOd4ZFlOoVTvX4ahO2YZ2AqP7MfAA==
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54

The fec.h isn't self contained. Add missing header files, so that it can be
parsed by language servers without errors.

Reviewed-by: Wei Fang <wei.fang@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
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


