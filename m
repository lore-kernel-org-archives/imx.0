Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8945C158DD8
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 06:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738562966; cv=none; b=lcxI2/086WkTR8ldu1qPAsOUOSWcVP9kx0ICeIlxSBLbmjCdJjw0cs7kCHOLRAUBTHcdVztDkrl2JeHo8IPJ2+i2vUMAJE8jrxR+hclONebL7/+mPZDxaAnLPZ14VOGq7fd5ucpTW3+57IJ9VE+zfjuQissr8rPHyqP+qI5A2HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738562966; c=relaxed/simple;
	bh=rLWgZ6eUauYiCONMe295ObHlUI97EXwV/4fS4BXwZ0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pdnxii4Hk+8xugv+bLWJjFUguAYM5uh+bBjVGMfl3rEX44visVQUibfPQ+ccNJFK55VUvW94zHAG8Ak+WnNVymON8YBIAeYcDh05osmKXyrRDB64MEmAvJwJlyVOLBf7sCGnk69uD7Yn1unoozkWKLHDAUlPHYfX6muMmO7NcHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=wGB0swZB; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=BlxkhBYY; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="wGB0swZB";
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="BlxkhBYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1738562963;
	bh=rLWgZ6eUauYiCONMe295ObHlUI97EXwV/4fS4BXwZ0I=;
	h=From:Date:Subject:To:Cc:From;
	b=wGB0swZBkJNLieSdlrHaNVeqgtIWV8zIq7SuLSXnixGkA/pijRyc2cQ/IgmKPPpRd
	 3piLoAx026+UeD8RMhJU2jPHBqnLFGNGM2SFXJgV0g9SqspAcUgfhpo6ftSAYC5qVD
	 Vwoe4uBC3cmvI64J5fV2gl2vBC2GWOWK31Z9cUaclikhQkVMF0jU4O3n8bnZ9o3Si/
	 qMAaDozhG1tskkCYA9aXdP2J9+S2oGpIl6Dc2jAMYHdcecbyHZuZnYz94YeKCR9kuK
	 x4MD5otOK/5j1oJewE89feN/PkyfvSYMa4e5t4ocOuCaW8NzCEox+K7uFHy4dOvmr8
	 RWqZB8Iago/yg==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 758844CB
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 15:09:23 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=BlxkhBYY;
	dkim-atps=neutral
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 58A8E4CB
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 15:09:22 +0900 (JST)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9b9981f1so11459825a91.3
        for <imx@lists.linux.dev>; Sun, 02 Feb 2025 22:09:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738562961; x=1739167761; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d0sM4/RmXwuU/ijuwtLBjbi8cvcOWTlQXElR9KepwmM=;
        b=BlxkhBYYWyrheiMzel56ArrntoFukRmtpCn81b91Jlcq6eLQLmH8PSLzudpG4Yherd
         XvCgolH8z050sXiEPkyI5QLFJR6vJAhtp1h5petn+FsKFCxDre+p25pVoULaT3ImsChw
         o0+G2esTQ/Qhj9PQD++qMlYH3OQZvybQi7lRScHQS7oCz8LsIfJbQdjVFPbr+cT2JAp0
         u8t06nwqGGNHr1p2CfKNUkWZr89JFQmznyxc4YyG0xhktFC25Mrdj/022CYLNJqiFsgD
         2N6vLXyBkDpfcd+yYqW42e1DALjyyzMCNd1Hlwiemx1CSoG5s6Li8YtfJtrl30TiLkcg
         bhyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738562961; x=1739167761;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0sM4/RmXwuU/ijuwtLBjbi8cvcOWTlQXElR9KepwmM=;
        b=GUv9o9iDD7alTuuS8M2LCKLBCXRt4u41QCLvYvz6W9QsTdIIWRNz/WlUTS1qoEPGRi
         fBazrSZ5vRxL2Kvl67b2gMtW8IrMZnfBTYCjdgMn3s5hi3YcWbbTFURKv27yufrdJP24
         KORn3j29h0+3JKetISDaQrCf6Y5IN+Ojos71TIwwGPDiZfdx4VAcmc4virJOiJtzSGah
         iJ5lsaq8eoe5qM9/L6lZ0mlbX/e56xgDo8dt40UQCmI9WCpHVY9sbPQDeDyEiwbI5V/S
         eE/8Hijj5oz2z8tOz5HJxFHWlK84RbGmZWyl83MLhPvJt4+qKUuye5N2oU4oupyYm3Jn
         hZNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVo+aHUmT+Oqu5u1a3K7BcDI5RETPMZP/nJAekRQ96pdB/ptGLDXcuNTiKPOqt/8jLAN9U=@lists.linux.dev
X-Gm-Message-State: AOJu0YxGZoFqNXK2fWDnrAOO/yQRvAMgVpj5+ZyFyQOZIizKWh/CGfrJ
	jCE14k4TadWKfF1KK2S6QrSW9xYo7gBQyrtMHoEf5phsAuHt9zSEHEOINK5CRScrflokqjlFH5H
	8alCf24STIszjeq4ItJ9CIuX4oLykW908/i8z3H9euTd3xUoit/Q=
