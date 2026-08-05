Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 079183D3339
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 19:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785958073; cv=none; b=kyyUDKnUT2w/hkf67BigS/MNkjM7UKvU9tk/U4GxmpJneSnubVYAwZ4ENXXiG2OpEWyN655GCQ/NMB1rbeZ5t1gcAETYu57keSStaOUzlUeDLZNO2PeugYLCfr1jkr+SZefmvFcslyJppFQKb647vtH1IwkhSHTnu1zhwsQBLW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785958073; c=relaxed/simple;
	bh=dVeNTpPB9YZx9hYK/eMTS366qVwI6Kw1emblFf6LxQo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YeS7BPb8Ju9n1mAyyMvIO1sNOlqg0o9pRNYE2UZyL7xrgYXdIE/VdZ3j5wGVw6xmKuGYDkLADP65OVXQ2rgl8Cm0YVe+0atU+CLfKlqFTlIFz9qiYyAPI3yAyI837SYTLz8G0PO4/U7ov70ZghgrDArk3GyXTs30Gpm1RniRlGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=das9KwOt; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="das9KwOt"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-3810c5d691bso1206722a91.1
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785958071; x=1786562871; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z397hzjtlhoJsdjyJYMPtMJAiE67KesRcDumfIuyFeI=;
        b=das9KwOtnU4fPuk6geG/rytcUe2ZenF5k1zHmIy/Byp9hgYTVGHCLOnbypMv3nKcNL
         5mTM7r9uMNpYHIwtkG0xyvHPT3+fWGmia0Ck2bVKjAMRtIvMuW5T2Pz2jJXjr3ZipTY3
         UtN1Ra87zFv2q+K2MeRFd2jrgEnIKEpcrlOwV+30Ty0o/E3mrNz2i38eP346JpddvE5w
         O7c6431K0NHcaEqJpsjkLZ4Mh3SP5lcphH7l2PoWBC12T7lNUeygAbSvpFXSwsx6l4lv
         zik3HtUXVE3ObjqrjGlnC10IPlX3SCb82Muhr1lxv4k9HdX8NK2qUBs1cHRykfp6GuVp
         WfyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785958071; x=1786562871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z397hzjtlhoJsdjyJYMPtMJAiE67KesRcDumfIuyFeI=;
        b=s83bFIEHPxhx7Lnw7K/kb6+JcF4boUpwvvXQO+JZTgoSBzlRRvekztK8BBnkLAKA5S
         VUINza3dv99qbF38X6tSGQbznh6J7Ok6dmdFp+q0fU18WEDjWgdNE2ENbdVp8twGnNxQ
         ylZrUx2FOArafqLOY4rasz7+2poc8gEXVXENDa/ihFNZYSyW6hMReoLAj/Dc54itDkMP
         PiuR88qlJ3K7Cu+bc+h1QyNkaUE8oP01jQOAG6X7waKmM5chfz1nTwe8F8QlEZGTkD7Y
         VnFTsVabVgc3pbjHcDTmIIkwVG52Tgo+5F6vkZME/mb0Q8qanJhRHs6Smr92SZIJ1x8W
         adCQ==
X-Forwarded-Encrypted: i=1; AHgh+RoawrdZ4dmKJ/+bfM5MMWzPME8ztSAC4CGiUWnjnyMbHIJKOnl7lt22RpW4ku9O3CgaxWE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9UhAOsMkTUOQt2JiySN14tdw0dEZm3kM+ivdODCJXXjrpH98H
	9PrpDhVHYLoI3bsbwfsXIw0BQNZmGw0KzfpZe9ovGGF5Hvg+fbamE7qF
X-Gm-Gg: AR+sD12bJR6FQyalAzBO7ttoRQERRdtb3N5ZsswKbCsXJ+RwtIqxxTEBcUnVaNeMten
	KcVBSf3nA+WOar0snszFF8dUaj0/UJaA3xDAl3M7TtFxVKXTp1kflILz/T5rvcvEu6V7+l/1+Zp
	PfAB/gvk0YUnsN2HDMtm/SfdQfJB6nhNU6eX2/epHxXCT6vvYl3VEVzVkVbh+/Z22F9QuIlEsg1
	B8p4gnco1/oMQuIwQ3CWTAeFBX7Knc1zZkki27ZFO2pezRhGgMmUXaN0doK561eBtNK6ow7l/QZ
	R2Uk19oUzOAQ1jG7xtilejWspwBhAJ2hHGtllLnJxQuRq++2IUlQ+TdE0e4LpKwXo7eV4//Than
	RbgDShz1wY1p81oi94JnfY+bcrbk8RR2nKFj0uIjs1q5QOElc9W52ZHJHYgt50EQF5OAL50lpi7
	4VpkxBrcWbbEgIRPLIjmAyerrZoebT3HAi9IoY2SM2Isjd9JULvTCxi5pzKTt2MOkw5QOLX6tFg
	DpfgmUIdCfOA9O92Pk/Rnf90OUkMUrLbAYlNw==
X-Received: by 2002:a17:90b:5203:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-3903c598ce5mr10207058a91.7.1785958071130;
        Wed, 05 Aug 2026 12:27:51 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:e1cd:bc4c:d677:df1f:9a88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm20260391c88.5.2026.08.05.12.27.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:27:50 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	Frank.Li@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v3 2/2] irqchip/imx-irqsteer: Validate IRQ count before creating domain
Date: Wed,  5 Aug 2026 16:27:43 -0300
Message-ID: <20260805192743.244441-2-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805192743.244441-1-festevam@gmail.com>
References: <20260805192743.244441-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

The IRQ count is validated after creating the IRQ domain. If it is
invalid, probe returns without removing the domain, leaving its host
data pointing at devm-managed memory that is freed on probe failure.

Validate the count before allocating resources to avoid the leak and
dangling pointer.

Fixes: 28528fca4908 ("irqchip/imx-irqsteer: Add multi output interrupts support")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v2:
- Newly introduced.

 drivers/irqchip/irq-imx-irqsteer.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 653e25115083..55aec60dee40 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -217,6 +217,8 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	 */
 	data->irq_count = DIV_ROUND_UP(irqs_num, 64);
 	data->reg_num = irqs_num / 32;
+	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT)
+		return -EINVAL;
 
 	if (IS_ENABLED(CONFIG_PM)) {
 		data->saved_reg = devm_kzalloc(&pdev->dev,
@@ -250,11 +252,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	}
 	irq_domain_set_pm_device(data->domain, &pdev->dev);
 
-	if (!data->irq_count || data->irq_count > CHAN_MAX_OUTPUT_INT) {
-		ret = -EINVAL;
-		goto out;
-	}
-
 	for (i = 0; i < data->irq_count; i++) {
 		data->irq[i] = irq_of_parse_and_map(np, i);
 		if (!data->irq[i])
-- 
2.43.0

