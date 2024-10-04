Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7EE1AA79F
	for <imx@lists.linux.dev>; Fri,  4 Oct 2024 15:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728055474; cv=none; b=mrCFsObacmogOBcwbcnu4vVTkI5Pd9mFp6pgG7YKGekqPDp1TERM2Npp74BDFo8PMQinvk5HN32bYi1NCYk/hxKcqLDgFYdyCOfQVGgSvE5tUO2J+1Gvq/tCBMboAY6F9ocNRWgYqKzD/SFgeYWQXJNEUmX3p9YPKqMkZkEQWbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728055474; c=relaxed/simple;
	bh=FWpacWro7cFViX9RXT8q46UqOa4w0r6o93vJBYGp7pc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cqLDMtDuU6VVsPHOehH+kT5tD/9wGL7D/TyXj8Ndo/veWBu7ahynlSOy3cb766RI4iZhOhMV1JEyRtAlABODyCOB7R85nYQWyOE1yr0TkS9HGf7AQwdvyOeNsndOyALrglyK3Mm8BrZdG83O8NdZeFzbqNWefK+yVqiplUMtFAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=niFojYRV; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="niFojYRV"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 99D4D20C07;
	Fri,  4 Oct 2024 17:24:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1728055471;
	bh=03fZTgCgiBxE0qFrCKKkCpSY6xFhbJQG1m+p4KlRZDE=; h=From:To:Subject;
	b=niFojYRVbuXDsI/dLNQTvTw1is2QMQvMkRZzSZmZjNHUdJddP0jp5yeiw56WSEaEW
	 QTbYyENZvgb0ifvrJkgTLYks7x29FLIzUr/zRyYMlnlJRERQJR8eYvZHa+TAKpEHOu
	 wQpI4e2qHk5wGM30CDwNWsQ2jnC5aAD3YAAM3wBsvkviao1nQpqtgFpLoMrjARH2jE
	 5a4HNohl6zchbT2512rjymV8MQz12kl66hjFMmsKmcayk22GZ8S/IiELP7x71+WCb7
	 hTt1XfZV4OIylDO+S0HFHqU9cnD92j1KQyvCIB4LzLg1sqHIbrBgDygFUQ1GMdy1Nd
	 31BFlCsBNulfQ==
From: Francesco Dolcini <francesco@dolcini.it>
To: Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Linux Team <linux-imx@nxp.com>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH net-next v4 2/3] net: fec: refactor PPS channel configuration
Date: Fri,  4 Oct 2024 17:24:18 +0200
Message-Id: <20241004152419.79465-3-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241004152419.79465-1-francesco@dolcini.it>
References: <20241004152419.79465-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Preparation patch to allow for PPS channel configuration, no functional
change intended.

Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v4: no changes
v3: no changes
v2: add Reviewed-by
---
 drivers/net/ethernet/freescale/fec_ptp.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index 4cffda363a14..ce7aa2c38c7f 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -84,8 +84,7 @@
 #define FEC_CC_MULT	(1 << 31)
 #define FEC_COUNTER_PERIOD	(1 << 31)
 #define PPS_OUPUT_RELOAD_PERIOD	NSEC_PER_SEC
-#define FEC_CHANNLE_0		0
-#define DEFAULT_PPS_CHANNEL	FEC_CHANNLE_0
+#define DEFAULT_PPS_CHANNEL	0
 
 #define FEC_PTP_MAX_NSEC_PERIOD		4000000000ULL
 #define FEC_PTP_MAX_NSEC_COUNTER	0x80000000ULL
@@ -524,8 +523,9 @@ static int fec_ptp_enable(struct ptp_clock_info *ptp,
 	unsigned long flags;
 	int ret = 0;
 
+	fep->pps_channel = DEFAULT_PPS_CHANNEL;
+
 	if (rq->type == PTP_CLK_REQ_PPS) {
-		fep->pps_channel = DEFAULT_PPS_CHANNEL;
 		fep->reload_period = PPS_OUPUT_RELOAD_PERIOD;
 
 		ret = fec_ptp_enable_pps(fep, on);
@@ -536,10 +536,9 @@ static int fec_ptp_enable(struct ptp_clock_info *ptp,
 		if (rq->perout.flags)
 			return -EOPNOTSUPP;
 
-		if (rq->perout.index != DEFAULT_PPS_CHANNEL)
+		if (rq->perout.index != fep->pps_channel)
 			return -EOPNOTSUPP;
 
-		fep->pps_channel = DEFAULT_PPS_CHANNEL;
 		period.tv_sec = rq->perout.period.sec;
 		period.tv_nsec = rq->perout.period.nsec;
 		period_ns = timespec64_to_ns(&period);
-- 
2.39.5

