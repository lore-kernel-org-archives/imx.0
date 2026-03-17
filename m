Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C7FA307AD5
	for <imx@lists.linux.dev>; Tue, 17 Mar 2026 03:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773718824; cv=none; b=ubewGrHIHvV5BmyeeRWIguDQDP5GWAU8juYR+zphIhryvAmMEUzg+Xw69v4Csz32B56FDa6kabMHKgSMSebWRFIoL2f7DLyKizIq6d1oCfIM6639vpHyfbMQMei7d/w/+GNtcR3CZyB49spK5hv+OV1uAYPm8/kGHILyOvpa4b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773718824; c=relaxed/simple;
	bh=EHzZfSji9YzTKd+dWCWdcJUA4LZnk2JrtPCz4ysfZf4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ts2qurkNsZ4PyJpMaIgBIyBP1gbObHFsEPVt52XqTUJEn4oR5VrwHlX2tKuUfb801+9DmRm5Plzpto2jMnr0IuM6I0/jkR5oUa6yj5e8IWXRINaC9EqG0fuvs/toSl8+EPki09GSBkNgIcrgip0KA+7ODnrL9+BxzmjdfSvTB/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eBU9khO1; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eBU9khO1"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c73aabd620bso3491184a12.1
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 20:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773718822; x=1774323622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0e4a1XqGu8pWFSZImA7ilBed018RbSnXlZrAKGDX89A=;
        b=eBU9khO1VtVR6Lwr4S3xrmATKRnf1KLD30nSalG2hnvIkJBPkEWN/gW+7OFdsj4PGu
         A6ofezAhyMROojgGhLsKBJRHZXB79ZtvI0k04YCfevHBvy4T9gfaRZM2iFAtbU+r9HIs
         Hbgt2yYfpuhnSBlTPNrmmWl08zbTz+gF10vtkEnQRDagTh0BtPBdnApupgdTHJDOpbR5
         IcTqx9j0zlLgHt4mwzn0VodaVVx3pv7Kx1dfDA64oy06UIEgXEUcgLYc9NWHiDFOkDhj
         1f2uvTUVgX/Vhdc3vtXY0ZrnLTt30oDizFRvKm0vHNulwvLdNBCpzZdE0xZUvLGTyL0E
         Z2gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773718822; x=1774323622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0e4a1XqGu8pWFSZImA7ilBed018RbSnXlZrAKGDX89A=;
        b=QjC3688yuiYSBihblmQQirTf3LTwb3FGN64T973Si+fz2Inn8KIpMyOQNua05enTeR
         sLqFHgQJ3q+5qbhXomM99mEbdyfP8K2i5VI8a08wStCexVAD35na3zRH1xE8Qat0sRl9
         5JOcZ/AiZthhKBEJm74uplCA+/T+EwqET1NqZGAplm8zFMG6S2G0IyuyqAK7GWNOWSpu
         O2Cmu/W9MUTGKhBcyGQvBzEve2ZcuyQzVejkg5RE9A5x3KN1sHzc6Jk7F1ImXSmKyL6N
         YO5v+C5HKEtuTP479ls7N8IQZa2NGVT86SEANT4pa8mgNLlRmKdCbPn8/xMqxvCsL/Ns
         XlkQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2ER1+nl5UUis941/ZU6kRv7Ah1YSt7RQfkbH770A/1lDOQAbB9J3rO96wqEQKFlMSNVI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4NyY62VF5ytpi0WK8xgTKI71JFp9iKZemyN/sBQ/9pdT0pO2M
	g7vpSaLSnXNNpP3V16b+9Rudk15q0uZeSdUXQkVBTxcsX2VtxRcBX/pi
X-Gm-Gg: ATEYQzy341WMG3itooSv2lRbtZqQhmEkqB+ebpOjOkvWyTyAIzygShSej65CejciNEK
	hQdu9bglOUvIf5nsIrZ4TVGMX0mhKNUTdn7Tsc5WEfsEisp9J/Nrn16SJpn/5aqAsTR60Lt5afh
	WrTBaBMqbKPCRX7/Chwny5AKDVHLTD4zvhvY29pxW7hcE42WXiAR/lFCm5cTo2QqLoa4c96F5WB
	/6xNM5WoVtYgq3tUNWrsvzOcFFrNoD2NZuM5GBEdLsmjmapfrHYz/n4bt7p8nTprk9Rk/wHpGK7
	6sKGa4AMJJiTOhPYiBN60ATOGIhe+NOMnjZ4Uhhisv9NVwbeuHbpMuR5Kl9+113uD4BcrCSyOzp
	aea/OKY0DV2HUCJLbilM/Ywo1ExaPQ6Q8w5yHtW/wfwtLwr4sQtV1A+hxJI0WXSp2qePNZuEFOA
	uivUIeiEQZjBuWSETQkpfWnfLtxYZ19FEd96YAqNz4LjdJISfEawCTQ9Bbhr6YtG3K
X-Received: by 2002:a05:6a20:2446:b0:366:2447:6778 with SMTP id adf61e73a8af0-398ecd6c849mr13870485637.53.1773718822408;
        Mon, 16 Mar 2026 20:40:22 -0700 (PDT)
Received: from ZC-202510311500 ([61.185.217.216])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07343719sm14847237b3a.38.2026.03.16.20.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 20:40:21 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"haoyu.lu" <hechushiguitu666@gmail.com>
Subject: [PATCH] i3c: fix missing newline in dev_err messages
Date: Tue, 17 Mar 2026 11:40:15 +0800
Message-ID: <20260317034015.638-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "haoyu.lu" <hechushiguitu666@gmail.com>

Add missing newline to dev_err messages in:
- drivers/i3c/master.c
- drivers/i3c/master/svc-i3c-master.c

Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
---
 drivers/i3c/master.c                | 2 +-
 drivers/i3c/master/svc-i3c-master.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
index 9e6be49bebb2..27e93fcf2eba 100644
--- a/drivers/i3c/master.c
+++ b/drivers/i3c/master.c
@@ -2396,7 +2396,7 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
 	 * DEFSLVS command.
 	 */
 	if (boardinfo->base.flags & I2C_CLIENT_TEN) {
-		dev_err(dev, "I2C device with 10 bit address not supported.");
+		dev_err(dev, "I2C device with 10 bit address not supported.\n");
 		return -EOPNOTSUPP;
 	}
 
diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc-i3c-master.c
index b84b324e4111..e09a6218bf34 100644
--- a/drivers/i3c/master/svc-i3c-master.c
+++ b/drivers/i3c/master/svc-i3c-master.c
@@ -1268,7 +1268,7 @@ static int svc_i3c_master_do_daa(struct i3c_master_controller *m)
 	/* Configure IBI auto-rules */
 	ret = svc_i3c_update_ibirules(master);
 	if (ret)
-		dev_err(master->dev, "Cannot handle such a list of devices");
+		dev_err(master->dev, "Cannot handle such a list of devices\n");
 
 rpm_out:
 	pm_runtime_put_autosuspend(master->dev);
-- 
2.53.0.windows.1

