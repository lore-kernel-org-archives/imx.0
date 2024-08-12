Received: from fw2.prolan.hu (fw2.prolan.hu [193.68.50.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E03C15099B
	for <imx@lists.linux.dev>; Mon, 12 Aug 2024 09:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.68.50.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723456071; cv=none; b=MQJCNH9zeFDIsN4La7NyQGrYDH3jk60t5lWCs8CX41rW2Yel5ptTpS25/v2xvQrP6VzWonVseBn/M2+sCqper03HoFQmYNlFkwRKawISwBYpmwbZfR/oJcd8QhZVGX5eMeFxTvnZre/siNAO+p7HvQQrf+ZBUwAxEO2C147qcfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723456071; c=relaxed/simple;
	bh=Jso0Qq4gPsryFGuHoMXouS/YJ+wODg/I0ksIm038E7E=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=RGcvdpwwmb4QFEnnfIs7P3zh1xKTs7T45oo2Mb28mCMbyvnoVnsuVbxZWxFlvg2ud7QHHGLSyInZnRXHkGzi0gGe4FAnfUfwN1PEPKtEENjFMbisOYFWx8GWLC7w1kBa1Pb1zgx+k1BPPxNGa1ZIm/xxtfLgIIzDdy1X7XLhkGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu; spf=pass smtp.mailfrom=prolan.hu; dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b=OfEGBbn/; arc=none smtp.client-ip=193.68.50.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=prolan.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=prolan.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=prolan.hu header.i=@prolan.hu header.b="OfEGBbn/"
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 12884A05B2;
	Mon, 12 Aug 2024 11:47:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=YbiEysMCo9eVDu4Ec2WR++H5KtVmAcOg1PQowdznzbQ=; b=
	OfEGBbn/d/VE5iD5YxJtavJpwjxihfo6irqQ0qlSRxezLD0jGY9+GCkf+WZqZtD4
	A2dc2l3Q3uCTDA/ZeVSPPxcQyHrirZX668S8ltfl4eIOZFhB69LRuQpgkUeVtN56
	trq6fVHIgvKhDVn/Qqwnhwb6STiT+BRqqydcmpz/8UsEeMvQmEsZg49PH27LV3Ii
	fqEhy/RJSyacZI8yhGDtfUEPfDNkq/QetIMJgA0RI3UKiZ+Sj4YRqGWvTwPmiTdu
	uxtB2eOQOw763m0aVfhgouSH+I2kPOkbAAGh1itFMNzOez4rB9yWzWiGrkVn9nYN
	X5QszQ8c4EmB4d92Q0BgHWU8GGdoB7w7UBav1d0XIXWgbkbiX7qbRQl7oDyaY8Kb
	/6a1lAASEWL7MLj95T76jR8TSFHSzc4yGdC9vBU3r7lEAfkiKAZoLr8wZREh5FUU
	APGY3rhI87HWP/xrJ8R5RBhBwzIct0kZBbfSOllpRLc5xRHJf3iA0pLuNyTJfpux
	oM/5ljLTD/0vHBKUlY5PCUibWiPlZzCjJnrsqTZhE80/8+62nVybPToPpZRDZdgi
	9C4PbgMplYobdjap3dObbH058vrcbu0Nki3ES4brx+0ZKASSSjmmvi1EQW9pB2yx
	fC2dVbBsyXWZlA4+3JkpAW6KQ3vyutCu0dmpyuv7jHk=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: Jakub Kicinski <kuba@kernel.org>, =?UTF-8?q?Cs=C3=B3k=C3=A1s=20Bence?=
	<csokas.bence@prolan.hu>, <imx@lists.linux.dev>, <netdev@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: Simon Horman <horms@kernel.org>, Frank Li <Frank.li@nxp.com>, Wei Fang
	<wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang
	<xiaoning.wang@nxp.com>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, "Richard
 Cochran" <richardcochran@gmail.com>
Subject: [PATCH v3 net-next 1/2] net: fec: Move `fec_ptp_read()` to the top of the file
Date: Mon, 12 Aug 2024 11:47:13 +0200
Message-ID: <20240812094713.2883476-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1723456058;VERSION=7976;MC=3778506329;ID=645951;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94854617367

This function is used in `fec_ptp_enable_pps()` through
struct cyclecounter read(). Moving the declaration makes
it clearer, what's happening.

Fixes: 61d5e2a251fb ("fec: Fix timer capture timing in `fec_ptp_enable_pps()`")
Suggested-by: Frank Li <Frank.li@nxp.com>
Link: https://lore.kernel.org/netdev/20240805144754.2384663-1-csokas.bence@prolan.hu/T/#ma6c21ad264016c24612048b1483769eaff8cdf20
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---
 drivers/net/ethernet/freescale/fec_ptp.c | 50 ++++++++++++------------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index e32f6724f568..4ed790cb6be4 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -90,6 +90,30 @@
 #define FEC_PTP_MAX_NSEC_PERIOD		4000000000ULL
 #define FEC_PTP_MAX_NSEC_COUNTER	0x80000000ULL
 
+/**
+ * fec_ptp_read - read raw cycle counter (to be used by time counter)
+ * @cc: the cyclecounter structure
+ *
+ * this function reads the cyclecounter registers and is called by the
+ * cyclecounter structure used to construct a ns counter from the
+ * arbitrary fixed point registers
+ */
+static u64 fec_ptp_read(const struct cyclecounter *cc)
+{
+	struct fec_enet_private *fep =
+		container_of(cc, struct fec_enet_private, cc);
+	u32 tempval;
+
+	tempval = readl(fep->hwp + FEC_ATIME_CTRL);
+	tempval |= FEC_T_CTRL_CAPTURE;
+	writel(tempval, fep->hwp + FEC_ATIME_CTRL);
+
+	if (fep->quirks & FEC_QUIRK_BUG_CAPTURE)
+		udelay(1);
+
+	return readl(fep->hwp + FEC_ATIME);
+}
+
 /**
  * fec_ptp_enable_pps
  * @fep: the fec_enet_private structure handle
@@ -136,7 +160,7 @@ static int fec_ptp_enable_pps(struct fec_enet_private *fep, uint enable)
 		 * NSEC_PER_SEC - ts.tv_nsec. Add the remaining nanoseconds
 		 * to current timer would be next second.
 		 */
-		tempval = fep->cc.read(&fep->cc);
+		tempval = fec_ptp_read(&fep->cc);
 		/* Convert the ptp local counter to 1588 timestamp */
 		ns = timecounter_cyc2time(&fep->tc, tempval);
 		ts = ns_to_timespec64(ns);
@@ -271,30 +295,6 @@ static enum hrtimer_restart fec_ptp_pps_perout_handler(struct hrtimer *timer)
 	return HRTIMER_NORESTART;
 }
 
-/**
- * fec_ptp_read - read raw cycle counter (to be used by time counter)
- * @cc: the cyclecounter structure
- *
- * this function reads the cyclecounter registers and is called by the
- * cyclecounter structure used to construct a ns counter from the
- * arbitrary fixed point registers
- */
-static u64 fec_ptp_read(const struct cyclecounter *cc)
-{
-	struct fec_enet_private *fep =
-		container_of(cc, struct fec_enet_private, cc);
-	u32 tempval;
-
-	tempval = readl(fep->hwp + FEC_ATIME_CTRL);
-	tempval |= FEC_T_CTRL_CAPTURE;
-	writel(tempval, fep->hwp + FEC_ATIME_CTRL);
-
-	if (fep->quirks & FEC_QUIRK_BUG_CAPTURE)
-		udelay(1);
-
-	return readl(fep->hwp + FEC_ATIME);
-}
-
 /**
  * fec_ptp_start_cyclecounter - create the cycle counter from hw
  * @ndev: network device
-- 
2.34.1


