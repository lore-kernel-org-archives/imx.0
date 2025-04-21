Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994B91D516F
	for <imx@lists.linux.dev>; Mon, 21 Apr 2025 05:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745213824; cv=none; b=EjISiiaHBrrAdmjnLf6VXXc6mjI37/E5bI/fiZudU0t6y7iBfVQg+rjhzlWOb6Wsz/2tbfqR3s0FJlmLs3p+yG1ylb3ABRzx+jB+xLEVJYZrm/wYhvCeYCl6/wkf34bBPa5yBEg/O1jqxVEWCy02X0aWp9EG3NCMTPAW8VypRT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745213824; c=relaxed/simple;
	bh=qnDuboyg3uC3ZM73XxREV7nSTfV+BWdos5WixRH5ZSc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RTJPW82TLavN05QAxxGNaoisNSRc6ucpzCYHPNsjIFdtKt2y6YnM0hPys8pOEtLXJXgdWJfcErRt9HMKijymonZ6AFH63wBItFv2+FBLbzFtKWhgnSRvJFRFYiGCY/sCNd8V46RgP+N8O2sgxMTuINunCHqOqpEoa8sxGAHEnX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wkme6bT2; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wkme6bT2"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-7398d65476eso2885283b3a.1
        for <imx@lists.linux.dev>; Sun, 20 Apr 2025 22:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745213820; x=1745818620; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qP16P958gYh46YoBLSFtpJ/M9EjZ/0g/N+HcV5FZKJ8=;
        b=Wkme6bT2PjLgNQntcgmEeWnAq1L3YbTQ+QQZRxW/8bFfnN7ntS7U2i0st4bJ1zad3a
         A66UUGx53cc5G7fYrl5Yqo8LwXWQRyiLHFng9s0Yww/+UZvgY3RBDmIOUcuSDLB46bt5
         qUSFM+wrg9gOk6xiig5c4U0uCKSeyof+VrSdv87jUJBtumro2QxAHnwgcQuwYULO9Fv8
         1MsIZy6AElqMI1SVgEltD6uTI5pGz8zCZyso8T37YViHXTmluRNe2kmqmHOM4gUBJGvm
         D3Y0ddKUlxqdiX9htMLOe7oaWemCS0eBGmEBgGdxkwfQdYjXCYnX+6jatpOa7VQYD6Ag
         I42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745213820; x=1745818620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qP16P958gYh46YoBLSFtpJ/M9EjZ/0g/N+HcV5FZKJ8=;
        b=I6mCuqMEYlxTCOd1bKm2vnv4icsQAWYhWKAHrvUxyk5hqODirZ/MJ52k1YHVwW10Mp
         5lNl6l+0KCGSuiFC4fW13EKKqb0iJmRNJsXGqiE7tDcP406QDrkjT40nD2j+o3ij9uHy
         AiyT2uq6+bzUrHuTI1uDo8qr2Q7AR3RV8+YtbbUOVXsfs7nCLEA775raPY8iCxKdH5rW
         5yxU21bSvO3xL5GNYpG7B+Bn7a4XGdbo+4jTNb3jVhc4BGUeRK9AdcpgsEbTJkUT67Bj
         bQ5PZUu5P43gpE56JEE6VwKk66RD85aGsHxa0GiR9qFv6mV3r4SkknZc81E9tnnqsbYw
         6OMA==
X-Forwarded-Encrypted: i=1; AJvYcCX/XOen0/5qhaSM1JrZhUOtm+whZQOUzmwNDh+x8svtS4q22vGQccBR/xH4sx7IRWNmOUY=@lists.linux.dev
X-Gm-Message-State: AOJu0YygMGlpmqU4Kut4kHeoT53h6HbvNFVWeWGnHdPifHJQdIfOCfU2
	qjJTr9uvCHZB7LPc1UB8WiQehArq1wWmDx7386C14+02jjKmZ2pu8XhDOKd4uYHImLzR
X-Gm-Gg: ASbGnctRnhPTjKQeyjNa2qNf6AU9OYh9KyzX6XTqgf2ukZ2XirrZU6Wv+Q7ejSb3fJC
	Brcg7HuDT+1me+HCMrPpb6ZjyD1JRl1bmkKN9h6AkY6i53Tbdpxus8Iu7nDDq0YxvnMcJBtdtx9
	cELMaCGEar3XFf7LdXVT0cAn4i6FHUS4zZhl2XKC/ftnzSzCaqYfQ/EQaOUr6sEtGIdSqHPDH0V
	a/oAzJupc3+UP1GAcVBCnvESh3ObnlyU7ClYGmVI0LOZliMDo65ZvL/RDOirAOexRrQcAzUKWWa
	kA/cp0vvbg5/Eu4ZrRJdzxhdPlp4ziECX3k=
X-Google-Smtp-Source: AGHT+IGaq1j44bIV9U9aAP6Lw87+CebUioUl2IXpzgU4JKDPc1gVaozyiEZcGrmNCAOWX4YZqafxgA==
X-Received: by 2002:a05:6a00:3905:b0:736:9f2e:1357 with SMTP id d2e1a72fcca58-73dc1b7d92cmr16890178b3a.12.1745213820426;
        Sun, 20 Apr 2025 22:37:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8beaf2sm5634270b3a.5.2025.04.20.22.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 22:37:00 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Mon, 21 Apr 2025 13:36:39 +0800
Subject: [PATCH 2/2] i2c: imx: drop master prefix
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-i2c-imx-update-v1-2-1137f1f353d5@gmail.com>
References: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
In-Reply-To: <20250421-i2c-imx-update-v1-0-1137f1f353d5@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troymitchell988@gmail.com>, Yongchao Jia <jyc0019@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745213806; l=820;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=qnDuboyg3uC3ZM73XxREV7nSTfV+BWdos5WixRH5ZSc=;
 b=9uDtFJOoouBVDqMeSweTMN8B5tBnbcf6uzO7/1YWRkgpM8iHl97fMt3EJ7tOaMIeXYzCFS9LS
 xyWr9Pns8uVDLFXmqfUey18aE+a/BSO9hELI++WhIAvbX4BdBLxZoq9
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=

In light of the recent updates to the i2c subsystem,
drop master prefix.

Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 drivers/i2c/busses/i2c-imx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index cb96a57df4a0..dd07fde79632 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1690,8 +1690,8 @@ static u32 i2c_imx_func(struct i2c_adapter *adapter)
 }
 
 static const struct i2c_algorithm i2c_imx_algo = {
-	.master_xfer = i2c_imx_xfer,
-	.master_xfer_atomic = i2c_imx_xfer_atomic,
+	.xfer = i2c_imx_xfer,
+	.xfer_atomic = i2c_imx_xfer_atomic,
 	.functionality = i2c_imx_func,
 	.reg_slave	= i2c_imx_reg_slave,
 	.unreg_slave	= i2c_imx_unreg_slave,

-- 
2.34.1

