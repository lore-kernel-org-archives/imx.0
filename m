Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FDA1519B9
	for <imx@lists.linux.dev>; Mon, 24 Feb 2025 14:28:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740407341; cv=none; b=lHAm3at9E8XX0Yb0W7M6k/Fl39nziotIg9PtjSLK7H3Y9ViD7Ej4lpBrP3xsCPnCcCwV7kPSL60K+ywENvgEzmkPK+ttP5kX07asrLwKvB13yKNBZyzf/7JCrV/UfKZGfmCScUnqExjkQHVp+37Rjo/S4hPii5BvIVJ5DfL+vAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740407341; c=relaxed/simple;
	bh=zhtVaOidnLZwODDfilv1rFpTFY4T032G84mUgsjCrCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=isfhcgimYSfa73cmUfHmT35wuJ0xcg2aHKvhh6SY2u8KLEw1RHb1h4+2UoE4dIs4cw+z5iDmSc4SEtTppSIhcDTh6fZ3C7des659WcEJZbB1RHACMNZEvbngcp8M0JReuiQn7uaCvAZ7ycuRr8ILJ+vZPKnFD6TtTSBAHeo68J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=U+F46lRv; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=eEcNe0in reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="U+F46lRv";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="eEcNe0in"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740407339; x=1771943339;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kOCuug6g2vlCEi2Q0VImtW/6CT/XO77dKbldUsHBpEA=;
  b=U+F46lRv5JMhCE7cp1lLyPrv4T/LJ507M5f8DOTy6PV0wG+SONxPBHIN
   /iRJPeicN/t+lvIskFrXe5jw4SbPI1dOao6aWGV+DLbeFRlrQnPGUKOlq
   AVigQX8kozrZ9PyCMKCjOK/jFx1EP6zGF/D7Do1PioBnNOmr9L+MYQ1Ai
   hA5xlicgZTUkSnyvaXx4cFrNGl6Zr8b+BwAX8RvULnY96kGVzJep1yUcS
   kngwQ9BqgiMsdOKFuD7JHLQMq5/9Y6rS4xod9vjX+174+Fzx/3YfgQ/pZ
   ZeZbp1NbyZWnnf1FisCLtZDbmijGEgAHo3pdHsm2AftfOkX6J1LjQ/7pQ
   w==;
X-CSE-ConnectionGUID: 4Bt33qgQSIqMqzutaJKLnA==
X-CSE-MsgGUID: w0i6W07KQM+WSKibYuqlpQ==
X-IronPort-AV: E=Sophos;i="6.13,309,1732575600"; 
   d="scan'208";a="42042110"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Feb 2025 15:28:58 +0100
X-CheckPoint: {67BC822A-8-28232521-C0C2250B}
X-MAIL-CPID: 6F94049082022C03CAAB93122D6C34A1_4
X-Control-Analysis: str=0001.0A00211B.67BC8229.0026,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EEB111679B0;
	Mon, 24 Feb 2025 15:28:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740407333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kOCuug6g2vlCEi2Q0VImtW/6CT/XO77dKbldUsHBpEA=;
	b=eEcNe0inS5AFVueX0jaYpHDTN05XPKbpt1E8R24GIs9L/TMcfYfpOwh9F/rVw3MmstemA0
	QEUJvNfnrv2ZEZRlTwatqtv1NnK/tT2I/CtkzYH7kGAKg2wA4XGv6nA6o7mt7Yu+alv0Wo
	ss0yBgIakgOBjhwlWNW/dAZHnLLrGGNqmsO8o1ZwxmsDuRHyGPLAfx4T+NT8BdPFNycIKu
	8e40VXuFf1MHL3RdgulHRMm6knM/dxKYFcFBR/dKUCHxtSZnXl9Dw0RsaPCfgn3tvZCy7L
	dRUwh2KgHXnQ4aaERbyvpJTamoAaPaN7YPhdHnXMq+1mWVdHMXtCnJkMe2pGKw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 3/6] soc: imx: imx93-blk-ctrl: Scan subnodes and bind drivers to them
Date: Mon, 24 Feb 2025 15:28:24 +0100
Message-ID: <20250224142831.485159-4-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
References: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This particular block can have DT subnodes describing the LVDS LDB
bridge. Instead of misusing simple-bus to scan for those nodes, do
the scan within the driver.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index 0e2ba8ec55d75..fe2ff7a457502 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -7,6 +7,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
@@ -297,8 +298,14 @@ static int imx93_blk_ctrl_probe(struct platform_device *pdev)
 
 	dev_set_drvdata(dev, bc);
 
+	ret = devm_of_platform_populate(dev);
+	if (ret)
+		goto cleanup_provider;
+
 	return 0;
 
+cleanup_provider:
+	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
 	for (i--; i >= 0; i--)
 		pm_genpd_remove(&bc->domains[i].genpd);
-- 
2.43.0

