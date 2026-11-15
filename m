Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751913;
	b=YQ5gZdd9uKlD+gUvd6uKBB2sEra/vC+4KINIqHAQMykYf59fsD12oG2Az9a7mRaQcFnQ
	 JCzYbF9FATitmcKAVudrPTWNGTRqLn082x8m0Mm2T2eQKqJVhheIkRAQ77WFIhslp6wcW
	 1kl7StNQDX++ePwVnILfgGb386LaIJUDp3OiNSUo36wlQ6ZS79iSCGmsehI1p7K7xqoVv
	 sJq9fZ5/1oVmbHm+LxDknnJp0kvYcBsqhwBn1U8fiz7VNVpTCO9EKfe+x6K+MfTcSqvOz
	 0Fa7DU71f8F3va/nGvf6X5bJujtIdXCKKOg4OShQPBeSAvzPD4jOhWLkO6mDZ5FRNPA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751913;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=TfR1MQe16bqqOEP5/Aiu81npw9CFsZbejn/lzaModFc=;
	b=n8hxdfj3yiDBVP5a4MZWqsZFuXlFGjNKl4Zfuu1bHSeLuhQrpPZqOv3INQlyJmaoqE08
	 gbrjL9+3UUdj+TRzcEBRXn7oTSnjR7UwsBwJDIxQk8PG+7ebWF+mNyo0IAe2s6p55Vn63
	 hKuauAchc4TYsUzv4ANeSe4so0hNYcFmwBEpcxbOJQELT0rzrS72X5A9q+J3J0eNuAsd9
	 zK9PEI3b6jsTmWbjwUn13F+HHPIqJg/0tiKRXPmYsQaQgo3890qE2ZhLwWDoSBC0v5cOB
	 cxdRMnptF//GFDxjsCuzG7ZyHABNI7wjuYUmOPZtgJMABDCBYJOkqV0qsdv6AmwK+9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fGS4UR4z;
	arc=none smtp.remote-ip=91.218.175.39
Received: from mta0.migadu.com (out-39.mta0.migadu.com [91.218.175.39])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E182E606A32C
	for <imx@lists.linux.dev>; Sun, 15 Nov 2026 14:11:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E182E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=fGS4UR4z
X-Envelope-To: imx@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=VpRiYUFHP1GYsEvyF7mXGqQ3VU4ihCdki3Xz2CHYzYY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794751910; v=1; x=1795356710;
 b=fGS4UR4zyE5fS2la9kCy4mIAgj7saG1CkipxZTr60H3VkRk51MN6o9sT62Ny1Vn9Qpg4vErC
 Useuan7FuczGzkc80gsHk9GmqrEA6zEVtt4wdgzv8/Qw5Fa0hZUbQIAERqfngvfQgBRfpeMUijW
 Dy+AMINODZ2WM+25Ivxv94lI=
X-Envelope-To: imx@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 1f05fa239dcfefbe;
	Sun, 15 Nov 2026 14:11:50 +0000
X-Mizu-Trace-ID: 1f05fa239dcfefbe
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Sun, 15 Nov 2026 22:11:26 +0800
Subject: [PATCH 2/2] irqchip/imx-mu-msi: Fix PM domain teardown on probe
 errors
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
Message-Id: <20261115-imx-mu-msi-v1-2-8beb58854ca4@nxp.com>
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

dev_pm_domain_attach_by_name() creates a virtual device for each
attached PM domain, which must be released with dev_pm_domain_detach().
The probe error paths only remove the device links, leaking both
virtual devices. They also return -EINVAL instead of the actual error
from imx_mu_msi_domains_init() and log the wrong domain name when the
link for the second domain cannot be created.

Detach the PM domains on every failure path and propagate the real
error code. Since the power-domains property is optional in the
fsl,mu-msi binding, treat a NULL domain as "not present" and skip the
corresponding device link rather than failing the probe.

Fixes: 70afdab904d2 ("irqchip: Add IMX MU MSI controller driver")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/irqchip/irq-imx-mu-msi.c | 69 ++++++++++++++++++++++++----------------
 1 file changed, 41 insertions(+), 28 deletions(-)

