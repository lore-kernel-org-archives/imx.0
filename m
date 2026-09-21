Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D7A339370
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 03:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961855; cv=none; b=X6EFXq33f4M3XEYW9lmtODOUGOaOjZuDwGUafyw7XfeOgABiqaHoBE1GjmfjMLnqhU+Frb+z/ErUuDBTktHFlXlKS8tf5IN79m+Nddf2YkuBE6ZSaQV7qabIVaZzywC53E0LaVk9U4JjOOdXzXxqXO21qVSHfWXbXKkpLmaxoyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961855; c=relaxed/simple;
	bh=RcS/Z7aQh0jY4Fp12QLKegu31U4ADuLak7CwB6A2Qnw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DCYtnB7dM/U0ZBTVQfFMzKXgxQcgdp+Q6gCkfUMmncMeYsElX4K9d6MQUBpFSbg/NTFnJIRivu9bvWCXO2dpekAuyaLJSekCKRL9s7Ucds8ZF6Fam4Sl3eb3ZYY+yp9JspjHZmNwswTZ2AxQiogNA5LEatz2CPWLvYGSgN1SpS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=boBJSG1n; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="boBJSG1n"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91c22d27dso14058755ad.1
        for <imx@lists.linux.dev>; Sun, 20 Sep 2026 20:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961853; x=1790566653; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EBiZyYVBdz7e8MBo8dJNsuvO53JvDE+I2EWijeaOzYI=;
        b=boBJSG1nXEhzAFmh2Tp3XukeUD38japtzdLhCy0zo8xPIbZykAU9h0nfkGn7IlyVdO
         5FTEssYHSpdAyoCQ/5USwmVh+Qs28ZcePjbBC89nLk0MMeNAq1QNWK/Fchv1myxMVbE4
         wJhYV6BsKn+PV4SwUnfqKNz65no3OWm7EaX2/Wk2MLoR6GPrpKLgKTToplS1yIkBiWk2
         XxY+KP8NOnOg9Zs8bjFw136o02jr4AtbVFo9QOocDWv9UnWBNAiclJxOn6+jia4ST1tr
         WRb9odTOtXbk7KzxgUjOHjavmkfC/BFxvkqwOfItFPuzW1UWeuMn5lvdmEK1kgel0P1Q
         WS9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961853; x=1790566653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EBiZyYVBdz7e8MBo8dJNsuvO53JvDE+I2EWijeaOzYI=;
        b=mVAs6tT45Rb3B3fJNopyalFGsJuVT122DK+CZa5t9N3q/j4PyhV6u+Rt48rkQQn7ue
         obsvTppKpUYNTLktnHmcwmD9xYk8/kBoDEff8Gc6O/fpGPtGIlrgJgk76cXGP+dteWuT
         j3kLodGIbZG6SAv7VCnAVGdso97gHD3MtcAFzeDcWwg5DHP0Ys4UorXMG91JsQOPr+5D
         iO9S2/171U7sCFxKvVq0cnmpDzjubdCvWxdSOyd8r6PD9LXPfIEzQrPQ3At5Ld/0IMPF
         ChlIiEAS4N4kzP4oziXncPCyRaDH7CnZtgJ8uQmIP/TR41AcE5LKWAaRU8LjC/Vbqddo
         9oaA==
X-Forwarded-Encrypted: i=1; AKwUvBzVr6sImqDIOXm8bkOkLSvXNF5l8uDfH4kZRZQ/Q7MU3W1wXMSPOteTvM96HSv01pvxPt8=@lists.linux.dev
X-Gm-Message-State: AFuF++m3xAAY2XI92rBT5d9OuHH7PmLFhXuEHsG9YbniFSoIhMnUFSSy
	jlTFrUp4RV/hGFG7pYQMb3yDxu7fWMoLopLQ2pM52keAye4F6y+IiSue
X-Gm-Gg: AYBFou17WSX94fsP1jV1UPHhWz4jidjMU3IDt/SWQhl69sfpPLr21AiOvAaLK1L4uBg
	FDiTaHTwKyisF+FaOokx+I3xhalz7ZXzNoSsFJxph06ONpJeFCpejchMjRfY//IMcqjNWmpI+Vd
	3psJ8KjOar8BAZuPfMdoU7G1KofSEWQKYCnGofLO+VLn2gLg0KfdAkZLlVSFf1aoNCxWZemSoFI
	t5O7SvZWjIywDR5H488fCkgVCNVgqOgQjGuSlsvubMYl1dROrYxPxOTu2jzfzOdzkvN/d4gSkok
	THiSBNWh2bfrTr4r7bm7PoWU7tjIxsBv/GbdZySrHYGL5m0gWTGw5H5pKx8bqkWFoG8RafyAoVm
	rz2PIxhnUzhyKyqkrTSAAtlyBfeubYcRq6EMXAjm7dfu+QTYUtc3Z8J7E2zs+uBTYetWKdk9Xot
	FCCRJAsXi59+XACNPnLQdDTnk8oMhT8fITyhmNkTyId3edInkfJskHpVje6DmkJBp2w8ECnDVES
	JgQeV6l2Gj7XtxQELTd84kDSc7ifBovnhh/4WN9nIXl3dkx2SF/ZDgFHSGCKTIGxH5jyWyb67cZ
	uDycKUHLY0K5FA==
X-Received: by 2002:a17:903:468e:b0:2dd:c100:4b81 with SMTP id d9443c01a7336-2ddc1005f8cmr84060475ad.56.1789961852965;
        Sun, 20 Sep 2026 20:37:32 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm25966515ad.83.2026.09.20.20.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:37:32 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	rafael.j.wysocki@intel.com,
	Jacky Bai <ping.bai@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	u.kleine-koenig@baylibre.com,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/3] pmdomain: imx: gpcv2: Use pm_runtime_resume_and_get()
Date: Mon, 21 Sep 2026 10:37:06 +0700
Message-ID: <20260921033708.14433-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921033708.14433-1-phucduc.bui@gmail.com>
References: <20260921033708.14433-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pmdomain/imx/gpcv2.c | 16 +++-------------
 1 file changed, 3 insertions(+), 13 deletions(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index a829f8da5be7..6a54ee734514 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -317,11 +317,9 @@ static int imx_pgc_power_up(struct generic_pm_domain *genpd)
 	u32 reg_val, pgc;
 	int ret;
 
-	ret = pm_runtime_get_sync(domain->dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(domain->dev);
+	ret = pm_runtime_resume_and_get(domain->dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	if (!IS_ERR(domain->regulator)) {
 		ret = regulator_enable(domain->regulator);
@@ -1397,21 +1395,13 @@ static void imx_pgc_domain_remove(struct platform_device *pdev)
 #ifdef CONFIG_PM_SLEEP
 static int imx_pgc_domain_suspend(struct device *dev)
 {
-	int ret;
-
 	/*
 	 * This may look strange, but is done so the generic PM_SLEEP code
 	 * can power down our domain and more importantly power it up again
 	 * after resume, without tripping over our usage of runtime PM to
 	 * power up/down the nested domains.
 	 */
-	ret = pm_runtime_get_sync(dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(dev);
-		return ret;
-	}
-
-	return 0;
+	return pm_runtime_resume_and_get(dev);
 }
 
 static int imx_pgc_domain_resume(struct device *dev)
-- 
2.43.0

