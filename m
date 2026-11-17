Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794899672;
	b=NHLCLDgYuylJMP5uuebNg7m71qYgdG8jnqvVLS27zpbDbPjZ75Az/Vwzk4Wu52yYjaXx
	 OAA2N90FId/nDLdsMH6ybb19aTefyuw+Oc666u5kvz86hQh1qfWKuwcakrUJvgJGYZl+o
	 BNdWxXu6rGz5lt8iiT8+o/qo4vwd16+sjZA/Oyzx5tpib4MMVB70TkP1yBPTA1Z2m1agj
	 9hNZINfls/Kw7QuWYkE6Vf/qZ+zEKc/qLr+rXef+3IyQdPTJW4pQ0rWeEym5ZDs9mg0Bq
	 6doJnR1rUrXnK38g6kNSpDfrGmGYtibM4xsE5Q4obxjg8R0X/RLXxkPgmrtJ4BxSVWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794899672;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=M/WdrMEavsqH0hS/EUDB3nkK/xjCmst2SoRbgl+9Ebc=;
	b=Ikn/IjPPhqVQP50nFSY69Ix4EfLrDeMywtIfXew/Is2KhAW+fR66HKEWFQh7S3mUGiVV
	 ynTViL6AgEZEuGldqDsyaSrPu2WdwVXmkbaHsQmS0DDV2skier84dtXuDjRJEY28LUUEI
	 Uu6JgoUB0sFfduGiYQ+D2h4ott7ayMloxndqg3wRs34OIB4vIHXqmxbNKAtIjLsxpRF1q
	 aiTe80mw2x10U/25QBAW9Z+oi9x34utUxNiMC+Bf/jaSqc6o3URBEgeoJg/4jkmnQLdzd
	 Sp/u96nUlKGl5RF2mIpq26FH8X/De1IfveCzjvX3tFIwHCI9t3l/BcTvMqzgPILvtkQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CfRKj918;
	arc=none smtp.remote-ip=91.218.175.152
Received: from mta0.migadu.com (out-152.mta0.migadu.com [91.218.175.152])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3CF606A329
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 07:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6D3CF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=CfRKj918
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=zwbhnDtt3vpTEzSOmj+MMGszUoWlFbw/XBu9eV7HxV0=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794899669; v=1; x=1795504469;
 b=CfRKj918Dz9PvQ0E8PYSnikHSmKszbQ3SAZ1UnYFSk3DczxTn14ZalGZ8QTp/VXhz5xrkszm
 PKZEzXd59g5WEILHVb8rXCP1oa4/hD4XDQFuDjSVd9iDjttJUl/oxktjBYEVrNuqLkzp1907Bmc
 Dy7anJSVtIQjCm1hwBCFtmGs=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 4256e9d7da406d0d;
	Tue, 17 Nov 2026 07:14:29 +0000
X-Mizu-Trace-ID: 4256e9d7da406d0d
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Tue, 17 Nov 2026 15:14:06 +0800
Subject: [PATCH 2/8] irqchip/imx-intmux: Dispose IRQ mappings on remove
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
Message-Id: <20261117-imx-intmux-v1-2-189e7e0ad98d@nxp.com>
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

The driver removes its IRQ domains without disposing the mappings
created for their 32 input lines, and it never releases the parent
IRQ mappings obtained with irq_of_parse_and_map(). Removing a domain
while mappings are still present leaves those descriptors pointing at
a freed domain, and the parent mappings leak on every unbind.

Unchain each output interrupt, dispose the child mappings and the
parent mapping, and only then remove the domain.

Fixes: 2fbb13961e74 ("irqchip: Add NXP INTMUX interrupt multiplexer support")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-intmux.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-imx-intmux.c b/drivers/irqchip/irq-imx-intmux.c
index a9eda7646e2f..644282228f1a 100644
--- a/drivers/irqchip/irq-imx-intmux.c
+++ b/drivers/irqchip/irq-imx-intmux.c
@@ -312,8 +312,11 @@ static void imx_intmux_remove(struct platform_device *pdev)
 			writel_relaxed(0, data->regs + CHANIER(i));
 		irq_set_chained_handler_and_data(data->irqchip_data[i].irq,
 						 NULL, NULL);
-
+		for (unsigned int hwirq = 0; hwirq < 32; hwirq++)
+			irq_dispose_mapping(irq_find_mapping(data->irqchip_data[i].domain,
+							     hwirq));
 		irq_domain_remove(data->irqchip_data[i].domain);
+		irq_dispose_mapping(data->irqchip_data[i].irq);
 	}
 
 	pm_runtime_disable(&pdev->dev);

-- 
2.56.0

