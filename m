Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795266383;
	b=PcrZOiXHw7jP35gsHkzThz3R4NOvv/ISvVy0rOuXhwXbwvCmDQDWDg6xO3k5GcMq3gwO
	 DjRS+nvgAhZMHbMJwhjm0TtGGNP0fWWcfUpVR3E5HD3xH4AJ5LYK7S/DTx7WChCzXrxtk
	 ZkvsI8QUOyQL0uiULA4Awsh8Y4JiMd6LHs8sboiAzgzV9bePc00Ki3Gf47UV2CHYLm+dp
	 /ETe0+J5SKcsrNsYPiY/xjkyJpT5ZK+JgEzdXF668XGl4GIARGmGYealHma5/6vzc2Kpk
	 TQQ9PDwn7Uv5u75+fkT22uLOwlecDbv5bqcGjnRQJ8hAS0mo2JDVVZUuxtqPT0ebMdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795266383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=bJhkKyRHV3mrHq/zTrWh/sC0/NiutVH/ddsVPD75YJQ=;
	b=FPTIiWkb/PPOvpNBYUNZVeTOdN2E28PqnNK5sS/XEXm7p2Gk8jHCifxP2pWZvLlkiPgJ
	 VRHjho59XWB7weqXDgNR7HndkkCiXKajG32g6ZN4I3TrJbsq5N0hvg6XtHIsASi3LfTnH
	 zPZUULfbE3PnN5NLIhkVvFO1ZZJKtpIPwYmwj+n0gtU3K0JvW+uOTi7HQ+N1+BbGpNt7t
	 Yl5iIo6w6Cjo7Ths0R6LmY2nYThEGV5CkG27RhD+rWEkHUReujK+AeTIKzILcZnxFDG5I
	 icgA5UXFyUNrsyQaEmuIidCvpiouwgTBREXWQEeYyYKBUtEpZKyoxPricCj9EUgx2rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Fm8FpKyL;
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D57606A333
	for <imx@lists.linux.dev>; Sat, 21 Nov 2026 13:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21D57606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=Fm8FpKyL
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so13663195e9.2
        for <imx@lists.linux.dev>; Sat, 21 Nov 2026 05:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795266381; x=1795871181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bJhkKyRHV3mrHq/zTrWh/sC0/NiutVH/ddsVPD75YJQ=;
        b=Fm8FpKyLCev9VvWQ2iwzw2WjWe5T/UkUH8eqYTrTzUy/qy3obVJGviLzVWLZaM8zKI
         kxm4SBzxMFkSJnkoRCyJwHCU/muXCCuCsGM/EeD72aVZo+WJ7gPdAx8KnCc9/nTl1RyZ
         ekCNwHUx7s0W1EK14RynLVyplZrbiZUBm7ppA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795266381; x=1795871181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bJhkKyRHV3mrHq/zTrWh/sC0/NiutVH/ddsVPD75YJQ=;
        b=Qd3nUf6Ccyue+a63sq+K/sGuH1xO1uxVUoIZJFmrBGNunEeSOvRgX4qdzDWjAd5mI/
         OLepeOrzj0wJnS2NMEi9/AjM2MiAyFO82nsOAfyT564KFu4jus3gSU63udLEBL8JEra8
         ae1gPPkTxkFfHLLCEkbDE1p4W9KyDS3zCLl07cRhzMmqZlrCTLcipeXqJlbxkbSxi1pN
         /1hNbQwbJmQRVAEJtVlCmaD09hS5XJevZfSPfiBe/HFm92KTKUlFjsy2PWP24eeuDR0d
         VYaUBDI2FQq1dmM9n71uRisI4qFPlXgpgg1Y/j1hrmTxay07jppmka1vlizsQvlVGNTQ
         1rdA==
X-Forwarded-Encrypted: i=1; AL+hErHlf1HV7HdNZ/xBU0lWLfWJAexKsjmcQ9QBdwLwvlknypCz917LE6yRyXuoTnPTdGrULtQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z8K/wy6XnMpLO+A6ciVNmrc9JmCrWB+oaVpPkYpGaW/EO2xIGJV
	HqFrydXwefotO20f0n4geLQbFwqbkaHJGG7NFVXNbWcT1OUhjjqyFOfAh5rnMaW945g=
X-Gm-Gg: AZFdTZcLGbxeE6jgmZGZdCEmtWL5LYVDZbq8oeYxcFK19Olfv+swKAdNib/klVRJvyG
	cdacthMA+MM9wxN4twsRQHOQetVdK1qZXsndsE2ZOp5oWM6anVkXkeoc+8jp0JImv5EHc3JkvJ7
	uQsORYJb/VyOBpP76y3sLDS9pYZEpasceHqKFqU0qYqrl/5aiPn2EglalkbZze4RVaD1PT1x5lT
	AANFtvFHyJcLrFlzUrQyvGlupytJ0iwcZCrmN7K1Mc+X3f0jHwIgErGKkaw1aWFf/6iwo6tekpu
	WVg8B58bzczO/KeN2NmN9o5BfCdLCvZUMzUYzkK9xL6ZQYim3sB4K1oSYBIfzD9dO+KgPZswAlH
	6ORHXe9yq2gqMkAimqCjjWE6Mz+gn/nYCM+WZRbrSGxHRw25LahNLgjhGedhHXpssr8OVrMkU/8
	f6omONrAUDn8Cv3xYY8wxLn/9AWCGEb/LUhFkuV+w0kA1RC5vOsr36GOvEguY4wBq6e9H+xmM21
	w/7qBIW9Qc9lm/Nv3ry95ktkoiokZI+bXl1KIhPW9fghlxz/25n2IH5vdiKIVxuahxs7x82hWQ2
	igF1WsDpssPIIH+BgnF0h79nAI5Io5p9j1i084shcQ60oQN0f3eMzfUKPMrcoWgVSi1aokwhJvp
	d6vpquKyWd0Foc+a9Ns3jFeHWvFeLGOHo5mi65lDG8RS+eGBF6Klh3+krAX1h14K8duoCVU3th/
	KTjcgND+tBT/6z7XZzytCMExAL9g==
