Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899717;
	b=aaol3dwxuPwoyY2Ap/HoRUkWoQotRs+VIQtaNeaK6UmeNhiUoixwIabGU6XYVHS+SHBb
	 UHcg8T7uljKmOY8ers1OYy7tgV9AKA6brQnhsFb4dq0SE4PvGw8nNQwHkkfxeqhUJ+Cnh
	 ekBWhWmqbi5vIVKzLjUGBjKopst0Rtvp35CJvyc+G/wHIMMr0czTKsi8VOhKiV49LQUqJ
	 m3X0T6FfpaNJU7GUnVHVCPuD8hpYl/6aisp/ruezMnkOKddz0Royf/gKSDJr6APuot5wJ
	 FZxazxNYA39xf8gS1hqheDn6kKwwjLjXJzW7HOX73TJzLbhMBrqn15afNILB6Nlt6aQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899717;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=BlXwq6e5uLfBG6i7v3zQQBNsfUZ7M/ptQpeTZ0epfD8=;
	b=UQvx3/oG9TYPnOH8XT24lZDND/fPRZ3imuC8IyqrN/UOq600mpxss/nBHa8N3N8NcOnC
	 fYeQrzcAepIaFbJ8E+DdDxm7tJSmtwguZCZIjRIm9vkwElcPdxorYlEfKCQnC7hx5wWzQ
	 aLbY8JQTKEvM/QzhU36oCCSEIqDaEsE4Ltn7I/vc3QzVWM/FHqItjdp3KEh804jzZWd+t
	 j+LVtKtKn44EJ90D5Kp8TuVOV9kmbcyqzplCjLZAV7mdwLM0uRiSmmwZchlLptauWCmLF
	 CkIpGIMXSgwufh1/jPX3Inee34S+0cnzVI/VTEbW/+sDxRezgJ8jCG6l3a+/rLfIwdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b="l0BKcpU/";
	arc=none smtp.remote-ip=91.218.175.180
Received: from mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1507F606A332
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 07:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1507F606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=l0BKcpU/
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=c6YRxFHQ4d67zvszv7CQoix0mMpRpP6JHVOJd5jF0pU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899715; v=1; x=1795504515;
 b=l0BKcpU/WDYWQfs435gNcQpxBkzIoQUDUqv+y9CWhwx3Ck8CGEaKlwNaMdfDS7Btq+3bUqfA
 A/XpF4quha3gylK7onRayOIQEGW3QOsiJt8gcV2JybGc64uo/zeHUshQJq+SwgKlbKfTi/dBW0P
 y7KfSgI5lo20xf5WTmFReqBM=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id a6958a8986243bd0;
	Tue, 17 Nov 2026 07:15:13 +0000
X-Mizu-Trace-ID: a6958a8986243bd0
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:12 +0800
Subject: [PATCH 8/8] irqchip/imx-intmux: Use
 devm_pm_runtime_set_active_enabled()
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
Message-Id: <20261117-imx-intmux-v1-8-189e7e0ad98d@nxp.com>
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

Use devm_pm_runtime_set_active_enabled() to manage the runtime PM
enablement instead of calling pm_runtime_set_active() and
pm_runtime_enable() manually. The devres actions then disable runtime PM
and mark the device suspended when probe fails or the driver is unbound.

Keep the explicit pm_runtime_get_noresume()/pm_runtime_put() pair so the
device is still suspended immediately after a successful probe, and keep
pm_runtime_put_noidle() in remove() to drop the reference acquired by
pm_runtime_resume_and_get().

The devres teardown runs after imx_intmux_remove() and disables runtime
PM before marking the device suspended, which is the order required by
the PM core. The IPG clock devres action still disables the clock last.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index 1f6e5d9c797a..770656ef10ec 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -234,9 +234,11 @@ static int imx_intmux_probe(struct platform_device *pdev)
 	data->channum = channum;
 	raw_spin_lock_init(&data->lock);
 
+	ret = devm_pm_runtime_set_active_enabled(&pdev->dev);
+	if (ret)
+		return ret;
+
 	pm_runtime_get_noresume(&pdev->dev);
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
 
 	for (i = 0; i < channum; i++) {
 		data->irqchip_data[i].chanidx = i;
@@ -286,7 +288,6 @@ static int imx_intmux_probe(struct platform_device *pdev)
 							     hwirq));
 		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
-	pm_runtime_disable(&pdev->dev);
 	pm_runtime_put_noidle(&pdev->dev);
 	return ret;
 }
@@ -312,11 +313,8 @@ static void imx_intmux_remove(struct platform_device *pdev)
 		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
 
-	pm_runtime_disable(&pdev->dev);
-	if (ret >= 0) {
+	if (ret >= 0)
 		pm_runtime_put_noidle(&pdev->dev);
-		pm_runtime_set_suspended(&pdev->dev);
-	}
 }
 
 #ifdef CONFIG_PM

-- 
2.56.0

