Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F3D26E70B
	for <imx@lists.linux.dev>; Fri, 24 Oct 2025 19:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761333362; cv=none; b=rwrc5O7QIzHkPF/JNK4CJjnW24IrmUMJ6g3zJwg2C1mxpHMKHuNZZ/19fab3ZuQuESFoBfAWaknbVWPM1Dr8qcsnshxy6L32QqZ7vlyWVhBV1aagNLAybCcorQ6BtPVJ6xl4k8MBzRTQX9BZdXAgTjH1Im7tOyYC3gZsPa8L/rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761333362; c=relaxed/simple;
	bh=h91Mh4hoPgByHdcKd6/RneQUViXMJHcN0u0JxmaBjQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXqlqng0O+D3+lPPO2MoaxS9pEhsZGJZZr4sJ5Ad1P4EBqqitlDpZ2jKSw771pMr3DDg+IksmOzY4Lattn3arohj8UIZUXWazhk2O+4Cs0l9VH55zAaqlBcVJa1+JT0SyUS2Guf294oU6+fF/rur3nJXTF14PeKQUApXx8b+F84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ARmMc1I3; arc=none smtp.client-ip=209.85.166.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ARmMc1I3"
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-93e89a59d68so104654139f.0
        for <imx@lists.linux.dev>; Fri, 24 Oct 2025 12:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333358; x=1761938158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=ARmMc1I36m1jUly53/sKlP+kXJg1jYXF7iS1JEQ/eAyfrSmUL6iqpWIsGhQKLP5lW1
         uGzqp5Obc0/0pUJLWEvL+sXuz4+TczjzWB5EDB2lt9rnGYFbdBBD0O5qidPM5ie9Osnm
         DP+hguSXITNOT/BYnsClERVYy8dEyG/f9i9vcP7yOySdUmNbQY09P+J3tsp1pZkym2zm
         Fir+MzUnA3VIwurKrHwwF+c73O4Vdf8yTLYfFu+JI+k1Mh0QvoQvH4A0T8XLsHw1mO5H
         cqxcqPZeUDRfzoV6BD6mJxIWY603kr9tVvYHur9hQUr/I8/0Ow3hjUV+5GLGuUAw2zB/
         Z6bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333358; x=1761938158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXEnNR948aKFzOMEVavf8q+kCpka+pPq8yUEtfNzTFc=;
        b=QZ67E0+TnH2N4/zm4OBx7owOJ0ZUXtO0Adjoqn3BxQSaVxVNhJSdrGsh9lZNFXoGJs
         KHiswGXwsXrF+1cLt0D1BsLvG3225MjJ72q5ofSpC9KT9QnUwTw6XxhgpPqpALLauF1f
         oT6bHjd6ktg91SgSv5BgU86mrjQkTYewn14VxG1J7kLju8PPl8y3K52w7vo0vgl5AZJF
         dC3GjmdyxOO1LNeJxaMfyqV8SgrfyJotuC+uLaFXlfS1Y2cghhmIIXZ1N/6Pzfm1ctgT
         oWc66RgOyY0/jAGEVTl25g2SdoZDG1R12p7wyCZ/296ghM4F3J0rMV027i20zDFtK27J
         d4Ew==
X-Forwarded-Encrypted: i=1; AJvYcCX2ZCn9g8wmYKUjVwQGKXfya3g3dcStg8FI4hnE6K+Ve518G919TOTnjIkzeW368nzJlI4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzoVvgw3NG5FJledC9AJRwhfrQGHdWPsKltjaUr7TVD2XldrQXD
	k6Ht64fs60gppUUOkKou9XtOcjSGddDbwQbIqZVI/7HchJ55uMHIIYOdF7O6FJOUxso=
