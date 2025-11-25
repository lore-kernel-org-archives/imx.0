Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B17C032BF21
	for <imx@lists.linux.dev>; Tue, 25 Nov 2025 20:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764102238; cv=none; b=jMvJhW1KvsLB8AND7ARK5Ky6zkeh6aOlvhe3JJcUFO2hm4MIcdCHUY8G/ekEN4x89THT64plCUIuZp8go8um/Kzz7X7QCDTY567FRz/MmqI2cn0qmx20GFp/bunsJloL6kugWRFxbGdmv7Pey/o7FpuMuVJiFtthanV3uys2nhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764102238; c=relaxed/simple;
	bh=WFDRo48TY+OGkYnJf8r9lMrykJuNpm83q+h1I+y4LH0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K2HHg9MSDlbx3OepN4cwYher03uMlLSBZeRpI/RCjWadLs6hqatbBZpZd3sP8az3IbTwVKbCexjxFimyNl1j13qM4gGXf9u5wVvP9fBwPR5PApq43Com7Qi/+l2ZhPMKGBu16uXBxT2oVpcw7cOTqGxu4DItOW9wSgmTy4dLyC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkLxJRx4; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkLxJRx4"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-297ea936b39so11175185ad.1
        for <imx@lists.linux.dev>; Tue, 25 Nov 2025 12:23:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764102235; x=1764707035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=v8yo3hO4mjCY+g/iV1oBOKZVnosI+hY7dYxVrjtrKls=;
        b=QkLxJRx48UsPC0sOgBTq+pJRK7pYfvzFDHoSNz0FnXMstn9JLD6C/g+e4592vo7Y3J
         6EKyp/lAgsFfHE7Ftl7R5d5HxLmV095+l5ShAjELUG0i8nSxh+KufcBY0ym1HEr/yTDZ
         +t11VkRENwJqYrcZzn1FKwBFYuKZhcaklodGjFunyyl/VlEGSFTdqpDlkp1h62fG6dDV
         arXSEaOYuaJ2BpLld9LcmIAltjsztENHoqsHIPjCnl5pBSo1qHIevW2HA+f1lN/3OtlL
         cxHjxyVG5Jw2dYSNSG5WQhOFX2gsHVOPIbVG2Sln1iBQKrtDghvU627m8IuxP4vNkxWJ
         +aKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764102235; x=1764707035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v8yo3hO4mjCY+g/iV1oBOKZVnosI+hY7dYxVrjtrKls=;
        b=BH6NYU+7qMJPfwJ87f/21u0Sye9gF3kMeEoSbalfJHICPHd9gkD/+pHe91QbIhdkyw
         Gl4fWsmKncd2ysb0V8d1UJ7S0az0CjLrtPASoI7WluMP7ua4eBTid0tkETDCjab4l+BC
         4wYMGMdzvwrKw/41IfZVCbpJEvhf4uQmwQ+WeikYxw4L6K3muA8UOhAVrIfMh3SUifvZ
         MF6uq8lKKw322rl14bJuSBXngkyqF++HBf9PQ0+G8A+Hq+rV+PMMkvQpy1vE3QYU79UW
         ZBB0ucOdU7sRsu+WoGymO4kI/rzzhUpmpZdi8IgrestktX9JqduHY5BRNe6/KAVfpKw1
         twbw==
X-Forwarded-Encrypted: i=1; AJvYcCUODnk14JTufVS1PNBYG6Ti1OJ3qACfC+5cfL3Cd2Ci5hYHSZJM8jU/LqLJBZfOwD+zcLU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfKlbP2w+9mXrbOQCA172UGCbsT6AtGDUALO6Oce9jBLL9S0i7
	UZb+aVYpnffN+GC76Zba59geksCUvfdQ5ovBcojzJZJupYbs5Z25R2dW
X-Gm-Gg: ASbGncuC5JKB8df5eyb9hqR7fDNwePNXt6lQ0G+MFYIOpKVmYWXDU7DJvd3ZyEWunje
	yZ7D3Il+lcrQ7UJU1uZURVIKNP7U3l99e+P4ekm/NT2B9VKq6Rh8UJ+1/AYcfpOcBtGM1trSvhJ
	/HgXnRFSp5ocfDJmHrxF7glyrr0fTxs6DCXsMfA3bjbpU/LST1LElKgb1bdwoPLb0EK9CcOfD2V
	IG8X3Z6n5XfE4js/EeumsZJmUq6TopK+fAqwxRca8ki4vGbduu9/xcHPs5xu6CCqaWODuwIbTPE
	zHAoOaqm+jdcB4j7pLo/6vxhNCbnZNFQJru+vgVmmrGOeljUheub9qMq7CtU9z+E9/GcxlMmYgp
	24Gw2U/zpijphQtccfW0dMZp9iqrSs/5tHiKPV3Zp5tOTG4ccOvP+NBt5g1q86b+YL3PihzjF8y
	ik92sZgqO3MME+3yQ=
X-Google-Smtp-Source: AGHT+IG3RTcRxFUsAo8usCNv69f81QaKk/JOFHEXI37wwk5ElPTb6WtM/qi0Gq+AIsPZSO6XeDWvSQ==
X-Received: by 2002:a17:903:1103:b0:299:bc94:7ded with SMTP id d9443c01a7336-29b6ff75aefmr104832265ad.2.1764102234966;
        Tue, 25 Nov 2025 12:23:54 -0800 (PST)
Received: from Kai.localdomain ([106.222.232.92])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b25e638sm176386135ad.58.2025.11.25.12.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 12:23:54 -0800 (PST)
From: Ayush Kumar <ayushkr0s@gmail.com>
To: slongerbeam@gmail.com,
	p.zabel@pengutronix.de
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-newbies@vger.kernel.org,
	Ayush Kumar <ayushkr0s@gmail.com>
Subject: [PATCH] staging: media: Remove unnecessary braces from if statement
Date: Tue, 25 Nov 2025 20:23:31 +0000
Message-ID: <20251125202331.36505-1-ayushkr0s@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhering to Linux kernel coding style guidelines (Chapter 3: Indentation).

Signed-off-by: Ayush Kumar <ayushkr0s@gmail.com>
---
 drivers/staging/media/imx/imx-media-of.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/media/imx/imx-media-of.c b/drivers/staging/media/imx/imx-media-of.c
index bb28daa4d713..7413551052ae 100644
--- a/drivers/staging/media/imx/imx-media-of.c
+++ b/drivers/staging/media/imx/imx-media-of.c
@@ -57,9 +57,8 @@ int imx_media_add_of_subdevs(struct imx_media_dev *imxmd,
 		of_node_put(csi_np);
 		if (ret) {
 			/* unavailable or already added is not an error */
-			if (ret == -ENODEV || ret == -EEXIST) {
+			if (ret == -ENODEV || ret == -EEXIST)
 				continue;
-			}
 
 			/* other error, can't continue */
 			return ret;
-- 
2.43.0

