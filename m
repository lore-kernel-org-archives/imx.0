Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C66B1EB1B4
	for <imx@lists.linux.dev>; Tue, 13 May 2025 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747118208; cv=none; b=LkeZKWw1NXRdiHBQOEO2/KkQ2+BO23Igye+RJWltJ+aLzuUWeG+m5snLwkltOkcw2wMiAIOLyR6bfNEN4zMKIwqaQV3Y9nbAj4dGiHFsl/y68P0DGUD2CvNKZtpxrjsnFGeOIgEkW18/djeJBlnyu40uYhXzK0LMJbtlZFkQ2+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747118208; c=relaxed/simple;
	bh=Ip3fCjtKHIWdXoxS2ayjmqQZ2CXz2QC9JgKDfWc8a7w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZVCWShJzQL4joVj+ekS9RzqX+H0Kt/YnzD1FM8dxbmfGb3mIj/D+O5FTptTGNXZ4QxAo9DodhVsTRU3ZBApp+XJpzqw/VorRUGMoHvphZYvZBESyC9jOn2V5Z+6yOqBwUAnu0dI00KIQp6kgqgNq4UnRXc+zpn/dLmTUHcUo5R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y/CDeEwc; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y/CDeEwc"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so5246721b3a.1
        for <imx@lists.linux.dev>; Mon, 12 May 2025 23:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747118205; x=1747723005; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y99xS7SY2LAz3TrF1rHqHfHg9H2RdQzzJUTTaDgx+SY=;
        b=Y/CDeEwcCk1KBOgC1UxWjRlrcJA9yWWdgim8a4s6WZOdwIgE5GAEfDgxexTK8W43xS
         6lJ6XkwCrdMx2KQyLzU0C2D1VTWX6ZyS8JbCdK3tj4xH6o5FNOIg81eHO0/KT5AYpIG2
         5P9DHJHakfTfo51b2chkGgu8ipvGaL0Zfx5rhyp2HzhT6ibBm2ayp4iWXL5ev5VEAP7n
         2OGAWgg+X97yZoUMH3ELXPNmaiUdDtAnd5AAmUZYcQ2bjwNdn7GxpO4aSE8rnmnAFUk5
         P3Y5FtGRtyL6sz+2pBzX1mmEh3ImXhrtDb9lxa1KQs5oRXLjPiJu2ZXCnxls7wZPiCAh
         7s/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747118205; x=1747723005;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y99xS7SY2LAz3TrF1rHqHfHg9H2RdQzzJUTTaDgx+SY=;
        b=G/uZLtzEl6c8LO/NC/QqtLZDc/Y+tf6g5fXYzkyFAhJ5f1+9qFKSEVF3ZhysoQytu8
         2ttuPcS1LTjer8kIRhTCl9E/gKXUHEHZeWI4su7HDBOlI1fC0Cd/YuxIUPUoAIYoEfPw
         evoKmhHOvBcrryEIVOtX06O+1SdeIRywPehAzHOuLMPvwD/V8pQOmli3T8AwZh1S5wWy
         RPlnA+loB0zwvsflCd8Ip7q0cEVyy5At/sfhBXrFaKhJcskdKXexkLPFyqK/duEuQYwm
         6ZAloT8FyGTK+kpaKpuJjOLM/jPwGJkkGxpyR4DPzs94njWANc4Yhho9MLot6hooD9Dw
         jWPA==
X-Forwarded-Encrypted: i=1; AJvYcCU1LMN1U+1zW0bKqxMErSCfPSsqcVkYJ9hpfagYwImbzICZHq+s4IWeHtE4HdgmvTuV2hQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+0K7Hsmz/486shqJqgkDf3M4JI7b2a5cGux/3w3qUq/pBDL9H
	aEjGMsbV29U3KYB44j2Hikqw7y8BvopXylE+duORMk17DS33DuRilG+vY/Y9bNo92uUR
X-Gm-Gg: ASbGnctnLdgGYscGNDWsGokTTeiFn3vfZnTITP46R6hRmvpV1eSTWjNdG9AokvZFETJ
	u5eB9dwbjh+tIEhmNYenWuUjs4ZdrAoBQXLpR20PNJSaVUEfXQ5EsyOUOjlpPrA2MEzaUWk3dqG
	Pfzzvhwb70vukwHzHoTibb9RAukJfnblt3dv2gImj/Z1X2L5KbaUYKhsoAifkfN108TJCz9ySUA
	6NIvHAxTqiUv4J55r1rxWagi1RWu3h3LSsgTMYkoGu+VkHyGv13XVBT0zGbV408zyOEz+wKQ+60
	8XCePNB2KYZJRNe7AaYJcryld4BIwnSfQAW+7Q18sp2KUtzlhGeTq1Y=
X-Google-Smtp-Source: AGHT+IFJWXy24yaetI34omZb1r4anR0SzeBfbfb+3vCHkMA5r41DKDPTr4sjv1kUrFcK6m2M+hxgTw==
X-Received: by 2002:a05:6a21:3510:b0:1f5:7cb4:b713 with SMTP id adf61e73a8af0-215abb3a301mr23308487637.19.1747118204664;
        Mon, 12 May 2025 23:36:44 -0700 (PDT)
Received: from [127.0.1.1] ([91.124.30.36])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234a0b76ccsm6657936a12.27.2025.05.12.23.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 23:36:44 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Tue, 13 May 2025 14:36:14 +0800
Subject: [PATCH v3 2/2] i2c: imx: drop master prefix
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250513-i2c-imx-update-v3-2-817b7426a67e@gmail.com>
References: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
In-Reply-To: <20250513-i2c-imx-update-v3-0-817b7426a67e@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747118187; l=873;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Ip3fCjtKHIWdXoxS2ayjmqQZ2CXz2QC9JgKDfWc8a7w=;
 b=dtZzgsLgDl4KFfOlioaf2TlzkSvJK7YIv+UGk86oqaYvH+1y/9yehAeMD3OYYPYJjYj4B7deQ
 sLWQG6khLQIDMDqVZzcC3TMjq2ndve+vwEALeKmMzhawudTm3ezOiut
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

In light of the recent updates to the i2c subsystem,
drop master prefix.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 5b276e007292..d85adfb73bac 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1687,8 +1687,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer = i2c_imx_xfer,
-	.master_xfer_atomic = i2c_imx_xfer_atomic,
+	.xfer = i2c_imx_xfer,
+	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
 	.reg_slave	= i2c_imx_reg_slave,
 	.unreg_slave	= i2c_imx_unreg_slave,

-- 
2.34.1