X-Received: by 2002:a05:600c:64c6:b0:4bb:6a75:d04f with SMTP id 5b1f17b1804b1-4bb88807d96mr135151995e9.8.1795266381367;
        Sat, 21 Nov 2026 05:06:21 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906d6a13sm47196545e9.3.2026.11.21.05.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:06:20 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Peng Fan <peng.fan@nxp.com>,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	michael@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH 1/3] pmdomain: imx: gpcv2: Keep the domains left on by the bootloader
Date: Sat, 21 Nov 2026 14:06:08 +0100
Message-ID: <20261121130614.2482656-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
References: <20261121130614.2482656-1-dario.binacchi@amarulasolutions.com>
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

The PGC domains are all registered as off, so a domain left on by the
bootloader, e.g. DISPMIX to show a splash screen, is powered up again
by its first consumer. On the i.MX8MN this turns the display off and
hangs the system.

The GPC does not report the power state of a domain, but the ADB400
bridge acknowledges the power-up handshake only while the domain is
powered. Use it to register as on the domains left on by the
bootloader.

Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/pmdomain/imx/gpcv2.c | 61 ++++++++++++++++++++++++++++++++++--
 1 file changed, 59 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 6a54ee734514..23159b0489d4 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1315,9 +1315,27 @@ static const struct imx_pgc_domain_data imx8mn_pgc_domain_data = {
 	.pgc_regs = &imx7_pgc_regs,
 };
 
+/*
+ * The GPC does not report the power state of a domain, but the ADB400
+ * acknowledges the power-up handshake only while the domain is powered.
+ */
+static bool imx_pgc_domain_is_on(struct imx_pgc_domain *domain)
+{
+	u32 val;
+
+	if (!domain->bits.hskack)
+		return false;
+
+	if (regmap_read(domain->regmap, domain->regs->hsk, &val))
+		return false;
+
+	return (val & domain->bits.hskack) == domain->bits.hskack;
+}
+
 static int imx_pgc_domain_probe(struct platform_device *pdev)
 {
 	struct imx_pgc_domain *domain = pdev->dev.platform_data;
+	bool init_off;
 	int ret;
 
 	domain->dev = &pdev->dev;
@@ -1348,12 +1366,42 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 		regmap_update_bits(domain->regmap, domain->regs->map,
 				   domain->bits.map, domain->bits.map);
 
-	ret = pm_genpd_init(&domain->genpd, NULL, true);
+	init_off = !imx_pgc_domain_is_on(domain);
+	ret = pm_genpd_init(&domain->genpd, NULL, init_off);
 	if (ret) {
 		dev_err_probe(domain->dev, ret, "Failed to init power domain\n");
 		goto out_domain_unmap;
 	}
 
+	/* Balance the first imx_pgc_power_down() */
+	if (!init_off) {
+		ret = pm_runtime_resume_and_get(domain->dev);
+		if (ret < 0) {
+			dev_err_probe(domain->dev, ret,
+				      "Failed to resume domain\n");
+			goto out_genpd_remove;
+		}
+
+		if (!IS_ERR(domain->regulator)) {
+			ret = regulator_enable(domain->regulator);
+			if (ret) {
+				dev_err_probe(domain->dev, ret,
+					      "Failed to enable domain's regulator\n");
+				goto out_put_pm;
+			}
+		}
+
+		if (domain->keep_clocks) {
+			ret = clk_bulk_prepare_enable(domain->num_clks,
+						      domain->clks);
+			if (ret) {
+				dev_err_probe(domain->dev, ret,
+					      "Failed to enable domain's clocks\n");
+				goto out_regulator_disable;
+			}
+		}
+	}
+
 	if (IS_ENABLED(CONFIG_LOCKDEP) &&
 	    of_property_present(domain->dev->of_node, "power-domains"))
 		lockdep_set_subclass(&domain->genpd.mlock, 1);
@@ -1362,11 +1410,20 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
 					   &domain->genpd);
 	if (ret) {
 		dev_err_probe(domain->dev, ret, "Failed to add genpd provider\n");
-		goto out_genpd_remove;
+		goto out_clk_disable;
 	}
 
 	return 0;
 
+out_clk_disable:
+	if (!init_off && domain->keep_clocks)
+		clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
+out_regulator_disable:
+	if (!init_off && !IS_ERR(domain->regulator))
+		regulator_disable(domain->regulator);
+out_put_pm:
+	if (!init_off)
+		pm_runtime_put(domain->dev);
 out_genpd_remove:
 	pm_genpd_remove(&domain->genpd);
 out_domain_unmap:
-- 
2.43.0

