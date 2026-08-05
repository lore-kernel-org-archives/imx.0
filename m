Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725FD3D3310
	for <imx@lists.linux.dev>; Wed,  5 Aug 2026 19:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785958070; cv=none; b=P0hCmIOUogJ7lt1Dco0qGjJ7LbKI8V+fmYE0bVTtQYigsxu7JwMGPuL6KwYVY+OaFwikIqH/EFCh/uionty0lt9lB9sQ0NzeczcKS54/2VlMqWR/1JRfgHUxl7qN7wMt/Jn+waarexS6JsQi86olyjGyHoSxiqK0oPEVf4EKMZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785958070; c=relaxed/simple;
	bh=LTwaNtRgS3ooW/16vSo1ZZSGSBIxiNpLWZOXEdrz9xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oji7B/T1+52g027bDw74KuV8me0Ftdi/LkkVmvkaKEq2Djf2Q71z8fLgPPmuFsneWXkxocno4cv4b7/0h4Zh7xtqA4Xz+2LR4mHrakLKXbcJKl8W0PqDDOLky04Is+cGLqWQlBDUwpcxlqEFpAGu7SYXf1uKDH39897FdA7TUds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hiim6oGm; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hiim6oGm"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cc891373e0so17840275ad.2
        for <imx@lists.linux.dev>; Wed, 05 Aug 2026 12:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785958069; x=1786562869; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ALVhTkLMakWqEuSe4Skb0kas0ActGjz0usx5j0rutA=;
        b=hiim6oGmmXSWeuK+SmvkghOu+qXVDu7TvOVByqQwvJlkCOFZfBqcmQEnzewjDj/HuJ
         h8dAVSGsupcm4C2AbRcGDRRH/u4CF1g38d2SA2UBVBMHQnKvuji/MkG9oWhXfEBeGlZv
         ZU0hHRH63mExdRZdwVVj56rVXCtSpo7U4+D10kCbb19N8FlFQN34YwRpJWYC7MtBfSXr
         EC5uNkjoUo4YASlmmzPxE8Wg9yoEDKxfSm3VIyfnd1BxLI1TtLm1Tg1OA9fuU/xVI7BL
         +/dVYxuoc1YKFL91lEw1BrZDsxwK5/WJ/lCaQFUyT5oNWvhdthZqXLm8WIPFfscI7rBF
         qk+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785958069; x=1786562869;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ALVhTkLMakWqEuSe4Skb0kas0ActGjz0usx5j0rutA=;
        b=jXNuSVaR4IQ2RwMtjHyspaCmImv1bKPofeWBz0me7M7eJ1qxpfqaFEx7cNp/YaocVu
         dd0mfPhS9O4JJdDpoLiruGJwycngsDDT9Jy7XxX2/4ass/Gf/lR4vRm9BBt9J1yGLhsC
         N2d6kER/m1+xohvE04V3WxVxbNvF5UcwxfOW+69hlLWGrOeiYb30Bk97s6sgT0MWO44r
         kI1I1z31Sij8k0P/QHALJAUjBE3Zv76rsQJV5v5uE/hQ4VIJiJO+VNOi30j0JUMRtyFk
         1T7d2Xq0XQ0PJB4qpdkW4AuBsbuvggIFwnz8zUjVZAn0gmrTSILosNBHP/vp9nkgwl8P
         eHZg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+xNyo11zaXH6aUSMZZcgKa99e5sUF8OjBxbJi+jUsovoaGCv7mZmNfIfHRLAuw6F4jq0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwSXR0TOEy6dGGE8P+ployMVAaw9EJyQ46+MRQRLb4OZEiZtK9
	ync5dTJIp0rnlYbOdRSrEJ1544WrXBoJSpM8z1uuZU2jdVkhd6yRiMue
