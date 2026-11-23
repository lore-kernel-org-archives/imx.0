Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795454372;
	b=kebWGltM2jOYoSKSVMwwDK1UrUb09rqkANj2FZc8A7mZF+6GggVVWXHVoguk4AAzQPAm
	 gfkNP7gzvJeIGhYxQFbZO2ovXcjeYSgp74o7JKM9u4Kll4uBd5KOE/k+kDS+DKX2y+2LL
	 ffxKTxoDqxR4DZctSwgUoK7xkketGdhz94gkdRSq2YZMt6Lxi29AfRtNj8nm1jMKDddzE
	 nOPIJqils64x4Fluioii5zq46yIoj8WHtYNdfWJvPZ7dDTeBLX9jSRlV7wf3ukdJFEN1E
	 HomK14Zf5kS8Z7ls+r9Mzpg0vo7XBRqaouG6m++EkAHxbQrPBcmvxEV8OCTlgx4DQqg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795454372;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Pl5LlU8oba1tB9cYFDtFrGCDtd6q3xDmJZtY4vUlwMQ=;
	b=Mvjz075eYeI7g3I9KjPaDjlbVBi5lDLJ6oK0qEAYAd0fTgXB0fYDhbqF4YTu7hfpw9S2
	 U5PdT1QlciOPy749FN3oq44oQFoIhJRnA7TUNkiw5NvzADMDpH1u6JTWY6YFtYfsBp8I7
	 1Jde02NTes0lUAQEvA6lv0vQwr2GtYeBCu/NNjy12ibJAXNQYLFwDR61kU7dpkh7T1R2O
	 7S+UrjCf+fY6IEQ9NWn1cuuRdmZDZTpqcac+33cTFM4+LCqFMwS0GjBz46z0KCXA4H7Wr
	 aHm72NpHwIIHo1dE5JO1EzFd2j8h77tQwcNU/sbpBsBnZfroy/WtqyS48X+i/XkXwwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zzLdnhX4;
	arc=none smtp.remote-ip=209.85.210.180
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4088A606A31F
	for <imx@lists.linux.dev>; Mon, 23 Nov 2026 17:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4088A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zzLdnhX4
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8b67f25e6e1so1711805b3a.0
        for <imx@lists.linux.dev>; Mon, 23 Nov 2026 09:19:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795454371; x=1796059171; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pl5LlU8oba1tB9cYFDtFrGCDtd6q3xDmJZtY4vUlwMQ=;
        b=zzLdnhX4SSpNp5AeQj7se2q72dN0aOkUEUblyIxv/KraypjIFYIZ7R5hgkzVvZz92W
         CN5C+1ElJMCEuYVGoa8OxYTsq8WXSt9tD3MIMSPIscMpG4mb6Ec/+qanP36fU1zsjNQg
         c3t6ATG+xzR+aajMWY2fC1tG2i9BPIV0vcCnvtqPYFS0JWj9fvnrJxXkm5rNJYyc+Hk4
         i/gmGkrqGwEF+jkDj+VEt7QEuXXtcT4JDuR8Fv1xsb2ScYWgCtRfi5TsBw4DxxT1MuLn
         qLLGPMxFJAASNrs9peUrW0y/LsysrrQm+7SV5ABg4EwDWZhRETFavl8FIOe5P9KQkNso
         5/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795454371; x=1796059171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pl5LlU8oba1tB9cYFDtFrGCDtd6q3xDmJZtY4vUlwMQ=;
        b=e1x7Pr7DxfN0Ig1tvX6BXnZjfHVTJAXhXOG9QSM+sN2PuL1eWUEmFIgO7S6ypobrO7
         ZN5Ko5EMEeggcoKN2fAXiGZkHg3muhcPunPRaVCx5AuxI8O+XNL8TGq6B4l+ZT7E7QVm
         u3RMy0Qr1kDpM0CNmuGB/vg6nCER6oamXM8UkjVI7xOouy3EPYkJEvr3p3U/buWu4Vda
         a7X4o2whGTYw7wpD0ek77Pt9mzwlNVmvF3hTv6sHxOvwBxvN0K5zrhRPJ6gZCN8Pm8jt
         CQlFTSr64vqPKYEDO/uST7QsHtg04f9o0GVZU6hr/zf6gAotbQnS6Zf5R18TkmbD2x5Y
         LMkw==
