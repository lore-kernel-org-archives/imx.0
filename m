Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A184431F9A6
	for <imx@lists.linux.dev>; Sat, 15 Aug 2026 15:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786807049; cv=none; b=GaqkM8XPVzO8fNq7ssnbDj7c9yvVsgc/mKAhIYtk82jSyZyUFm4N0s+l/gGR+tFG0yjB+vsGFLZ1Hu7Rdtbg+rQ3MgHJQzJwg4VBaBe4iCoK/m0WL4jb6pCTux/q+PL7pXdalfSIm54h2FV52pO2huM6bTft2yaDWQEviz8JI4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786807049; c=relaxed/simple;
	bh=L2rv/8hWgLO/9YX6ozCUc2a/DuHG5ngeE3Pn+3OXH8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QY/AscTfLtTkyF363Jbk+WEPqrzHd8rR88z5tmhRd2pkwjqNA6ZUqzBTPf+AUy+AqcTJiL6e8VaQFyAX/bjkJ2PLWpFhpIpGFEEYmhTzy1Zg0RP4SnK/mihVMGsDmNCLdzgmmOfckKCxz0omRlD31LGPHp89ppXibsNIJ5IkWlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V0m3g0Qe; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V0m3g0Qe"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caced6038eso22631465ad.0
        for <imx@lists.linux.dev>; Sat, 15 Aug 2026 08:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786807048; x=1787411848; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UM/qY+57O2WGKIidD8uuvpNNv07GGWbHqFgymg7+PkQ=;
        b=V0m3g0Qel+2uMf0OKz6ABT5vN6jGqdKf4V05IuQ+c/kx0L7cH88/ZzoBupNBIX40xg
         t2onOL1Re00ez8PGLMe2T2cH6uX9/WcGalSlS+fguje2U5jFfe02byX/NxLb5l/7AUuh
         +hdtUj+qKdiQ45grm2gvfAkfkWyxiT6ky6PWK+GCi72X/xlqfhtLgTEoS4Uvr4W0pJcW
         PE1n1nwuPXWZw7Xm90XQCVbQQT0S1cJPUCjv/E3VgdlR7ihkURxSfv28nNL1SJRTiI6p
         YWJP1rjoaw7NpKVtLnCERQ4kFcYKM8bIegVG+2hh8fxrIRyehcAW5p0oC0KbcoGgQwXx
         JhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786807048; x=1787411848;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UM/qY+57O2WGKIidD8uuvpNNv07GGWbHqFgymg7+PkQ=;
        b=EF1f9gxoBr2Q1/R2bQSMxsBpJinFCq6yTRE58yWkYEeMyFfelUFp4qcbeP0oCIoPSU
         nX3Otx/F2gYZYZSPYydwlugoIfbH3M8vrlzvnVKhWyLYmxARNP1LioCRmG1AwIB9MEYS
         W2MQvEgIuwgpjxqKG9/WOUuNL40TZXePmt8ctCyYudeIeEnDaWeSNw/8mo4fn1Zr4Jem
         TqlYdEa8HXbJW627Q4GpODprreOfKDij4gPYV5JeJFZRt0BXSszRZ0UX1ASj4WDgE8vu
         8Ja6KHFuZ39MRNZyB30HaZA62HvpDYFeUBwF4vlEtKpzw0O82cxxkAicECPaBWooLqwV
         kE+g==
X-Forwarded-Encrypted: i=1; AHgh+RqpZzNo6/yOG2WBytrO9blcKDcr/7PPp3g+/u3avAZaXZTJwCUVdUqXqDxpRqpfgNWtxtQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1sP/dMekxH8A5OR9EIGRuJZ2QfApnFmEHhPKg/TNznn1M0Nn6
	jvmMzYIE15oe7DzDF8fHHmXkoOWy+1/re+wj2NQ1pvHqAoGM6Joj4g0s
