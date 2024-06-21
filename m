Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091115AAB8
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 06:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718951260; cv=none; b=WmJI9PSgVVDhiT6kq+WJvofTnKs3aXmusmTmfuBkRELv7CwEOi8DvRJPvhS3THNqlL6MKXCvOwnO6Bng6Q+Pq39xz8mr8HgwYZbLdutEMlqJzZRY7nPcKxTRV+A8FPo1btQR9+quGUrRrwDknsR49vbxbjOCE/N4Ub2WKLrNkkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718951260; c=relaxed/simple;
	bh=IwilEpxoWBhCfcRwNi6IPFn8TUid8ReCw/G+eRzc3ak=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u4KUrp1cJKtK8BKLoPCortMy5nfG8oOmBTb0ksxerMpb0YI/yH1mjBrpCJLBrL5ZLOxQNuTydLdvwuPvFjDsZq1THcems/pxUhaLhp4FZXxBcU+C0CGZHE3hWoiPW1AIwsVC96fTxf4mpFD25vVcigzzgdKdRaMmXJAFX2SIWPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QGr68PGC; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QGr68PGC"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-364cdfdaf91so1208256f8f.1
        for <imx@lists.linux.dev>; Thu, 20 Jun 2024 23:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718951257; x=1719556057; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmm2AP8HdLA0xcCQlwNYSdjRGs2bIdgqgz6HJe1wJBM=;
        b=QGr68PGCogJHQpt8S8ymDxZ88LrI7XKoKqnQIYyX5sZEOJ7cDALB15brc+7gipIptP
         XFUco2MSUZOwxqDU9QUCMWnEEIeBftu3dWXsa+9yTqe4uNAPrZLO+a64esAXC8DSwVYe
         dWSAGSGtBr2wA2xpdVfH2L7bqR2Ca0sn/96EczoyQ18l/oVB/P5Sc8L3GZ8/1vx4zI2R
         BhRZlVFiY5zGBLbzS0cK48bWz6Lyt+3dFCoU0UcVI9P9p3y7sVbKPPjnjYen8zMp8l3n
         oZwSY3rDYl3gP04Mo1x2nAA6UMRMp/pcHEhbLfCVHrqscZlJbtQaZf8q9YluhnWYAYCz
         GCGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718951257; x=1719556057;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cmm2AP8HdLA0xcCQlwNYSdjRGs2bIdgqgz6HJe1wJBM=;
        b=NqZG2anIEhKM11uIsezzCkldD2Wf77IN2pUj9a/DeW6LdJEPyrAaaqy795HTEeezdR
         QzvH+IMIcmT3F7qxCPxUZNFiVoVhVKQzMmBjA+vMUZyiYCENlp4iXSU3febI8wYK/Ub3
         squtWmKUIBOI8vk1DGMBX3FzuIJ8QSIMq9ao4HVKfL3bcu29aDbqLvtjWFFF9cA+hG6t
         g7eIkvAV8sXl7Dtptcc9S90DMVrbjRUhV1nHr2THTk8jVrhwWtVMN4qcHamTTWy52Lo2
         ucCQJKt1vL4EF2RItYyWYYoXLw9NrIPHS/OQYPTqD9o11SMwmS7oqeKzTK9zMhSGf5yt
         42RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVz6KqX6NCK8WgmAc7rYcyRwHrhx4W60OY6/rGxG+rgffRQ8vn8eMoEufhACq3cntCFUMKc27m3vtu5g7U/3FeVTC5J
X-Gm-Message-State: AOJu0YxERnbk8bi5jWfaEfR3xUnan8N9iPtkowIddPWAflg7TM8Td4IX
	3gkw2IowIpNnRHGDD58P9KBBeC/0z148eqtXJxA7JwaERBOGDqwrO94lnVvE7eY=
X-Google-Smtp-Source: AGHT+IGNuPtTUWoR/fyqtIISKh2Cu4R7v9ETKaekvIPXTadAHe0SolPNV0MLSDlmZ8gtZV4ZTWZwZw==
X-Received: by 2002:a5d:4e87:0:b0:360:89a3:5293 with SMTP id ffacd0b85a97d-36313fd379amr4629579f8f.0.1718951256942;
        Thu, 20 Jun 2024 23:27:36 -0700 (PDT)
Received: from [127.0.1.1] ([82.79.124.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366383f68acsm814013f8f.2.2024.06.20.23.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 23:27:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@linaro.org>
To: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com, 
 sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
 kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 shengjiu.wang@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <1713848917-13380-1-git-send-email-shengjiu.wang@nxp.com>
References: <1713848917-13380-1-git-send-email-shengjiu.wang@nxp.com>
Subject: Re: [PATCH] clk: imx: imx8mp: Use modern pm_ops
Message-Id: <171895125570.3618049.5200843914649548447.b4-ty@linaro.org>
Date: Fri, 21 Jun 2024 09:27:35 +0300
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 23 Apr 2024 13:08:37 +0800, Shengjiu Wang wrote:
> Without CONFIG_PM, the driver warns about unused functions
> 
> ../drivers/clk/imx/clk-imx8mp-audiomix.c:363:12: warning: 'clk_imx8mp_audiomix_runtime_resume' defined but not used [-Wunused-function]
>   363 | static int clk_imx8mp_audiomix_runtime_resume(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../drivers/clk/imx/clk-imx8mp-audiomix.c:356:12: warning: 'clk_imx8mp_audiomix_runtime_suspend' defined but not used [-Wunused-function]
>   356 | static int clk_imx8mp_audiomix_runtime_suspend(struct device *dev)
>       |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> [...]

Applied, thanks!

[1/1] clk: imx: imx8mp: Use modern pm_ops
      (no commit info)

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

