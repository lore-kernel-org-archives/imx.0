Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA5F9144D29
	for <imx@lists.linux.dev>; Wed,  7 Aug 2024 08:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723018283; cv=none; b=V0xxc8vBiW3utXpflr2kgsED+D/xiZHBAF9br6MFMLG/0f9IR+ZjMYl9yFAkVyeGpaW12y3VsJ3Ahj+lj72nA6nu8XBRdd8QM3dAbloPxCJw5u/3ax6oT10OFfmFWxMDAFg+K8mmx9Y5Ec5H9PIehhmN+q22RcMU3bkvoCe1dDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723018283; c=relaxed/simple;
	bh=O7WCjeIvWkbZgBS6vM4vQIgl4u3loiquJKhsttv30Po=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EHsL717DxWAxNCeNdGVChaBmZI0Nl/9vehtktRvyn2lo6K2Qh27DYRIbLzn8st8h4rWqKvHdWpig934hyP4vDxsxAIJN9+99syFW0w0idbR9lakK2D20v8/2nKGP71mPm4KM563MMXeSErqoPo/O5MbKkpSGI7zI68fl86ZyqHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=F4Tprxxe; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="F4Tprxxe"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 0EB16A05B2;
	Wed,  7 Aug 2024 10:11:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=KEun1WLwGlElpIBwl7qA
	hygYiEvU6poeyl+GGcKm/bA=; b=F4TprxxeNJ+M6GhE6PQniqBPwzBMc+icwTzv
	1BIsuzc2IezHaUkTzzuaZLcrvQwHj3yP92v4f8oKOabIhQCZkI5kUyaiir2vQEoM
	15RwQPKIuaC2zhXaO2iLINuGGtd7+4j1c0l/wEK9VbZSwFrpkXUiqslxlbxzVsjZ
	J1n73dXoH9jLgU2qnaURR3/otgTfqd5XPDk68AeLpKDP2NtMzOCsoJ0N0EDjMGhj
	/xqsCQ+9oJplBg1/3t3AlwIGRBhATFg7z99983wmrme/8KpoMdB3nL3MyophbCXH
	MbR3Eb1Ey2D8O1vA+4GSsOWnxybyG6yZfxsdca+8l3cBMTmAuY9ThL6wVPcvuCen
	yp/zJLHZFNSKAEs6GCAYHRdPJRo83L0iAMWtHI9NCZxJlfvT4Yu6uXgiwHKZGgVq
	gEDFV6CwniZaR+RkDRl7dSfoa9Elxhv67f7bzzuIYnonewjVehgFv5h8PPHaSXfw
	lwMk23fJWLzzyW1ZV0OaaPscbnKPegqlg/ciBrz5j9KHUdDLqNkGZdFAKl2WR0Ky
	S8W4FykvWAl7U+ICYzy4v6o39GHNMnaKeHArD6Z2xPXIKakuqDuiBU+WyBBQMtYr
	zOOYaCpNYIBBkI9gbhuOOQIkvdGU9wYBlJfBsnfkeqA1UAwojDLdhWOlcB/9hgXI
	i4AOvXk=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Fugang Duan <B38611@freescale.com>, "David S. Miller"
	<davem@davemloft.net>, Lucas Stach <l.stach@pengutronix.de>,
	<imx@lists.linux.dev>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, "Fabio
 Estevam" <festevam@gmail.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
	<shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, Eric Dumazet
	<edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH resubmit net] net: fec: Stop PPS on driver remove
Date: Wed, 7 Aug 2024 10:09:56 +0200
Message-ID: <20240807080956.2556602-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240805145735.2385752-1-csokas.bence@prolan.hu>
References: <20240805145735.2385752-1-csokas.bence@prolan.hu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1723018272;VERSION=7975;MC=1504705215;ID=810479;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94854617461

PPS was not stopped in `fec_ptp_stop()`, called when
the adapter was removed. Consequentially, you couldn't
safely reload the driver with the PPS signal on.

Fixes: 32cba57ba74b ("net: fec: introduce fec_ptp_stop and use in probe fail path")

Reviewed-by: Fabio Estevam <festevam@gmail.com>
Link: https://lore.kernel.org/netdev/CAOMZO5BzcZR8PwKKwBssQq_wAGzVgf1ffwe_nhpQJjviTdxy-w@mail.gmail.com/T/#m01dcb810bfc451a492140f6797ca77443d0cb79f
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/net/ethernet/freescale/fec_ptp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index e32f6724f568..2e4f3e1782a2 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -775,6 +775,9 @@ void fec_ptp_stop(struct platform_device *pdev)
 	struct net_device *ndev = platform_get_drvdata(pdev);
 	struct fec_enet_private *fep = netdev_priv(ndev);
 
+	if (fep->pps_enable)
+		fec_ptp_enable_pps(fep, 0);
+
 	cancel_delayed_work_sync(&fep->time_keep);
 	hrtimer_cancel(&fep->perout_timer);
 	if (fep->ptp_clock)
-- 
2.34.1


