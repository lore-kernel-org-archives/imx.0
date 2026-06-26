Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924C13F1AD7
	for <imx@lists.linux.dev>; Fri, 26 Jun 2026 14:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782484663; cv=none; b=uLhfUm/9enae5fMCCjAC8x4ShekZ4IoU8vmxZq0lb0YTCm7xGIeZ2qUEPcxC5BT6/nAWSvxoOHXBUG77O4V71k3xjwMQheYU5iMy5iAGaejNAwWJrXTmIs7+3J62zSP73Zbiw/CAqLReX3E0A9Xs+e5I8i81oyeImi2jWsA/2HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782484663; c=relaxed/simple;
	bh=hdcucjKaXo99zIVLHqBl+pduwyuwZ1Ak8BLvT8zqF9k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YbidwquSDcNYgoKDTy52CY3oj0cuYBveLiUxL6OxoUI2gGY/w4I9ZYSlcWlGHmvNzebXQdFyJzKs1fSw51EY2GmzMgM9D+0mmiBFH/kq5j0m/9UkS3CGM1j3RLRfXuYi5/h49CrzBTZe+xUc5fcQWG+5kKrf8xjNzpic36YBmUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dj56ccUa; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dj56ccUa"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c8017e981fso4774835ad.0
        for <imx@lists.linux.dev>; Fri, 26 Jun 2026 07:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782484662; x=1783089462; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f2zIaBu5egU2fz0I8v1SkUtexRvT+jWXEOgQa3ZIiEg=;
        b=Dj56ccUa5pRGG6079SmsZ5JukoNMgaQKETGu6626h+AkE2YRnFz30qbsG2tCUsde78
         No7MngiczTqeMk9YDCrrInzJE0OItN8pUYGLpHTq7Xr5PEvOj2sN5hl2E77m3EUKv7DX
         D7y6qF5aT/cDtC6CS6FEMSAuWo6yZsT5Z7s2vsOKOyroE206UeCis/Jhen8ZsesfuQAy
         qPn88gz+qf/eCo3K8uBb9K9H+VtxYJ1yD6V1SCN27bo1SrnG2diiNVM8dB1oTskrdV3L
         AY9GVSs+xe0xwEE+l2zfdECkRUvXkq20FXq3mu2Lzv5rPbvfUy6XtqSMUBKEawxrnC+h
         kbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782484662; x=1783089462;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f2zIaBu5egU2fz0I8v1SkUtexRvT+jWXEOgQa3ZIiEg=;
        b=RBHenyopSdVTIEjlYrgTyh8MjTPS0orcs9IjfUEo3/G6w6vQRv51n4YFPixezEOHVi
         yXOblzblxCgmE2DmL+RexqeXC/VnYewQ3ETcWO5pLuUiwrlGRM8QPjjc57Fhrdb/NcGh
         HW4Tvx/LfCyRyHfrisGJ8YRJdnYsH5fx7M/hkXah8nCQdKODmY5R6wyydYGh9a8snXeQ
         pKOt7PO3w3zabPHKPR7JGiHNzL95q8eJgOhJS88gt+ckGZgdKLJXrj7BR5SWJgHoxsJe
         4msD+5nJzvBSsH3G33BEU/jdn7RCqSD8PC3aJ+/VtPlZNl43lKayU7Fq2OgRKIxaTvXV
         8yxw==
X-Gm-Message-State: AOJu0Yxvgx3u0DLhLoUTsNn2LQI7vp//T0rJBzB4Qb26MZBWNeUM+lw1
	ps1nqPzkoeam2OEgJBZR41dj1Bj/EW+hmobT+MPqXC5LtGb5/sWxtqDa
