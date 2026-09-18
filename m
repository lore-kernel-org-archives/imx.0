Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C273EC2EF
	for <imx@lists.linux.dev>; Fri, 18 Sep 2026 03:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789701228; cv=none; b=H2a1HZAIMNweyIwj0o6E9Z6sIiPlW5uvYrzUxOlrg+fJsab+rUwUajOCQyHWl4ezYzLuMjaksuhR8rC81uH6Mt5U9wBoaJNG8r7VRlqWOXGRS2h/ElkUq6BW+MjPmGvEjCSxKrMvKnENU1Os+8Oio62dWlBNSEj2U6Zv9e32FWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789701228; c=relaxed/simple;
	bh=NjLc/8TORdZon0fRfkIxyX9z0eAz0zc3Bki0New4I28=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ebDRZFIvuasBB/AZbVGxTxYkUhplcMW6T0Br7P+T3vjPPmqMoDwKaQDzru4/J5AnQG0pZQIf0AWV9+37+un0XPZG7FPzATymww/+xObPbSUC4QF0GA/AdxRsWukzzijMm2oA0feynWk+W+4tHoInoWL/FkmvVuCFGA4IeBrGRQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qsxEn21W; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qsxEn21W"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d91c22d27dso1501105ad.1
        for <imx@lists.linux.dev>; Thu, 17 Sep 2026 20:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789701217; x=1790306017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=CKFxldesfAj8FdEDKAwfFPd/txX/9A+5mA0y6fZJndM=;
        b=qsxEn21WrA8Iaz31Krdsyc365KQh4m2e03ivNdWgq+rf9zYlHWnDpNmOGXuI/muf0f
         r56ZMM989+5B3AUHQzW1XTosIMWqAB+20HgBVA5W5ho4ZvZe19eSBNXeD4P9xsqfijTJ
         2KaujVjGUN3xNPCuM/w2D7gCCe8Udjxk7ASUS+1YhQ3afidVVzf71SuEPeTlOmYkDaVR
         oQzEsR1jtKgOP/VvMCAPSkQJqVgLuYLulU3audtEfGdouTnWev+ar1+idtj4zj6GTwCQ
         8/XFzVzeVs22D4GYdIQfpzAzIjXXSpus357ys8xErVEy3A1Do7HzDe/Yr1fOLqnr+Pn6
         H2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789701217; x=1790306017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CKFxldesfAj8FdEDKAwfFPd/txX/9A+5mA0y6fZJndM=;
        b=OJ7hXTfh+3PFIfuUnL5xkk8VBd4Ebb9VRubDyjVMWPckRVvcbUxBxM7aBZYUJi9xin
         eYPNCYqrTarDC+IoFq/QZM5pjSwU209pnr0bOT/+SKFEgION5vrtgVLMr6/rsGh9g0Bj
         +OQdABP0xfd+F4oTYLdXRspwy7gpRRNfVAhcdbFuIe5BRwPfDtXu/RiN9+kESOhBKIMR
         EJZcbAsvQMWA6CHbQFHJ/n++4DKbU3aFdsvCmAHnHa5TT1ARPuA4w3ljbBxSpp+h9FYV
         hAZF/vvW16cy7DH5Xl1perVYfsZxor8tYhPSM75z7FGv66AKWWyFcLge2Y8/Ks9FAyCE
         mayw==
X-Forwarded-Encrypted: i=1; AKwUvBzieY3qhKSp+4MpzDPYE1Q+6UkNK2UAM4n7F8HH38UEp+0OVzEFScy5T4tj6WkQBZk0aug=@lists.linux.dev
X-Gm-Message-State: AFuF++nCQ3T39GOxeUxreCY95Bf4URL/7xwPxqbdYxZF+t6gPf30/Oap
	O9hCWPviHgRg/20ZOTMgz/F4WmG4D13+kdS+jiVN9eVMAqzzGSEBdgPB
