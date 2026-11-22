Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795380705;
	b=AYjNAgYl9CaR1k7Kpf35LAe8X+qGzrjVAMy6N9OLaVVPZsQFFnsSEn003tHPymPRZOAc
	 MW+W6Ldx0/0TUZO0oubZvxLIHRs2mdI+O8To7WBWsRh5RWFTHrxFjqNK3ReDEqdh33eo5
	 OWGiKKM6AbdjBA6jUn/l05SVsp7MxbKdnb8sKqY0uZOFZBM+biHxaPr2QYPAf2uSzNd8n
	 JcP5vFCHfvPIkSzEMTRV1SCqOXJcCuva86spioDDiADqM8uzACfgXxcLdD5H/wRHEDEEA
	 XcSsdMempLkdEiQ0WTrsqe/UGtHFxopEJT+8PpG0cnIritSCyqNdckWUEHbPKCq2R+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795380705;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=H1tDo9wE8GIjmvDNP7MPhEM33+qsU/I9oOSPNzyzY9E=;
	b=UN3jn6nBGb0Rqjp+MRlyr6ZdDIX8Qa5u66lYq9u+o29UYdp1x05fB/E9sWwbfIYlEMKR
	 /eEDCuiH+d5j5scjgvwCKGf9WtLj7gjZfzvOCwNpyPcQpPLTnv+klUxtGuVAsW7c75PB7
	 Cl9+OnLXSIR16c0zIPTM5a9xNHqynGEIAype8DJKOTTylMvT+OSUMRUXmqutu28kc86YR
	 66FCKGRyNTi/2+8Tlz128vN/MH1+FsUsAAHTxKZX0AF2WScS6+TBsUdhrC67SVf/QDM26
	 LdmzdM/OnyVk4OewSBDfmP2rGNskgyVNmGH1swwqvtscjzL9aDBTMH/DVlju6GuRZQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GIx5GwHF;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C56606A691
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 20:51:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76C56606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=GIx5GwHF
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so16168185e9.0
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 12:51:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795380703; x=1795985503; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1tDo9wE8GIjmvDNP7MPhEM33+qsU/I9oOSPNzyzY9E=;
        b=GIx5GwHFtDXWjcsKcyLAyLdqmbVHy695Czui8r5Yjqy81klXH6f+dJVFkLrC5+KJe2
         qVUjZzpwWYr3tPy9kQ5a9M+sxk4+y1gFceWXK8yM6p5hgkDgXefV0gJ+rvUNq1gX/SdW
         AjIFRzCHjfM8arzwPO7gWIxiLBY2Pgg52OnGA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795380703; x=1795985503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H1tDo9wE8GIjmvDNP7MPhEM33+qsU/I9oOSPNzyzY9E=;
        b=WB9D+8PeIiIPMidIl1N01bs/z0U/w6OY7xafBETmjuTQT7YTvTnGpolguoG+0QPwty
         c+N+G/1QHEsKrUY1L8PHDbSsIUICqgyPJubaDMEjTqAW6m3cjj37T2GUWGCmSYr+RAl3
         ZGvD1DJLVkw0UfxnwVyA8UGa0kLmRC5alvgR+b/llYrMERbUvU1hhwwbjIzYnTxR8U0Q
         iBe+4RQif1Ym/Mj1pLyDtznB6Dt1zCpj9Do9cDANeXuDiSjiMx/OwHLQrv3W0TDrYa16
         rRQsp3WuKI32BSDI/K4yRhbELwvmi+6NdQsVtD9eq3NrDxvHZ9ZR/+Q7uORO6DH/lIn5
         1EGA==
X-Forwarded-Encrypted: i=1; AL+hErF9G5k5c0xTJ+XZwIC5ZPjndAziquxqAz/iIxq9zZDG3jWKNk65O6/lmTVmtF4cfTlP0mY=@lists.linux.dev
X-Gm-Message-State: APuU4Z9trTzKh2QDvYU3lHE+siCrMcQa6g8j5JkRW0LgES2d0jPRM2v+
	25EK4oDpVaX55JYPVyStdzISObsKDoHybLLkpu1309FA9NHaaHkKinmiR3Ebe0fTv7M=
X-Gm-Gg: AZFdTZfV5qRmO70N3GQr0PMizTi85/Z3+Pu7Cyiz0PTBc+QZDx1o13a5BtlSffuFTr4
	qWiL8CRr1pcJ93oO357bUVTx7+CbYEyYqfBirYh+j+aoorM/AFYgYg78WgGUBrBMbTK5xU76+RT
	iF2nYzcTqaPvxUlQ7ei+ADkdW1/xS18Bo8CnTBGz5cwVi6clKNQ700GTp0pCWeUh6wSP0z7xpMB
	xtbJ0rbsQxAoiI09T3yj9bxKyWtKEZstQaOHiKgHh1wY6ikfgBiZ1KO83BapWQLPJiVknmCSI52
	6sRVoB3UfoKpD923Dbo9Xdq0EPh/ZZg+cQNwYY1ZQB16TkfjaGRBrwHpEQJP7GSPkIZxk/kE/vN
	wnOipBLyvwqKu3nXwoAngeMd3ULTN82ptHdPOdrN7ujssUQntQhbYZkALufdJHLKuRjkcyTuQ6v
	J0ua3F3Axp8mV2/UwfvmEDb8h13tYO7VxU7cwt5bn+Yze2B2BabKp3Bx9N28zwh2BD58RVBCa3x
	9geipfrkUMYsjeeAkdl2ZDM0a4scg+UcvA1im/WUOI3Z8rUo+cdKu7/pc4c/VkXen9YuJ8Z6DEa
	h0Mpx2yh6T1Kf3xgD/hmzfbIFcNoZhhhpm61sKW5EG9KYr5TyOJIG2ch7Vz5xEBfM+e1COoow0z
	8w4J0wP4ZJFiHFJ0bESsyqzJMkeiJNHHqqkqOuQXUyGYz17TsjZ+pLs4K2MR+KU1g1qLVmLMxuX
	dPxCwPA33SAfhRQAajolkrnnyefg==
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr205083495e9.11.1795380702757;
        Sun, 22 Nov 2026 12:51:42 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm397355305e9.13.2026.11.22.12.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:51:42 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: Lucas Stach <l.stach@pengutronix.de>,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Sashiko <sashiko-bot@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 1/4] pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
Date: Sun, 22 Nov 2026 21:51:10 +0100
Message-ID: <20261122205136.138173-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
References: <20261122205136.138173-1-dario.binacchi@amarulasolutions.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If devm_of_platform_populate() fails, the probe returns leaving the
power notifier registered on the bus power domain, while the memory
holding it is released. Remove it.

Fixes: 9cb6d1b39a8f ("soc: imx: imx8m-blk-ctrl: Scan subnodes and bind drivers to them")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/sashiko-outbox-227073@kernel.org
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v3)

Changes in v3:
- Add Reported-by and Closes tags

Changes in v2:
- New patch

 drivers/pmdomain/imx/imx8m-blk-ctrl.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
index 9df933a7a238..7d6735728d8c 100644
--- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
+++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
@@ -345,10 +345,12 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
 
 	ret = devm_of_platform_populate(dev);
 	if (ret)
-		goto cleanup_provider;
+		goto cleanup_notifier;
 
 	return 0;
 
+cleanup_notifier:
+	dev_pm_genpd_remove_notifier(bc->bus_power_dev);
 cleanup_provider:
 	of_genpd_del_provider(dev->of_node);
 cleanup_pds:
-- 
2.43.0

