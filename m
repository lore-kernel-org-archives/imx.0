Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCEAF38F97
	for <imx@lists.linux.dev>; Mon,  5 Aug 2024 14:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722869830; cv=none; b=t8coO8iK4bOZvVd3zbJegPvrho9N9GigcLlcG6xVBzS/xBw4v0o6cc0acFqmQ9e5ABMAJKbftLV9lFrrbJr3+K93odmdrTnuSc2YbOMJtzTOQkoR2iUiFShgUPeG//MUJVVkAWGOZ0y28Hb33YgPQaBDKt1gYnDfvqiI2NGrOfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722869830; c=relaxed/simple;
	bh=Fkt20XYz9Qi4FsxLYqbwpAbiAsbWZpK+l/hr5hWMwPM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ccabPazx0f6OmcT7yTbKvBUqJy7aXSzDm+yZiYhscdAXk3O5EITXyw0X1arxTnuLTPa3HKuc/ZX4l7WpAzuYx9lFeUSwwWDjO/i5I7n5FKeUTGS3uYoV2nHygznnKSdvrrCF56eam39QFXOq6cFkrA8qLbgRXUSgNQp1xDMFu1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=KEY3ON4r; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="KEY3ON4r"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id E5999A0CB7;
	Mon,  5 Aug 2024 16:48:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=2hYbkfzllAEjZBmcKvceliNAUoS+7aQN2EKiLnRG54g=; b=
	KEY3ON4rTXhI8qZ5nA449UEZGDiAxJQNyZFKL/6/kRbS9B/fIXcF0uhcphMtlWfq
	HsfoaVJq6pLQKySDGUSmRHAkaC6qVteocp+GRoJbfys8m44APqX3lTy2/0YWh/c0
	5ldUvjiKqFAsV8uzZ5P1e7AZT7/gfmNhF0sSTK3mfp60OYoIAzfH3Q8sO0jXgoQO
	uc0Mye26oBq+euozufpS8dm5FwXZym2liWaZIg2LiQkATfoK5z12Y8vBiNDZAcEN
	rhiL78YqeTl77+tWHzHpWQazWmtxIglAc4Yjq10FSYpKWITxvsKr5z7HMwLQo0UI
	RqleEqulpZxBwKpMLapC49aqFcD+21YGyrtrNNm/EG8eLLG17nS/LhS/SPxb0YVi
	HU0kB8+pawiPPBzRsPWi/KrufFoNFlIYYVahyUEGL1DoJxTYp4eSd4uOwgXHa5M+
	kV9vL0LOeRoaA++er6axnQJn+AcChIKga3GahMtihaBkVSrBA45v2OytISalZYmW
	95swTTgW61bVsFPIqmQ9fk0k4KOobiO4+vE2aWmnFPXzaaoUqsKnFLsa/odQjFAE
	jhc0aeNi0NCKd+aHESE+K3vmfBL8f6LRkpEiZMfXT/6n9p2kqoaAGUcP7IlhOS2g
	DyD/th9NZs893OmNcAi1v87OS7b1fa+iECiDXP1JDCw=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <imx@lists.linux.dev>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Wei Fang
	<wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH] net: fec: Remove duplicated code
Date: Mon, 5 Aug 2024 16:47:55 +0200
Message-ID: <20240805144754.2384663-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1722869289;VERSION=7975;MC=1667799009;ID=774119;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94854667C61

`fec_ptp_pps_perout()` reimplements logic already
in `fec_ptp_read()`. Replace with function call.

Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/net/ethernet/freescale/fec_ptp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 0cc96dac8b53..19e8fcfab3bc 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -211,13 +211,7 @@ static int fec_ptp_pps_perout(struct fec_enet_private *fep)
 	timecounter_read(&fep->tc);
 
 	/* Get the current ptp hardware time counter */
-	temp_val = readl(fep->hwp + FEC_ATIME_CTRL);
-	temp_val |= FEC_T_CTRL_CAPTURE;
-	writel(temp_val, fep->hwp + FEC_ATIME_CTRL);
-	if (fep->quirks & FEC_QUIRK_BUG_CAPTURE)
-		udelay(1);
-
-	ptp_hc = readl(fep->hwp + FEC_ATIME);
+	ptp_hc = fep->cc.read(&fep->cc);
 
 	/* Convert the ptp local counter to 1588 timestamp */
 	curr_time = timecounter_cyc2time(&fep->tc, ptp_hc);
-- 
2.34.1


