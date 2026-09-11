Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B9FD37189C
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 04:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789099396; cv=none; b=LGCyXi6XEYrQ/q/b2EXTJ2OWhrCjHyeEO/ztPiWpLdNav4xrlNqCaBLgOCUxYLyaMleCwGhcqobuEMRrUH76jsD+Dn8rSLmcMm1BqnpcCnjlzeT3QZzdUCCXXlhfD6mDvToVUbIrY2VS9/09EXW8Q9qOUC1FiG/4ip5kP0b2gnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789099396; c=relaxed/simple;
	bh=OIgLDadHm6v3Hhfp+LeVPKY+DdMyNj+RWmDObrAfsfo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ids23Vx67+8n8opo12W3Pgiu0ZWA/xtBl10Bw2d/aXj8Am8j23LN+/Q+GXBGEijClhdlMCeWL/bwvEP3wkvwg48OW7K4PWf1YBA2IKFXVY0l0tEEW4mOBu175yL3FF0xWFXsIUUTzewxqRTf95UCRSWq3jh+JMjd1VcmPQUqPoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qgCCq33H; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qgCCq33H"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2db1ca06b03so1534335ad.0
        for <imx@lists.linux.dev>; Thu, 10 Sep 2026 21:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789099395; x=1789704195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NMNMLyka/PxRqW+FEjSX/JhUiPb37rME7mEkb0i98KI=;
        b=qgCCq33HYuS+vYvWdBZYT/ThgAcbAq/StChy/AMFQGianKcz+wm6FSYTUhKP1+GsWG
         QVn4edM4NZHEaQGU2/NtJV6yppJwEwYQETDqFafGFb+ouspa4bUGBtAEscEYEtBdffci
         6pBJyw/e56ABruVBGG7IDiMJMQEeXo9d7qxBtL3SFU2hpZByhnm2PWBMFuT4UYRKVtBG
         mmc9rIU7zfFrYGvmZqsr6ebyrN6LChxrM/dszagjYplo7+NUaS4wTDKOOGTjHur9/9Nl
         aoxIEmvOPKnZSkXUXACeSC+7ee17Lpv3GNIFoX210dm51wayILlQ+8ywsEHZSDzqos/f
         j+1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789099395; x=1789704195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NMNMLyka/PxRqW+FEjSX/JhUiPb37rME7mEkb0i98KI=;
        b=YZFCK4i2LRJDfMtPueq1UvjDXKweWk98K/E1oQc3yy96qWuGFxTrdEV58JklYUIwk7
         Kht6iK5Iml18FBVfMnYyQZsY6KfdRGqnMXShtCsJOWnDTcJjBw4B5pF3SOsinwi/Wtqa
         fBdIBdu2+647AjHbjnBwXzIAXS1aR6B9ZSIVw+1iwiIyJE6ZFnEBWhMVjTELkkR2fUNm
         YbXwAteqf0GluFyaMyozN8i6zA+rXKCEDSsWlIkNUgNmEbBI8JY+dM8GWSN4ENoJPfai
         rKqsLxzqEEjy0jIOxadiYK22Yea59hrG1bBriQmcfXyRfIsFSqPrhuOJXJLukqXz45vu
         b02Q==
X-Forwarded-Encrypted: i=1; AKwUvBxXgpctQ9jHWdx0ilCzc02SVJHNqI/kGU8hdKEqb4e6oTpuUQ0qPCfPhhUB5+DHRyNG6Ag=@lists.linux.dev
X-Gm-Message-State: AFuF++lyzaRazjrkfrAFYPu7s3O9Qi7LU2U3d1tR/zqxbe23FZ2D6pK2
	Lg6IMvIFm0CZAKJbfnS2EMt0XTK/kiSVQXOcqU4ZLjU8WZXPpvO9OU57
X-Gm-Gg: AYBFou30RoJPQWiCxAU4LuZNpwvURWeJXQjd1kMgo6iiosurLNChbeDZLbhTIXTzd5M
	AbjKoJRgJAGhD+q7FqT674VlrbUO37nnHqBuOnv2Q4EqtK5DCqEiXiqSlsVlCSKzadElbtu1zMH
	4oAaOhLUu2O5iq0rXyQQrilf+8k/g+hG+xMmgtVng21AtZfPjcVX8HvalOoSgW5jfJG5quAPuyf
	9JleHl14IvQ+uHpj9Q0gxeWjaMSezVZYjcvuHTiNBGulFiWDeK3vEzccZlO6ZU+Ki7cigVtfGnj
	TbrLsuXpxfGmPkb6iz98pg1iXlreyvFM0ztpXTXhH3rreoDlnf9qu60HtASBRjXCiEWgasbxLhb
	9nQhEqDYco0v+O8K2p28SpTEtgnfXTyBds+cJjLyYmueSP4ijBhcfZShLTCaFqgrUpQO8XxKzCF
	gENE8819beF5q9oBNhN0Ea1gJJv3MnHwKmzhPlKnHo+8cEhhuBJ2qwofZsIJVAzXvUGQwNujK9T
	NuvblRPjRlJHRxTS3pMrwsPNUoEUGRBG6BB1ld878mPWyBv0JcPOoFWEk/5wHo3Kup7IegV694P
	bF1fsWrLXb7wsGWNf5ApR0i63uQ=
X-Received: by 2002:a17:902:ecca:b0:2d8:d4cf:fe49 with SMTP id d9443c01a7336-2dd2a4550bcmr29793865ad.15.1789099394759;
        Thu, 10 Sep 2026 21:03:14 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm4670925ad.48.2026.09.10.21.03.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 21:03:14 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Wei Fang <wei.fang@nxp.com>,
	Frank Li <frank.li@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH net-next v6 2/2] net: fec: Handle optional IRQ lookup errors correctly
Date: Fri, 11 Sep 2026 11:00:21 +0700
Message-ID: <20260911040021.12289-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260911040021.12289-1-phucduc.bui@gmail.com>
References: <20260911040021.12289-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Handle errors from platform_get_irq_byname_optional() explicitly while
preserving the existing fallback to platform_get_irq() when the named IRQ
is not available.

Propagate errors other than -ENXIO from the optional IRQ lookup instead
of silently falling back to the indexed IRQ lookup.

In particular, silently ignoring -EPROBE_DEFER can cause the driver to
continue probing instead of deferring as required.

Reviewed-by: Wei Fang <wei.fang@nxp.com>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index c6e29b5c2abb..f7636f23d1eb 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -5397,12 +5397,17 @@ fec_probe(struct platform_device *pdev)
 	for (i = 0; i < irq_cnt; i++) {
 		snprintf(irq_name, sizeof(irq_name), "int%d", i);
 		irq = platform_get_irq_byname_optional(pdev, irq_name);
-		if (irq < 0)
-			irq = platform_get_irq(pdev, i);
-		if (irq < 0) {
+		if (irq < 0 && irq != -ENXIO) {
 			ret = irq;
 			goto failed_irq;
 		}
+		if (irq == -ENXIO) {
+			irq = platform_get_irq(pdev, i);
+			if (irq < 0) {
+				ret = irq;
+				goto failed_irq;
+			}
+		}
 		ret = devm_request_irq(&pdev->dev, irq, fec_enet_interrupt,
 				       0, pdev->name, ndev);
 		if (ret)
-- 
2.43.0

