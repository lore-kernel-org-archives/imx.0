Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716BB111AD
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 06:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738564341; cv=none; b=Q/UV+AGbTIH3DMYmhuDhxi9GqIaFLnbM8oxujMr/e1CHrIh7Eeg3m1p4Gzk8kyj2Xlxxxgmpc0lLN4o/5x+lX0Ue0zpw4lpgj/f4OW1GTUUsPV1obCFPJfQR/wYR7M+K2SmNHunDHIyQOgVBZfkJ8R/XQJfig3Fpu4fy2IuhmsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738564341; c=relaxed/simple;
	bh=FJMF8I5ajPpN5Y2/kDQ/re4S2W3srhBYMde3V9Wgc1U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=px3ZAEt+RTpQweZE+AVgDF6bg7FnOPiqBp1/LJUSC4bGZgG+UPSHZ28TJa/4ypErBR91eIim9e7naPcP6oh+wLmseGcI4ghSSGh/EzJv4aPHYF1tpSPiosS0vHseZlHe4F6s4FpWwJ9b1nsw0RW9HQaKjeJaRS4Rhm5KLP8cYnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=VlV9tDY9; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=jIoQ29im; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="VlV9tDY9";
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="jIoQ29im"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1738564338;
	bh=FJMF8I5ajPpN5Y2/kDQ/re4S2W3srhBYMde3V9Wgc1U=;
	h=From:Date:Subject:To:Cc:From;
	b=VlV9tDY9G7jj5G081F5exjxom4xsU2HTL9jPqWWBTYxPbMpS1Opiy6OJ21NHQaB8i
	 CTq9QqDT7l6G2ZAiMi8PbyxR/6uBCAhKrIOxo3B1xnpPP5bL7cQD+MlmAIvbS73NZY
	 0UVOQJgFvecHVnk8rFe+LR+xiO0DsikQlljSZCI19Ls8M/IqKi+gzJJRGWxYtWwJL5
	 Dehji/xPHfMgD8l2e/PfUm8jsgqQKq6W2mdwRjAfReP4TyJEDazSqyoy6v2Hzc728j
	 se+S3z0QDKeEQyhcjXX12l0PR7N2obhA9kkvt3X37mIhPb/2ZO/ESxhhtWnbVNsgzp
	 Y6f0M2CLftr9A==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 69D5D92E
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 15:32:18 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=jIoQ29im;
	dkim-atps=neutral
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id 22F7E3D8
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 15:32:17 +0900 (JST)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2ef79d9c692so11714657a91.0
        for <imx@lists.linux.dev>; Sun, 02 Feb 2025 22:32:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738564336; x=1739169136; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIzZOYUpu+a9dZG8GPKM77gyMrEbYFRg9tCIw5HJ87c=;
        b=jIoQ29imulUUhOk0S1M0JHDnqAGRWS8G9r0cHt4HY2CBXPFbzyMkkXpu1azZ9s8D8m
         tlh3WBa+cRyuk/r84fDUmoiG3iEI4Z5p6FdLiXD9fxOE5UPrrVocSYtzAC+nFlN2MaCR
         s6CEFTiXpNpECj+jHbc8WjGmfiw9HVQ/LFTITEAA4nnKdEslmj31d05Qtxk9awgBUNK9
         nMhzTaGHUHNbgiHH6LuA2tkc2VRRq+5ssqv1eExh3N1gk50RmHRKrpqJ1W9D3qAq1Bye
         hHWpvWtBpjGBgeqcMz6xcrPp2iFI6NKNu47TW67UrNwx0m8Ys4rOIzykYZoWX9BEZ7TL
         JbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738564336; x=1739169136;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIzZOYUpu+a9dZG8GPKM77gyMrEbYFRg9tCIw5HJ87c=;
        b=wLUnaiBHNJsGxj3/o7HjypfW0a7DWV/Tp7loa+zoqRS5tIz6fdkS0VuAx2ohZIYJ58
         AQkKl2yyt+PdIjrK9fI6BeiUI1El6O59Vis/KjuXUmQt8/g/ZzhfoW4DoPa4BU0kJLGP
         0n9Dl8zfg/xP/arJ8F9YnZKub/wad9qEM0AzO3NcZY4wp06US5tYYSmdswG6b/BpgqXs
         fSpLRXpiYhCJNyS0pAwk3VWEdk5tJzMPfUvrAUIsA55BiqIu5MsYtXq20my52fYZROEc
         sA2SD5McyRNx9gOcIYRmhPz0HWzlO1vIByzk4varxnE3dIQNlgq/c4hxhxF71nhuJYHF
         vFTw==
X-Forwarded-Encrypted: i=1; AJvYcCXm2uLgsgf8NREsgVdYv1ncZEGTp4vrYivEbrCukh08N76TFWL7pFYiJGMKUR1XhCjxlIs=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxlg5Akw4HwlQKN7qWdKg1jj3dijVpSB/r5CjAVOk2yTEV7siTx
	NO8aWa2tZFoNitO0LNM+31mjJwqQq51PpojmxjE7ExPYcyMomdwaMFyFn6Bwt6ok/5u7YVESD4S
	2XeIvTsW4JBdIIKwFu0PzRpor2a7WYXJSrh7CbfTFoIwKL7g1L0I=
