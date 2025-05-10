Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B1A264604
	for <imx@lists.linux.dev>; Sat, 10 May 2025 01:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746839937; cv=none; b=Z0AcYDMnRqaB1xqAxTim+PgssovBpapnrVND2Y3TU6SVJUCQHja5yj79gd+4gHPHaTUOQNJM7KLk6y8Ruopcz47sgyZU44fhxZuNp3581DuHs7u/aXO2xlnAYQgWH8h/YrXbaMH7zhD0/tvPyNIRZx3XJfg0BQWNKX6OFOiYDFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746839937; c=relaxed/simple;
	bh=MVFP26o3JRYFN82Czfr3I5Vz03DmDe+QuR/wItUQxJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qz9uPAUyogvNO4eFExxCUwaNhT5MVvgVg/Re3MwJ7V4Bl92yZlMC9V10XbXi4WA8o7x3ht1yqPHE5dIYncq2V2xTJhFP0Nj/4yCYj7ALwQuoRINeFmBuoAZTPT2nsINOCILcoRYAKAFBu0Wg0Cjth0xEU84VmG/tVH4VhPibGiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0rjE/Ij; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0rjE/Ij"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so19151935e9.1
        for <imx@lists.linux.dev>; Fri, 09 May 2025 18:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839933; x=1747444733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KcbRw7WL1aA35JdPyMCk8b9GQjgHfODnY0TIqzziuqQ=;
        b=e0rjE/IjkkHqKm8Az/lI/T2u8UapDlllCJaW5Ji4QQoLEJwPBO9HbDH3x/0vT1T8jS
         62/M5QZyfbW2quFHRpAE+mSTqIRBVg70M+HFXpOPgKPVSRwyrk0mvXfRSE2QIXxV/uqm
         CeD6Mn/Ybj3j3g788aYvvgg/j9ENR36wabCBWTSbq3kPLiKZGNx4wVweFiH8NGmOCZac
         YoWyZiDHcs05whpHLQ8dNHOUOpD3mQRF+5vqysVe5fBIdUdQHiJ2ZlrV0vi3eDnpTFVC
         W/AeVv7YVYVv2jMYKFoNXcC/Qya71AT2C9WksPmwhqhhHhYPDYRnOxd7ovOw8RBoGkar
         gO3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839933; x=1747444733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KcbRw7WL1aA35JdPyMCk8b9GQjgHfODnY0TIqzziuqQ=;
        b=FYsYJw8fHgSh3r525XDLwyAS7+0wkUbQ4zwdnhRtC9AeMAFTnRDfmt2PtOL9WwbR/p
         CKNlPZzuU4vfD5C3Iswg/YkExySwDl6fQXPveWHIAuqN8jIQ1eXsdt9thHWRQWfyJxJN
         +noae4rJp/VoOgeSrGoLVIBrc0ko7LvKoupBVEVjDbGTCg1F0koL8lCgbcrKXZNu2gaY
         frSqQc8avD4WWAFxc1VoMLjWJ5EPR0c0aSnj39NKPEtgNG3N2nBqcE4E3ovxRs76NPbL
         M/CjsLDIFx2UxuW52Bkc9PEh8eZUZwBPF+T+LXcGQhLZJKH8VAgkL0ji2dwm8gSDeHqg
         D1kw==
X-Forwarded-Encrypted: i=1; AJvYcCXm+wNpMM7kiu+RrwY/KNPwXAzMCdeF/4g8GnNQOapDIYPefrsnjSZICauCVm+PngXIWCo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxC1MtXfkb+V5KbJIWrYtqiXXQq8AjjO283trQ0KNmOdvfee8n3
	5ZLIMSuWP6DQurQORcJoaGWffEjnIknXPjx/ufhoSSQB5a9msF3E
X-Gm-Gg: ASbGnctN1jK1aeBHCZqSfeZfsbF4jxZpVsPkr1Gr/waiwAyXmAY4ahk7qU4/hMMkIQa
	/v8T8MXJvkPRBHUdxsT86bIiN0BZsQ+/LCZ06Yn6cM8KRJM86Sw3f3+nT+0tuOZmsxgLHGXFLPp
	+p5AbS92yC1KtMITAoI7ZKgkdGgmoJo/ijwQUO6WAR89DafxPmwUOEGEKXkuVvi1/NwcIrkbi4J
	+ozbxXDVd0iefXZfFKPYntYbZOjWHgEt1MUvFdJi92kp7GeyLKutWQtmi+aNU1dneH9f0kbRWVc
	Ifa33uwjgLOPz5cencIkQ5C/SpH/ZkPz3JDHstMG7QihOy1+Qnr0yVAVQjCCHNfBx080OZQ=
X-Google-Smtp-Source: AGHT+IHslDelJiKBr0u5zFkfUSe0cpcfUyw7dLCX3sH7zQ7C2K0jEXgxo60/V/aqM7KalwC2bIriTg==
X-Received: by 2002:a05:600c:8207:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-442d6ddcf2dmr42021515e9.27.1746839933274;
        Fri, 09 May 2025 18:18:53 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:53 -0700 (PDT)
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
Subject: [PATCH 3/3] ARM: imxrt_defconfig: define CONFIG_ARCH_NXP
Date: Sat, 10 May 2025 03:18:06 +0200
Message-ID: <20250510011806.13470-4-benato.denis96@gmail.com>
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
 arch/arm/configs/imxrt_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imxrt_defconfig b/arch/arm/configs/imxrt_defconfig
index 52dba3762996..7cc1555c0231 100644
--- a/arch/arm/configs/imxrt_defconfig
+++ b/arch/arm/configs/imxrt_defconfig
@@ -2,6 +2,7 @@
 CONFIG_BPF_SYSCALL=y
 CONFIG_SCHED_AUTOGROUP=y
 # CONFIG_MMU is not set
+CONFIG_ARCH_NXP=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMXRT=y
 CONFIG_SET_MEM_PARAM=y
-- 
2.49.0

