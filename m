Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.93
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751906;
	b=460wGvYvuZXbifSNF4whC7+0KB7YgYjFzOpflAX4UI5ohzkJ9csI03BJk8EdlenF/emb
	 DhvuXr7DQHcHlhilm375hanMYTphJUU8lMQCsc0Ua9SraRlN5rsLxklLmU0JcUposdMbl
	 ZHg7axOZiyabLzfzVkp93zombJ91OYzEDv9If6lblHYAJUM+Rkt8+P32tCHSfv533QCOW
	 RhLlfz218QcGYYW9d6BhpstIdkKSvJEJBJBE7HET57AeBBLQj+jce9O3Qk0kbNxX7IeD7
	 zcRzwZwDuzx17e2RlIea49jTSFQDehmChi+iPlP2v1dwePW8d4ywNXJYfPCGx3jYe4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751906;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=fX4x/DwPozKPTud5FkAAKQrO1M5Mc9gEHPAUZrZ+dhU=;
	b=ho+tzFK2fCYs475qBDn7yFuUglRekYw/39/rfnqVBTs+XyzKtCndjfvLnTVTn2ZnA2wk
	 cqQTz7dSOyD8jSvzoDhQ0HmIQ++3IDHyVPYCyuje1++xY5/oM6WqsOeI6qO9Tcg82pJUC
	 ZL4/4YUemOKIPZ6RCCoUhANupSO7/Q87s63i8Ki5kX2tKvqBKVu12zCvv6lVLYdhXAzlt
	 A7ihjrr+5ZD0vLY9KPAHjT1QSqDCaiadMklwIYxHxEIZZXisyrDJ5ofGGpJe6evEnAvP5
	 f1uKBL0jZ4JHvVL9S1flCNZyLZ6DQP2ZZxVRgaxEM7fte+sVfo+jqAtFGbopHyRwBbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HMFtC04U;
	arc=none smtp.remote-ip=95.215.58.93
Received: from mta1.migadu.com (out-93.mta1.migadu.com [95.215.58.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7298606A31D
	for <imx@lists.linux.dev>; Sun, 15 Nov 2026 14:11:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7298606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HMFtC04U
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=dYZVjHUUnYJbCP3BEmxFNbYbsLJb5S56W4DO//XaLI8=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794751903; v=1; x=1795356703;
 b=HMFtC04Uf+2QnwCff9CM65z7x9EnmQ/4oIK+o6iTNwJK4zdPaDuvygZ2NIP3ED2jFy8M28p5
 BpxKBDDT87szR2FwqdETrrPmtk7mUs++bEt1HCjSuzPCOwB3kb7rAlwYNk6c6xG9gIiEtbpFSfp
 v0A/J8LEdGQEUf2lzH8m1eLM=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 616e2252748b30ee;
	Sun, 15 Nov 2026 14:11:43 +0000
X-Mizu-Trace-ID: 616e2252748b30ee
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sun, 15 Nov 2026 22:11:25 +0800
Subject: [PATCH 1/2] irqchip/imx-mu-msi: Fix MSI dispatch through the
 parent domain
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
Message-Id: <20261115-imx-mu-msi-v1-1-8beb58854ca4@nxp.com>
References: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
In-Reply-To: <20261115-imx-mu-msi-v1-0-8beb58854ca4@nxp.com>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Shivamurthy Shastri <shivamurthy.shastri@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Marc Zyngier <maz@kernel.org>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

Since commit 7b2f8aa005bc ("irqchip/imx-mu-msi: Switch to MSI parent")
the driver creates the MSI parent (nexus) domain in
imx_mu_msi_domains_init(), but never stores it in msi_data->msi_domain.
The chained interrupt handler therefore calls generic_handle_domain_irq()
with a NULL domain, which resolves the hardware interrupt against
irq_default_domain instead of the MU domain. Depending on the platform
this dispatches an unrelated interrupt or drops the MSI completely.

Save the nexus domain so that the handler resolves MU channel numbers
through the domain whose reverse map was populated when the MSI was
allocated.

Fixes: 7b2f8aa005bc ("irqchip/imx-mu-msi: Switch to MSI parent")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-mu-msi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index 6d7baeeb2bc8..c42ea0797624 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -238,6 +238,7 @@ static int imx_mu_msi_domains_init(struct imx_mu_msi *msi_data, struct device *d
 		return -ENOMEM;
 	}
 	parent->dev = parent->pm_dev = dev;
+	msi_data->msi_domain = parent;
 	return 0;
 }
 

-- 
2.56.0

