Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334131E51D
	for <imx@lists.linux.dev>; Wed, 23 Oct 2024 19:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729710014; cv=none; b=i7+3KohYf+++P9TrGKP3nLFDLvTz5diDw2WEtU7MkDyHSh9lWNhX3eE9WH5f5QCVAFgoVz3p2tj1/1AbG7bReGdDM4fbDFfj78RFxLH4PxvE+PLkRzWuxwVRJ6DfBSZ4qqjGGD/lLIj4xfwcWn5blZrDB9EDiR/CKUMpvKmX5W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729710014; c=relaxed/simple;
	bh=nZj0NduciKk1HbzoMnOveeMw2oIQ9Ik3zexrd9nymEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pu1GD/VCBV7XTTYhHxxIMRJcKM/S0bFk68Nnp3v7zggIQyTAmvbFTqnVqlXb5DvteKU023RXBeN2iA2QhkT5/nHtH9dRHOG/J2qncutnCb355boyWEAKa82GoEx7ZfDD7QnuvTP+7GlZ9mJ4901FOYqTGPq15rQCkG09OD79ll0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BspDVBCc; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BspDVBCc"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e93d551a3so116422b3a.1
        for <imx@lists.linux.dev>; Wed, 23 Oct 2024 12:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729710012; x=1730314812; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J3smhQx2K2n9mAGJ2/sVtY1rBPZPgykalQxV0Rdjhbw=;
        b=BspDVBCcO1muvXWecw7GzFQvfkobaSvh8N4NzuKh2NMEfPfHT/d77OXdC28HyNdm7z
         NjhIwLCG6+ELo+slOjJtom4cnDUWW89d3tm0m87IeixBS5TxdtMT3fiMx8+3mev5/eep
         DPM8zzjenWIBtoolLwvT6KK5ofU1SQq0H+HyVxojrlG0FBTc//ekaNoxmh7riCprMVvW
         xz6u3Ty9OrinRUZNQ98NPmVdNqjZiqBkAZ47T5OndfT71znXp9SmsfpER5aREs7Nl1YM
         mYWNibsIXn1tno5nKHbOg6c0pK4tTbk6pczeRMA/oUQuUJY9T+VePv+RDhUui2wDHm4V
         cWLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729710012; x=1730314812;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3smhQx2K2n9mAGJ2/sVtY1rBPZPgykalQxV0Rdjhbw=;
        b=QdcKAUl0LUb7nKNrOqmMW45zykHDR21ypVTwKXYqviTVJ2DEC1Aes58RedbI7PxkAS
         UL6G35+CYy9j+hvkOXCSl1C2cFEx8iCLqjjiJkVaGmlrohjTc7pE3FwRjG7fp+/LN/Aj
         2iN2f6i+cT55KK/7jb0Aq6qEKHyd29WWBYsYCXKOetBjKJZaNuheZTedWE+Sp7jWjg0R
         z2o6uGpmB0WUCXowsF7eBxYZMg1pzrbK82SDRA16BrehvB9Hw3KmsTnS3GunxCORLgFW
         IVqNczdftw0Cq8pb/UR/zZnCSaQ437EmpK+q2vnUEcOxnHedVXo0OUDJtuC7HT/onvfN
         M3Dg==
X-Forwarded-Encrypted: i=1; AJvYcCUFpmkMEz+Kj3OFWuNzcDPLmBQH4BpimocG+iRHko0zpGiYwFwFNVEw1FMOGzwg+/9KcQ8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxjVZ1ZdSljRsw6dqoTgLe0SyIGiilHkNdgYoxpVf257sPZM8G3
	aNrc1eGqJklPeRjgfiZxfYDVNFj1gCOe6CI+XQ8Zd7XVJa3abNAp
X-Google-Smtp-Source: AGHT+IG+ltqDjtjEpQ1SU72hV+W1Jsd+q7lfK7P1134SjJP4RzXfRsSRUiNCovEcNQmmGpk8/7Wr+A==
X-Received: by 2002:a05:6a00:2302:b0:70d:2a88:a483 with SMTP id d2e1a72fcca58-72030999937mr4839132b3a.0.1729710012352;
        Wed, 23 Oct 2024 12:00:12 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:248:317f:2ba9:e66c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13336e6sm6698289b3a.75.2024.10.23.12.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 12:00:11 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH] ARM: dts: imx6sl/sll: Add the "fsl,imx6dl-gpt" fallback
Date: Wed, 23 Oct 2024 16:00:02 -0300
Message-Id: <20241023190002.1183938-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Fabio Estevam <festevam@denx.de>

Per fsl,imxgpt.yaml, the i.MX6SL GPT compatible should be described as:

compatible = "fsl,imx6sl-gpt", "fsl,imx6dl-gpt";

Do as suggested to fix the following dt-schema warnings:

timer@2098000: compatible: 'oneOf' conditional failed, one must be fixed:
	['fsl,imx6sl-gpt'] is too short
	'fsl,imx1-gpt' was expected
	'fsl,imx21-gpt' was expected
	'fsl,imx27-gpt' was expected
	'fsl,imx31-gpt' was expected
	'fsl,imx6sl-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,imx51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
	'fsl,imx6dl-gpt' was expected
	'fsl,imx6sl-gpt' is not one of ['fsl,imx6ul-gpt', 'fsl,imx7d-gpt']

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 6aa61235e39e..96f3c6b9e485 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -378,7 +378,7 @@ pwm4: pwm@208c000 {
 			};
 
 			gpt: timer@2098000 {
-				compatible = "fsl,imx6sl-gpt";
+				compatible = "fsl,imx6sl-gpt", "fsl,imx6dl-gpt";
 				reg = <0x02098000 0x4000>;
 				interrupts = <0 55 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_GPT>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 85fe2a4ab97a..5cab9bf577c1 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -358,7 +358,7 @@ pwm4: pwm@208c000 {
 			};
 
 			gpt1: timer@2098000 {
-				compatible = "fsl,imx6sl-gpt";
+				compatible = "fsl,imx6sl-gpt", "fsl,imx6dl-gpt";
 				reg = <0x02098000 0x4000>;
 				interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_GPT_BUS>,
-- 
2.34.1