X-Gm-Gg: AYBFou3copPsL6kVEwUSTRYOrr/LuZ33p0G7jgoK9TDzSeHptwHOPVOKHAg8G9jjn7x
	ZDZjYx0hf/m+RYhAOKm1kHjoCcTOhK+Xn3neq4UQpIgIkMjizDhvwrxpceOCPmFn53Yx4SwHUZt
	o8PwePgo+UnhRDOGgNPjnFHCbSWF//Lo7CDCZVHEmpsTZ2Bz6Gly5ud/McYZRZgpkt4EptUk6A0
	jY7Fsbt7QLPJLF8rW7zarGuAzvNIxyQuqTXyZpEmRdeAvJeyIl0VDm1Q7xOcL+v7pcxwn7fkOZG
	5i59FuHGo+u687Int8fMBtvBcGK3/7ULO4hILV1QvFwhTOWVBNAVgeUJcK9M3KQS3kj3LI4g5f4
	8QRo3Vn4SLrM/1nF2/OyjFwZHdT7HWBxF1G0rBBbTMZsDQtC1bzP3ofc5MatRM5SU+9uKEmoDE1
	6XpzWe/cwcfMWZqY50CNBeFm710S1yL+Xn3jwPsaI3oEt8CExom4F+cA==
X-Received: by 2002:a17:90b:54c4:b0:39e:4c7f:7308 with SMTP id 98e67ed59e1d1-39e55071981mr2385940a91.31.1789701217262;
        Thu, 17 Sep 2026 20:13:37 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1002::de93])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e5a0e860asm827971a91.1.2026.09.17.20.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 20:13:36 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Miaoqian Lin <linmq006@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH] pmdomain: imx: gpc: remove all initialized power domains
Date: Fri, 18 Sep 2026 11:13:22 +0800
Message-ID: <20260918031323.3376849-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_gpc_old_dt_init() initializes all power domains described by
of_id_data->num_domains. Its probe failure path removes all of these
domains, but imx_gpc_remove() only removes the PU and ARM domains.

On SoCs with more than two domains, such as i.MX6SL and i.MX6SX, the
additional DISPLAY and PCI generic power domains can remain registered
after the GPC driver is removed.

Remove all initialized power domains in reverse order. Keep releasing
the PU clocks immediately after the PU domain has been successfully
removed.

This issue was found by manual code inspection.

Fixes: 5a42d1198901 ("soc: imx: gpc: fix imx6sl gpc power domain regression")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/pmdomain/imx/gpc.c | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index abca5f449a22..5766e3b40470 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -502,8 +502,10 @@ static int imx_gpc_probe(struct platform_device *pdev)
 
 static void imx_gpc_remove(struct platform_device *pdev)
 {
+	const struct imx_gpc_dt_data *of_id_data =
+		device_get_match_data(&pdev->dev);
 	struct device_node *pgc_node;
-	int ret;
+	int i, ret;
 
 	pgc_node = of_get_child_by_name(pdev->dev.of_node, "pgc");
 
@@ -519,19 +521,18 @@ static void imx_gpc_remove(struct platform_device *pdev)
 	if (!pgc_node) {
 		of_genpd_del_provider(pdev->dev.of_node);
 
-		ret = pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_PU].base);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to remove PU power domain (%pe)\n",
-				ERR_PTR(ret));
-			return;
-		}
-		imx_pgc_put_clocks(&imx_gpc_domains[GPC_PGC_DOMAIN_PU]);
+		for (i = of_id_data->num_domains - 1; i >= 0; i--) {
+			ret = pm_genpd_remove(&imx_gpc_domains[i].base);
+			if (ret) {
+				dev_err(&pdev->dev,
+					"Failed to remove %s power domain (%pe)\n",
+					imx_gpc_domains[i].base.name,
+					ERR_PTR(ret));
+				return;
+			}
 
-		ret = pm_genpd_remove(&imx_gpc_domains[GPC_PGC_DOMAIN_ARM].base);
-		if (ret) {
-			dev_err(&pdev->dev, "Failed to remove ARM power domain (%pe)\n",
-				ERR_PTR(ret));
-			return;
+			if (i == GPC_PGC_DOMAIN_PU)
+				imx_pgc_put_clocks(&imx_gpc_domains[i]);
 		}
 	}
 
-- 
2.43.0