X-Gm-Gg: ASbGncvtQ1H6N+jKy4Yk0NNUsOlla2O3D1kW7Tl1GaFirXXPNqOiGThWgQvgzbnCaG6
	Oz80wLU97DszthJfzV0DjI6NvweteheL16LTt0jW5+Qu5tsbNBdmm0xHxRQyuRKvUQiUSY38zy9
	9es68Mna9+jb31eYn2qJn/AHMMmpsm1ZPrSJKa+4Oz1lF27Q5sh62+vBlLtGZkQ/8zUrRDQ7ZOy
	KZn0EqbUSgGpjIXE7PPPfw7tSXGneubVUIMeiUgR/+nJDatFDm6RAU7Lde3SWiN3w1oJfkruCYq
	EIBsJcWBLwF+TjOomAoCkTuHhzEQb7Lic2BBbOYt7u6mWuXLoc+s7HWjhUF/Unv+
X-Received: by 2002:a17:90b:5485:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2f83abff361mr29356011a91.19.1738562961380;
        Sun, 02 Feb 2025 22:09:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPlyVzISCSESRGQK82l9QvxGtfTDK4CsmACY7TnxikBjBA5eBNIk3T/ibndka6W854Lw5+ew==
X-Received: by 2002:a17:90b:5485:b0:2ea:b564:4b31 with SMTP id 98e67ed59e1d1-2f83abff361mr29355986a91.19.1738562961075;
        Sun, 02 Feb 2025 22:09:21 -0800 (PST)
Received: from localhost (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31f7927sm68024175ad.99.2025.02.02.22.09.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:09:20 -0800 (PST)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Mon, 03 Feb 2025 15:09:11 +0900
Subject: [PATCH] usb: phy: mxs: silence EPROBE_DEFER error on boot
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIAIddoGcC/x3MQQqAIBBG4avErBN0IhddJSIsf2s2FkoRhHdPW
 n6L917KSIJMQ/NSwi1Zjlhh2obW3cUNSnw1seZes+6UR0Car7ywAtgGa502zlMNzoQgzz8bp1I
 +rfM3lVwAAAA=
X-Change-ID: 20250203-defer_usb2-ee26f66a01ad
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1120;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=rLWgZ6eUauYiCONMe295ObHlUI97EXwV/4fS4BXwZ0I=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBnoF2O3a0jWTHdw/jtTOd3PohMx324/DljYO7n+
 O+T2jfpKJmJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCZ6BdjgAKCRDyimB/1oxx
 B4wlEACYkp3ePrAVerdSG7mZHg/um8PiPAEYvgNbS91eBPyCxdpaY3hktUcwRhuUXSUHcYuj4Ez
 el5W0YN4Gsf8q2k7SiEEZGxsUSSr47WfH6DMcKOUBmEhca6vxGze1iXa8Gs7LeSyHnzkHL4X2Lx
 QqtWr3AHrLbhhJy1DpFoaWl0Yw3agCI2z0PKp+7JGfuQ50UdC5LKq83mlhAYUccuEnMeUMRYAeX
 DodnrZpGIxbZUv1JlX6AoOYDx0qfUof2+m8yPq7LFuZbnbE3vlPRubDHJEeDjp+qWteTYZVujfQ
 kUkIkeH7xpPoDjs7DYfWsYozwCazQDhv8nFPaKfyDE2igikxm1StjAO5T4bluWKBzH/oaJTq1+h
 sdMBH2m73jBMxEfot4JOgAolJifbHi/bavXfLzhDJQDl2P1augT38S+XV0VBRpN9ssU3YV7sj/p
 PQNoOUw0eHcr85NPjb+LqI1s9SIctiFwTirX7On5U5oDOyL3OZ0/bOZ/q4BHEuoZ0B3IcuV794e
 8KlEntd5ZgzfNMQWJZnYsAFBFOQ7UChqTsRPlplU+uwmtOYwNmpWP+S8P6TtHFEpqz79AfjY8yn
 4kH7dH+ppIusR28uUAf+Q0dZYmzsNYDwIjuoQdwSstKKDyYTkH0+7gArO82kNEXdMi/4T2QwTmx
 TQVYet7/9LUejLQ==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107

Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
[    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
 drivers/usb/phy/phy-mxs-usb.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..dd2b4a5633934e257e792bbd61d6748304b5e679 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -770,9 +770,8 @@ static int mxs_phy_probe(struct platform_device *pdev)
 
 	clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(clk)) {
-		dev_err(&pdev->dev,
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
 			"can't get the clock, err=%ld", PTR_ERR(clk));
-		return PTR_ERR(clk);
 	}
 
 	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-defer_usb2-ee26f66a01ad

Best regards,
-- 
Dominique Martinet <dominique.martinet@atmark-techno.com>


