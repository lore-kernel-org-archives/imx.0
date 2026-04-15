Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FACC31F9A2
	for <imx@lists.linux.dev>; Wed, 15 Apr 2026 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776258634; cv=none; b=dvYC4dF300Wn5vyBNgA6Gly44d2XYt5NeA66YxfuSOHmXGZB7z5FxxGF/FRjN15M/Yv3QemWZANOz67xb7lWJJugy6yFkZ63IToB62MDqJ9+NC+id1TSFlnNwdunACghzHibJyeL0AOO7cT7MDS4Yku/Nc85yOZbUF5pv7AA1Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776258634; c=relaxed/simple;
	bh=TKihPKu1wRQ8mI4Zio2465s/4R0zt/1D8Ib7m8Y/KFM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=SKbpc3+mH9i7ejwzBIClDoUoZjyF3wjGPPmFKyK94HPX0N+DCdwktA9ZBUQNRteUxF3x8mzDvexxnpaYgi0FYM6s5tze4ceqLpwChuPz17fW+SkvQ6jYU3aSXH8QMd0NKzNeif4EXykSModA0vtuVUquG+YS341+Jp/HDFS6v6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iee+di0d; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iee+di0d"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b2503753efso58577385ad.0
        for <imx@lists.linux.dev>; Wed, 15 Apr 2026 06:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776258633; x=1776863433; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij396v/ARQbEqIfPoR7kjIiJGCWUlYIBuo1ugDzDJG4=;
        b=iee+di0dpLyyd25sFGWXMyiYtwDpkyFDzkwyuGLGaz4HM6Zgct7sM3jN0I5PVYfSJ5
         CfC78Ku32Dma0IIFwkmOwVyQ5oPlZCujyMOj4+uj3pvdKhg1YigwK49c51iffbTWTyVj
         vSg+48x5mVqFxHT1tMEBx74H3IL2bLMcEqpab9kBfLiMl5daRSlb46vSp3cV6n5vW/S0
         5U7Y7a98k//5bFpIcylxNTNFUzqss1kygFciGn2x21ynnCtVFicFsPxOvdkGV+h6F3L7
         4nDF46F76B6om1yIRWeNGPPxEDadbFUaiRWqkWnxLcqxgBfd2Zwn2M8vJrRiCEHeuHnl
         tdAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776258633; x=1776863433;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij396v/ARQbEqIfPoR7kjIiJGCWUlYIBuo1ugDzDJG4=;
        b=isT+078iw5NYMXK3H7nMoT5pUX6MDRuukfA7dTR+RfCH9VNv4inpoYy751gs6P0tvI
         I90IzINi2kngJplgNi2gZNG65CL09nmKOrGZzm6zCJ2THGtsCmHs5B3dUPR7IUa8Q1NU
         c51UrVtOFHb5fmOp9Guw7QkusCnKqWgB4gOFrPqLgGUpFoYGEXwHYlIMEPR6yXCZN36+
         gYxWoDEBL8SviZAxI7xPRXlKXLhYkCgW7qfJcDP/hDWuBUkhXajzuMV9E3IoMm0ac1hD
         6VeH/7s5DVV5bXdC0PimQlFzydUD71IkvJYVV5EWtrRkQFE5tm7tUUTg/AAJxLlLJU4f
         jXbA==
X-Forwarded-Encrypted: i=1; AFNElJ84e/AqsIjKe/HsaHxAnLEWMOQoLrQRlwh5ygym8fPx1fFk7scLtHXi6JXD0opMcQMvdo0=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbAnsTVLdtz/ZUu1tD1tSBU18hcZs8rYgsCBilc1YebxOxsUn2
	XLwOa+XwFMBTdKOz6FI3jSIHs4s87ELbjRuBLvgFaDLEjqYn9gGIZMTg
X-Gm-Gg: AeBDietyj4c9NL6mnKzoPqXaoK4c5yYPVBmsbyKJN6G5aMSBTGm7gKdIqEa9FtOd04M
	kkd0mfpA9TgIGF/VSYbEgPdg8U3Txn5By+Pa5TcSh4Vb0zAon3CU+HWoKcAVoOdLB73Pabyj2ji
	TIXX0WjKlLfqwHIxPqAN+IDqec4ZAS6aYk62TVmL8JMf7v5AYp3dckH9+FMGKyIQGSI783A28sC
	ZaCVaRJyYz44dhaxRpRnzTB2aHDtHGzLXxIWuvdTd0dNmJsxf5LNPCk7u9W+bHpneLXaj03HXC0
	5CUi2PMEo0D4TBJhXe/ElmM4HeWomTTrNbfpOdZpqpXpaCl0N9qKXJzfYZBcLycmq/F1cJDnDbV
	TW+EUK8ohI4NAwNMmtMbTTZLJi+01/pKuWiyuJt4zLUG2K7MXye3tAN7ct7H1ucY8HjaZIXa4yL
	7buOjREdJ+rIclBLGPSpdFrFpm7jerFt79Toc0Nctb5RPe/+7QBxCG9HYgDqC3qclnRQJcovTpG
	rTTxQ1zwbjp03C0QzPegQnJYPPeZKU=
X-Received: by 2002:a17:902:bc86:b0:2b2:81aa:f6c3 with SMTP id d9443c01a7336-2b2d5a5aa5bmr174065115ad.29.1776258632397;
        Wed, 15 Apr 2026 06:10:32 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.167.147.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b478292053sm28062555ad.56.2026.04.15.06.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 06:10:32 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Subject: [PATCH v2 0/2] thermal/drivers/imx: two fixes
Date: Wed, 15 Apr 2026 21:10:26 +0800
Message-Id: <20260415-imx-v2-0-aeacff9e72b2@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEKO32kC/zWMQQ7CIBBFr9LMWgxDa7WuvIfpAujYTiLFgCE1D
 XcXSVy+n//eDpECU4Rrs0OgxJH9WkAdGrCLXmcSPBUGJVUvO0TBbhNGKnUekDSaAcrzFejBW63
 cx8ILx7cPnxpN+Fv/vqp+QiGFta3pTlPfXhBvs9P8PFrvYMw5fwGinG2rlgAAAA==
X-Change-ID: 20260411-imx-b022791ea1b9
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Oleksij Rempel <o.rempel@pengutronix.de>
Cc: linux-pm@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776258629; l=726;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=TKihPKu1wRQ8mI4Zio2465s/4R0zt/1D8Ib7m8Y/KFM=;
 b=CNdQWFIHFiTFWs0EFl3Cyentbx1WrOppKyZSwi6EDSUAdKVfXJN9zmQWrGvs8MCLKZnyaH8h5
 t9sOioC0Ul3AJOtUkP+wRYpj8HCr5PgWeahKcvILQyj3kbtcTmive2S
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
Changes in v2:
- Switch to use devm_thermal_of_zone_register() to fix Frank and Daniel's comment.
- Collect Frank's Reviewed-by tag for patch 2.
- Link to v1: https://lore.kernel.org/r/20260412-imx-v1-0-cc3b45d63811@gmail.com

---
Felix Gu (2):
      thermal/drivers/imx: Fix thermal zone leak on probe error path
      thermal/drivers/imxl:Fix runtime PM handling on early returns

 drivers/thermal/imx_thermal.c | 49 ++++++++++++++++++++++---------------------
 1 file changed, 25 insertions(+), 24 deletions(-)
---
base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
change-id: 20260411-imx-b022791ea1b9

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