X-Gm-Gg: AR+sD11IyVEnq5iJVzFhJTkbaWOPqaZu7ccKzHCDmzcaPrCMQ8zbtigbxUZgjtRxmRe
	z+5n1u2ibi1oL28VEGIvF7r7qw5X753tuTczbW92IAZ5yrKdMrG+0BsMFahzCp2hzEVDjatNYRZ
	VfkEermB2qgAYWJSbITJKF6/qudAP8UmWR97UP0/cC3P7TAtyV8qg+9VpilJqXLDgOGs1XMedfg
	TRBiyAvWHPLZE1pd1BDprSeEqSMdddCODxfS3kGAxWwjl1bXK16hhGJGcwy1pTck8DmErBM/rxd
	J90fJCCnaC0VltG7C17SOb4aXgpgETS001aYAnl+VNDXyFwJ0tqdXxcQqdqy25IvnNCuWVigIeE
	ZBRbvCAb6MoNH9nUc6T0R+eQLwveGDGaxrOKiJYFXQiJ/nA3+XDnlmXjpSdTEb8YMtdHo9Jurhw
	QtHTf9gDDnsJ3XFP9oF91Ay8OQBeQGU9fbx/Y9LyYWo2rilPryKeNgay26HHogRyaQjvO2iEh2Z
	ginigOLmqK00EShe+gTv1fB2CWb/eeQrAdD1RWS0u6ZxeM+
X-Received: by 2002:a05:6300:670b:b0:3c0:ac0f:6558 with SMTP id adf61e73a8af0-3cb85e99259mr11160290637.2.1785958068690;
        Wed, 05 Aug 2026 12:27:48 -0700 (PDT)
Received: from fabio-X870-EAGLE-WIFI7.. ([2804:1b3:a801:e1cd:bc4c:d677:df1f:9a88])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm20260391c88.5.2026.08.05.12.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 12:27:48 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: tglx@kernel.org
Cc: radu@rendec.net,
	Frank.Li@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Estevam <festevam@nabladev.com>
Subject: [PATCH v3 1/2] irqchip/imx-irqsteer: Convert to devm_pm_runtime_enable()
Date: Wed,  5 Aug 2026 16:27:42 -0300
Message-ID: <20260805192743.244441-1-festevam@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@nabladev.com>

imx_irqsteer_probe() enables runtime PM, but imx_irqsteer_remove() does
not disable it. Consequently, runtime PM remains enabled after unbinding
the device, and rebinding it triggers:

Unbalanced pm_runtime_enable!

Use devm_pm_runtime_enable() to automatically disable runtime PM when
the device is removed. Set up runtime PM before creating the IRQ domain
and registering chained handlers so that a failure cannot leave either
resource pointing at freed driver data.

Fixes: 4730d2233311 ("irqchip/imx-irqsteer: Add runtime PM support")
Signed-off-by: Fabio Estevam <festevam@nabladev.com>
---
Changes since v1:
- Move devm_pm_runtime_enable() prior to irq_domain_create_linear(). (Frank)

 drivers/irqchip/irq-imx-irqsteer.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-imx-irqsteer.c b/drivers/irqchip/irq-imx-irqsteer.c
index 87b07f517be3..653e25115083 100644
--- a/drivers/irqchip/irq-imx-irqsteer.c
+++ b/drivers/irqchip/irq-imx-irqsteer.c
@@ -236,6 +236,11 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 	if (irqsteer_has_chanctrl(data->devtype_data))
 		writel_relaxed(BIT(data->channel), data->regs + CHANCTRL);
 
+	pm_runtime_set_active(&pdev->dev);
+	ret = devm_pm_runtime_enable(&pdev->dev);
+	if (ret)
+		goto out;
+
 	data->domain = irq_domain_create_linear(dev_fwnode(&pdev->dev), data->reg_num * 32,
 						&imx_irqsteer_domain_ops, data);
 	if (!data->domain) {
@@ -262,9 +267,6 @@ static int imx_irqsteer_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, data);
 
-	pm_runtime_set_active(&pdev->dev);
-	pm_runtime_enable(&pdev->dev);
-
 	return 0;
 out:
 	clk_disable_unprepare(data->ipg_clk);
-- 
2.43.0

