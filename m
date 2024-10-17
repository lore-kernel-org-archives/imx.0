Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516F217BEC8
	for <imx@lists.linux.dev>; Thu, 17 Oct 2024 20:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729197269; cv=none; b=R/d+L4c9krvOHxW7jVAQAWx4SisXqFgP0/RR8B95u5iQX+1TsfMtwUsfLFv/ljb3eLWjcRrH2lIZMf4W1MJ4qPdpr/gxymxYfskpzzTmJ71Lf5bBRxLcLlkfwKPYxfwHc1wyVd020/Sn0x//BNC72rqSkm9ECi+4oyHJLk7IqLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729197269; c=relaxed/simple;
	bh=DpHYpfP4wfR+URtc3nLIT4CXA+r4pWyOSFTF/zEameU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L9LOHDKuiJCki+poKzNAjhOsfIO4lKA2+u3ig8XBOGuTvISZQWQeAwpmCcWFPLfenPE43U/VYHOhx4GeIA7zyEnQF2CL7P+9IAdI83MqSgX2BxwsSbgfvvB8yhCp4nayrk4z+A3R05DAimLvldTsWh0NoB3Xs7YAfZ2XkZBxrQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=J28sbAzF; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="J28sbAzF"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a9a3da96a8aso218270566b.0
        for <imx@lists.linux.dev>; Thu, 17 Oct 2024 13:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729197261; x=1729802061; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tGfGq8AYZ7Nk9tfcNf0RUEE9wnLOSE1tLqUZ0uRmdU8=;
        b=J28sbAzFe27UQRT4iP6NXQJ+zSLCSrD5tvOaK9y5z84kUzc8QPYdz/0jpDM3qZoGph
         2sGqcX+O1SSNXOClPhfgF/s7B+fgke0uY8ChRzIcLObryBYqeQklFNReQyM4o8Qb+tlT
         8DIcPhqLf8KElz88P/eFEW3gJs+8E3cvcu1kKp19PtHtjFQTE4U64XtUD7EczC4kDZw1
         ie259CWbQerY2FPUhdJR1M5Y16kxSeoDP/lrIV8zu9HjtYoF0KyMfJn364A/inumKKi7
         BnfvF+EYDjo/4MXrgTp7lqPynBcAeHaoK2na0Gj5QRDZkx5mk1Nw62gW84Swy9Pvj0du
         TFUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729197261; x=1729802061;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tGfGq8AYZ7Nk9tfcNf0RUEE9wnLOSE1tLqUZ0uRmdU8=;
        b=g4l7isNaac7G1wEJ7uYxPH7lKxlsEp6UC1wRv6dOArO53mFO/C21JeFGuQN8fGI090
         4oiUIcYX+n3KBW3g5i1GmYJwbRH3f/M7AA+ONtc8RnPQAoZXQ7FfuZh7wNFtKABa+QfD
         IThuPRj1iMbmhNrL4qqyc5c3Xxu6DQCPL5600Q/KwNtePUSbgM4Ic/vVWFVZntT0XUtH
         HtyqCnY/dam//Cq/IBvg6jYfSsTBXiLOXyAETXu8+8G05ZVjNEMUsk28QjLzEa+rFkKe
         h+PoMR8oGYw0f4QXPDU+R7ZJAhBNBEPmho14YGErw/L21D8yANHXDLux6+tY2zfQQPlE
         d9Sg==
X-Forwarded-Encrypted: i=1; AJvYcCUXKc2aVElx3LsSMVHTE+++AChFbYbRSC+SVT+auX50RVA1xEpaV6DkwNtWl8c/z2Ci6fA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYK9Zc9ha9VzqIQDOnnURI9CKrXkY4l+U4gQ6dTs/C1KVjr6Jm
	0rS3/9DWvClaF9OxIclz3GENBH5PbAieFxBHh9EP3sWc8YfOgbn/ZYy0T3yyeJs=
X-Google-Smtp-Source: AGHT+IEmgPvX1kkIRYEDJUNIKySkuA4+HXCNFKzqTi2T8I5tzNgjLRaV5zSnWNszCG4Cmi9deiEQMQ==
X-Received: by 2002:a17:907:9404:b0:a99:ee26:f416 with SMTP id a640c23a62f3a-a9a4c2ef2a6mr454115166b.14.1729197260600;
        Thu, 17 Oct 2024 13:34:20 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a68c284dfsm9818466b.197.2024.10.17.13.34.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 13:34:19 -0700 (PDT)
Date: Thu, 17 Oct 2024 23:34:16 +0300
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
Subject: [PATCH v2 next] media: imx-jpeg: Fix potential error pointer
 dereference in detach_pm()
Message-ID: <ZxF0yOCms6cldOlV@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The proble is on the first line:

	if (jpeg->pd_dev[i] && !pm_runtime_suspended(jpeg->pd_dev[i]))

If jpeg->pd_dev[i] is an error pointer, then passing it to
pm_runtime_suspended() will lead to an Oops.  The other conditions
check for both error pointers and NULL, but it would be more clear to
use the IS_ERR_OR_NULL() check for that.

Fixes: fd0af4cd35da ("media: imx-jpeg: Ensure power suppliers be suspended before detach them")
Cc: <stable@vger.kernel.org>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: The buggy patch hasn't hit Linus's tree yet, but it's destined for stable so
    add a stable tag to this too.

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

