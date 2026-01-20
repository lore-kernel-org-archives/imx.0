Received: from mail.gruber-software.com (mail.gruber-software.com [3.120.200.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB9743D4EB
	for <imx@lists.linux.dev>; Tue, 20 Jan 2026 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=3.120.200.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925627; cv=none; b=G4KBJ7LfeJiYv5Z5j6d1yx/+w34dOVjGHGT/5mCSj5JTBKRZT62KXjjnY5OBX6b0zdB1oDGZLVS0G1n8PcNVQUbCnWhEiuvZxrmUQiHo10dMhUoTtCOzWBs2NwKkDJTSixX+qKdsof+tDaamePpMNXjiQbUpW+sbDmZ+CDWR4Fk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925627; c=relaxed/simple;
	bh=6u9VQ3smuZ4xFNkub6aGClHC3hHFUo7ccwAg3eK3rEQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HuVLCj1MtC7hE0gBfsaABvoc60D/pyhQiaTdIhoNtaOPuCAm3QoE4N2WgqA/v9T6QaVS4+6dKXFCJpQ13CnYQCJ+QyeKHfcwJ2omvAPuB6dBhVVoWzkFGo5YELY02XDZrphD4z2RsgBIUufzEZ7i8wDdqk7W00UWCvAN7nYaXAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clemensgruber.at; spf=pass smtp.mailfrom=clemensgruber.at; dkim=pass (2048-bit key) header.d=clemensgruber.at header.i=@clemensgruber.at header.b=s09+MPcL; arc=none smtp.client-ip=3.120.200.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=clemensgruber.at
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=clemensgruber.at
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=clemensgruber.at header.i=@clemensgruber.at header.b="s09+MPcL"
Received: from workstation.tuxnet (213-47-81-100.cable.dynamic.surfer.at [213.47.81.100])
	by mail.gruber-software.com (Postfix) with ESMTPSA id 5B2038055C8;
	Tue, 20 Jan 2026 17:04:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=clemensgruber.at;
	s=default; t=1768925072;
	bh=JsKfgJAs2masJfUaDnn/wlkoczkVyhE3PEUqqy6Qi1A=;
	h=From:To:Cc:Subject:Date:From;
	b=s09+MPcLvM4vj0LylDaD62uIATGq+eYmnL8bPN2IsN6AeeM18Jdo/dqIytTonIVmS
	 wRqhB+ZTl54dJigmtThWGjBx+LcHyaKDXSJaz03VzDkt1SWVn7bSotj8rN195KRkPg
	 0VXOHvP0z/AgyGgXC3ZUzkQdLzv+fqKXDO4tZ/CpOAeCL9Af0yB3589jasHlq6T8Ir
	 UfioQM2Xg/J+m53C94sCOtgZWZLeBP1VpOgQ74P+YY9mlZDry/X701dA3MbA1Hdg+K
	 ds/n/ul8kL1Ua2NZuRZResAN76WKO9TSK9u+ckupicB9z8bR8m6JPydKeHhydnZwoQ
	 uwVB5XohAvBbQ==
From: Clemens Gruber <mail@clemensgruber.at>
To: netdev@vger.kernel.org
Cc: Shenwei Wang <shenwei.wang@nxp.com>,
	Wei Fang <wei.fang@nxp.com>,
	Jakub Kicinski <kuba@kernel.org>,
	imx@lists.linux.dev,
	Clemens Gruber <mail@clemensgruber.at>,
	stable@kernel.org
Subject: [PATCH] net: fec: account for VLAN header in MAX_FL calculation
Date: Tue, 20 Jan 2026 17:04:07 +0100
Message-ID: <20260120160407.101273-1-mail@clemensgruber.at>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 62b5bb7be7bc ("net: fec: update MAX_FL based on the current MTU")
changed the MAX_FL (maximum frame length) calculation without accounting
for VLAN-tagged frames, leading to RX errors / dropped frames.

Add VLAN_HLEN to the MAX_FL calculation.

Fixes: 62b5bb7be7bc ("net: fec: update MAX_FL based on the current MTU")

Signed-off-by: Clemens Gruber <mail@clemensgruber.at>
Cc: stable@kernel.org
---
 drivers/net/ethernet/freescale/fec_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index e2b75d1970ae..f8f88c592323 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -1151,7 +1151,7 @@ fec_restart(struct net_device *ndev)
 	u32 rcntl = FEC_RCR_MII;
 
 	if (OPT_ARCH_HAS_MAX_FL)
-		rcntl |= (fep->netdev->mtu + ETH_HLEN + ETH_FCS_LEN) << 16;
+		rcntl |= (fep->netdev->mtu + ETH_HLEN + ETH_FCS_LEN + VLAN_HLEN) << 16;
 
 	if (fep->bufdesc_ex)
 		fec_ptp_save_state(fep);
-- 
2.52.0

