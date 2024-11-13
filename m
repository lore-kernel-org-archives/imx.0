Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32D3179956
	for <imx@lists.linux.dev>; Wed, 13 Nov 2024 07:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731483092; cv=none; b=goDVbwANaGKi9xTYS5uIN/RbueAqwmdbZ+AIaLRCqYr8iZJeSOMVCcGf1e5EW00p3/hHJ8E596cYbRIg/wlvfLGjzuqtiiQ4sf6JJZCTc3rvXAP/mpl62fatrOIuvnPNIORy9MTZcoiM0JoRbfqZlzTqsZ98GIJb8YkmKwSvZ6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731483092; c=relaxed/simple;
	bh=tmuSu2iaBDMllSjqEsXXqjaCbaHp1pOOtGHzUZ12VGc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/I1lfc8Gtexmi66woLoN75XiQNKv3N0t7KmOeZv0+UqkGT0BrAHotqY6Xl+IIQb/E+k5c8X1eykMejY9o1FPJi9PRH2FHj9vPlouTVqdx9T8BwjFwyM1WtgIwLfeaZNVRgQK9zdl3V7FYgUk3zhja2igh2SRXgrwv6SF+qZc3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LtZufE/d; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LtZufE/d"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-431ac30d379so57154355e9.1
        for <imx@lists.linux.dev>; Tue, 12 Nov 2024 23:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731483089; x=1732087889; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V4csWLl7Ej9wAFH627/RtOwQI0dYK7exWefQ0DxYMq0=;
        b=LtZufE/ddIXLpJc4zVcolFZ+SmGMtBbys83wAISIKUdWAsKy059AFL96xawBICNjG4
         vKQ/ZGOwg82EvOcdYyLHH3eujLvEV/jQ9zOv9F27UglbYC4BfBBZKmEPZPx+FQt/EAbA
         tux/eJuaWhDulXBlV7Oy3AheNsALGEsy2Zck2i1AW5mYwU69awre1I5Mc0x+S8uuNrUH
         8xONQ90CEx9oWIuUKs8k+zRDdzlfCZcUG2XiBV0JFTcIrIPP3LTo9hYeA38A8KKiWGxF
         hGganlfe95n88BnkhXpaE9VMtQ9/Rs9gdZp+aUngkeTTCgGCg8Ik9XUs2MVHcwF/69nj
         J7gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731483089; x=1732087889;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V4csWLl7Ej9wAFH627/RtOwQI0dYK7exWefQ0DxYMq0=;
        b=fzBchbkc0BeOGsuyGr3qAnwDuy2jsLvQB85jpQimClVktOqX5ZbebhloKQJn5mOmm2
         SXcFvn6/ZThPtQNc0dS+tl9h8ofRRbV9p7dVrksL/dNeqBnvCNTZeCW3A6/vZtXXdL/T
         T5kSU3jLgGyXsPvI6+CWqCrADLevaPUZl8M4zxYfe80D+hAit9HUKhN2JvQ084bDs6I0
         uObtp/UZ1ZrYmnPEo2rk7CTM1s63vrvsVHZvSAI7NHQzMuXrcrFwJ9XLgHTw3w6Cq3oQ
         mO+vWB3ALaWrIF8dw5gXjYhWPd6R/JkEEMFlF3We73HwEerk+iBqNcJu7+eHhIrwkg9X
         Dedg==
X-Forwarded-Encrypted: i=1; AJvYcCWJeB2vxrfoVOlW0V+cP/Sgnji66HWzd55pRydkibyjX/c+Y+zZJwkso2g9bZV6JNf9WbY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxprq6xuY/OZSkW8qhYYKAEPdEobQwsubDlp3gmraVbYa2ZYkkP
	62RjbLvBFnb9oZz81WRJLVoP0kUaul1H6qgiSHLM049WECkpbrKRkvTcVgdgtS0=
X-Google-Smtp-Source: AGHT+IFXhHLRS1YpnITs+WT4llH7CTWUIO/WdLiyAZE4altKKyOTrJjPAyh4aJtRTdM5ubYGkxnsCw==
X-Received: by 2002:a05:600c:a4c:b0:431:5df7:b310 with SMTP id 5b1f17b1804b1-432b74ff9b1mr168355735e9.8.1731483089349;
        Tue, 12 Nov 2024 23:31:29 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381ed97fe6csm17353305f8f.31.2024.11.12.23.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Nov 2024 23:31:28 -0800 (PST)
Date: Wed, 13 Nov 2024 10:31:25 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: Claudiu Manoil <claudiu.manoil@nxp.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Frank Li <Frank.Li@nxp.com>, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH net-next] net: enetc: clean up before returning in probe()
Message-ID: <93888efa-c838-4682-a7e5-e6bf318e844e@stanley.mountain>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

We recently added this error  path.  We need to call enetc_pci_remove()
before returning.  It cleans up the resources from enetc_pci_probe().

Fixes: 99100d0d9922 ("net: enetc: add preliminary support for i.MX95 ENETC PF")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/net/ethernet/freescale/enetc/enetc_vf.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
index d18c11e406fc..a5f8ce576b6e 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
@@ -174,9 +174,11 @@ static int enetc_vf_probe(struct pci_dev *pdev,
 	si = pci_get_drvdata(pdev);
 	si->revision = ENETC_REV_1_0;
 	err = enetc_get_driver_data(si);
-	if (err)
-		return dev_err_probe(&pdev->dev, err,
-				     "Could not get VF driver data\n");
+	if (err) {
+		dev_err_probe(&pdev->dev, err,
+			      "Could not get VF driver data\n");
+		goto err_alloc_netdev;
+	}
 
 	enetc_get_si_caps(si);
 
-- 
2.45.2