diff --git a/drivers/irqchip/irq-imx-mu-msi.c b/drivers/irqchip/irq-imx-mu-msi.c
index c42ea0797624..42e930caed8d 100644
--- a/drivers/irqchip/irq-imx-mu-msi.c
+++ b/drivers/irqchip/irq-imx-mu-msi.c
@@ -300,8 +300,8 @@ static const struct imx_mu_dcfg imx_mu_cfg_imx8ulp = {
 static int imx_mu_probe(struct platform_device *pdev, struct device_node *parent,
 			const struct imx_mu_dcfg *cfg)
 {
-	struct device_link *pd_link_a;
-	struct device_link *pd_link_b;
+	struct device_link *pd_link_a = NULL;
+	struct device_link *pd_link_b = NULL;
 	struct imx_mu_msi *msi_data;
 	struct resource *res;
 	struct device *pd_a;
@@ -345,33 +345,38 @@ static int imx_mu_probe(struct platform_device *pdev, struct device_node *parent
 		return PTR_ERR(pd_a);
 
 	pd_b = dev_pm_domain_attach_by_name(dev, "processor-b-side");
-	if (IS_ERR(pd_b))
-		return PTR_ERR(pd_b);
-
-	pd_link_a = device_link_add(dev, pd_a,
-			DL_FLAG_STATELESS |
-			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
-
-	if (!pd_link_a) {
-		dev_err(dev, "Failed to add device_link to mu a.\n");
-		goto err_pd_a;
+	if (IS_ERR(pd_b)) {
+		ret = PTR_ERR(pd_b);
+		goto err_detach_a;
 	}
 
-	pd_link_b = device_link_add(dev, pd_b,
-			DL_FLAG_STATELESS |
-			DL_FLAG_PM_RUNTIME |
-			DL_FLAG_RPM_ACTIVE);
-
+	if (pd_a) {
+		pd_link_a = device_link_add(dev, pd_a,
+					    DL_FLAG_STATELESS |
+					    DL_FLAG_PM_RUNTIME |
+					    DL_FLAG_RPM_ACTIVE);
+		if (!pd_link_a) {
+			dev_err(dev, "Failed to add device_link to mu a.\n");
+			ret = -ENODEV;
+			goto err_detach;
+		}
+	}
 
-	if (!pd_link_b) {
-		dev_err(dev, "Failed to add device_link to mu a.\n");
-		goto err_pd_b;
+	if (pd_b) {
+		pd_link_b = device_link_add(dev, pd_b,
+					    DL_FLAG_STATELESS |
+					    DL_FLAG_PM_RUNTIME |
+					    DL_FLAG_RPM_ACTIVE);
+		if (!pd_link_b) {
+			dev_err(dev, "Failed to add device_link to mu b.\n");
+			ret = -ENODEV;
+			goto err_remove_link_a;
+		}
 	}
 
 	ret = imx_mu_msi_domains_init(msi_data, dev);
 	if (ret)
-		goto err_dm_init;
+		goto err_remove_links;
 
 	pm_runtime_enable(dev);
 
@@ -381,12 +386,20 @@ static int imx_mu_probe(struct platform_device *pdev, struct device_node *parent
 
 	return 0;
 
-err_dm_init:
-	device_link_remove(dev,	pd_b);
-err_pd_b:
-	device_link_remove(dev, pd_a);
-err_pd_a:
-	return -EINVAL;
+err_remove_links:
+	if (pd_link_b)
+		device_link_remove(dev, pd_b);
+err_remove_link_a:
+	if (pd_link_a)
+		device_link_remove(dev, pd_a);
+err_detach:
+	if (pd_b)
+		dev_pm_domain_detach(pd_b, true);
+err_detach_a:
+	if (pd_a)
+		dev_pm_domain_detach(pd_a, true);
+
+	return ret;
 }
 
 static int __maybe_unused imx_mu_runtime_suspend(struct device *dev)

-- 
2.56.0

