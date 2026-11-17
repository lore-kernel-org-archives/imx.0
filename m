Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.115
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899706;
	b=Z3/Am2Eo4owTsFYBx9wcqVXABHFd0Z69ooJ1bW1qCMXG9nl4zLzX9xt/67w0IYh0vzjI
	 cMPU5ZISV7TTepV5AbCyvfDtC2bbDQ5wk5Wg72yY4oGp6kMQOAi4R+rkVGiuIBCU3dCfF
	 7z/xlenv3L75CZAf3dheBp8o0cK5htQJ2j+l4RvQMWz32OFmFx5W2qmeExq6tOoD3toNn
	 sWmhZ+Ajl6yBUbDitacZRWZeLt2myXEkImDm34Fm3RkGZv9xhEn7yNK8bfujG3X4L3R0I
	 e5t8eO9YW7SA+9MawARUo+mdsjbdyhhBQL/ZDJ2Qh3ga/tnV9NdJoqOZZyAxBZV7VXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899706;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=wKJtGPqUh8xd1e5gRSCSrRuD1kv5RiOZcl5rDs0i/H0=;
	b=OiXPRj43SBZsggjkEgzUQmzjrBAsT9EzyaiBAm9pPxwoPk7ngnQ1PPG0orJwyTzksByk
	 NwTyW7hl30OzgJYoXIeXThgM+IeGJmDtf/zDfcs3PCjQ1+ZRJJRvNCxY1Cy9rgArBRfTV
	 p9pwdApVOB1ksiWqGi6jPzxQCsIjhNxO7ub3oVISws+kRT7w3iSayO59jNsulIjAExkpO
	 kbjbUlsfiR76+oOFeHwWErG02/EqQdam5+EgYWCpSIuz/Ur9RefsuRjSZjeA7VTv8v4vh
	 xJb2YVCgvRtUj4+PpFnamf4gBLdUr1VnGTd833azPgNpHkR+WKfrzvYiM5/YtKH3wvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZHecvaiQ;
	arc=none smtp.remote-ip=95.215.58.115
Received: from mta1.migadu.com (out-115.mta1.migadu.com [95.215.58.115])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AFE606A88B
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 07:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35AFE606A88B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=ZHecvaiQ
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=egOOHYWo88XqIsFmRrJ9jNqDbHUnSeRXeEa+bS/h07s=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899704; v=1; x=1795504504;
 b=ZHecvaiQA5gt/14YhiLhtDW/Br2QboeyBwUzeh38lXl3TSXoLDwP5SdhgIOU3L4yToezvy4p
 grE4/YG+TqFO/Cx5/qKk+KcwkSOdGnU6nH/l/bODrWHQqB9WdHA2UB+gQ/66zR6YGq7h6/dnUqI
 mUzVHiKPq+zdug9XSdwzsPaQ=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id d5b6e237ac341039;
	Tue, 17 Nov 2026 07:15:04 +0000
X-Mizu-Trace-ID: d5b6e237ac341039
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:11 +0800
Subject: [PATCH 7/8] irqchip/imx-intmux: Use
 devm_irq_domain_create_linear()
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
Message-Id: <20261117-imx-intmux-v1-7-189e7e0ad98d@nxp.com>
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

Manage the per-channel IRQ domains with devres so that they are removed
automatically when probe fails or the driver is unbound, instead of
calling irq_domain_remove() explicitly in the probe error path and in
imx_intmux_remove().

The child mappings are still disposed explicitly before the domains go
away. devres runs after imx_intmux_remove(), so each domain is removed
with an empty reverse map, and the domains are torn down before the IPG
clock devres action disables the clock.

No functional change.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 755c07007390..1f6e5d9c797a 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -248,8 +248,9 @@ static int imx_intmux_probe(struct platform_device *pdev)
 			goto out;
 		}
 
-		domain = irq_domain_create_linear(of_fwnode_handle(np), 32, &imx_intmux_domain_ops,
-					       &data->irqchip_data[i]);
+		domain = devm_irq_domain_create_linear(&pdev->dev, dev_fwnode(&pdev->dev), 32,
+						       &imx_intmux_domain_ops,
+						       &data->irqchip_data[i]);
 		if (!domain) {
 			ret = -ENOMEM;
 			dev_err(&pdev->dev, "failed to create IRQ domain\n");
@@ -283,7 +284,6 @@ static int imx_intmux_probe(struct platform_device *pdev)
 		for (unsigned int hwirq = 0; hwirq < 32; hwirq++)
 			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
 							     hwirq));
-		irq_domain_remove(data->irqchip_data[i].domain);
 		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
 	pm_runtime_disable(&pdev->dev);
@@ -309,7 +309,6 @@ static void imx_intmux_remove(struct platform_device *pdev)
 		for (unsigned int hwirq = 0; hwirq < 32; hwirq++)
 			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
 							     hwirq));
-		irq_domain_remove(data->irqchip_data[i].domain);
 		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
 

-- 
2.56.0

