Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65637208A7
	for <imx@lists.linux.dev>; Sat, 31 May 2025 06:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748674678; cv=none; b=Cgd6fCYyB5GSoZstz6GcxIuc4P27ZxnPjL6OC8HSBiMbj/0dOhmSHwDrm5aUGNlJxX3bu9cO7kKrHTWaz+TTx161xMgcvOg91Ax3CXGHsW3FPS1QeQOxUwqkvwkVULTEHKFYwMlIOJiQzcQ3Bl129QvclOq3NWtK3slfVG4VqhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748674678; c=relaxed/simple;
	bh=kQKAVOjABu4DOdsXyMCztP9egiM+XBu9UnlB89Vw2+Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=baBzSnNpF0TvpNVtN7t+H764ULgYwYYSTXwbTvuFz3RUPYkFB8j6RrKWQCdMeDXr6YE8nkVcchKhusmNyHu1dY2wR+dFaCILnR45+LQUb4Zg1+dUQyud0lRWZ6pC/Pvpj2llowcHX2fYO6sBa+FZj/DtnZlSTvQg7yzPeeNR8bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AZxOpCO6; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AZxOpCO6"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-234488c2ea6so29156605ad.3
        for <imx@lists.linux.dev>; Fri, 30 May 2025 23:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748674676; x=1749279476; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=apGGcoxP8Ev99mNcn6Y1E8dxFRDON+SAO6rocvuISrs=;
        b=AZxOpCO6Rul8GNalBIV+rMZAEbrFR0X6KJPHikC40CIJsT8PGBUoPW3EIK1bDUCFYn
         y8Oy7cCDVcA6EVOidDx+kj92+xTfGaAJBqpqEpuz7lDzTeVeo3mEPsxkrPD2pEvGygAi
         2M4BHpf5XCAkq7by9j4Wt9VSXsed1v0v8cRIJeQm3LIXemuRymfMz4BZRatNnOokGa7S
         PcMq/5gfNIUQg4Bybc0K+OZ5G6vhVnifgPgfOICIW7umuoEB1NFQMvoFkJksJER3ypqi
         l1J0iklvwfWZg0/mi/SP0vttz5akystMQMO7nxtAJ/M3A8MjaTmH6GBK9fviD1jIzpsw
         Snaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748674676; x=1749279476;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apGGcoxP8Ev99mNcn6Y1E8dxFRDON+SAO6rocvuISrs=;
        b=exngGy2cuOX07mWkMQB568EnvvHcxGtU5CHZvA3JLrfm7+j9ppcGZmTKP8ALdMWKiu
         rpyPZETNOogh6kk4BcLAwaI/oAZq3wvXc3v2NbBbgO74cXwWWJDEVwwia77z2c+oBSgz
         pNOhfAPa3r1C70uR9U18IzEmK10VgtChg5W/3XnuHopWbMEoitjCNjfCDCepb6Pc/Mkr
         x8Q3eOpuowraG1OudN+s6wjSHRsiY+iWUol+3b45rmAIfz4He1dP2zYj5m10Ac1Q+YA9
         Fei1d5r6MRh4ryUxs5ZG1fNeRd4Dv4QNrgpC1CDQrDlP7LrobRF6b09liDPt7253BstB
         gZQQ==
X-Forwarded-Encrypted: i=1; AJvYcCV6PmK7esJSlTJa6+dLVTWdnkKj8qTGhV1KALPMtDd5X1oySOLdieJmNzkwutcpbWZYWzE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxS6xtQLSAm2AGXrtJsjw6Suobt3WmH7Gn4gd7sL11m2amahVD5
	fbxXY55N8GjohVrcAN9/V8Su+8x8C/NoevMfBbe7mi0EiyQWxQPB0YeK
X-Gm-Gg: ASbGncuaoTVzzWKu96lfjHIrhpjJIkgeNjTcXGbA8s0F/b1kceBp0lxyT8KvQAAbATr
	OH1v81EX9s/jwplzaZ96Nhq5NgVXpDG4bVPAIFt8csZEqqq0+oa+HWIp9QEBp9Lxe+4R5FvXedg
	wRDX1rzl3CMMAoPDa8T5Mo57aHUKah5EpoDXyfkkGdeZ++ihd+xk2G0RtHVtoev/HVNVE30QHkb
	sBsMXe8vNlE/A+3ohmMweY8PBI5Mvkbgu+153PRJHJzW5JOTh/sF72d5T5pWiAnvvO9sYuMCV0J
	r9/Cg04tXl3MWZFhM4OdgsZzio2+AMWSsy0=
X-Google-Smtp-Source: AGHT+IEZEi9SjcI+3gdNIx2vN1L8Jdx9YJrveBMTkReaRTGrreg8M6bTR+tIvp8XdcV58kFMe1FPxg==
X-Received: by 2002:a17:902:ec8e:b0:234:e655:a627 with SMTP id d9443c01a7336-235395d6680mr70877965ad.35.1748674676483;
        Fri, 30 May 2025 23:57:56 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5448sm37596625ad.185.2025.05.30.23.57.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 23:57:55 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sat, 31 May 2025 14:57:27 +0800
Subject: [PATCH v4 2/2] i2c: imx: drop master prefix
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250531-i2c-imx-update-v4-2-bfad0c8fd45c@gmail.com>
References: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
In-Reply-To: <20250531-i2c-imx-update-v4-0-bfad0c8fd45c@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>, Carlos Song <carlos.song@nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748674650; l=973;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=kQKAVOjABu4DOdsXyMCztP9egiM+XBu9UnlB89Vw2+Y=;
 b=pU3nS5K/z91d8OcdBox2f63zfxUhxWUPLtlrhjoZVy21l+Y9Pw4XxYTZL8coyx6XZu9rmRwCT
 DefaDA6YghUCOJT2/YpR3id0q8qHsCsTy1UXDct+TsQiQB89grxhXZw
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

In light of the recent updates to the i2c subsystem,
drop master prefix.

Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Carlos Song <carlos.song@nxp.com>
Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
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

