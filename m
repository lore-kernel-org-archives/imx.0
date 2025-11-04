Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A8B24A058
	for <imx@lists.linux.dev>; Tue,  4 Nov 2025 15:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762268824; cv=none; b=WkrgrTPjDjEw5iLcOBb3Q0jt0IjCGIStIJOdNSnpfGvadD8cYSnz3Rmn2DkIMGufUYlGSI+Ti9UCzAXa3IWAydz2MHqWImcSlwLjDu+gyAxa5K6MGXaMG2XN5GkHLARqWNUMFDE45xlZQ8AyNlk1kh0nuxHgAXutsCm49GyW1cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762268824; c=relaxed/simple;
	bh=+xLPW149u0EPQxrFFbkLg6mu/X+Jh93ibtFPT6VV7Pc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=raQXoeHsMNbz9XbscdkK2YAbfoBHHTNB/Dd5fvUqrMV1mP0ruaP7uV6GuLZWjDNZ+tnnh4dK0oVXnzpX3GJ1o9CjNLFZoPpCv0ntz52r4v3AChjl2Z0DFBOBMoTvYbuhivHkN456fPwVTOFGzDcJ4+rYeYi+oATD4T0jmyesUjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=abio38w+; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="abio38w+"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640f8a7aba2so538599a12.0
        for <imx@lists.linux.dev>; Tue, 04 Nov 2025 07:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762268821; x=1762873621; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=knoBTxhys0G5L6IMAZNao0/3R6GsTIMb0vdRqZYYHho=;
        b=abio38w+POAkQpF/LAPcotiaxY7elnEfsv/wxScPgT/9agZlh9iUGvqxlhffvNJwcM
         iDbqK6Lmy6kVVYLK5VgBVsOywvn7MFQFDK5CeKfIpoofk7BBM1hIsu3l99H/D867x6yl
         lMnwWlpM4Isu2w8V0uYmzlUfAfOo6dCfDAC0nzwFaLElQbfp06AnvRGdp0dNyp2AcvSA
         fYPkG8JfVmeVzGqUWzgl4qFCc+kqMZOnwDgnThoH9YKS31bmXK3ro0PAhQIBY6XgqGTa
         E/Bfsbx9PiyIaroHhz2bCEs9UxblCeIKlQOQM61dmcTXZc7vuunVDCbnB5wCgUPK7wNQ
         jzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762268821; x=1762873621;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=knoBTxhys0G5L6IMAZNao0/3R6GsTIMb0vdRqZYYHho=;
        b=UD/rCEvBfmpCFGMEAZNFT7Pb+MhopLqM9/1qlYSkm3P6HzIqZ4gK0VTupouA9IWkCv
         EE6ibXTzHKgMw/WCrgHrEEDb0okpAL/+fGR0pwMxgeVlN/nzZjAPvXpQDO0kCeomDA8I
         K4euYsVkSS3ulHilxTGk2Yazrbvx9k2J0UlGhK1jbbi1G40nam8RhsiZGmzJR6IE8w75
         cym2yXG3e3aD7gU+cfWr2A3yfUsPpMwQIKvEIaGQkBad2KKi8pQ4hRj4U00+1cHPC7/2
         FBCchvju4yrrj/StUkgpkgf9HEY/ZlSt7hLlE8hl2Qj8F/288PbP/B4iiF9ZZkbnU67E
         6dXw==
X-Forwarded-Encrypted: i=1; AJvYcCUUakSKOci5gx17Z2ZHWe2ogDwFes7pjw1fxKaxupYrGiQMtEaBO0oZKyG95E8mr2izxGA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyXZ2XEydghqlDOxJarrHb3n4uB3rfHhdO3ntwq0T5EA8df+/lP
	+pCuLhEbMeOm/BtxfW58eO3bwxMTMc66FBZtvlENPRID8YKmnkURnYAX
X-Gm-Gg: ASbGncuJhqehSBdv0PeCqt0QRxys3qqluqx+9cNrOCHlNLtEKFWrEpb3Y1DS0HuzkMi
	f69R3anFLZSxzZR4yv7Reot+Ap9526xz8UFqpf95UbkbVXKLfsX2dv7UjKmALOmdmsrJz2XpAMa
	EKBp9y8o9TI56WkrUZN4KdRSQ/9jF7eYjI00ziC5ByFfxKRDfFTgkg5icdtb87EPzQyL1idQnJb
	48yHEJAR4F1MlnuFYvxyd8IZkPLulONqlQwd4UHISblP347o/HIOhqpuKj/Kq7N6C/Z5Z5OR9rD
	08GvCxljNUC89zwuu1wGMemIc04BIySAWOJNOqg0m4qQnHF0Os+Ql0CTyyPIXfF8dAbZ1qGV6Eu
	yGQvF6TFJPL93qEWlPFahbtUqnoiYrwQ3WDtvO8W4v8H9x2+Zp5Jf3Ylol2ABx2NHz+9mSY7Lt7
	BrX42J/lBetqX3uLv0zQHJKnxupA==
X-Google-Smtp-Source: AGHT+IH3QQar3AAy6xFUftSUi+POCA8TYsQTXR01XqUsEDkX3Cp2Kija0BWAy5x9Z/zOTkdgKsJWSA==
X-Received: by 2002:a05:6402:350a:b0:640:976f:13b0 with SMTP id 4fb4d7f45d1cf-640976f1865mr10596262a12.12.1762268820845;
        Tue, 04 Nov 2025 07:07:00 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6805da3sm2342014a12.15.2025.11.04.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 07:06:59 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] arm64: defconfig: enable i.MX AIPSTZ driver
Date: Tue,  4 Nov 2025 07:06:10 -0800
Message-ID: <20251104150612.1874-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
References: <20251104150612.1874-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Enable the i.MX AIPSTZ driver, which is used for i.MX8MP-based boards such
as NXP's IMX8MP-EVK.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 03d89f29e7c1..ae5d32ea9fc3 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -271,6 +271,7 @@ CONFIG_GOOGLE_FIRMWARE=y
 CONFIG_GOOGLE_CBMEM=m
 CONFIG_GOOGLE_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
+CONFIG_IMX_AIPSTZ=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
-- 
2.43.0

