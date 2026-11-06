Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.145
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793951494;
	b=Dia0Sh+JrG/lMXsaayOgcbR7gY485iNkW2yNVs16mlR2tNw7MQEuWZTz6aDZPqv6DMUu
	 ngHsP4RsSO4gykotGwLOq25+HerZsuLxD2I0NOkR2/z1oND3ZY+0Ty4xmQ+oNadzeUiJ7
	 qGKVB6y39YGBoX1IEz/Do4Cz4dslOPIxYlcWU06pHaS4gtbD/35EkaBKlAa54gtiKgKSH
	 z0nMPLaGuXMBV9def3BVUxwqNBoNOnZP/edG/jlkVpMq5LKb44c/+S27YfNDtrJRKxtDA
	 qrHy35or83BF5CueJpb14+jkwE1XFim3ogtVsI14uc/RDQKJKHJ2EQZTeFORllelBsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793951494;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=X3nxSXG+H2J8k8t3k6poogjxQFJaTHXAguqehE2TWiY=;
	b=2BajMlJaji5NgAhVij+wc7n79S0m8qseUy2zPVHvXpicMRInDYwQX2QlJ0Moj+M202k5
	 0vQmZ1fi2kC1rFp8qi23aQSuZmuILcKsJVHUKd2wiS1SLXIkrgJgNpXZY5/+/phy27VOL
	 km/liUcEMI7i03BDHmPXrH7PkbUbscxJospQuTmDQboXre2io/3CS7N9h2q0Y/z3K8oSS
	 WFkkmjNlFPOFP8r7E90O8dp1dePIO8qaFYbgmVtp7O/3elpm0LpP57xoU6RIwOjsxHl4v
	 zEjjJ7EIpCc5cin2SMfssu6FA9jC0dIPc0Q5021K+qN29qGOXGitGeo5ZaHaZAEeyHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=xiaopeng.com;
	spf=pass smtp.mailfrom=xiaopeng.com;
	dkim=pass header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=EdBOOO5d;
	arc=none smtp.remote-ip=115.124.28.145
Received: from out28-145.mail.aliyun.com (out28-145.mail.aliyun.com [115.124.28.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48226606A336
	for <imx@lists.linux.dev>; Fri,  6 Nov 2026 07:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48226606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xiaopeng.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=xiaopeng.com header.i=@xiaopeng.com header.a=rsa-sha256 header.s=default header.b=EdBOOO5d
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=xiaopeng.com; s=default;
	t=1793951489; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=X3nxSXG+H2J8k8t3k6poogjxQFJaTHXAguqehE2TWiY=;
	b=EdBOOO5d/HlK/xdK+U63qbsCipbHTOjNjstrXi49twguHyNCSFWfk4udWTjT++l+gs7f4/JjR6BY1sbl1pNhGqsabFd7UqgnLXopyDkZIJKCx6lqYgei7RSKnt1Kbx0fYVrLo9zU5ulAIWNisZgvIILVcRMU1/NTFOLmymFqTVY=
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07707597|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_regular_dialog|0.003847-0.000952075-0.995201;FP=12758894924369871956|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034254;MF=liuc63@xiaopeng.com;NM=1;PH=DS;RN=15;RT=15;SR=0;TI=SMTPD_---.jy77D-U_1793951487;
Received: from localhost(mailfrom:liuc63@xiaopeng.com fp:SMTPD_---.jy77D-U_1793951487 cluster:ay29)
          by smtp.aliyun-inc.com;
          Fri, 06 Nov 2026 15:51:28 +0800
From: Liu Chao <liuc63@xiaopeng.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Juergen Borleis <jbe@pengutronix.de>,
	Denis Carikli <denis@eukrea.com>,
	Lee Jones <lee@kernel.org>,
	fangxy@xiaopeng.com,
	linux-input@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] Input: mx25-tcq - clamp the FIFO sample count to the buffer size
Date: Fri,  6 Nov 2026 15:51:27 +0800
Message-ID: <20261106075127.3105907-1-liuc63@xiaopeng.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

MX25_ADCQ_SR_FDN() reports up to 31 pending samples.  The IRQ thread
aligns the count down to a multiple of the sample count but never
bounds it by the size of sample_buf, so a FIFO backlog larger than
TSC_MAX_SAMPLES overruns the stack buffer.

Clamp the count before the alignment so that the result stays a
multiple of sample_count.

Fixes: 4f7ed234f2a5 ("Input: touchscreen: Add imx25 TCQ driver")
Cc: stable@vger.kernel.org
Signed-off-by: Liu Chao <liuc63@xiaopeng.com>
---
 drivers/input/touchscreen/fsl-imx25-tcq.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/input/touchscreen/fsl-imx25-tcq.c b/drivers/input/touchscreen/fsl-imx25-tcq.c
index ff270b3b8572..fa8d8b736723 100644
--- a/drivers/input/touchscreen/fsl-imx25-tcq.c
+++ b/drivers/input/touchscreen/fsl-imx25-tcq.c
@@ -319,6 +319,7 @@ static irqreturn_t mx25_tcq_irq_thread(int irq, void *dev_id)
 	 */
 	regmap_read(priv->regs, MX25_ADCQ_SR, &stats);
 	samples = MX25_ADCQ_SR_FDN(stats);
+	samples = min_t(unsigned int, samples, TSC_MAX_SAMPLES);
 	samples -= samples % priv->sample_count;
 
 	if (!samples)
-- 
2.50.1