X-Gm-Gg: AfdE7ck72zvtYrra+Ytw3XEvgN/1zhAzd/djP4Q1T/X8/LK52/wvJaJ9og3CNyCwBtO
	pA4WYXIDzKFQatSMowb0bt7latdGErFf6iP2Am9YO9twlCjomevLQPZgzbYqGQh6IidjaqUu6/i
	euABwd5755tKVXUQONHELbqNSWqpu30y+cDNqN5lNC+8+rNpuOqpoxtgJaQpO9VbFFPh8W9FpA/
	1+7s1u4vV6u2Stt5rkR/qH/03FtbCGaEd+zS58uHbR14mv84WuMOWhKMHWQEE8OCVS6XYB6yuCm
	gEztOnbYcr3DmeW2nEnWFPOBlS1Dk8AWhpdPN6iPuNRSL53PaIOrEDnQ7pd23m3oGdhpRK6qh90
	AzD4oQWLexgBpnsR+kStaqicH/mX76g1S3N54gunSxOn28TXYtMtAcRSECwNRAmkdUgd2Vx31wz
	M1DcZQI0P6m9BtKrFJTgouC171tF68fjTf2c+9xkM93+ub5qiRTi311pJr6J/S/j56bDA4MjUTy
	Ai08B8=
X-Received: by 2002:a17:903:285:b0:2c9:97a7:f541 with SMTP id d9443c01a7336-2c997a7f613mr2239595ad.39.1782484661576;
        Fri, 26 Jun 2026 07:37:41 -0700 (PDT)
Received: from junjungu-PC.localdomain ([223.166.246.74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7f5ac8e3csm40667925ad.10.2026.06.26.07.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 07:37:41 -0700 (PDT)
From: Felix Gu <ustc.gu@gmail.com>
Date: Fri, 26 Jun 2026 22:37:35 +0800
Subject: [PATCH] soc: imx8m: fix clock reference leak in
 imx8m_soc_prepare()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260626-soc-imx8m-v1-1-62657e3376dc@gmail.com>
X-B4-Tracking: v=1; b=H4sIAK6OPmoC/yXM3wpAMBSA8VfRubaaWWu8ilwwB0f50w5aybsbL
 n/19V3A6AkZyuQCjycxrUtElibgxmYZUFAXDUoqI40yglcnaA52FkVu0RaZ1FJriP3msafwvar
 6Nx/thG5/B3DfD4YteVJtAAAA
X-Change-ID: 20260626-soc-imx8m-938e89104044
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>, 
 Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Felix Gu <ustc.gu@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782484658; l=1048;
 i=ustc.gu@gmail.com; h=from:subject:message-id;
 bh=hdcucjKaXo99zIVLHqBl+pduwyuwZ1Ak8BLvT8zqF9k=;
 b=/JiTuhoNoGmbRMn7H8kiMgtE+3nCGhdX9twaHyi5h+Z4MushNSaK6p8SzSXEY0Are5Ox6mJEb
 yEATvpMTHfiDWPE6jnnXiBWPtLkIHVRX/wN3H9iNLUv5+gAKIy4IEow
X-Developer-Key: i=ustc.gu@gmail.com; a=ed25519;
 pk=fjUXwmjchVN7Ja6KGP55IXOzFeCl9edaHoQIEUA+/hw=

When clk_prepare_enable() fails, the error path does not release the
clock reference obtained by of_clk_get_by_name(). Add clk_put() to
the error path before iounmap().

Fixes: 390c01073f5d ("soc: imx8m: Cleanup with adding imx8m_soc_[un]prepare")
Signed-off-by: Felix Gu <ustc.gu@gmail.com>
---
 drivers/soc/imx/soc-imx8m.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/imx/soc-imx8m.c b/drivers/soc/imx/soc-imx8m.c
index fc080e56f50d..de19972435f9 100644
--- a/drivers/soc/imx/soc-imx8m.c
+++ b/drivers/soc/imx/soc-imx8m.c
@@ -150,10 +150,12 @@ static int imx8m_soc_prepare(struct platform_device *pdev, const char *ocotp_com
 
 	ret = clk_prepare_enable(drvdata->clk);
 	if (ret)
-		goto err_clk;
+		goto put_clk;
 
 	return 0;
 
+put_clk:
+	clk_put(drvdata->clk);
 err_clk:
 	iounmap(drvdata->ocotp_base);
 	return ret;

---
base-commit: 30ffa8de54e5cc80d93fd211ca134d1764a7011f
change-id: 20260626-soc-imx8m-938e89104044

Best regards,
--  
Felix Gu <ustc.gu@gmail.com>

