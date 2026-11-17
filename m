Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899681;
	b=TPd2y30kAYvdXeOz6nVy4tZJnYGWj9mS4k5KrueU3nbPBmWuyppBcaxzMszNOK5KVxdb
	 eZ2i0gfWerzevSVEfrhBvoZwpSysn4HpcnbaBrZkpVdPCIY+SShaiEUVIMDW/n6M0d/91
	 RPl50PeWo4vV+imm6HTJNyZaM+wyhs6zgrlNHhGTgeo/eQAi9mUcS8TPNuO8IhzCGmDWG
	 TaV0Y5B2vGpjBkExiDBkjQBsBl9/UtHM4VWmkCQooPHteTO7Woqewf4CswT7m6L9QMelh
	 gqSW/18oCe1/bD4U6btd9j4dbPsYCXF4qCRlJMAjm6yh+GD3FFJRbV6rMXL4xLv0how==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899681;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=/uMuPe5mgi1Eu4yEWFJYCwVsaSE/AArChxvbCEr7Peg=;
	b=ph+fc3P7A7WkU4NdhI8Ma7zDWzNruqwmgeKWWFZkN6h9ajMBtVoGfie8JJzvNl9bshhr
	 BusmFNmvkZyJFsR8kWfCGumRrOIGQyMmzWAP1lIj41/Frj+hl3NhAaJ70F2adZSZczJeg
	 gwnbRMUijLYA3mQCmcwGR9fSWk3QYzKTJ3VbhKs8/ENP+5LT940ex4sBMG+GVUAESrtEy
	 6GzhSY9Goqk/v2EDZfcWub6AYfRXRyEEm7WQQfYaCyj4/MZpsYB2MAuaGTiNpB6gNPDMm
	 mzhq4qSwxyvAUVrQuaVU/af2aWPf9c3j3vP+rsrggtb9TGFoUXaJxyOV5dNo+tiRdWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RH5qvwVa;
	arc=none smtp.remote-ip=91.218.175.156
Received: from mta0.migadu.com (out-156.mta0.migadu.com [91.218.175.156])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE7C606A31C
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 07:14:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AEE7C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RH5qvwVa
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=IR9VcHeYSsHfv5ifLvABSgrY6uC1+UTctHpRZU8BkOk=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899678; v=1; x=1795504478;
 b=RH5qvwVa96F/+auHiHXI1EJA1N/dFmngsMV3MqYOX3sqouaIrnXCI+ZMJGzg/ULlCQhgOBFQ
 SPKQKDmOHFckjHysxuEC7o39+TnGJBNmsOV2NSEBPfVXQ/TGRWxTV8eTPwYQg/WrpgyvJegeIm1
 DHTrvH6WaYuAzT6EwLQ7J+rQ=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 0e5d159210048f24;
	Tue, 17 Nov 2026 07:14:38 +0000
X-Mizu-Trace-ID: 0e5d159210048f24
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:07 +0800
Subject: [PATCH 3/8] irqchip/imx-intmux: Handle platform_irq_count() errors
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261117-imx-intmux-v1-3-189e7e0ad98d@nxp.com>
References: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
In-Reply-To: <20261117-imx-intmux-v1-0-189e7e0ad98d@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

platform_irq_count() returns a negative errno on failure, but the driver
only special-cased -EPROBE_DEFER. For any other negative value probe
continued with a negative channel count and passed it to
devm_kzalloc_flex(), which is broken.

Propagate every negative return value and also reject a zero channel
count, which would otherwise register a controller without any channels.

Fixes: 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 644282228f1a..c7b6b475bfb9 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -207,11 +207,11 @@ static int imx_intmux_probe(struct platform_device *pdev)
 	int i, ret;
 
 	channum = platform_irq_count(pdev);
-	if (channum == -EPROBE_DEFER) {
-		return -EPROBE_DEFER;
-	} else if (channum > CHAN_MAX_NUM) {
-		dev_err(&pdev->dev, "supports up to %d multiplex channels\n",
-			CHAN_MAX_NUM);
+	if (channum < 0)
+		return channum;
+	if (!channum || channum > CHAN_MAX_NUM) {
+		dev_err(&pdev->dev, "invalid number of channels: %d\n",
+			channum);
 		return -EINVAL;
 	}
 

-- 
2.56.0

