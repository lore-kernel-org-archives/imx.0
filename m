Received: from gw2.atmark-techno.com (gw2.atmark-techno.com [35.74.137.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2736178F5D
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 06:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.74.137.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738565930; cv=none; b=r3X7t75me/DxLY9uXhLyKAV+w5VIyA4mSVoC5ZPwq+gtPjNRF3sBnSDjkdt4eWoT/X0UFBJdvCfyipYWsjmmYBuVCtxw3rSjjKpBiAwJ7KhiSLtB2ELM8ZGiiCQX3LDZzLjCLRzI12wZkh2PBq5+8E9ns7TZarnpzjG5mv7qoSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738565930; c=relaxed/simple;
	bh=HpKfWals6gvV6hSueqjY8CYDxxN+av46LngYDKJxyFM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ez8V0lbboKjOmC8FmW653HEvovESYEKqqaF6/5KYFjCe7pJUPI1AFsnXYT4LgZnQoiVDgVWOvy4zu7+yoiDp9V+Youe6p7j/+4ED2cRhagD//RxEwpOCUxKvI2JXJJY76IQz4VoSROOKguULOPcXAzxcNsuV4DTiDzTeRfuZYQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com; spf=pass smtp.mailfrom=atmark-techno.com; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=JqvgvcTq; dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b=Y250JoYH; arc=none smtp.client-ip=35.74.137.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=atmark-techno.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="JqvgvcTq";
	dkim=pass (2048-bit key) header.d=atmark-techno.com header.i=@atmark-techno.com header.b="Y250JoYH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=atmark-techno.com;
	s=gw2_bookworm; t=1738565928;
	bh=HpKfWals6gvV6hSueqjY8CYDxxN+av46LngYDKJxyFM=;
	h=From:Date:Subject:To:Cc:From;
	b=JqvgvcTqyjnznVPI3nFIUiflcI3AyPupx8QgYBlAjNm0Yq8i2uzAICE8yaEewujX8
	 rcQ5obx/iGFJuAjpWF3EGoW1IEPh8c/l5P6e8K3fDboeILCJNYGLoz57W36MJGc+lM
	 cp/oI6NHj3yrdc1roasWP4nXmX+gQxMRDE+kklHuhCrv52PXdrsXvP7bv7V6220eoZ
	 ybtKg6Zj94kbiNnO0VwbfwPb450+tFUOMcM/YRfWWB/tQDo90ydf162t3qFv8W5WQO
	 j5u23qd1j+Ca8xHhsI4NlCJ5uRMdfZt24GIN/7exbThWp2US45FNtNMPT37ogB5qTU
	 hACzQuv/W5lSw==
Received: from gw2.atmark-techno.com (localhost [127.0.0.1])
	by gw2.atmark-techno.com (Postfix) with ESMTP id 027384A6
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 15:58:48 +0900 (JST)
Authentication-Results: gw2.atmark-techno.com;
	dkim=pass (2048-bit key; unprotected) header.d=atmark-techno.com header.i=@atmark-techno.com header.a=rsa-sha256 header.s=google header.b=Y250JoYH;
	dkim-atps=neutral
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by gw2.atmark-techno.com (Postfix) with ESMTPS id C37814CA
	for <imx@lists.linux.dev>; Mon,  3 Feb 2025 15:58:46 +0900 (JST)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21655569152so88879225ad.2
        for <imx@lists.linux.dev>; Sun, 02 Feb 2025 22:58:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atmark-techno.com; s=google; t=1738565926; x=1739170726; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11ZT4H9fbLzjQvrQILyhKp3+cau0oLWEvJGvUrDp0l4=;
        b=Y250JoYH30YFXw4Ct1Lq/r2pCw2Guu0St1MTT7/FlA3aQBDgegIf3T2ayHvbit1kqe
         QeptHZBvFY6DBDdR3rnZqWEUuqez/PBoC6fAVs3Any/MS13Q4Ve7D8UN+45jdtj/TM3k
         oBzYTLZs3INRz2MraxDg0BA5vKQf9VSnePoDtsIgkH4otw03FDPNYdYUE9OeHZ/MBEZ9
         5Zjcl39f45GJqPAxmrfXrX8Qu8GA+bKibf7MZZ5p5Pn/r9KltvfVUiQWmerYjSIwTAqy
         G3StgoBqywFxoya35xwHCxMam8qols8HB6wKBZL+lorr4cu7p83/Vm2uAJncDEGP+kRd
         6zTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738565926; x=1739170726;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11ZT4H9fbLzjQvrQILyhKp3+cau0oLWEvJGvUrDp0l4=;
        b=Phv+lTgWTVjBtXdDliU4M8KU9+BUDP7RPEbMckWBjjZ2yphWJVAMMzu3xBTDjEgsRN
         y1XuklscWQZhAefENu8glkVsiJRwZuz8PK8rZV8WjwEDPzzWlljm+7zlHGY+xhI+ZtvP
         Y92oBB2Fx7KemDluCy705mIXb+SvYSw0l0EmTIdVW+xGMmK2xYZ24O2s052OJ2jtz5c/
         spQ8oMfO3e3eAi0b8+FJrVkphim7aOlxPAOIT/wsQfI/UiAbnbx2hHtex5GeIwQ5yZHU
         qjbaExvTgw1dHdBFKccwvIfi4ZyXaXXC0LewQPhMkLR6WeclYfrFcdiy5XsgsFXFSi0E
         vhsg==
X-Forwarded-Encrypted: i=1; AJvYcCVnZ48buFcPf6YoC3E2o/fgwA2THc4YoZ3vaD9WC7AWUwmU2w4NW6xsrDn/rXvxNchUPR4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxtgEx2lwqJnOx/5lxtF3PyC54MLMjja3tEDzbo1NIub/G18cmI
	XUt4ihPK9aGXWQuCtAaOr9ySXoaqOZbg/GB12hBY7+/X0akRJV4Vw5JN49CwZmPnQn3vaZzvFvL
	jEL66YNrMPrphS500wrnl6duJGTVIwJKJh8kNZDVFxBEi/ODttqk=
X-Gm-Gg: ASbGncvWuOwOBPbei++GKBVzbrKHBPE2lFxd82T7iHaI97CFblCConG5ZQHYRyPLepF
	0YqXlEJJdvEozk4PyRbTp59IW7+zGLeEwllNuclglC10aeaXBV9vOFjn9e//lVVWoFOKq5UYybr
	skGZGYxAUB90wdBp17h5mP47MdYwC6Gvdh5JnbT7kMsMvMinfdpguf6U3pnZLk6OP8Bl9ppBmRh
	kCJ5n/QXXajMrIA7+1qUVTtkovS0NF4iI3WziltCQpxoCsaXiRYZGQptdB+ip+ho0Q38xMGNzkI
	22V/vkXJhnV+gNgQCtebTNwzA6czdcuynBPsVpBhpT6PT98yC7jOxXp5fAjJmaec
X-Received: by 2002:a17:902:f54a:b0:216:282d:c67b with SMTP id d9443c01a7336-21dd7ddfd33mr363334395ad.35.1738565925807;
        Sun, 02 Feb 2025 22:58:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFtPhFFH++bFRKPkUR0RSviTIbqX4KaViWw6lqaxHu4nVbbFwJqQuzm9j1D4TH/k0qb9akCSw==
X-Received: by 2002:a17:902:f54a:b0:216:282d:c67b with SMTP id d9443c01a7336-21dd7ddfd33mr363333345ad.35.1738565924336;
        Sun, 02 Feb 2025 22:58:44 -0800 (PST)
Received: from localhost (117.209.187.35.bc.googleusercontent.com. [35.187.209.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de31ee774sm68121615ad.41.2025.02.02.22.58.43
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Feb 2025 22:58:43 -0800 (PST)
From: Dominique Martinet <dominique.martinet@atmark-techno.com>
Date: Mon, 03 Feb 2025 15:58:41 +0900
Subject: [PATCH v3] usb: phy: mxs: silence EPROBE_DEFER error on boot
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-defer_usb2-v3-1-428182286ce3@atmark-techno.com>
X-B4-Tracking: v=1; b=H4sIACFpoGcC/3XMQQ6CMBCF4auQWVvTTnEMrryHMabAVBoDJS02G
 sLdLaxx+b/kfTNEDo4jXIoZAicXnR9y6EMBTWeGJwvX5gaUeJIotWjZcni8Y42CGckSGalMC/k
 wBrbus2G3e+7OxcmH72Ynta67TFJCCdREFqkkZHk1U2/CS0zcdIM/Nr6HlUv4n8BMUFVrU5VKn
 5XZI5Zl+QGqRpKf7wAAAA==
X-Change-ID: 20250203-defer_usb2-ee26f66a01ad
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: linux-usb@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Dominique Martinet <dominique.martinet@atmark-techno.com>
X-Mailer: b4 0.15-dev-7be4f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1657;
 i=dominique.martinet@atmark-techno.com; h=from:subject:message-id;
 bh=HpKfWals6gvV6hSueqjY8CYDxxN+av46LngYDKJxyFM=;
 b=owEBbQKS/ZANAwAKAfKKYH/WjHEHAcsmYgBnoGkiGAgewFMK0YZ3yZfvnyEBWvr/Xmg4ikJng
 7cJqrs3tbOJAjMEAAEKAB0WIQQoFSiLMD+txr0veJbyimB/1oxxBwUCZ6BpIgAKCRDyimB/1oxx
 B+L+D/44ciLQ9mN59Ny7bJdaq49k967IpOp18rI0KfriGa69NjMQEO/K5y3wjcY0TPuzMKilRvD
 zyBNlA8L166gDqfeFgLcQU8HXTM/3SpBBDhobiqwlPa90oz2i3q4aloqI342t1FoVHDufKB+cbk
 +3WP1FRNWHoueXQl1Uw/nehPEXdQB0gT/9FlYPNxg18gSy2M+eCXUqF2iPbYnTK4wrNgH/JUMDs
 I54fYL1X6T+oBi8frOQoWMpfXOWJ5smH8VKsw2QNOQw3LhgvB22N9fiiHjBOHiAE08D4rV9PhxA
 mNAygFkK1hI/ZU848NdtLKZU13IvB59c7iLgZG4IxaOE9oyTs2umM/TPftO/GgbLFgieD1SC+ff
 vdXd1bO5AYiRxryP4gQ1yJr/gxOjogvm+YmbHxiqjyaucTcJ7pedbig2xcwG7QQ+vzL/+oNRa19
 BLjCHARSk5d7zL2C+v+n2LpoUxmHy2hujw+HWsTmiA9Da+RVkPwDnhsCkfF+wsM6Wc3P6qmF7UG
 mgWiw25TJRPAezrkB4ymMPDGhTwhdvZmBxuOGw54Thh3GZ8FwDDSfwQsRPIemF/0bq6PMRDa0ED
 ScFwDUH2Bj70a2eFTFOMnxobUmPYM12xwMb6b2K1Cffl9DKRcqpK0aaxRsJW06tsFmNq2uhs3va
 E0LB7IbIEf+G3Rg==
X-Developer-Key: i=dominique.martinet@atmark-techno.com; a=openpgp;
 fpr=2815288B303FADC6BD2F7896F28A607FD68C7107

Use dev_err_probe to silence EPROBE_DEFER error on boot on i.MX8ULP:
[    0.127301] mxs_phy 29910000.usb-phy: can't get the clock, err=-517

Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
---
Changes in v3:
- add trailing newline to format string
- Link to v2: https://lore.kernel.org/r/20250203-defer_usb2-v2-1-69b3a941371a@atmark-techno.com

Changes in v2:
- removed redundant error message and now useless braces, thank you for
  the quick feedback!
- adjusted message alignment (that was also bugging me...)
- Link to v1: https://lore.kernel.org/r/20250203-defer_usb2-v1-1-2366f26462e0@atmark-techno.com
---
 drivers/usb/phy/phy-mxs-usb.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/usb/phy/phy-mxs-usb.c b/drivers/usb/phy/phy-mxs-usb.c
index 7490f1798b461c39c29bb74e1e57e0a4adce2bd7..7069dd3f4d0d9433d62d3c3b494c2f99858e1899 100644
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
+				     "can't get the clock\n");
 
 	mxs_phy = devm_kzalloc(&pdev->dev, sizeof(*mxs_phy), GFP_KERNEL);
 	if (!mxs_phy)

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250203-defer_usb2-ee26f66a01ad

Best regards,
-- 
Dominique Martinet <dominique.martinet@atmark-techno.com>


