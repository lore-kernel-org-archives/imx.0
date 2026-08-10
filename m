Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D07B3B0AE2
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 09:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786354303; cv=none; b=nyonLwTTmp+c6QVYb16rZXF+0GpZQ8n8o4g/bY4VLex1ZCBTSRZsv+b42BwzOE98JIvjysp/HJrnydqWkR5Hkg2AYztR9tgHJfI70rqhNTea2O2hNIcJpxRO4JR6MPz9pmlptjTrscxbIyAlxFGYh715jWvw4Oc1xPVc+yZLpTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786354303; c=relaxed/simple;
	bh=CbsVB1hXJyUjEccFMknjHswWvr3OXNG4BroPSztxlZc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ut88StK8lO8DBmerBF9rb/axCD74p/C8PZxO39vkHZUd0l2tqwLuXUpn3dgPCPe1WJdJRGjS1Poe0bMcxKLMB7wGPWb0AqK1jw1q08sKh+/wEtkdCk1lInDxtO4/LEGYFtyEQyhrJ+2LBpFl1w0aELwIT9Yk8p5Tmb/qvoKbAac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oELeN6Aa; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oELeN6Aa"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-84847482584so1038622b3a.0
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 02:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786354301; x=1786959101; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cwAxpvRCX4EgXLddkauSQNM3rBs+fIQ62nEnBaV4zEw=;
        b=oELeN6AaKA9efoJMFUVy0K+9gqW56QalxOgim2SrMJ28Chw+oGKAetjYosg6hCHh/r
         Y3+qIJ9MNnwDvf6NFfSVcQY8xQG6yeJnJFLmuhUHGAW4sgAxX0eMobmgxzpR9Bl0oq/M
         u+lvLmXrlmwd/VQyI0uneU0yuNRLs6OAvhCMK2ELdwQ+jxDLdLEwSholIB5s8G02DLW5
         EPjvTUBdrDsE/BZig1kpU17jd1Yv2itOFokN+T4hGiBEuB1qe13NT6P3Revidl6N+05u
         J8RI3k1/0mhgDOuqe7hWWxZxWiG3xGOaPGcAv+jUFZOYMoomMmPvYcXtRi+npjcbemo6
         fQpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786354301; x=1786959101;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cwAxpvRCX4EgXLddkauSQNM3rBs+fIQ62nEnBaV4zEw=;
        b=fReqIq2GH1B6IUOFN4MXsIAFlfkXQq7is+Ex+Sj9xqk/pfpfGqtYTX/1z4NP6yYkSa
         OlO/AiW4jXxyphGb7+W44j6hdXxw+03OxK0ZqM/kfrfLr3tryJGlHPg7SVSvTKZ3AZxj
         1zxJ+xp4TX6vfey+E7nJPjWIDQtrv82cfdXKM0d2zcHNPJavQiTLydBvuPyNmYcmFZJt
         ReWMAlxinCe/BnAPiJD/GDP/9GloIafHVqJcmwZghI1yikMZaKEZqKlt8JK2Q0dQtISD
         eN9hicmX1gTXhLfUbxrJk6wkdn1WWPLflGv2Kw49c6yqi7MWHR2+JZiKBwH1F8rLf+r3
         mRUg==
X-Forwarded-Encrypted: i=1; AHgh+Rqh7+SRj14rCtyiZsiQbz8ZLIkRD2RM4DlKyvIGcZayNwKTBvtEnHHljnt99vR/REGIIj8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwlgVaowpIgG4u+7EyAMASeURhmgiBEUa0uMJEP71B6Ye4gXpWh
	+8sEbmrYoW7EWfi9bJ6mzR15zrnZyUKjdUdLeadVevIgwe/Sjjfujl9v
X-Gm-Gg: AR+sD13eR+6nhyt5ziUQQEFr8tgls84ovokJh3+HGdTvlJ1Espn0e47LYV//uLJcsss
	Ip+5+8FKv7xMbCD2IzI6X4yyAWdj+6c8PGIjuPN4wHhWvNApquCx96JSvYyleSemSa+xnTOW+OQ
	JNW6yivozRbib4QyaNcqBTh6erCyjSefD7odNu8C0pv45VLQTDTY7QNNbbhWoI4M0BXV5eUZ+sH
	u8YBLYVGHuT0q14+i3AtaQh7FosaeP+3nuZVD5rPEiswUiQyhwlF7BQtbJXouSaX8z5N+l4v3TT
	HL4io6FpWnwO7sh7Tx09HaSTXMJedtq0+V5hXE2A5Eg2qnOFwChoSDgQ2JnP69F/M4XRKycDVff
	fBTSpUR2fdkbq7s8cBhkfsoyXK5EcFQI8QZGUaBzOLjy30XenLxFIKq3ZcXj9VCu0hb4FWRBzOG
	dvIKCllRqof/1O4TfqG9qKgqxDrHGLRFpzoMThHEpIpRX851KtTr/GRZw29KlaCVYseeNTMs9PE
	ssI+GfjB4x5k53z45ecOVzBSgqmAg3x8G+wQQGQMYi3glDs1FIuwgLtrNBkvvM6VHKhJXFfxAAX
	qohH
X-Received: by 2002:a05:6a00:3d0a:b0:847:9dd7:2683 with SMTP id d2e1a72fcca58-84f6b7ef419mr18218663b3a.9.1786354300606;
        Mon, 10 Aug 2026 02:31:40 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f5a3fe7d6sm3592046b3a.26.2026.08.10.02.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 02:31:40 -0700 (PDT)
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
Subject: [PATCH v3 1/2] usb: chipidea: ci_hdrc_imx: Propagate errors from optional IRQ lookup
Date: Mon, 10 Aug 2026 16:31:11 +0700
Message-ID: <20260810093112.47807-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

platform_get_irq_optional() returns a positive IRQ number on success or
a negative error code on failure. For an optional IRQ, -ENXIO indicates
that no IRQ is available, while other errors should be propagated.

Propagate errors such as -EPROBE_DEFER and -EINVAL instead of continuing
probe without the IRQ.

Acked-by: Peter Chen <peter.chen@kernel.org>
Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Link v2: 
https://lore.kernel.org/all/20260807065619.30604-1-phucduc.bui@gmail.com/
Changes in v3:
 - Use the phy_shutdown label instead of err_clk as suggested by 
   Sashiko's review. 
 - Add Peter Chen's Acked-by tag.

 drivers/usb/chipidea/ci_hdrc_imx.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index 56d2ba824a0b..9e529398c607 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -525,6 +525,10 @@ static int ci_hdrc_imx_probe(struct platform_device *pdev)
 		data->supports_runtime_pm = true;
 
 	data->wakeup_irq = platform_get_irq_optional(pdev, 1);
+	if (data->wakeup_irq < 0 && data->wakeup_irq != -ENXIO) {
+		ret = data->wakeup_irq;
+		goto phy_shutdown;
+	}
 	if (data->wakeup_irq > 0) {
 		irq_name = devm_kasprintf(dev, GFP_KERNEL, "%s:wakeup", pdata.name);
 		if (!irq_name) {
-- 
2.43.0

