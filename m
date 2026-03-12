Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACED282F3C
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773325840; cv=none; b=ZZNdw0CjIht/tmW2cf/GrzT7u/EaFOcFD8tytjy7MJ3gBz2Vh123H4tdht8YzQ98xbmQFbT8hB3QfBOyyYCxH1cyjCNYd+Hhp7DSwi3uiRwu2bDVGdCQRI8IFb865tUXkTyQdnnbbf+2AHY5y+TeEElWu/Rs7alkZNkMSNclVqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773325840; c=relaxed/simple;
	bh=BO2utXCtSlIOe53OM8SMxNkndfMd5EGrJEN45Pc9kjQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Fh++xoNJKvJ67ET2MoF86ErWxj76ni4/aqBoMoC/8UHQuzSipa+b1n002fqhOabcNswpUl1Ym/5EqtjPI8KU3nAR3fQSfAdLQX7j/m+3cdW38l3sDr8LNFfSPk4LgF8lZFphfU9lyYbeEt2bqywSXtZh9X0OGYH2DusWQA+Vgfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L8Jh0/ad; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L8Jh0/ad"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-829759ca646so636659b3a.2
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773325839; x=1773930639; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XuFudhwWDzcDy/M8oM7aUzNT3S3BqbI84NXHU9JAhaM=;
        b=L8Jh0/ad+NgpFjA3xdZlldT7VgABVAyIFrJFkDmgqFAvU40/67pMeCkS54D+9gBnca
         hjNdY9cZ42wEGjHwSHOUqf9b7cr8vG0msxo6PXWCdyvGyGk+hgy/n38agdCDRXpoK13s
         d7iFQy4r0Y4AxM48WkeDncAy6gGPrq4/flQmsi1+yAuLzTyUt76CodUky4LsDl/KdTO8
         u8vKMkR9xksMnDCJLUuSfXDCqtzW7czJr7l6QgjLqSMLjZZJYXN9uYXd/H/siGCrVwZS
         aAJcdVrqFkBBUb6eIi4nZ/RD7UOn5qSibMpMFcXSRzeNrRHJBgY0nj2lt2ZLQIvnwD2S
         NvYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773325839; x=1773930639;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XuFudhwWDzcDy/M8oM7aUzNT3S3BqbI84NXHU9JAhaM=;
        b=wBR3IeBXujgPJS+ORSq1bnDJBDpNKU5ebbrmAX2TYDfcwsW5Jv9EWzx1zYMZS/xqHL
         nMMGGI+ZI6WCrsL6+1uLCmN21CUB8/i3pDBZrwzz5eMEzkWdYJ8XUN775ScM0IWGXGgx
         Xxkv+gQ1uwjkKcvz3H1OLjDtuBtj+l/gdT/vjGWbHqjWPyjsbEEwueNo83+x+6ENRwy+
         AUMaV9DC6fAFJgyehu2FGZDRqUH+j1HlcDfY93j1R2QzKHw3F+RvGh0Vt3c8O2PY22Bk
         w31rZ11zqe71t9Vzf65C6/jUqjSeO/jxrMIXlJhRaDrknnRCWwQGh61Vy5Zm0eAWX/BN
         BFqQ==
X-Gm-Message-State: AOJu0YwFRie7hapyMvXYo1MMQpfHNUjBJhUBfwP3GQmwpvzORKpE+7QW
	sRHwGdURbam7CtLlOaiBEmXVsTVMEnv+dKf6AFGbhvHF5962oOpmUTDysxqJZo3s
X-Gm-Gg: ATEYQzypmZq/+ikEDmtgo70673G5Q75EG0ZKavU+yP/kedzmkQr0HFhLZKFYGdQR6nF
	ggEjze7Wdd/YFtzqYLo/DhXLm6Rw7smQhA5nn0TzLn55plsZljR7oWlm1+hL/uTnw3ozpzK7eii
	+lRVrygT3u5xH7SV6WjlkAgg5jGKvHIXSJwHL+6EX6FiF/lS3LjWcymUoX3Qbzw1mOKGPYtF2h9
	PglUWQhMajNaEZqO0BDX8XgO/ksF8igGd6QVF7+9UZpW74HuZAOrCCj4EQzm7YsljZzKxURWOqn
	aQiyyyeXM4V216mc4uf9+qTqdU9G14s3FQLONU1bZAWx7i7ePDJiQRcW9m7PBvENk80zJkJBnZG
	WJakRg/SRGp/cSZaGQciCXnbQx7POMiMxvsvrUj1mtNQmNiwsfGBpXTjg+FwgfOIHnZJSQddIeN
	bD6eJzpjrw62ydhzGf1GSuaZZkgNudU/SDJx6M
X-Received: by 2002:a05:6a00:3d0d:b0:829:809e:8972 with SMTP id d2e1a72fcca58-829f707380bmr5994821b3a.3.1773325838661;
        Thu, 12 Mar 2026 07:30:38 -0700 (PDT)
Received: from junjungu-PC.localdomain ([2408:820c:9009:3f2:9df0:a51e:2213:88ba])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a0736590fsm3343171b3a.43.2026.03.12.07.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 07:30:38 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Thu, 12 Mar 2026 22:30:31 +0800
Subject: [PATCH] regulator: pf1550: Remove redundant regmap assignment
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-1550-v1-1-5a84b886ccfe@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAbOsmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0MjXUNTUwNdYyNzA0PzZLM0U7NkJaDSgqLUtMwKsDHRsbW1AByJK55
 WAAAA
X-Change-ID: 20260312-1550-327017c6f56c
To: Samuel Kayode <samkay014@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Lee Jones <lee@kernel.org>
Cc: imx@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773325834; l=1009;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=BO2utXCtSlIOe53OM8SMxNkndfMd5EGrJEN45Pc9kjQ=;
 b=eE42nvG9GajWG3cAblf35mtuUo5gSHkG8+UbWhtDBZ1T1ZIaereT+pMbhL6jyDDj8ObTJY//+
 5i95ydHeuAVAbWdwIS6E/YIv/y3uB4ki1NBfq/Eu+gbDgvPWEPUJjeF
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

The config.regmap is already correctly initialized using dev_get_regmap()
on the parent device. Remove the redundant second assignment that was
overwriting it with pf1550->regmap.

Fixes: 7320d41c29bb ("regulator: pf1550: Add support for regulator")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/regulator/pf1550-regulator.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/regulator/pf1550-regulator.c b/drivers/regulator/pf1550-regulator.c
index 037b8ec94066..1d1726528460 100644
--- a/drivers/regulator/pf1550-regulator.c
+++ b/drivers/regulator/pf1550-regulator.c
@@ -360,7 +360,6 @@ static int pf1550_regulator_probe(struct platform_device *pdev)
 				     "failed to get parent regmap\n");
 
 	config.dev = pf1550->dev;
-	config.regmap = pf1550->regmap;
 	info->dev = &pdev->dev;
 	info->pf1550 = pf1550;
 

---
base-commit: f90aadf1c67c8b4969d1e5e6d4fd7227adb6e4d7
change-id: 20260312-1550-327017c6f56c

Best regards,
-- 
Felix Gu <ustc.gu@gmail.com>

