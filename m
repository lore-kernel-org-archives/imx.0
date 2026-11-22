Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795341576;
	b=BQXSRsVIKOeuJsmYFVSwC4IYaQnM7kz0QxPcZS2P7bFg0j6H8nViEHLy3lxovn4Hsyeo
	 2sGGWeeaJYfLefOMqOwbNJFgeagaYSRgC/n5K2HVpWtBYQRVhlhAZCVGt3DLE2S68hp/y
	 y1xZP0gr0UAnp1GmV5zbtktCoXZVTyMo+Nswj1NsX9H4YF5JR1UCZTV1to3Sgsql4goxe
	 hVGcQ2jjW0NAjlbzMp5jQ5oigPqGlDTgItW5CZNqwxVGZFzc89Uiow1BO5ki/QBlKIViw
	 xTtgPdb478wn8Xog/uvklaZvFaHoAd4VSO/7Z6vnPCtcv+mDUlYMvlTlqJ2YXRmWQQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795341576;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=EAJZGrU+K9EIx1PBrfq2qgcoNQAfdXDu88XhOMIZ5xQ=;
	b=S0N9Dg1Dp8RyHQSxTqBR21lgVyo/X486qDTOGbbT2+jupNxJthleC5WORWa4YsdSqYUF
	 I90fhRUdiXv9QwjjDQLCK2KHsaNYslV+R8GtySVsoHgYRMm+ovSBc7Ouq7ZKVes1DHulm
	 L8pqTQaRIBYnoZBR+qJn/TyPbgCRSFmZa5DicEPipvyzQTkOG7eXf6EupEOYFQt8tlzdc
	 6i5bRmZgYIVlukTME/RyNj+BxE1TaLipImR1aGQjUTnpEjfT3OjuiRG1RSmfLKxBbYu9p
	 7nqlAAgHVAC4+l9i6mOLXjOQep5/Lyl6Zmbe+HHE1ZXWxxRznLxZxPUTZrfvqBZQ53Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amarulasolutions.com;
	spf=pass smtp.mailfrom=amarulasolutions.com;
	dkim=pass header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MTsO3kNY;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDDC7606A32A
	for <imx@lists.linux.dev>; Sun, 22 Nov 2026 09:59:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDDC7606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google header.b=MTsO3kNY
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so16774875e9.2
        for <imx@lists.linux.dev>; Sun, 22 Nov 2026 01:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1795341574; x=1795946374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EAJZGrU+K9EIx1PBrfq2qgcoNQAfdXDu88XhOMIZ5xQ=;
        b=MTsO3kNYuDaZLN5lM4FqLrrKtSA/EkdZ6aCGTMZ21FhFx5dUgM8B//uENfBcKDaE5s
         8kgqGypKX1LodIVmkVtesOxwn47vU2m9IBG0MB8I7Hhjq8s3hcRxMEQX0ajrmrFatqmd
         tQk3XrLKgsjLy73JVMnIOlMXK4y6n3b+S+2GI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795341574; x=1795946374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EAJZGrU+K9EIx1PBrfq2qgcoNQAfdXDu88XhOMIZ5xQ=;
        b=hImL4ilqEGGbW7eAjkuXjxyVqYXFvKzSMSEW6VQ474JBYnlISn/47J6aebchFzepF/
         VhHHEUbmQnKCxzPsfBomkzlfpAzU2zhL98KaVA1zUdimfgNEk+RvC8wGcpkxliFRIztD
         TLqGgRZW1nJh+oOiY+eO55cdxYMDYIJV+KJWsrXoYuMZD64gEdbaimZ/RSyRFxOtQvFe
         1KujNj8BlEptCwINiMG/r7bNTeXOIiJJ1b/lt+grmLIOmVGjdQ7qosiJ3n19SojP/upa
         EcKb7T3IyNpEFUYsC5cTe2P/MbMsIQDtVqYqFAEafgEqblm7glFJm65BnaQj6QHyimTs
         7Nug==
X-Forwarded-Encrypted: i=1; AL+hErFeuEb3r8R/mVCXNmY2iSrXyCzSEkcMbDKphwyEzY0LT5V0w7J4bYH1aUS8MIs/2FSQUXk=@lists.linux.dev
X-Gm-Message-State: APuU4Z+Npf47l97fD7VyLNi3/0OrWv0ubYnzWR1HYNDxT82DNSBIEPk1
	sSbUYun9mJVonwTLgnxid7mKl0w6pVRo7943uc3oUyvJmflsHHy8RWsHaS6wypLCM8U=
X-Gm-Gg: AZFdTZdTphcD1uHPjdorcu29svJxs/GYSQ7WplwPlfYAwBtF+33D/Do2BYe95ioeigA
	xcIWWxEEhN0Bi6TVov9xDnSkqI2+8++lTh5qKcaTyRLrB6AY8HvF4MsFcpZfyb44ZO+liPttyn6
	tPrOZ9ckX/OMWBtZIg/OXXZrHkjJttYi5Nl9DS017Lt4Vo4no5xwY/jNuzNEPV53SsF3QKQRvPf
	PgAmrMqJiNr8AytCC9G1GrcNE54OCAhMx3hzmqs01X80izThU72p4MXdAw1JIW+9UAm4K/ojRYg
	cvE80GKwI3yrTx2XlbgcVF5OlC1/q6hsPj0bEwf7gOIMsfLgFMyR7G24ulrF7VWw+6AcbrmQNrl
	Pir7RkHYnmxnNwjysarTK4giLQgwnlmZl4hyCDU7TeNG5aSVYU2szphaSn+5DFEkhV/uG8LSCGi
	uokPFgbO9MOZdtiCJYN3HrpC4fR6PRkFUx2zaRWy5Zi+1/HnKznE4usAVIZvTJZjNvSoVjev3Xi
	EruZGNHgAXFOVRn18yi4IvYnI2oZOUqY44Vo3nhT5FaJ2QsqrY8nWJJjq7r93XDBXdpurYQrpX6
	78hxhnNTSbKrBxTMRo41Byb3ijw8YnL65va8mdAJEXYeT1ywZS5hNDxN8BZrDxIOvGqKFLt3CaX
	4NJW/u9wMomGM4H8a/r3mA6SqPZSDUWviFZ5tEP+jlWxSzTNjuLBdjZahwXAyw9Lh0M9xajiYGk
	6PT/BsY3sYZ+ro4XHowUOtNdLqCthINZUpNLlr+UaNvJ31lVw=
X-Received: by 2002:a05:600c:3b1a:b0:4a7:8fe8:130c with SMTP id 5b1f17b1804b1-4bb8881d4damr181304545e9.28.1795341574239;
        Sun, 22 Nov 2026 01:59:34 -0800 (PST)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-14-29-58.business.telecomitalia.it. [79.14.29.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm342455265e9.13.2026.11.22.01.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 01:59:33 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kees Cook <kees+treewide@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Ming Qian <ming.qian@oss.nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Xu Yang <xu.yang_2@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 1/4] pmdomain: imx8m-blk-ctrl: Remove the power notifier on probe failure
Date: Sun, 22 Nov 2026 10:59:16 +0100
Message-ID: <20261122095927.2631909-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
References: <20261122095927.2631909-1-dario.binacchi@amarulasolutions.com>
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
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

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

