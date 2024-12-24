Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2D8AA47
	for <imx@lists.linux.dev>; Tue, 24 Dec 2024 03:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735011310; cv=none; b=nCy1Q36oS93Kgvh5fDnz03t9Y8Vkweyut9+uT8sc20RO7vBCYDUnVmdrpQPK8B80sTQiIBpbBfxGKc6dfsjdYyaBuRS+CCuI1Vv95bYfj4W2PS00beqZWgfkXKy0eiTLKInmhgIIZthjllpoEkNGkam7Lj5eYcYdtueDME8xyUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735011310; c=relaxed/simple;
	bh=EG0Sqau4beoYU52EZ1pfjjsmXv4bg6teF7p2N+TGzuM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a/yqJ+38KjtcCqucJAVevPZkzTwhgMN/57RQs8qhYu2AE72hZvbPl1zDrXmEbIuzDNfTmGScFUBMQpLuD9XGHptXoVnZO3j0stUrFhU7AbTjv4SOptFDSzRW66+rkfTT2nqydxUEwf9sN1AbLL2KYcdaAx7dxSorIRiyNi33R1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=Kt5HV+of; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="Kt5HV+of"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2161eb94cceso32621295ad.2
        for <imx@lists.linux.dev>; Mon, 23 Dec 2024 19:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1735011307; x=1735616107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYWpRq+1xJQBocTKhhdOtH152ag/y1pcS32FvRM6WwI=;
        b=Kt5HV+of0dtHnTx86DXMUYTWWPKXXxu0Yc/FySBjeFsBwVkSbzRzPp0u5RxqQ/UchL
         kaYb3tDWIuHs8ER/sZgXnNBqW0n4+xDV9ae60+dfyIFVK50rkqinveg9n+w8bNwXKFdI
         9eWutzrIV90Qfy2aos7gjBELlNkLxGSZRWGag+Wmct4RC4Rug/wyOu60BH/udMf9Axi/
         Gdp0cvUfwewoHvZtbLCvTrfgRImpOoYij6sVETD+THGXzCMxy6dII0XJqww2lsSAHTFc
         xkoisKQXIuvjuNAvWYQYWDO0nv/Bgk7JoqLD0RbEcjet0kBXQ3r5Vg6u7jqSm77j/bb1
         J8VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735011307; x=1735616107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYWpRq+1xJQBocTKhhdOtH152ag/y1pcS32FvRM6WwI=;
        b=ZNeZFbKRiQ9oTq4G0PmT1YdIbbbd94M2yYQL1/Jlw4CwnPcYMtQhc/K9c3oJWSS21T
         f8hQPHNifiGY/G5+JQbJgpGYCOcDT/iujBa68e+OcexrVR8G9K5eKu1dWCiMl58AOvng
         Q4jENRxZvkQ3ORom36LGCJp8+aTd/enexpjgHFMbkakJPJtWXYGZCIOiXnHC1qfwbTJC
         8qyrUuzm5JS5LddIrab3A+Px/+qjhX0DUW3OBfkZup+ZD9uR8wIZtIqqkkuYcaJKuooc
         Ux4V4rPA4JbW2ZjTJDkCwWP/6pfkcvMr/o3qX9Ge163KpFKNLItUPUcqUvbL9Dmw+9wK
         yWTg==
X-Gm-Message-State: AOJu0YzEyOAS+qrQVhrOngsHQpbt1najbPUg+DQcApkv5wLhqVSFe70B
	AEvyYuSK4iPcPxbQq8HQx+UmabfE/N1A96BIimbXZnUHug1LiQQEBko4WwyhjgHtIqyCbJ1cjkB
	zAu8=
X-Gm-Gg: ASbGncsWbLWUt5lAOXd2FJGeqITgTWJHfhxszNr/vAxyzKf7deWSohNtWG+/HR9zIhv
	DQ1iyh4LZtYhZFW1fyrIQOWbh3VhYJ1xpCY7fNlxdF+4w8ssXgHwj6TruxMBYw8UFghcl8habj1
	Ep8ZGX5eLcQDUxiGnBZ5f+LtMjPpLr5Iamdma55AFllLx0ZPAjXXldvkI5zGeL9m3OaCXQebb9x
	OKd9ZkRhcqWgLBZHrafXb+eiVprNzAXh2oUIhbw3rZFTnC/I0mB3fhsDrX729Mz18M/FSRRTdUv
	JW2A49hM5deHX5UbqC2iqAn56qRCwyUejmnBHwBrsQY=
X-Google-Smtp-Source: AGHT+IEAqHFYrt1jNYrNMorMBx7/oxc08Zq63PTEfndEK5byLv8IstZ8xpO+mfomO9/4yPUYkKmPdg==
X-Received: by 2002:a05:6a00:2405:b0:725:aa5d:f217 with SMTP id d2e1a72fcca58-72abdd912fdmr19359517b3a.7.1735011306861;
        Mon, 23 Dec 2024 19:35:06 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842aba73267sm8016840a12.13.2024.12.23.19.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 19:35:06 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: imx@lists.linux.dev,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] firmware: imx-scu: fix OF node leak in .probe()
Date: Tue, 24 Dec 2024 12:34:56 +0900
Message-Id: <20241224033456.1312930-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

imx_scu_probe() calls of_parse_phandle_with_args(), but does not
release the OF node reference obtained by it. Add a of_node_put() call
after done with the node.

Fixes: f25a066d1a07 ("firmware: imx-scu: Support one TX and one RX")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/firmware/imx/imx-scu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/imx/imx-scu.c b/drivers/firmware/imx/imx-scu.c
index 1dd4362ef9a3..8c28e25ddc8a 100644
--- a/drivers/firmware/imx/imx-scu.c
+++ b/drivers/firmware/imx/imx-scu.c
@@ -280,6 +280,7 @@ static int imx_scu_probe(struct platform_device *pdev)
 		return ret;
 
 	sc_ipc->fast_ipc = of_device_is_compatible(args.np, "fsl,imx8-mu-scu");
+	of_node_put(args.np);
 
 	num_channel = sc_ipc->fast_ipc ? 2 : SCU_MU_CHAN_NUM;
 	for (i = 0; i < num_channel; i++) {
-- 
2.34.1

