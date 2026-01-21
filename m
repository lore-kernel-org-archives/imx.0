Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA730EF89
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 14:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769005049; cv=none; b=ZWaRB1t9VOZYKahI61krBN1n0t7e4LnBxYD1xne+rSmPOBSC1yc0YpAQR5yrcwrDNsWpq9sk9gA8+rHqc+GCLei0C/GZ9xjvTvAZorRqpu/BlliUH8e3cBqBxuTki1Dur9aLKvjRW6QGIkRp/1C9guEIZxtcLjUWayb134qVeSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769005049; c=relaxed/simple;
	bh=psXMmI1AnrTNmbUPhfuPxpMrDFwww3OT+Tpf52rUs4k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=B4qVzU5PwmFhVmWNC4bbtixOYmeWljwTDzfwllZk019EUvFLHyJARHKL5BCOagiTVFffqPGydOF0girelegfg1yU5+4Fjne82N5ENdNcx9htj3YL/umNYQub5HD+zDdc9fdKaQVHCEXpJ8YNyeSc/sIea6UUt/Tdy5ULOsVsj+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I+eVAGYt; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I+eVAGYt"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2a0c20ee83dso58767685ad.2
        for <imx@lists.linux.dev>; Wed, 21 Jan 2026 06:17:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769005047; x=1769609847; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iKrrqjcg46QuFiM8rQG6H6noqywu73UQ7w/zxl2mM20=;
        b=I+eVAGYtoTSJJgPYDYLYahWsoW/M/jwRwc7ZBaF/m9zyxzJ1qiAFh9Z+MuZDjIEiR9
         VvX4mQKkvmRgJXdCr9j8pWEFLeKIxthHp12boc64+k6j+slwCzdQf7YXKDvpZ+4Shw5C
         BxIlijXY3Ev88QM6jLOba7M7nr8tt7jAvK2q/YeG16Ke8JVva4ra4aIHEaSM7/yDNvrC
         mvuEB25MgzeJnVuc2u97VuDx2QQZZLs534Y+ecg0vfUBQ/JTwnztzYdK/PzvazH3fjA5
         XK6aZk+hG7T6nMfTGMdDz3HAKTADm28vSi0t8c+HLDlE1Ey+f0TpJO5F0tVeBgBC6wzm
         TUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769005047; x=1769609847;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKrrqjcg46QuFiM8rQG6H6noqywu73UQ7w/zxl2mM20=;
        b=JMwoB2KYKLdXadOQBopdCKLOdbmRCb+iRVnWpOxufB9bCEsmD96Q9Q8VcRGVGW7i9f
         6oNBWF0sekd5EdAp8ojt1KCINOIWgsQkSSyZVH9ZQZ54xfN0lNCIiAa8bRr9ayd0zKti
         626/OT+wvUBVwOj0HsocSKNrFQKSM31TgtoDLH4+ZRw/EvGIEwdiFmMnG8tYBAP5PEfB
         6dcLZK1hTvDldlN1MreDAyA6eR1k+suIYfy6QGRcnUTY9HfEGwa+y/PY1ZPSx1gXrMMm
         3/9oJJv37tDE0sWMhl0hHcmMtu4rMhb5pn2MNxAZy5NkoyyTW/lM1JseD6HOLFLvhksw
         jGaA==
X-Forwarded-Encrypted: i=1; AJvYcCV7H/FWKgtA70232YttEw3VELnDTTDEXqbnmussOs3QG2A8ZP4Do6v6mzr/Jqb3xZKTcPY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw2Qs4NhdypvKdK9ZYakVFafQ32Yq48yaTvVbw2LCyTHHBbrUI/
	mtXi9/CS79fmxL0wQ55rnxt5Lcb1X/5ibon5Yl1pw4gTzWngXhrBRPsQ
X-Gm-Gg: AZuq6aI9TInxaKgG5A51XU05tg0EOl5ivF6wREmQcXkaKcETubQJX8QtduPXvzlbuWH
	2a22cJU26nYqzf1aGRtLDqIZ2LvRNU97Ohv/mOK6Teeup3qslmWHYogmBbUs8mL2S88VmnXnbbW
	6LzwVXa+ODlwGdTFUItrr7/zhewszZB0/cL+Pi5MQ0SHxxpEyOp/z+rbjzTeEvqaXK+9fkrUX81
	0aLpqEfCdUIdVPCzb/WZR2wYjWqv6a3CdeWgjBURdHNfQCAX3+kpIUbfqdRbzA1yBJK3ohq18tg
	+I59c1hMWxGhKCVJtRI3xc0rVdeeEIlUlgtpUkNTNiqahEWRrM3SJlMV3eLi/Om7mARX1oOOMha
	qwH+cCl/RQjHHS+PD80pjtkrcpEhRyd43eE0tf5JRbn9J3PpKdNluWx0wJ6YtGbYimpaqQ24QJX
	mBQUv3SMhmoJjCHYaXX4y0n3FL
X-Received: by 2002:a17:903:2f91:b0:2a7:5751:5b30 with SMTP id d9443c01a7336-2a757515da0mr55304155ad.12.1769005047012;
        Wed, 21 Jan 2026 06:17:27 -0800 (PST)
Received: from junjungu-PC.localdomain ([188.253.124.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190d14cfsm158144605ad.38.2026.01.21.06.17.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 06:17:26 -0800 (PST)
From: Felix Gu <ustc.gu@gmail.com>
Date: Wed, 21 Jan 2026 22:17:17 +0800
Subject: [PATCH] firmware: imx: scu-pd: Fix device_node reference leak in
 imx_sc_pd_get_console_rsrc()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-b4-scu-pd-v1-1-f993e4082089@gmail.com>
X-B4-Tracking: v=1; b=H4sIAOzfcGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQyND3SQT3eLkUt2CFF0jU/NEy0QTg1QLk1QloPqCotS0zAqwWdGxtbU
 Aj9diLFsAAAA=
X-Change-ID: 20260121-b4-scu-pd-257a9a40e84e
To: Ulf Hansson <ulf.hansson@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769005040; l=967;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=psXMmI1AnrTNmbUPhfuPxpMrDFwww3OT+Tpf52rUs4k=;
 b=UewNA73STZQdwpe60NY3QQLvtNzecqxLwUk0xLMEiSVclZNQAxE+IH3eKK335EAGp/MKGyHZG
 wY4gCGmtTJ0DRQcZJY1wETuCJmC9PKgZPFG3SozHPeDF6CexTqIJ/lk
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

When calling of_parse_phandle_with_args(), the caller is responsible
to call of_node_put() to release the reference of device node.
In imx_sc_pd_get_console_rsrc(), it does not release the reference.

Fixes: 893cfb99734f ("firmware: imx: scu-pd: do not power off console domain")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/pmdomain/imx/scu-pd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pmdomain/imx/scu-pd.c b/drivers/pmdomain/imx/scu-pd.c
index 01d465d88f60..3ec33667a308 100644
--- a/drivers/pmdomain/imx/scu-pd.c
+++ b/drivers/pmdomain/imx/scu-pd.c
@@ -326,6 +326,7 @@ static void imx_sc_pd_get_console_rsrc(void)
 		return;
 
 	imx_con_rsrc = specs.args[0];
+	of_node_put(specs.np);
 }
 
 static int imx_sc_get_pd_power(struct device *dev, u32 rsrc)

---
base-commit: 053966c344dbd346e71305f530e91ea77916189f
change-id: 20260121-b4-scu-pd-257a9a40e84e

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

