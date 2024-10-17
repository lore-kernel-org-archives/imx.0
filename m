Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EAF202626
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 19:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729194018; cv=none; b=lg+HcZaKfIuvL8YIiZgSic5nMHt9CfjJdEP19Zc+zlQdOakhzdM5UCUeRhNsQD3i6Ry4TL7b+QOfrnzNWeOB3jEZuBerrUjEnOe29abc5r+vTargO+exkKz+g6miMZEh2MS3Kp7BA3dT4beI8Rb30s7g4uBQjQKzNIn/SPBAYuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729194018; c=relaxed/simple;
	bh=3cjJavFR6NC/HCRHI9EPOyrqnyNGb2dE/RAZTMIh2Bk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iyKxPvkOSmFmeslCLrmmloqlnxYU93hZHaLCAmUE7JEVLRbRH1h9brx1g4B6eD4c5r51aDB3+d9u1Iuq8dzUbL7w2ezjam9BsH5yxwIpGkk+H61t4DDFeRJ1xrPd6W3Xro3MTArEv02m+Epd9jdYDMPcHP2gj3VwuTCGTpCu7dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CVE/YxN3; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CVE/YxN3"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a99cc265e0aso175898666b.3
        for <imx@lists.linux.dev>; Thu, 17 Oct 2024 12:40:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729194011; x=1729798811; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QZpms9R5kWODAqigQeGsxMS1uylrcIOwy5W+fcCCNgo=;
        b=CVE/YxN32V0RmuT4PKB0kFlB+THeWWYjz4KwuRglagAReSglxfAzKTbxryCzs3z8BD
         jsOJtF3PVdNvSE23j4vBjM2zDwol+Cy6SRHS75sILz8X0joZVfHOL2fA/xaQHNkG37rv
         LxdAjtqfMhMkVMYh3+lSqQCugShswu7XrNhuLEP1ij5TCFRnH5AoynW4v+1ediCIiz5t
         wI1/nCu0LKdBb8RhBbXmyYxlHknTD8RzndYZj7OfXM6uCdacyoB8vooySjVs2AWF0vKG
         +XstjpuLXBQ3qHHBoelAnGj/TRFBYQaTpH1tZCKi/J7Fz4GmmFUbvvL/HKU/2UrSjTpe
         z2EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729194011; x=1729798811;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QZpms9R5kWODAqigQeGsxMS1uylrcIOwy5W+fcCCNgo=;
        b=ihZ12hkWDvT6a3FjIM8rHBUqp961DmlRCx3KzXtEOWvudNN9D6cnKQhZAeSEebf0w6
         wEm2c1oK3GmXgq67I8ibssw/rsXPli5CXOyQeXH0CHMbWGh9Ix4/Sb9FussuPgNHgib2
         9Dw7aFF4DTV4vrmk+MpQaVUHgHSajSTsRTWMq+OqFHlvvatqUqf8ul5hSs6GtwkY97iK
         gQbtIhmlmBKP/hTLqf1cEXm3YHIIh0SkybT5KrCf/3pxJrnH36wV/BHk+jhVm6Kbo3Sj
         8n6RM+W6xPq3nAxDbdDz404QGZ/Z4E8nwzBdm7QqE5DLwTk3j2VIi/lzareNsN/D2gNc
         NWSw==
X-Forwarded-Encrypted: i=1; AJvYcCWT+KVa3lQiBMQpfnWAtu6W5HbfW+l56OH0Hahud4P/FZk4hfuu/TzAVXV2+34UBICSGq8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2v7nX1lPrO8z9wUTa0NaPKRd62GPOEFBU1vEpCyYKjvVRwY/V
	q0PlnF6I6i+BR3QecHNVmzpswPcdkmsaOJVEsIqWKhp5BlnD/MnIp47LD753ErM=
X-Google-Smtp-Source: AGHT+IGxstbOFapOUqQjp3ZRs6n1QMqDvHLOM3P/WHoCxTXHHg04lmOTKj0g3pfWvKqi+rO1wTNiWw==
X-Received: by 2002:a17:906:bc23:b0:a99:368d:dad3 with SMTP id a640c23a62f3a-a9a34d078d5mr696337266b.30.1729194011492;
        Thu, 17 Oct 2024 12:40:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68bf7037sm2959166b.183.2024.10.17.12.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 12:40:10 -0700 (PDT)
Date: Thu, 17 Oct 2024 22:40:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Ming Qian <ming.qian@nxp.com>
Cc: Mirela Rabulea <mirela.rabulea@nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, TaoJiang <tao.jiang_2@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] media: imx-jpeg: Fix potential error pointer
 dereference in detach_pm()
Message-ID: <ee0eac36-3bb7-4bc9-8062-1305d5679580@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The proble is on the first line:

	if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[i]))

If jpeg->pd_dev[i] is an error pointer, then passing it to
pm_runtime_suspended() will lead to an Oops.  The other conditions
check for both error pointers and NULL, but it would be more clear to
use the IS_ERR_OR_NULL() check for that.

Fixes: fd0af4cd35da ("media: imx-jpeg: Ensure power suppliers be suspended before detach them")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index d8e946aebba2..918ab12edc9e 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -2679,11 +2679,12 @@ static void mxc_jpeg_detach_pm_domains(struct mxc_jpeg_dev *jpeg)
 	int i;
 
 	for (i = 0; i < jpeg->num_domains; i++) {
-		if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_dev[i]) &&
+		    !pm_runtime_suspended(jpeg->pd_dev[i]))
 			pm_runtime_force_suspend(jpeg->pd_dev[i]);
-		if (jpeg->pd_link[i] && !IS_ERR(jpeg->pd_link[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_link[i]))
 			device_link_del(jpeg->pd_link[i]);
-		if (jpeg->pd_dev[i] && !IS_ERR(jpeg->pd_dev[i]))
+		if (!IS_ERR_OR_NULL(jpeg->pd_dev[i]))
 			dev_pm_domain_detach(jpeg->pd_dev[i], true);
 		jpeg->pd_dev[i] = NULL;
 		jpeg->pd_link[i] = NULL;
-- 
2.45.2

