Received: from sg-2-4.ptr.blmpb.com (sg-2-4.ptr.blmpb.com [71.18.227.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAA9034DB4A
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 02:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=71.18.227.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788835108; cv=none; b=Eba3mwDBObkFEtOzS8YTuaieP05Sac/wCZA28h67w2H6eSQKW8YuP3ViZcJr30NLHuax6v6CcNreOQJNKZIubmyghkRUOflNn6+VgqGA0jOOBWk5JJmXDln3aaBcTAXLT9Vp5Ck0VxiX6armhJ+zzoPrDntxHhXMUzm467DvsKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788835108; c=relaxed/simple;
	bh=YFk8ijcB8bITxXkCpEHcDU++XgwznV4djJXfOVSeN0M=;
	h=Cc:Content-Type:To:From:Date:Subject:Message-Id:Mime-Version:
	 In-Reply-To:References; b=G8s1ifjNHsHU3CnEpfL/zL0LrKrTBE1Vnt/YDRP3Dpi/UlSCQDwF4eUjOyg6jHMr6VwJDhOZE/ZIGgYTHrPlVkFHiNRuNFziG24chnmy4FJO9mZ5sBXlCk3SQbkl8uILfN+eoFVfFOCmj57KSHipcLOvYlZzZo5gdotkk9JkNlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc; spf=pass smtp.mailfrom=cherr.cc; dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b=DCgWHM5F; arc=none smtp.client-ip=71.18.227.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cherr.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cherr.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cherr.cc header.i=@cherr.cc header.b="DCgWHM5F"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604220257; d=cherr.cc; t=1788835097; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=JuHLfjAtbzVg6yDfxoJ2zvQ9bI5H2+ld+xQJ8ev3rsQ=;
 b=DCgWHM5FNZDOJk8SQqHSoGz+xiZ/58DOdYf9s3p1DnNh92toelltSMCUI4tawt+DUo6Bwi
 aGRhkvIa8Dqj0eYu4yggQF7cbwNSsxPDsdSRfmmUE5ToLjZGeB1BlluN+ZfRyom1IAeeYv
 da9O9dQ5PcIR8QiagbP7vf6cppg3+D+qu0Mbvod82JyJd5zZpGUPfKU8el4XyqK6oL3OF8
 xKpEyY1XV9Aj8XLpneLnhZlTpVFGo3UMnanqydLU8A2yfP1JGUsG08rzu4FqerYWN0Grs9
 Fk3l+5Mc/PevnO5a/udQmp+GIGtM43fI05hawdrOGDeQSlSy+s+Dwq+s6s13pA==
Cc: "Simon Horman" <horms@kernel.org>, "Phuc" <phucduc.bui@gmail.com>, 
	<imx@lists.linux.dev>, <netdev@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>, 
	"Shengzhuo Wei" <me@cherr.cc>
Content-Type: text/plain; charset=UTF-8
X-Mailer: b4 0.16.0
To: "Wei Fang" <wei.fang@nxp.com>, "Frank Li" <frank.li@nxp.com>, 
	"Shenwei Wang" <shenwei.wang@nxp.com>, 
	"Andrew Lunn" <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, 
	"Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>, 
	"Paolo Abeni" <pabeni@redhat.com>, 
	"Richard Cochran" <richardcochran@gmail.com>, 
	"Troy Kisky" <troy.kisky@boundarydevices.com>, 
	"Fugang Duan" <fugang.duan@nxp.com>, 
	"Lucas Stach" <l.stach@pengutronix.de>
From: "Shengzhuo Wei" <me@cherr.cc>
Date: Tue, 08 Sep 2026 10:37:57 +0800
X-Lms-Return-Path: <lba+26a9f750d+cbd05b+lists.linux.dev+me@cherr.cc>
Content-Transfer-Encoding: 7bit
Subject: [PATCH net v2 1/2] net: fec: stop the PTP clock after the netdev is unregistered
Message-Id: <20260908-fec-ptp-pps-event-uaf-v2-1-2a1d57121ade@cherr.cc>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Original-From: Shengzhuo Wei <me@cherr.cc>
Received: from [192.168.9.107] ([111.42.148.30]) by smtp.feishu.cn with ESMTPS; Tue, 08 Sep 2026 10:38:03 +0800
In-Reply-To: <20260908-fec-ptp-pps-event-uaf-v2-0-2a1d57121ade@cherr.cc>
References: <20260908-fec-ptp-pps-event-uaf-v2-0-2a1d57121ade@cherr.cc>

fec_drv_remove() unregisters the PTP clock before unregistering the
netdev. A concurrent ethtool -T can therefore pass a freed PTP clock
to ptp_clock_index() through fec_enet_get_ts_info().

Move fec_ptp_stop() after unregister_netdev(), which drains the
ethtool callbacks before the PTP clock is torn down.

Leave the probe error path unchanged, since the netdev has not been
registered there.

Fixes: 32cba57ba74b ("net: fec: introduce fec_ptp_stop and use in probe fail path")
Cc: stable@vger.kernel.org
Suggested-by: Wei Fang <wei.fang@nxp.com>
Assisted-by: GLM:5.3
Signed-off-by: Shengzhuo Wei <me@cherr.cc>
---
 drivers/net/ethernet/freescale/fec_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 794ec427b0ee..a29c8ddbbf34 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -5500,9 +5500,9 @@ fec_drv_remove(struct platform_device *pdev)
 			ERR_PTR(ret));
 
 	cancel_work_sync(&fep->tx_timeout_work);
+	unregister_netdev(ndev);
 	if (fep->bufdesc_ex)
 		fec_ptp_stop(pdev);
-	unregister_netdev(ndev);
 	fec_enet_mii_remove(fep);
 	if (fep->reg_phy)
 		regulator_disable(fep->reg_phy);

-- 
2.47.3
