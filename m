Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018216DC03
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723456072; cv=none; b=EkmNipoUxj9KZAU1F3562Sh14jUbQ+swEHK72nrbhsXZ7qA/1SnrGex+mua8RnK3J0Hdijw9T70uNnshIGzCQNpqBtbO1qi9hcYZEnJ5Tkzizk7ciBu41G2906Rm7yA2iZ/apN2b1jnGu5gfP55LdL/OzbYs3mfjRDvS9SUIxZ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723456072; c=relaxed/simple;
	bh=mHrx7jeCvf7liAzUhEblv0bq8nC2O0YGczC8eAhv6IA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YwKTwLew02UEJFHk4fVnOQicN8RE9jiemHweEWmBW84SL+IlaSSdtLUjzbzyn6Vd4M35tZhYZjFYNEJZF/7FcARjsAHjzxeNRlNIxj+kfEBB0mJEY3Ress2c/+QP/8EA+EcNn0KLML+YrH2eqO+nGvL5tSAB6GI5sTu7gbXknTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=ENkrjTQF; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="ENkrjTQF"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id EC6ACA03FB;
	Mon, 12 Aug 2024 11:47:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=3wbtoEoxYVroU1JNp7eB
	tK/67fGjW/Y+nxaKV9kolHw=; b=ENkrjTQFSqjD6EHY++oag+wCwJmWCbXDKTvc
	PZfxhJ2ATAkjrUKmj4UHidExkfVaBDVneFetjVgRQOOQRYo6L3g+euhILh/ZvxgU
	+j0E4fQ6PVpu6NwaNRXyOcnmLkv6Utb4FM3bK/CybN5kGjdX9vpDzuCLj3+gPwrw
	nRSq/D6UQT0zqZWIo2u9EgTQVVbdcOfii76pjMwyrlTYWD9Pjk0FhdsAIqkVMCaN
	F+7zago67KtZ0obS9XnXvlAlWGlnOFRdYeROUblNDDtAKYVLZDP/VA/b5zLFisRH
	3d3pcH0rqePo0ouLoctamnsTnHMFB0u2yI+61GdZ+5ug3VxV2cNzd6cl+gkF1nuz
	uYM8nFAU0ZDAktuZScYyYrso4kLj0FM9UZSFd2mqeFHRyksQaLFk9x+K6G/sbumZ
	6iE8zbjAP220nVf+ezBKZ6Gsf0qFPifrKcLwfekJCLQexkUneTXi82dFWiFxjtxP
	5QTAMOvufnhab5jt/mOrG4cTkQzVx6Yw7qa+Tcm8Vrcv3OuiQh3rdOxE06sC8Xmh
	66SzTnih6T5NuOJt8U1TLlPlwz8IHyotsrfqP3SSr/ZbMWZA1xQg4qe4nr65F1XG
	nwSnC3K4g3vJmx7GRDZXehs/exsW4JpVugxRAKJg5TXljkrEnBTA9d84TSYKoYUm
	Q164IuE=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <imx@lists.linux.dev>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Simon
 Horman" <horms@kernel.org>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Richard Cochran
	<richardcochran@gmail.com>
Subject: [PATCH v3 net-next 2/2] net: fec: Remove duplicated code
Date: Mon, 12 Aug 2024 11:47:15 +0200
Message-ID: <20240812094713.2883476-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240812094713.2883476-1-csokas.bence@prolan.hu>
References: <20240812094713.2883476-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1723456068;VERSION=7976;MC=3472913282;ID=645971;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94854617367

`fec_ptp_pps_perout()` reimplements logic already
in `fec_ptp_read()`. Replace with function call.

Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/net/ethernet/freescale/fec_ptp.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 4ed790cb6be4..c97a0e4e7d89 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -235,13 +235,7 @@ static int fec_ptp_pps_perout(struct fec_enet_private *fep)
 	timecounter_read(&fep->tc);
 
 	/* Get the current ptp hardware time counter */
-	temp_val = readl(fep->hwp + FEC_ATIME_CTRL);
-	temp_val |= FEC_T_CTRL_CAPTURE;
-	writel(temp_val, fep->hwp + FEC_ATIME_CTRL);
-	if (fep->quirks & FEC_QUIRK_BUG_CAPTURE)
-		udelay(1);
-
-	ptp_hc = readl(fep->hwp + FEC_ATIME);
+	ptp_hc = fec_ptp_read(&fep->cc);
 
 	/* Convert the ptp local counter to 1588 timestamp */
 	curr_time = timecounter_cyc2time(&fep->tc, ptp_hc);
-- 
2.34.1


