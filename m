Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4620205518
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 01:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765314; cv=none; b=jla8LkozRbGEart7pnNV2vfY1T3eoNz0SHxhWsDAaH2R85Awtrq1tfwTnkL6+lyakdNDm7SONCNAAEzlNxwmcoQnW4gheGFGJ8O62rOacuc6CHm9VcmF/xH14nzEkXuYsfcSQ+czlJ//syWPTGgIQl8d9PPmwd52811DhmqFjRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765314; c=relaxed/simple;
	bh=fxstSu8qzAdIhLAQYEClN5UN40X87p6oIsu6USwOWBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OJ0fWu9EDBgLy2PdYNsQLFUHvE3NXdCY1/BkU/ZrtxvsWYXqCWX64g4A3HpJM+Sz6oRv6hhEazYUNyuOVsa/aJvWWrdbgYtzLXALVC0ytYoes0wgGYlWgogkENuYyOp1HTFFWiPuCH8pZDgYs1QceI1vagOOkdoQz0Lcts4NRIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tcmak3bz; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tcmak3bz"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47664364628so2366981cf.1
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 18:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765312; x=1745370112; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Nq2Ww24LxFVqSq9jn2uyDgDeiQ5tXdDH9PjOgGJn1k=;
        b=Tcmak3bzCNJoRNg787mZQ7GcaqOyf+vgPX/TRdFEWuZr7HfPqHVi0EYJa124ZJhWAV
         DMsjfzU2rD6njHZBUCyT2MGGZXzQBjlBG/LMMjMUIBaF14tpKyVVqfg/4E4Lh2/Qu55y
         CNI8PpsIPVfY+00h+3P7l1jdVhh1hd01MjHp2LYu/Q7iRUo4ESCAE5GD5nmS7wlcwaRV
         qlpiaGAPX1vc+HdxKUVa2YxL7USfhhTRN57fdlNU5eMZUTvrAl3CZBqsjTWMJbw6Dzi+
         6Jd5KCPOxrkV07CTbRAG+bwPoz/wijcsJ7JXudIcS2ShXphwqHIyTp//OhgcT+Ekhxau
         kI6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765312; x=1745370112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0Nq2Ww24LxFVqSq9jn2uyDgDeiQ5tXdDH9PjOgGJn1k=;
        b=PqTTtrKS0XZVaXBuUlXlQuJx/AK2d8IT3lb1qyIlZ34M5BqXNnwlfMNnqdAlEKEytF
         RdMN27u/5sa4thKtfxm80QfLCG0KRZTAov6AFE9DjP0Oi3F1D9kERu5BL1cP/0UiLgoA
         OehPykcM+VNiFX6Ws+wIqC3c0/5gvUihePlpDNVVOI0Fbv/y/GgQRlooBU6P6WcYH878
         VVwk0CJZ1ZBUfwUzBGhqeUkSLq4F25ArBZD1buMuXYBKjoR/BcxmCXUtRQOlhUgOZJBE
         MB0pJ79iSubg9Et+GIFVtwzEIWjuxTPJ0MiydE+YvhXjMwCyyk6A+vf4XfEzFuGabSB0
         QfVQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+XY5IMRlyclc47GMJrYi29kKjjwsAwvfi/diRyVN35RBrX6B0lxdNRHhfrzWIpQ4Zlps=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZmUWHXP1n97YLHRAOLsd7qJn8gBBEd2zU1udspeN1pRR5O7R8
	kBD2cOiDZcQR662gV85GtvaOCLk3TcKcSmRDFvEmUFPC/YbO7jKT
X-Gm-Gg: ASbGncukjA1T5V+K4Aqim0HUkx+XAx9GHe2+VaSMmx4fan7PVonHyRzGY62JVvCWSz8
	6DR+KFKydHHoaUkBpj5YD53c+/JySD0IVPPkVRPqJZrvycxCtAH3CvhA6q/+TaZTzMtTDdyOAAI
	f9FOttwQ6bKk9EsTljb5amjfDmmb2J6FLkJVmvJevA1yh9yz0K9rdDpPr0hbtvXqBV/b3m9d+1K
	sMqXTwVb5bp8w+vS6kRezku+tddTMpHC7jKwPTI8FhuN5YC779q0tNdniTOLw5ol5Rmvpt2cWJO
	mRt+iNRTeXMFTbWmq84P3fzF+CXGfVkK4A65uUF5wKXtxmIi/38KKZSljyp2/NCJsZxSeeODM5d
	57iF/MxIzjiWXxds=
X-Google-Smtp-Source: AGHT+IFVbV/PtUyWDy5dJ4ZAzRjnbBQX/ZzVFdzXITZAv6qMqnv4IbtGbczYUR/sIYzqBUBHsjPsVA==
X-Received: by 2002:a05:622a:355:b0:476:5fd5:4dea with SMTP id d75a77b69052e-479ff080e97mr80895381cf.5.1744765311578;
        Tue, 15 Apr 2025 18:01:51 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:50 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 03/10] arm64: dts: imx8mp-beacon: Fix RTC capacitive load
Date: Tue, 15 Apr 2025 20:01:29 -0500
Message-ID: <20250416010141.1785841-3-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although not noticeable when used every day, the RTC appears to drift when
left to sit over time.  This is due to the capacitive load not being
properly set. Fix RTC drift by correcting the capacitive load setting
from 7000 to 12500, which matches the actual hardware configuration.

Fixes: 25a5ccdce767 ("arm64: dts: freescale: Introduce imx8mp-beacon-kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 15f7ab58db36..88561df70d03 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -257,6 +257,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1