X-Gm-Gg: ASbGncvCMtI0/pPhtg2c4T+0vzisPDjycP0lFXm6EvCUyGQY9yVydEKdnQOBnOtvY4S
	MmpHsC7hDuKSIbUOhGvGI+6LaghGOrkSajsBqGwPAbjE7AWKObxhBcNS/zDXGZqDq1aBTVZjgBs
	GOipmgMTVTQ0GMLtqu50DMjXjeJHp60kV426TMDq0dCM9PuWwcLBfxw9/RKJeayWYhkmK2y0sl9
	aH+u+xGS+y4ahwuK2ZW8y98qx5cZXwzjULGJe40WObm6mKsp6q7kGJKWjWc6iSAhLsLI//IZZu6
	foYJXmYAf3zMbHPpf4CSdaqxqyCH4ET3mIP4dV1OVeRWkEvCOAfcnP6+sCh0jQoDYtELuK29X3g
	HebQL0WIOhb6pOpt515uhVcKR2C+sCF3NmvQwLwHxZAT5X9Fy836PtaM2j3h4FhvwS4oOA5ivVp
	2gwy5pwHmuAGTIZvPFXRr4koKlBWOGTs2tzsymfpHHSjg=
X-Google-Smtp-Source: AGHT+IEtD+Cr8mACF/K0NonNKa9lBHI7Tp+o5Vfp1juGLlBk90z7fTUTAMVH9dichKlDp3Ypt60Lnw==
X-Received: by 2002:a05:6e02:148d:b0:42d:bb9d:5358 with SMTP id e9e14a558f8ab-430c527f7a5mr415578465ab.27.1761333358489;
        Fri, 24 Oct 2025 12:15:58 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:58 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	p.zabel@pengutronix.de
Cc: dlan@gentoo.org,
	Frank.li@nxp.com,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank.Li@nxp.com
Subject: [PATCH v3 3/9] spi: fsl-qspi: add optional reset support
Date: Fri, 24 Oct 2025 14:15:43 -0500
Message-ID: <20251024191550.194946-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251024191550.194946-1-elder@riscstar.com>
References: <20251024191550.194946-1-elder@riscstar.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for one or more optional exclusive resets.  These simply need
to be deasserted at probe time, and can remain that way for the life of the
device.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 drivers/spi/spi-fsl-qspi.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/spi/spi-fsl-qspi.c b/drivers/spi/spi-fsl-qspi.c
index c887abb028d77..1e27647dd2a09 100644
--- a/drivers/spi/spi-fsl-qspi.c
+++ b/drivers/spi/spi-fsl-qspi.c
@@ -36,6 +36,7 @@
 #include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
+#include <linux/reset.h>
 #include <linux/sizes.h>
 
 #include <linux/spi/spi.h>
@@ -267,6 +268,7 @@ struct fsl_qspi {
 	const struct fsl_qspi_devtype_data *devtype_data;
 	struct mutex lock;
 	struct completion c;
+	struct reset_control *resets;
 	struct clk *clk, *clk_en;
 	struct pm_qos_request pm_qos_req;
 	struct device *dev;
@@ -857,6 +859,8 @@ static void fsl_qspi_cleanup(void *data)
 {
 	struct fsl_qspi *q = data;
 
+	reset_control_assert(q->resets);
+
 	fsl_qspi_clk_disable_unprep(q);
 
 	mutex_destroy(&q->lock);
@@ -902,6 +906,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (!q->ahb_addr)
 		return -ENOMEM;
 
+	q->resets = devm_reset_control_array_get_optional_exclusive(dev);
+	if (IS_ERR(q->resets))
+		return PTR_ERR(q->resets);
+
 	/* find the clocks */
 	q->clk_en = devm_clk_get(dev, "qspi_en");
 	if (IS_ERR(q->clk_en))
@@ -923,6 +931,10 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	ret = reset_control_deassert(q->resets);
+	if (ret)
+		return ret;
+
 	/* find the irq */
 	ret = platform_get_irq(pdev, 0);
 	if (ret < 0)
-- 
2.48.1

