Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0EFB331EB5
	for <imx@lists.linux.dev>; Mon, 21 Sep 2026 03:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789961865; cv=none; b=GVPAO6pdo2u2SrJLoELdmG/wdtG54BkHh00+cXSWto+DNnVPYYayTBxtW1B04dAjcALzZKa5rDmGlSCxWBHBnhSKHkKIR1osLV8NWaYmCoOGcSbuulnCIOJm6f8wEXwyGMc73vLtvKNg4zW9am/RNd9opFJbLm6x1zdZt4aAMt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789961865; c=relaxed/simple;
	bh=k13YmX7qihqE61VqxeV0hzmnuwQKmXHbWHJrlo38j/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1BgMerHG1OPwtPXbRkIttjl6gv7cUVsrii7Xa9G0FsJYCpYblybPD3CGz0DjJwO3Rk2f9v+aYG+lwz2GqJs8PuYQsRCToo+LyzJp0//w2bpB9UWw/tcN4HrWvZ87hwinUniqxkiSRSkuloy8SXIQXRwtUHUoVNIhRz6QxVimMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G4k36522; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G4k36522"
Received: by mail-pj2-f42.google.com with SMTP id d9443c01a7336-2df4c9d14b8so752545ad.0
        for <imx@lists.linux.dev>; Sun, 20 Sep 2026 20:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789961863; x=1790566663; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2A7bjFDm34OFInSMA2wk1n5UqXeKw0k+y9VVpS6ySqY=;
        b=G4k36522bSzL6YnodYi0ZsowqH/JmNKZtftzSR26GVeYpMp0bXO4qgH9n0CneO/BEn
         i8EyZ8VLqWTU+yVLkWoLN7QLx5p0vN00w6RjR1D3/w6T2Jw4HlD6hy9EgAcJ0LPHlW24
         +rhR8GIsCaQa+ybtPYI9B8uhVnpN13FfVSZ3DsWYmrSy4Bd682gvGKdA58Km2c3Tdtt+
         hKW686uX4+tf4J987m+iRcp2uKIy+ee6I56wm5HlwIC8iYmgwGn7I58YmySMRUEswgSj
         xr1yLJDj0zvRwRhQGm6iYK4CZmNWg2mS73mwkXdnTcheqEYrAPiVc3bcNahyIo9iCDPe
         W5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789961863; x=1790566663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2A7bjFDm34OFInSMA2wk1n5UqXeKw0k+y9VVpS6ySqY=;
        b=kA1+JKJLOWaxfSRr96NXmLst9x1SxLGG+nZXNEMuX9Me0f1IyTjO27eBn9Bv5rxi4V
         sgF2xzDYhQblF12XH5njXEzb4zj0phWB6PpP0Fg58/jfvgc7++PwIzzematM4iSv/5wU
         1XTVr35FSnzf3PpUWsRHN6QQntJ4CsrmQd1LpcsHbpEMvjaBbmi2jCJufeY5aTQR4Uip
         O7bwpZJHprdzUq1cMLB4frWibAG63sJwImqt6fkeXGWOiHbqrgCrDYws4MXjc7R0mkl3
         1S4IJ6K9ZXQwH9w2YNa8lSicirWlW8grtt/2IEJJ3Q04SIYaljAYeTUo3f++0PV/dqAV
         VoEg==
X-Forwarded-Encrypted: i=1; AKwUvBxtkDEOWVg57rpK3opQfJMni2XOnvLcNJFcXOz+TqJP7N4CtpshLtai2ysiH/7xbTfZyhE=@lists.linux.dev
X-Gm-Message-State: AFuF++k18H4YO5I+UNXoIbXANMGJRCnrmHoFZlD8fRCnBsrQqIa0njq7
	ZSU6ye0bxMmWz+hVyiYunpctNjuw7uD0zZ2FcRTnpFwTcxye9jdOL5d4
X-Gm-Gg: AYBFou3+ic/PnQxIb8XVZ7vYO714UMhc9/u59OxBGXOb2nAVTZ1MjdFyd+lyN+urq19
	+MyifZUT/Ao4CpiJo0dV96FbXpwoheqHQhN3JVIstE9ssjSgjPKYenyWTpcqfwZF6RWLsFAeNRk
	EePzTKZRxfNv+Nbey37icQS/a7ni9xfYClf5XwHAoVLROKQsZ0GtFu65HUbfuwDUJAobuzdvvm1
	Xy0EMO3W0O+Bxp4mwCVD5lDTeLszKlcOk+Mq+Zygd+F2jITNKZh6YJ4akZvJoReqU9MwHZBI4kY
	d1bJP4RRZ/Z7o7hlMCOLzhnPcpTIa/FWTzPwzltmV7749XdnrSIhw53RwDsVcLvp4YNwm0OTxu3
	euV5HIYS4CO6c+1t+MNVma1lPiHZfgF9VTtgHUibLR5n9q4cYfiQDTT4n0ls0jZSppF87gS2/zu
	iJ1Gk2vWTF/zcJgxpMn8XZp3NVV9X7Pfj8NixVN31gSuOUkczDyysHDTmrvGbBsIlT7JISHROB5
	o7gGx+udMkM/U1iGz+cx5OF7pgY9FPo+gwRjsG/LvHIUyNApj6grAuxYwdmX+Z+mg25tE8vLoy5
	XGB/wmoqvmBxak0=
X-Received: by 2002:a17:903:38c7:b0:2dd:c100:2517 with SMTP id d9443c01a7336-2ddc10025aemr64473935ad.32.1789961863038;
        Sun, 20 Sep 2026 20:37:43 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm25966515ad.83.2026.09.20.20.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 20:37:42 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	rafael.j.wysocki@intel.com,
	Jacky Bai <ping.bai@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Ming Qian <ming.qian@oss.nxp.com>,
	u.kleine-koenig@baylibre.com,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 3/3] pmdomain: imx93-blk-ctrl: Use pm_runtime_resume_and_get()
Date: Mon, 21 Sep 2026 10:37:08 +0700
Message-ID: <20260921033708.14433-4-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260921033708.14433-1-phucduc.bui@gmail.com>
References: <20260921033708.14433-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Replace the open-coded pm_runtime_get_sync() + pm_runtime_put_noidle()
error handling pattern with pm_runtime_resume_and_get(), which already
does this internally.

No functional change.

Found by manual code inspection.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/pmdomain/imx/imx93-blk-ctrl.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
index 243ce939ba68..6d4c55a85c64 100644
--- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
@@ -152,9 +152,8 @@ static int imx93_blk_ctrl_power_on(struct generic_pm_domain *genpd)
 		return ret;
 	}
 
-	ret = pm_runtime_get_sync(bc->dev);
+	ret = pm_runtime_resume_and_get(bc->dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(bc->dev);
 		dev_err(bc->dev, "failed to power up domain\n");
 		goto disable_clk;
 	}
-- 
2.43.0

