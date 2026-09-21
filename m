Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8603385A5
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 03:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961860; cv=none; b=OrzOA3MA2i0Qs6Xaucm82SLjhjOa+LMDwygUOHTbqtLRxJJyfF6N+9QigykuVfu0abHqHKkjbuWaO/ctVep5jwN6KYosrCqdjK8ycQ3acJMxmj53xsS+pbqR95cu9m14bh0xzEqURAahlwY0Ec3I54JHDLLBZpt6d+hVJwMRKTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961860; c=relaxed/simple;
	bh=AlzIW28Y5xD5eAX4CX9xsq0gjSAmNnpDF69Est26CwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C7Fa4c2wFeItIGdUv/QpPgv6/rS6DhteDPZSgRt/lIdQ4rC2Azlf+h8J2F1hTxbj8gv7bcwIhglN5ZymKWwY149GZFCj3Et5i5QbIn1FYDcNk1LpeW5wNCTKNjMgjVHVOwH/1v3pdAp6xJjH47Tuv096SHorsvRnzKXFHoY7g+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVbiyucn; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVbiyucn"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91ede8035so29739525ad.3
        for <imx@lists.linux.dev>; Sun, 20 Sep 2026 20:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961858; x=1790566658; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m+un6tjUHLWmwcQGwEsJ9cbCIh8rw9QkbUaL8mBGbKQ=;
        b=KVbiyucn+EzYrnRTBQHRHmu8PLkwJnMp3S9qQA6ed7sO5ZfFIjyRarM6TgA2RamD39
         CTo6VqNPMWMeQV+ELvpmJuuahV5Lww26r5KW96YckOnQhC1xw2QJJHCfGnbBXyTiQzDE
         CVgtnf8rfmyU7TfFiGYw+qniR52plS/Hv+9DttepnIU5mYswLNXSN5M254Ierhp1NuHn
         K9+/ujauzb0CWVOubEHND/wadj2rIwS3Wv/Z013yhVDdxTujjuxBBde1GwibFbGWGesU
         fEVkvjMB4w5KMhToBYQEExJXuobKomR8JEENSZCTJ6U+l4GXYd3YcrAsmPBSqG/mjiAY
         /SJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961858; x=1790566658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=m+un6tjUHLWmwcQGwEsJ9cbCIh8rw9QkbUaL8mBGbKQ=;
        b=icBA/ha1yM3nMZUaKNovwLGANT93XFUrkW3ZMXcRcQdbXGgzY7rkMs85SMFt+bKMHk
         eBsyFcfYaCFCJAMdYPLId6S0suDv9cEHzbiI0AMM18+yzVkxuSKMg8r3QrkIGG/LbXfm
         gtUkXHdNmJD2aZj3eRy4URyAUSKX4LdqEM1Tx1AkAcfmhIqyWkuBkWkzAi0mbwyFP43N
         seAnhD+zEtTdm3agVi4b6J01vgApv9m3IhDa7yKEPBBv1RREwvAIJf0EmCUZoFHRGUea
         FrAMCzDLINRbsxMqFlyDfFq7Z2i5xAxyLrr8tnRxqVfVjcEEZgdOR16f2CkFSj5lMGf1
         c44Q==
X-Forwarded-Encrypted: i=1; AKwUvByJva8SxmACMH7oVPJ8n6kGsveQfpE2xW3APfDFkSeC+eZp+MOyO0LKnHOrLIcVhHG6zso=@lists.linux.dev
X-Gm-Message-State: AFuF++kWiDlq84A+7UqLUErOI3efWwpwie9kXHL7zoTJRhN43sIqwb+l
	RkzTVj5viXuaKpetcByI22o0nnAVf9TzC7TTeKDGnRYYpMeQ6VbzRJpo
X-Gm-Gg: AYBFou090izXF4+ZVkSoOzyyRfO/LYpELdlht5q/ZOitj2O9tThS0EjjioWCdM0SGz3
	3OBWKtIUd2jSyz+yv1MS3HYuKt2FhON1CuA7dkOD1rgFeXqxtrCkyGWLvrBCkGn9EH+/4Nf0Pnm
	ZDWxznfgCGDUCFO5jVrP+F/tyr/DFtwZBPSb9pE2Ot0WqodO/bNmh83O3bQndT9Z+Wu03iveaB/
	G9B56kGW3+p8oDRKaERG6aU98zOiyJZw0AeDvEleXKFuwVB2qcAR/msiZ7HdK3mB88baqf8VymK
	RfZQSPT5T1n/mnts4navxa52HZGV1nqF/frv7IKdvh+LH9odTzApnwf6K/+DQ//ILKW0DjZd6sL
	SmefdP0gpNOjCb8XbCz7EELnse1pKIEPkHoysG/FjMrTESMqkWYZYOMikQ7F56lyWhG+5MImUHl
	fsR7MiuieqjUWeOHPNQwiiUv7jztOCXlFoNJtZ2Ip/aof+pKfV29S2Zruy0kyvgoxYp5ju861ej
	HYgnK0uskE7heg3s2sxSsHq548dsNCI00/HNi3IhHMtl76wlv9IQRALoLi+dO688OkpfbNyIufV
	kTk1ED5m+RJ7IA==
X-Received: by 2002:a17:903:324f:b0:2dd:c053:9c6c with SMTP id d9443c01a7336-2ddc0539d9cmr89231915ad.34.1789961858000;
        Sun, 20 Sep 2026 20:37:38 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm25966515ad.83.2026.09.20.20.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:37:37 -0700 (PDT)
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
Subject: [PATCH 2/3] pmdomain: imx8m-blk-ctrl: Use pm_runtime_resume_and_get()
Date: Mon, 21 Sep 2026 10:37:07 +0700
Message-ID: <20260921033708.14433-3-phucduc.bui@gmail.com>
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
 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 479789009c7f..fe083b1e7251 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -99,9 +99,8 @@ static int imx8m_blk_ctrl_power_on(struct generic_pm_domain *genpd)
 	int ret;
 
 	/* make sure bus domain is awake */
-	ret = pm_runtime_get_sync(bc->bus_power_dev);
+	ret = pm_runtime_resume_and_get(bc->bus_power_dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(bc->bus_power_dev);
 		dev_err(bc->dev, "failed to power up bus domain\n");
 		return ret;
 	}
@@ -382,20 +381,16 @@ static int imx8m_blk_ctrl_suspend(struct device *dev)
 	 * in the system suspend/resume paths due to the device parent/child
 	 * hierarchy.
 	 */
-	ret = pm_runtime_get_sync(bc->bus_power_dev);
-	if (ret < 0) {
-		pm_runtime_put_noidle(bc->bus_power_dev);
+	ret = pm_runtime_resume_and_get(bc->bus_power_dev);
+	if (ret < 0)
 		return ret;
-	}
 
 	for (i = 0; i < bc->onecell_data.num_domains; i++) {
 		struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
 
-		ret = pm_runtime_get_sync(domain->power_dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(domain->power_dev);
+		ret = pm_runtime_resume_and_get(domain->power_dev);
+		if (ret < 0)
 			goto out_fail;
-		}
 	}
 
 	return 0;
-- 
2.43.0

