Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1F7263C6F
	for <imx@lists.linux.dev>; Sat, 10 May 2025 01:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746839936; cv=none; b=B3Orzt53tiE/5YXMOK06+I8p3FZVAzSQNFM/O5vBZDmRcXyosq9R6OIRDbSqjUnM265P25n9nMZacbRRALoHonBJXNPSLa+A4VK45mmu6Bpfm3GZxMm5gfnniBOSiLprfd9vXg7PqD2n+weTc/VG0hssgAUwxRzycuhQ+ZwLKjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746839936; c=relaxed/simple;
	bh=7xbc5LKo4AePgyLxenx40mfDo6sufo2oJ0TAz8Scl84=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ValydzWYti3LzM/E9KAQvhhEoa4j9NYkN88tUCb2vkzHjPuWKbdk+DrZpVRGlUUTD7dZ3NoDAqCMAZby+abQMnby7yaIXyRaD6sXyUTXa65bVUEwScyNypOlBFetHZP5F/GyaWy6KatWCYUeVYluUrCR5HkTYTpNYxxlFjE/4Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ozjk0oPU; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ozjk0oPU"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ede096d73so18603855e9.2
        for <imx@lists.linux.dev>; Fri, 09 May 2025 18:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746839933; x=1747444733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vKpKd+91Y2rLJn8AIBDEdxmAM9hr1jGqKMcPcum37fc=;
        b=Ozjk0oPUD4T48K6qBv7nkPI3vB06ksdw0jYiuFVYGfZ32tT+ihcXf+0uPwdfCTjzza
         zcKcj9B2mfWk1vimmSnVIVZ72KIyimqM+3J1Mq0gqi7Cv0JXpYkgEGKTbw9xXMCFDymJ
         184/pp6DI0jXxZXAVa5+RaMculdziV72C5bPvuoQOxQYOkLzPfKq9KQPRNNGr/fQ9Riy
         k/gG8rwO/8Jb3qIzV8Frmwt2hTefj+PKCJmaZ+5TZQM2SuaXe4fqYdqdJpE7h7Bw4O32
         dD9CcrUwH2SdhtAZkMBt6kci3PFlFb4Zz5YnxRaTokFsFiS6RHzAHTHDoGdlruIS7RcM
         X/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746839933; x=1747444733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vKpKd+91Y2rLJn8AIBDEdxmAM9hr1jGqKMcPcum37fc=;
        b=JDoTdMvpXg7RPEdM6kwdBxxdVONbHpmjkzHYLAKNhycrcXtp/ykuSKAvZQIG/Vw39i
         HW0bfAOGzd1RNBxt1e1HOgOKdhJu1f96Pr9zP3bXq+AOhLEXBvwJ8HhxvEMWtYd4f4Q2
         yizMsSFZl1ktS/JeHchgQtChSpt2MtJUkjqR4mYU8QDwiZlWlrSyi6y6IJ6dG1qKi/52
         +fleoT7rmGaMq/eWCzdNuTJoLrSt3zowxGySwSA8LQ9P26kXG1CB+TuslgyhBTbQgKQT
         S4NTMZ1PZ5EoowHxw6Gb5XpRtXgQw05U5+9J/87CnX6yZ5XpiYdihh/HL7O/EgnYpzEc
         aYiA==
X-Forwarded-Encrypted: i=1; AJvYcCVKwZgnLzgHICp3QqdR4vmuyniGDqytwUIPTfhAWFA3O4DgEviF/I57knxbpXex37n+nY0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBRdZzjW9pBXc3pnF2Hw9lHYIqKGUCOVgDyeW4StZ1ty2lGEQW
	/St+bhgZOrSNoiS+I+WYyeXtFjF/6dRX753DASijlgZ6jxBoT9r7
X-Gm-Gg: ASbGncttEZJkXVzQK675ypFeiMqXrGLq7Ii7agCb83Sly/+wQ4in2skMRZskqCv6X1L
	NvHafrkDjohjufAOugmCXuV5n7r0Vksi6dhc7yvGg0qRM7AyLcSTj9l/varBu8MeIe5MRygHBO1
	moeMHphNPGKimKkIXilKTo6xR4UHRftz0tiiFxaciO7UjHAn4PN9RtR+P8df7g41ovEyEnzYfXO
	9+PImklfEUxnwO90Bb2G6aPCuefW19aB2Vls9VfLaSmwuappZOHHLto/bgq+3fVzy7nqNK66Tcu
	omNw/dQhlfRqDvHoNhjUKeODVXwAizF+iM5l3nRiMHMmxSHLsLmvDz8zEy7Q9RJfGuHED4A=
X-Google-Smtp-Source: AGHT+IEE1Is4hilhLo2Uxeuzo3FKadxXFaI6HwNkhnIT+gx3/gSURBsGdbp9t8C674tp4Acuwl2tmA==
X-Received: by 2002:a05:600c:83ca:b0:43d:2313:7b4a with SMTP id 5b1f17b1804b1-442d6d18302mr54963995e9.3.1746839932479;
        Fri, 09 May 2025 18:18:52 -0700 (PDT)
Received: from localhost.localdomain ([176.206.99.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f0easm86967305e9.12.2025.05.09.18.18.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 18:18:52 -0700 (PDT)
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
Subject: [PATCH 2/3] ARM: imx_v6_v7_defconfig: define CONFIG_ARCH_NXP
Date: Sat, 10 May 2025 03:18:05 +0200
Message-ID: <20250510011806.13470-3-benato.denis96@gmail.com>
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
 arch/arm/configs/imx_v6_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 062c1eb8dd60..22edc6d17520 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -13,6 +13,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 CONFIG_PERF_EVENTS=y
 CONFIG_ARCH_MULTI_V6=y
+CONFIG_ARCH_NXP=y
 CONFIG_ARCH_MXC=y
 CONFIG_SOC_IMX31=y
 CONFIG_SOC_IMX35=y
-- 
2.49.0

