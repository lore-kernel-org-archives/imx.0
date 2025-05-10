Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 978801E9B29
	for <imx@lists.linux.dev>; Sat, 10 May 2025 01:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746839935; cv=none; b=mA+ZW6UiX7xXmoDZO5WaoMFlSBfzWz5YiVbgvxlpCO+144CdTPcciIYaUbcT0qtPNk+meo3Kn4u5y3V1NalG3mB0GLFd6xTiLTGi6v8Cp9p6ShBNrk12UxfjwNNkvuEzXcoNVQ2WpinNZLAa/KRzeJv7cAu0PJ/BAQiK05axEPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746839935; c=relaxed/simple;
	bh=Vd8MLSTM4uqn7PmAmWXghKlh2fnrsmJaQbxTzGZOE1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gdrXrrtyFUxEO0Odi0qYQ0yrGkBlr6jKE8k8qHFcx9kW51hfyirkk2/guILQvN7G4UL3+bPasEtng86rm/AB5veiysjRBMBq1lKf7skUuGIrSXaVxh5CI8Gknh4/TYD6RDmLAIytRfj8WqLqCRrgCwGa9NHqwMy6t3WkXlAS7yQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dEzFg4jK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dEzFg4jK"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cec5cd73bso17757355e9.3
        for <imx@lists.linux.dev>; Fri, 09 May 2025 18:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839932; x=1747444732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sF2Bg8dFphUkCryZWbe4OS7qSU2jUKmCAqLckdO43HE=;
        b=dEzFg4jKB9Co3r99D4QTjYnRSt8cU3mrxcok7VJCdm9xrn0AdAFPi1D+QguJsk9qTN
         mCLRuZTFA9sAErxqx2yE3+ipiQykJEDN4pVqlpuuQ57MN05Ev29xuNZ0BupcjLq2gu9P
         ww1I0BFW3g/QBku5bV6NUdL80arbJABaobaPdwFJqbuIAv1BBbdrOQPRZqmgabzQFNEH
         J+LhNouKs8c5VAyxwgGVl3qtgxVTVEGjQtLYE+Hy4eHu0qiXpDcBPdpG9x0sWx6pyo4p
         RKr3Znp6SIAnwSBN9un6fmajnvDI40pinS5ocKheFlbR3yZ1M9bE3ydY2T152EcGFZBB
         ECfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839932; x=1747444732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sF2Bg8dFphUkCryZWbe4OS7qSU2jUKmCAqLckdO43HE=;
        b=p2AMlBtsIUi4V45Mk5Ajqmxn1cUHI98/Smz0Fr4SCayzXpMbxYHei93y2Atd5kVdIy
         e+AfcRh4XynXkuE8Tc4dOcTd59rlE2akGi/yNnLxBBAT5sQUZONSBBlHrODc4+jn989H
         8ftzuzfXyZfxQN0HEDGKbPtDKeUvpkoaALLnre/CG7XJRn1JiKpY/TW7VVDq3A10HBKB
         yRo1b5Um6jeWZLRoorW0kqrrt3f6UXpASMIaL6kicLqBvE6kLbu9U2rj0vlmQDjg7cIV
         zWHpbfI3Zm/Dp+tjImFkgmkpUV40c+Er8VDZGnkbgoFsF99Ka3Nwg4WJnhBcoDQW2evT
         6oIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzHom+jVLmpD2AAyhIHSVvsIDb6PPeLA145t8D5hSwh1mQoKf4KWZQ7fSycZLhU0htLi4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr476KnrINy+1Wz27xa8Zus7cZliAGgWhqfmr7Vd9xpOrk6RTh
	3mBG7UCZUs5WEBdQtkzp0aGx3JLAhXoQzR6N/LQxp0Vnr8mgm06X
X-Gm-Gg: ASbGncs5zu91pdPj60UOSyOFlTKLHsnbzhAAeyXL+IQgD/UkKGWvy4H8BMTH1Z7vmYa
	S1qoDwOBE36ikfoHMMSeZeqWCr2AxfklTm2tyHbw2gfEPZ9z/DRYY5JiMqWrNhok8spBrQmmLdx
	E0U+0PTEFKXgVAq/rDteqiaFkC3Yhk9sGUfmm2g1P0H0hG7dLha/k/FdyKglkG/KtXj/C7krxLZ
	UIU/zqEjdkp2Fr3x6X6TgMXdd8I4sDkttAZzQuFICfnmDMV9qS8l70N0jFVnzakZywUh7ncmz90
	UU97ApFIyfagx59XrEyzF8930SK03eAfsahwc4tdIrQRRuxmWFOXfu7TJMKhNz5+jJEUhkE=
X-Google-Smtp-Source: AGHT+IHYdvdXBuzhOXulslg3FcTy7/1wnjTVOQ8CVC6MbjHWdXZlynWwgpVoO+4Ylf2Y6Y2tzQn0Xg==
X-Received: by 2002:a05:600c:1913:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-442d6d3dc11mr49327095e9.13.1746839931663;
        Fri, 09 May 2025 18:18:51 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:51 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: Russell King <linux@armlinux.org.uk>
Cc: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH 1/3] ARM: imx_v4_v5_defconfig: define CONFIG_ARCH_NXP
Date: Sat, 10 May 2025 03:18:04 +0200
Message-ID: <20250510011806.13470-2-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250510011806.13470-1-benato.denis96@gmail.com>
References: <20250510011806.13470-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define CONFIG_ARCH_NXP so that CONFIG_ARCH_MXC won't be disabled
as it depends on CONFIG_ARCH_NXP.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 arch/arm/configs/imx_v4_v5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v4_v5_defconfig b/arch/arm/configs/imx_v4_v5_defconfig
index 875c8cdbada7..19e26b4a9fb7 100644
--- a/arch/arm/configs/imx_v4_v5_defconfig
+++ b/arch/arm/configs/imx_v4_v5_defconfig
@@ -11,6 +11,7 @@ CONFIG_PROFILING=y
 CONFIG_ARCH_MULTI_V4T=y
 CONFIG_ARCH_MULTI_V5=y
 # CONFIG_ARCH_MULTI_V7 is not set
+CONFIG_ARCH_NXP=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMX1=y
 CONFIG_SOC_IMX25=y
-- 
2.49.0

