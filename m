Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDFB64746C4
	for <imx@lists.linux.dev>; Fri, 14 Aug 2026 13:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714842; cv=none; b=mge5UiW802wAgJw6g8IL4hVcHaZ6fA7qgoEZVtkDZ7xiC6AD7fOWBShIK5p2tgfnkP9Po25Kf6zNWui8D5GMLum/lv+xZJIXqg3q+a7AWF2Qj13QVyEf7oHch9SMkyQYT1tmBqSiGigzGMFgInqhTCcszJ/ePCGnaWj/oZWQ2JY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714842; c=relaxed/simple;
	bh=ZFcWIVAF5GwsG/s4LdZRYp+ubN6mNHhGokZn49msOb0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UV/Tfw29U1dF8aA3YydPAOrrY3d+eQ8x9gp+k/+1KMD15OKxKY9MMUSz3Tf67xtJcmYbfpobUxvIIkpRzGr9CxQlh3JnjEChjDiTRhs+hgEqnz87LUSjVONOMiE/5oD7YOS4aeEpJbub9uFtVyiXM1VKdLV/Kimd6p7IJS1S1j8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qJX2E30P; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qJX2E30P"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf27856f9cso9943275ad.2
        for <imx@lists.linux.dev>; Fri, 14 Aug 2026 06:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786714840; x=1787319640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OUSt8iKsvLES1DoWZPe2NRZJAWICuOCKAgFaBxq4B1Q=;
        b=qJX2E30P8rCHJJs6AtBQuuYw7NG+UBwUMRWULYjfhxNSK1Ha0tyDUB02zn0WatqPqM
         T/YO0JXVd1dMH4p0PauOxgPCpTv8SmTd1r4/ZNQ7CD1gcS5Y6lTn+V3RJOZAwmXHsTjG
         shMHVUTaz6pYRJn9A9/RccXK3Nlzp75HwJSuYMAvBlzLc/GRIuppz/qdoP9ofVzpAyWC
         uIimEkbQuu5GBpJ586OBWvik2+VPULMIGT6CTIGtyq+xG9Vbu++XKC614w+Z2TbseeqX
         N2OYA4ALQEVFhtlWt3KWSKhXPoX7i/q+7wWkS9L1fTFP/MplEwbuc8rzIiZGgwRZ2M64
         zBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714840; x=1787319640;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OUSt8iKsvLES1DoWZPe2NRZJAWICuOCKAgFaBxq4B1Q=;
        b=JjfTdZYoqZGRNrDNVw1AiqU2ANQDc+7oGL4q7aB4qV41RaW0R6/5FTpxI3ZvneQuC7
         5Qxm4IWBhYL2jDWmlvn9S+DfftoAPLmVeY1pk22XhQ/9JFYXpvXoxl6FIfrV40Wluuof
         0gqz6aO8APxOrTNiHUsZwhQQwKjXY53Bn2+2dG1S+l3Pkmx/Bnafj6e+NBi/20Yce9ok
         n6smtGIqZA2gXik8PRUWUgZnKQYHQlff6gB/SSZ6Sx5rbWbegvTUseCQVfXDKcl+1cdM
         YwzoeZC6wsBRXLbGZK5tIfPXjy9EOaZQqXtWrbWLVPxRvlXNd/QhS5p6hBVAbmHpwlgM
         ZjvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq1IAg+APJHkwXpLnonpY+0sQgD2U/q9jgoSJt2KeA19+nwYf33puKa71C0GGEgyyLPQkw=@lists.linux.dev
X-Gm-Message-State: AOJu0YynEpc8p2XwVfTTG8MVmZTtn30tFIe6GsWjx/lNb0t59oB+cAZu
	Arlovj1IMazPh8kbgm0Cd2ndkTqes0lFMTFuNzLP3hi8S5TlDhoSKbBG
X-Gm-Gg: AR+sD13IjslgXNP89J2fBrIttsTwPx3soDSUpUPvKws9u9+T4GrY6EhpF2QSi8F1VXd
	J2zZjh1mq1JVIrj65AKO/acyEc1b68mc4GZQAdWIY9qQ53RZ75sUZVKi1twRiWd6ifF9oadRxLi
	Q8S2MOGk33o7MHlpK5giAad96noQ5k0ROUC71c9fdzHjzWkW1Ak9Ug6qJRTqCJ8uPiVyevgDTjh
	T3i2FXKDGBZqtZgIv4ltnjG9X/U2YvpaDpGt6a2MTZrFktNstxvr1BbPrQCktO/SOwp/QFR0UAa
	LyCyj9APe1/AGXw1CKJu8pAegkds0Q7UKS03TYO5pIbjLhxasoea/82R/l0SYw/oKASbmodm5Vz
	ceks6QeaS1fac6j0H1/AKgD32+2pTdPFt1jsCz+7dj33OMK+E4VZZ3aaF6zD/ga1Xn23wD4HCKJ
	GQIAxJ2wJfME8Qzv+LBYMRTFQxPmIy8ENMdR3tXxiT6V1OlHz560TOiOoGyDHPpfHibgEZgpO7O
	EHHghtr
X-Received: by 2002:a17:902:da92:b0:2cf:9f0b:b562 with SMTP id d9443c01a7336-2d3b0cf922amr67711065ad.22.1786714839447;
        Fri, 14 Aug 2026 06:40:39 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:e9af:7c0e:be31:2c3f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb2a085sm9837125ad.42.2026.08.14.06.40.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:40:39 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>,
	Wolfram Sang <wsa@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ruoyu Wang <ruoyuw560@gmail.com>
Subject: [PATCH] i2c: mxs: fix DMA channel leak on probe error
Date: Fri, 14 Aug 2026 21:40:33 +0800
Message-ID: <20260814134033.1386874-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

dma_request_chan() grants the driver exclusive use of the channel until
dma_release_channel() is called. If controller reset or I2C adapter
registration fails after the request, mxs_i2c_probe() returns without
releasing it. The failed probe does not invoke mxs_i2c_remove(), so the
channel remains allocated and can prevent a later probe from acquiring
it.

Release the DMA channel on both post-request error paths. Keep the
adapter-registration unwind ordered after the existing controller reset.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 62885f59a261 ("MXS: Implement DMA support into mxs-i2c")
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
---
 drivers/i2c/busses/i2c-mxs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 4e07babea9c3f..a5c8b44ec8142 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -849,8 +849,10 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 
 	/* Do reset to enforce correct startup after pinmuxing */
 	err = mxs_i2c_reset(i2c);
-	if (err)
+	if (err) {
+		dma_release_channel(i2c->dmach);
 		return err;
+	}
 
 	adap = &i2c->adapter;
 	strscpy(adap->name, "MXS I2C adapter", sizeof(adap->name));
@@ -865,6 +867,7 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	if (err) {
 		writel(MXS_I2C_CTRL0_SFTRST,
 				i2c->regs + MXS_I2C_CTRL0_SET);
+		dma_release_channel(i2c->dmach);
 		return err;
 	}
 
-- 
2.51.0