X-Forwarded-Encrypted: i=1; AL+hErFxtTpx54mkBANw9LseHdWIEsr7f7Yzqhg/vc6bOhz7mqqmn+rw0Zi4TtsLLZI98YIypIU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8bex8AV+Z/wpclD9p+bK9+f1LzokxZUfTw2U3ql4p0DUTJnaRr
	0sgEmU+dMH22Pmygc9fb4RAKUk+9uy9R/el2e+3O1gR2Bwe0TegRxpc=
X-Gm-Gg: AZFdTZcW/XQ1l8ZJHZwjDkgt8V49fmEvpmjFn1/QsNya87JZtd5bJfaJPr3bY3gDS2M
	x9KvvD0w+1beL7FF8BFpW+rMM92S4pLpnXEOyk/QDJLdrm0CCHnQSkP5eMsneY9QMtvPZqg8xK0
	HcYJgqF8Vm/J7DTTAiAgVEBixKs6e0Q/QuYPx2jAZtilDFlDEpJdeILHkS4X43/M7irhsLvw4Y8
	TL++dWZ1WAgUiVz+j0Hycoc53n/VxnbS89vE0HZf7RuX5ZqCb09vWVbimTdnUh302Wv+UfNcl8k
	8nvkaA/nxZA+wUdCOLgGQTsGZfN0i/zj9iZQjWeyKZjsXgJ4MZ1Jk1TbyjBzl4zzFUTznkGsKER
	CoecNk2edpmeTXrEip2+8STHrpBHlhPM8DPGZZToZJKfgZCv3105C3vB7GiI3CqmjSDg0lmwzb9
	eXV8j3cz+WhmOr7H+sQjjgB4tCMBvVddlZDpVNjetrEE0nIOO7HPnPXzltZvtHMhnFNcChip13Q
	oES/v3Fg/XFrn5wW2AyJrkSLUi4gjlSiXAJGJDQHTswOCTQjchiUCpVia9vNSL92kkApGNLu3lq
	pgfvseH5MQLPi3uOvdHL+kCFnSYWTuDVK1i6nWwn7PCKQQefxGCvKFpVZ6pKxYNPZl0L
X-Received: by 2002:a05:6a00:844:b0:88b:76e3:cd8a with SMTP id d2e1a72fcca58-8c87cb4bc4dmr11130870b3a.38.1795454371512;
        Mon, 23 Nov 2026 09:19:31 -0800 (PST)
Received: from localhost.localdomain ([2406:3003:2002:639c:7883:5066:4773:c572])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c873c1cf5bsm5985151b3a.52.2026.11.23.09.19.28
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 09:19:31 -0800 (PST)
From: Yige Jiang <yigejiang86@gmail.com>
To: Ulf Hansson <ulfh@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Cc: Yige Jiang <yigejiang86@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-pm@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] pmdomain: imx: gpcv2: Take a reference to each PGC node
Date: Tue, 24 Nov 2026 01:19:23 +0800
Message-ID: <confirmed-20261105-18-6a8421e1b241@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The child-node iterator owns the reference to each PGC node, but
imx_gpcv2_probe() assigns the node to a newly allocated platform device
without taking another reference. If platform_device_add() fails,
platform_device_put() releases the node through platform_device_release(),
and the iterator then drops the same reference again.

Use platform_device_set_of_node() to give the child device its own node
reference, paired with the put in platform_device_release().

Fixes: 03aa12629fc4 ("soc: imx: Add GPCv2 power gating driver")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/r/20260530004541.E04701F00898@smtp.kernel.org/
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
AI assistance was used for analysis and patch preparation.

Based on next-20261104 (8b7179210b22).
Compile-tested: arm64, GCC 14.2.0, W=1, drivers/pmdomain/imx/gpcv2.o;
baseline and patched objects built with no warnings.
Static source review; no hardware, boot, or KASAN test was performed.

 drivers/pmdomain/imx/gpcv2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
index 6a54ee734514645db7e0628bdddcf579d1f0d904..7b377bf0196491298e9e772b97d15a2bda9ff83a 100644
--- a/drivers/pmdomain/imx/gpcv2.c
+++ b/drivers/pmdomain/imx/gpcv2.c
@@ -1513,7 +1513,7 @@ static int imx_gpcv2_probe(struct platform_device *pdev)
 		domain->genpd.power_off = imx_pgc_power_down;
 
 		pd_pdev->dev.parent = dev;
-		device_set_node(&pd_pdev->dev, of_fwnode_handle(np));
+		platform_device_set_of_node(pd_pdev, np);
 
 		ret = platform_device_add(pd_pdev);
 		if (ret) {

base-commit: 8b7179210b22f8e48a82c5ceacb9d56a9c4cfec4
