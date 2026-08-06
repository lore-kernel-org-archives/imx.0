Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0893B9D95
	for <imx@lists.linux.dev>; Thu,  6 Aug 2026 06:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999192; cv=none; b=NMvj97/OgR0hEBRz11lvHWikQyLgWgoq8MBM8J2J7LSdz2lu5iwiob3CaTx1h2URJZJ/p6ExErG7CIIS0qbzmQgRApCr2ZiOhKiFohTBiUf9t/cnagR/yvPtQCVoNNurKneb56rO7FePg3+BJRzU+I63I6q8iqH1wRAVyIMMOvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999192; c=relaxed/simple;
	bh=jKzHN686d3QXF0JLp4kLIZ+bA4V44p4VT6AlQvKbjM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RKrQnzJbBn2tSBfA8SCST5G8uORjoXfJxnEKgOPSDScWxy3TwoDFy0BzVFh9o7oLruqD+Ucke02Cz1wAah/qTJN3benMx7oyTpbcrp2vtA+DY5wHSTUSeMLPdRZSidQGuVfno0eWYBty+r6Ed0s7Odg22l97bjD6/AXfaOxhb+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q7/zuH5B; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q7/zuH5B"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1694972b3a.3
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 23:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785999191; x=1786603991; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=331DRkSFWDCKr7dCFic+xle6jZcQv2JhNVnEK+JljZE=;
        b=q7/zuH5B9Hg3x7FOhe/7dF0j7CYPsECxB157TwqXRvdcE3JArZfxjZAdiVfr+L4mz4
         Jo8tTif6iWiaWP1vWowF2o+9bbDuErhEb5J0VTmhykMih4kPjWrEbwFaqKhJW1+luq7n
         m1ObHhbVC82cz49A2FTq5QsS6bGLiYxFYxiiOXcOdibjGcUFaKqjaIk784L/YZWUt8+7
         gTYGmiGp2DAL9NGjptaTqF/9/I3Wg1VP6VmmJhRMMf69yREm7c8WNpiCM/gckSK99pWm
         K5gfVhy3y26Qe2UVn/q+5EhVHednKOzVqBrfYugNinS/zzWmlfn3x+qKc8K4zxnMthd4
         1z8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785999191; x=1786603991;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=331DRkSFWDCKr7dCFic+xle6jZcQv2JhNVnEK+JljZE=;
        b=HXMSmvj2qfGPL1+Srle86Pymhc8fQLwx3HrTs4neXou37lyUeJeje/w2V9Zf+m8Sn9
         KKBkjErhIvijslEpUdr+jASe+en3o0jKJoAcb6MeEwqS5FExMg2QI61w/0deQLhig+Kw
         JMkDHCiqz3ndcODENTRjp8nNWEQmNfdPf8KMAQ6GqvHALcaFGUlAUClomYYBR7BIg6z0
         aTtTTto7SuP6Peoce5A6HRo476iFr1r3MM3d0bmKbqJCeU3iSZmImLjzgtZqpeWcE1sg
         aDNJNQM8sTLlBAHy9tOmnP+03PsuqMe5FwBayoV7f709398AB7/q2MNaLwDHadtdQdsc
         gRNQ==
X-Forwarded-Encrypted: i=1; AHgh+Rokd8m7wW5q1eL9a4xQCgQMSV1E80HLRbOmjv5PnBjXYBp7zyjb3ZXe+ze2IJx9CLOorNM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+31NVTk5xDFLbRYZBG68mEicBnSrVUuC01KQwD7iwQlCeTatQ
	d5mRzmi9tS6o6UGPSjHqVPzj5n/+/EKtVxlzwivhBq8EvPMGKw+bdcAo
X-Gm-Gg: AR+sD13pkAcCrZ9RFa85vu6VKqxX7u+JBpyVcmS/l9F9orXAn5/K6b+hOgKap8Lq60+
	gjDZXnC5OHvkvo9wlpr5WxtkFgZnCdQhBYKFpSH9fHPQ+r9V/C7pwuQ0VwEzNuFzdMx1gr3v2sI
	26XvbyajsHCf4o+sSjGAwRKMOQGp9PdG/+PGTpGVh9NTUpO3HNdo186oPA8Rr5xVYJecmnbWbKy
	KWfOF5uEIR3+r635BDVU0emSG/m5sSagSL1XnnDHBXUOLnuIhwkwNgSl1q5iDJDQ8ZSoUN/vljO
	8WRqhLtzkCqCGax4YCSLRtL+vpYUkODeK7IyoqUTiX8FgShD0s7qJZVH2EAPQaOp2qK/Kpne93v
	JfVdf3nzKvDgpUQ/x895YuoKhIl/dEHKoN41bjXaEhxcLLp4gyWbGrzceVFKTTJ3F6YjK6uEJgX
	f4n+xgbXrrIzxl1fLhH5fGmI+GJ02lRJJ/wKOCK+DiqQL0amx6UWn8xmsydov4jeWiBfzMhbldA
	pialm+BS65gEHPMS5XVyDDMEZjdEpc6u7vvvTWGFFPwYXWds3hU+EXCBY5J/onf4Lr9V/0pEq0W
	Txx4
X-Received: by 2002:aa7:8884:0:b0:847:9315:fb8b with SMTP id d2e1a72fcca58-84f2e031490mr13109342b3a.6.1785999190781;
        Wed, 05 Aug 2026 23:53:10 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f459ba2b9sm714920b3a.48.2026.08.05.23.53.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:53:09 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Peter Chen <peter.chen@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-usb@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] usb: chipidea: ci_hdrc_imx: Propagate -EPROBE_DEFER from IRQ lookup
Date: Thu,  6 Aug 2026 13:52:54 +0700
Message-ID: <20260806065254.28204-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Return -EPROBE_DEFER from platform_get_irq_optional() so the driver is
re-probed when the interrupt resource becomes available instead of
continuing probe without an IRQ.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/usb/chipidea/ci_hdrc_imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..f53d09e90010 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -525,6 +525,8 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		data->supports_runtime_pm = true;
 
 	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->wakeup_irq == -EPROBE_DEFER)
+		return -EPROBE_DEFER;
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-- 
2.43.0

