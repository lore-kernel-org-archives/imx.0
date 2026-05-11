Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDD6223DFF
	for <imx@lists.linux.dev>; Mon, 11 May 2026 17:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778521393; cv=none; b=kGnLS47LmviKvSNWzU+Q2yxps+Dqo/lDqyrTibUzyBdzh+2uMdHsihKgKKM35XMdoTWiiS1lMGldDyN62dgsMgxxM4eclVNaBLo6cgOabW01rzLB3Y9mEJ1IPJULRHYD4J3l/LPc/RMee4144RbNZy8m/apbj3cD0ZZLZAJSy6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778521393; c=relaxed/simple;
	bh=NmpEIPGRlLUzKjoLSyn8mQV0OZgocjo2yX1kNidP4gQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BCgMtPvAQAevGpanhQ4IuJNBrhmPaDjhzeyMcCmXAJu1fQo6/gJ0lpjwDxXUe14ruqiOsCos3sZgt5hnqZhp8JYKtaW1Q4bu8xXqyHazM3FprPvt9yK3ax4OZExdlGOd3v8LcUPo2tTQJHMaE1lelToaZZgLFHiQsI0tewVhWJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g3ILe1vW; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g3ILe1vW"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8383fb7143aso2150386b3a.3
        for <imx@lists.linux.dev>; Mon, 11 May 2026 10:43:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778521392; x=1779126192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=H/v/BO2s+C/N+KeMLepP9unKc4wiBqpI25gDLTzhr3g=;
        b=g3ILe1vWtc6qp5Jqgz0Ve6x9gcCY9WJGr3ImkKyCEMlnC00TLN5OfXqdB79KpdYVDP
         8MwNfgS/0zbXRw4l5diqguluUsO9mejsu93ZgXeKZ3h5hM/7Io8D9Q1TCV/6Rrpu7p+O
         7RVtMvKlVoIAlEIBWMt1Bm145yPszJ51+kMM+oWVGIxaM3RLiL2YCJKL5BDtrEIOPJdX
         gmkl+XqqDnPObr0/Q8Q0TbuoWmRxa2P6Jz7JNNCoUiZk0bWrBA169V4qSBJrI4aivxL8
         /LlFtvjF2IeRWRwqrhP2lMRwlzKTKlDjCdlK9KKb/Zc5/1nrWf2iQvF3SGY0cAEcrUzH
         UOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778521392; x=1779126192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/v/BO2s+C/N+KeMLepP9unKc4wiBqpI25gDLTzhr3g=;
        b=Ljj+1hLgZ+TzoMTKQphS26k+YAbEu7RpT8xP3RjMIGkUKEiLo5Bf53pwsDLIqV8eBt
         jH4XhIkAo5KspZTuox771td/nrHcEJO/nLyVOyJ67G/6Yps2cKYSXyPZCthcqlXUpxE4
         XaLZBqenGg2ZCTBLs8ZEt7ufkyL8qzvM4Jffes4wnE3+AWPMjT5itF8wYdJVTFupiH6O
         PB4W+3qySlOsIoVV+5mvXTqxee6B2eiaf0+RNplc4Ntx6tR3DnNgaqbPtxyF3a7zRz0W
         9SzTx0RRbCI7qQ8WSPc9l/quDAjCbxx3el/VU3ySWbBeWPj8kKwn0kuWdkjQFWtXMOH3
         tJAA==
X-Forwarded-Encrypted: i=1; AFNElJ9eOHMvYjJCbNAEmait/Sjr5ZiQfRosEvRe7qGRhSrWErtU2aC9axCD2xUYPmEB1E2gMuQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwWPtIEUrmXeJlObIvy3uoueUDWM36UcGIr0XSTvreOddxLlc3H
	wSpZ1mJB237pnRzUhoQqG15pq4Ic4UxgpKdBXukIym3DoWgk5auCArmw
X-Gm-Gg: Acq92OEfGiMLd+8k4JVb/FyKwuvIhsCDA4NVIkoYxj+lGFqmhpOXeR+dgKdTXAo6EzF
	vvUomHawjAGIYqnU+BE9dMzZXl8PvRD0SdN+5j+yqkbHnkdwgEb40dITDocMDagD4a4+yD5ZvTD
	8JK1pvTbsgRtAaojPXMoy5P38aJQRAkW7t9+KmIHDhs7Il6MPXJN3jlevo5I6V/iXcUYLTHiZXd
	Qd0tEssHu+xcdfUdIvof5CzzOxXXZKx9CYGz8piJAZiqubU4FUC+Sx9pGKi+YpAdgwBiJL9kaYn
	0kjc9hOX7/vg96H1dgOwEhgmrE2UZSMean4+fddY6zyy7foSulFZxsU3b/MG5vHCZkR67aXpKzN
	UkpkneXay4lsVDTCkaxi1UgkD951Vuxqw0tuS6MJGHX0LzJG5V/aiBG9MLUKXCOvlcoYvvRlvZi
	O3A/BJp0cJIXRqZD4MbsMiMTQcSP1+IiMQDVu0
X-Received: by 2002:a05:6a00:4b12:b0:82c:6f07:299f with SMTP id d2e1a72fcca58-83e39c37b69mr9964792b3a.14.1778521391621;
        Mon, 11 May 2026 10:43:11 -0700 (PDT)
Received: from Strong10mede.domain.name ([122.161.50.8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d34872sm21398367b3a.22.2026.05.11.10.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 10:43:11 -0700 (PDT)
From: Mayur Kumar <kmayur809@gmail.com>
To: rafael@kernel.org,
	daniel.lezcano@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	rui.zhang@intel.com,
	lukasz.luba@arm.com,
	festevam@gmail.com
Cc: linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@pengutronix.de,
	Mayur Kumar <kmayur809@gmail.com>
Subject: [PATCH] thermal: imx: do not split quoted string across lines
Date: Mon, 11 May 2026 23:12:55 +0530
Message-Id: <20260511174255.215207-1-kmayur809@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The checkpatch tool warns against splitting quoted strings across
multiple lines. Join the dev_info message into a single line to
improve the ability to grep for the message in the source.

Signed-off-by: Mayur Kumar <kmayur809@gmail.com>
---
 drivers/thermal/imx_thermal.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/thermal/imx_thermal.c b/drivers/thermal/imx_thermal.c
index 38c993d1bcb..5aaacbc5347 100644
--- a/drivers/thermal/imx_thermal.c
+++ b/drivers/thermal/imx_thermal.c
@@ -693,8 +693,8 @@ static int imx_thermal_probe(struct platform_device *pdev)
 		goto clk_disable;
 	}
 
-	dev_info(dev, "%s CPU temperature grade - max:%dC"
-		 " critical:%dC passive:%dC\n", data->temp_grade,
+	dev_info(dev, "%s CPU temperature grade - max:%dC critical:%dC passive:%dC\n",
+			 data->temp_grade,
 		 data->temp_max / 1000, trips[IMX_TRIP_CRITICAL].temperature / 1000,
 		 trips[IMX_TRIP_PASSIVE].temperature / 1000);
 
-- 
2.34.1