X-Gm-Gg: ASbGncvZUyIYkaXtD8xdb7672TnpQ4vIcXC8b9rBTKSj6BqwMmtnnMqLgElWsuOztlt
	LhaLeyJaXZ0ynM1RTeVWPYQrI6MrK+lfeVYEGD8G5yDf4d/eGbuJE1J1pUvAW4qdhS9edgm4f4W
	8AucCaPvsdMc281V3Wr2++jkTJn+ZX8wZKuZvchX0d4teNfHjx2DFObmd63LMQBRQMPtGo4oAgu
	nLGU0BxN9xaoek1sQC70hKcbHk12KU0t8eHwc7YslDsdTOduOD/ucBJlsQIABgytYOJGXfRlK88
	hYNWyQ1YIcYghBQX7XSWkDK5bc6YCxwXR2c5zyvOxupUeq2z0juFirer0+rWourz
X-Received: by 2002:a17:90b:2b86:b0:2ee:f687:6adb with SMTP id 98e67ed59e1d1-2f83abb403dmr28797270a91.3.1738564336189;
        Sun, 02 Feb 2025 22:32:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGarftDjJG90G7YVRs6D/mMSQKNkWuKkn3/GO4LgDIV8/LFojSbEyi2eC4i6UcBS8OPq8mV1Q==
X-Received: by 2002:a17:90b:2b86:b0:2ee:f687:6adb with SMTP id 98e67ed59e1d1-2f83abb403dmr28797250a91.3.1738564335875;
        Sun, 02 Feb 2025 22:32:15 -0800 (PST)
Received: from localhost (162.198.187.35.bc.googleusercontent.com. [35.187.198.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f83bc97ca8sm11556441a91.1.2025.02.02.22.32.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:32:15 -0800 (PST)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Mon, 03 Feb 2025 15:32:05 +0900
Subject: [PATCH v2] usb: phy: mxs: silence EPROBE_DEFER error on boot
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIAORioGcC/23MQQ7CIBCF4as0sxYDU52FK+9hGoMwCDEFA9hoG
 u4udu3yf8n7ViicAxc4DStkXkIJKfbA3QDG63hnEWxvQIlHiXIUlh3n66vcUDAjOSItlbbQD8/
 MLrw37DL19qHUlD+bvajf+pdZlFACRyKHdCBkedZ11vkhKhsf096kGabW2hePdwVVrAAAAA==
X-Change-ID: 20250203-defer_usb2-ee26f66a01ad
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1499;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=FJMF8I5ajPpN5Y2/kDQ/re4S2W3srhBYMde3V9Wgc1U=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBnoGLt/xToS2Y0fiRAeRpW2bj2YZIueibGgFcFf
 cRM6sb7I9CJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCZ6Bi7QAKCRDyimB/1oxx
 BxtoEACi2GSPB02A7ekZV4EL+vRQ2dOHbU2hEUMmX+7J8QYC3sKcqVuvfrNcujJrgbN6igycZgh
 hbo51gNKd/EkiT3hr6riNqiHGIYI+a/qCN454NI8Lbmq+8KWyvSV7PMUdLUufk+FlYjNirkNAfR
 LFMrmv5tmgX/WWMSIM4vkKoycgRmGQkWDy9hllRe5xxGSwRYPcnANeNP5lABU5D2IhOziKSwYc8
 JDVCxkJpWx6VQYloYokMpVLoKUbXECo6jmgWT9nvCWwQVO526POcXkHC+pzMSZx+/0UqDBjgheU
 ZTE0jw7MXNGAj1H0HEJrq19XB21yw91CXASMwjYGbz1acu0weFz76c+dqPsxQcl9XxFo+CY41sx
 4CM3xB0VLDqt0CJeqZMMZTX7cJ6b39VGLBBy+P/De5BfBX3fNZpsIRda6Vkg3rczkRiD3+Mqf1g
 Imo11uXVPQoyO2fl/UNrf2nmvTnmvgwOeCqq7G8V/72x55fsG/Yf2i9eWI1PkgHrCwQmqDKynTe
 KNo059v1eqjkG+QzNKSpTP1EoksGtT0UtzpGI4CKbF6xSFikAjG7jquQSAObj8vrKEkl6vv2YOA
 g6tVcepqeQtZmO6d7Vzt1wJ2PL1+hnZS9GUrVBx94HFxn0wb8ZkimC1/o9pHnIJQfaHAwXvhlH6
 BxGtCdrshYkKrAg==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107

Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
[    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
Changes in v2:
- removed redundant error message and now useless braces, thank you for
  the quick feedback!
- adjusted message alignment (that was also bugging me...)
- Link to v1: https://lore.kernel.org/r/20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com
---
 drivers/usb/phy/phy-mxs-usb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..39b75199d11c6f9ec21174c20d0465cb79c133fb 100644
--- a/drivers/usb/phy/phy-mxs-usb.c
+++ b/drivers/usb/phy/phy-mxs-usb.c
@@ -769,11 +769,9 @@ static int mxs_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(base);
 
 	clk = devm_clk_get(&pdev->dev, NULL);
-	if (IS_ERR(clk)) {
-		dev_err(&pdev->dev,
-			"can't get the clock, err=%ld", PTR_ERR(clk));
-		return PTR_ERR(clk);
-	}
+	if (IS_ERR(clk))
+		return dev_err_probe(&pdev->dev, PTR_ERR(clk),
+				     "can't get the clock");
 
 	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);
 	if (!mxs_phy)

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-defer_usb2-ee26f66a01ad

Best regards,
-- 
Dominique Martinet <dominique.martinet@atmark-techno.com>