X-Gm-Gg: AR+sD13oNGzalEu6vn1BgFRlqXEp0ODSk//57m+oUVJJie2XuBfIgT8llMtO+WB8uz+
	uPFPgIhPIhPfjFX8fnURJtUVQlUdWJF7ZjvGnULS4ijJo7w/TpjaRfbgkEhbiH0mAXKYv5iTY+M
	FOREWQIWQLG+/WYL5VSrNHbXNNg1nPlBrobfm4eMQteF9WgLpMWSs6IPGEJkjvnBgkan/4bRMUP
	N8Z5T6UtFJPmNBymOnf8ThRVKN+TGnBR8b6tUTUk3e/tfdGY1r7FSUZg79UVUSWzzv7bcVH9ByO
	dyqG4LJ7oCVqPnvnrRhW1Vd8WOEWLdaYOyEKPvbzWV91J+xOCUEqemBMqkiFnec8Rm05VxLnZWh
	wywJEdfZi5cq7CVm198pnyM/+LVH2nZ3FKcipfcAW047digTt6mI6roEfLxqK1V1Nk93FMo6rco
	8sV9jNx/lbIyWQLSGALGBwMNedQADHpE935eh2PNi7NG66qa62ZeCYEKxvMKAV+Ghf4+LNq/CnO
	y/vdXf3jg==
X-Received: by 2002:a17:903:15c3:b0:2cf:b9f9:18bb with SMTP id d9443c01a7336-2d3afdacabfmr116123305ad.4.1786807047906;
        Sat, 15 Aug 2026 08:17:27 -0700 (PDT)
Received: from haichao.tail057a43.ts.net ([2001:da8:e000:1206:5225:2a2e:8e7c:13a7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb88bddsm19887805ad.63.2026.08.15.08.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 08:17:26 -0700 (PDT)
From: Ruoyu Wang <ruoyuw560@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [PATCH v2] i2c: mxs: fix DMA channel leak on probe error
Date: Sat, 15 Aug 2026 23:17:20 +0800
Message-ID: <20260815151720.3757460-1-ruoyuw560@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mxs_i2c_probe() requests an exclusive DMA channel before resetting the
controller and registering the I2C adapter. If either later operation
fails, probe returns without releasing the channel because the remove
callback is not invoked after a failed probe.

Use devm_dma_request_chan() so the device core releases the channel on
probe failure and driver detach. Remove the manual release from the
remove callback because the channel is now device-managed.

This issue was found by a static analysis checker and confirmed by
manual source review.

Fixes: 62885f59a261 ("MXS: Implement DMA support into mxs-i2c")
Assisted-by: unnamed:claude-opus-4.8 typestate
Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>

---
Changes in v2:
- Use devm_dma_request_chan() instead of explicit error unwinding.
- Remove the now-redundant manual release in remove().
- Add the Assisted-by tag.

v1: https://lore.kernel.org/r/20260814134033.1386874-1-ruoyuw560@gmail.com/
---
 drivers/i2c/busses/i2c-mxs.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 4e07babea9c3f4..eee4fdcd9df31a 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -839,7 +839,7 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	}
 
 	/* Setup the DMA */
-	i2c->dmach = dma_request_chan(dev, "rx-tx");
+	i2c->dmach = devm_dma_request_chan(dev, "rx-tx");
 	if (IS_ERR(i2c->dmach)) {
 		return dev_err_probe(dev, PTR_ERR(i2c->dmach),
 				     "Failed to request dma\n");
@@ -877,9 +877,6 @@ static void mxs_i2c_remove(struct platform_device *pdev)
 
 	i2c_del_adapter(&i2c->adapter);
 
-	if (i2c->dmach)
-		dma_release_channel(i2c->dmach);
-
 	writel(MXS_I2C_CTRL0_SFTRST, i2c->regs + MXS_I2C_CTRL0_SET);
 }
 
-- 
2.51.0

