Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C5523644E
	for <imx@lists.linux.dev>; Tue,  8 Apr 2025 15:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744126987; cv=none; b=pxkGWirVIMEZrgCsl4pmavLVmnYl+qcNglbhwNbg86szHsRBOLfYqjUKvggaheLwj36gSOMKm5PrSAp/eMhGWZeJgPzSmN4C/QF4WylmbvkEvJ4USlgf+BXYTLwvPVGVIpt7Rh9AnSVXV8ZV8mdYuYLl1mXbcHidWES/+LivWxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744126987; c=relaxed/simple;
	bh=JEyvW/eqJbmU/OCF5g6macBqJVG6TLDRzvb/ARI/GWE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nFux9O1Eu0Am+1q4eTYGkm0WM0I+tbi7FsqquY1dV9gT2JVXQI3Vzaj8iTE+kAaYquWgmOvFiNh7XUqpcdY+B1z0/w4DgYcIxYAt2gHRrkpGjmfyG5lphyQYl1elatzvWLQ7wVlFBtQpjxymT5r3S52Ru9Rpg6n0htIYTZx82Lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lijDLihO; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lijDLihO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edb40f357so31762035e9.0
        for <imx@lists.linux.dev>; Tue, 08 Apr 2025 08:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744126984; x=1744731784; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtG6uWcIXl5lH7IBHhdVeY4nZALvB6ooRyYGRnxDiL0=;
        b=lijDLihOtDwz0zXXQKlVKi5sz/lAru2lxY7rrbIb098lnvn1hyq/lvM/GQoCc03bqa
         cLYSX8x3XP0qB88rHd9ZKJwz57zyOn26gbGxkzvztjFf0XaGJb51MoM8vi1gmrvz7Drz
         nW2h0JNpYIXmdFVcQlPumpEchY8pBVEuzRaowAxZyFF7Xvin3GorJwZDAlNKT3wpUskG
         MTsDVdzxpOidr6CqV+uW7Wvnvn2BYwBDjfHY9GfCGbJHz+IZnA2kqruFNMrMgMaO8eHh
         Ofu06Ar2BLqWVEq2o1bLZzZzjfdXNyDmzmubk2kercZtz9vTIxo7oPvC09Q8Ud0ZahCW
         uhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744126984; x=1744731784;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rtG6uWcIXl5lH7IBHhdVeY4nZALvB6ooRyYGRnxDiL0=;
        b=efBcJ12zt1YNuou7Z7vvjaX7pF0V3HNGjVmYZwmM0TrtOhNagHEGKlDGjl3tz9D0M8
         27tqp5DRoSz/vFuUYLdZUsTvLUX1qcBqwdmAsf8SWkPNJ9SxIOFTT0i/IHwWrTp80Jmj
         9vsWcFfBkVtyiTVrkecakrl0DINkGFxaKcW3S13iyjQg/cskkcwOH0Z6Arpg+PKfeFBN
         QcmYVpX+dhMDz/ZEu/teEwm7hVBwUO3NjjRDRUSL3b5sst9fF9QU/8M2SmGVis+tzikU
         rbLvyq0hgYY6pOlbpJXFctLLuY86RJTFW7Yyr87CzbTVY/Ek7CWMXRJPKyLF660FUeAU
         F3Og==
X-Forwarded-Encrypted: i=1; AJvYcCUAm7XGGmGUDg5rLpBDlBzmtgS+u0PtQAt9BpoeWgibDecIoZeoe4DJGLSmiiQPTlFLtik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw1sZzZVRLZgXVG3rDIp8CemfO5npTvCd2taF/XD2k2mIyhRf4j
	SPfjPWl1t1b05YJXcb5YlLNRQ9M7b8OP4NvNV7wP/AS8Eomu6TUQ
X-Gm-Gg: ASbGncvHV2a+4GDL/HZHJJa1UO77wweNla6czjxfcDDBqy8hxtVCAcjjJ0Ebqf0LQCH
	N3yxLBMhXJKLoAk6ZCaBh9sJFU97xMdJqOgNWwYVkAnVHNSUWB3nweEjBfV9RkhIHyZVtZ5n9fi
	le2lZJ2nIFc8nLWUJQdQkRpHdX7NLWYMGRyYppVkgz+pyJ1/xfjAEICZlreo4rSLiqS6uYBqHJu
	1kI9D+aEcgshmKdL0PB1/3pyN9bbIhVTLk+3sjEqF6uvEO+xKZJCNufCl9P5AbH5Cb4LqvFitVe
	VyXZdJ6rB6+CAkyuvQ96WGKula96AHI5duHsGcuaXdxk44YL7auqallOT7/glTkv+64iTFYhCip
	u7dV/t9Q=
X-Google-Smtp-Source: AGHT+IH2pIjwLHd99OaOkEDJZzV3BxzBXMBL7iQPz/Uj8BamXLBLhgF6w37q7JaR9mEFlWaWbAKHNw==
X-Received: by 2002:a05:600c:3489:b0:43c:f0ae:da7 with SMTP id 5b1f17b1804b1-43ee0617025mr127689295e9.7.1744126983675;
        Tue, 08 Apr 2025 08:43:03 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec34be2e6sm164476675e9.18.2025.04.08.08.43.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 08:43:03 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.li@nxp.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/6] arm64: dts: imx8mp: make 'dsp' node depend on 'aips5'
Date: Tue,  8 Apr 2025 11:42:36 -0400
Message-Id: <20250408154236.49421-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
References: <20250408154236.49421-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The DSP needs to access peripherals on AIPSTZ5 (to communicate with
the AP using AUDIOMIX MU, for instance). To do so, the security-related
registers of the bridge have to be configured before the DSP is started.
Enforce a dependency on AIPSTZ5 by adding the 'access-controllers'
property to the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ebbc99f9ceba..f0f0ff5edea6 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2425,6 +2425,7 @@ dsp: dsp@3b6e8000 {
 			mboxes = <&mu2 2 0>, <&mu2 2 1>,
 				<&mu2 3 0>, <&mu2 3 1>;
 			memory-region = <&dsp_reserved>;
+			access-controllers = <&aips5 IMX8MP_AIPSTZ_HIFI4_T_RW_PL>;
 			status = "disabled";
 		};
 	};
-- 
2.34.1

