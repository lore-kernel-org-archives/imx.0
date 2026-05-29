Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89A193CB8FF
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780051976; cv=none; b=e7NN1llAGBQjGeu/uWIe1jbMjOBZTNqsvXTUv1cYVC69woY2e8oiCGsa4iZ1F8wSnLaOiZOapqTBCZGHr0TYKugX05Np2BZoUgtU3J+C9gdwpOGppPuTQeg6SswWeQ0Xj3ZD/EnbkamjNyUVhWfY8yivy3io2BW8TPwxc5yrQaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780051976; c=relaxed/simple;
	bh=6mv4FnV2Lco8574QK6WdeYdtGY9CzSyYh+5KpNScb98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GhG4S4lj2q/STcneoeVk49i77YwdoqTdxQztD/MriW3R56LvYmO2ehW1lraMpHGQNWF28rUxuZnVwRb2Vr+uhvJGcHRZkMDR9zh12s57zumYcD7B7uaTa5yPafpBdvrAfac+C8DYshb7Chdxn0VxV+VQnWAWo/iJ5PNSZUnbjVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jd1tmrst; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jd1tmrst"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-45ee6d32402so919893f8f.1
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780051974; x=1780656774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+pkLvwI8vTIWszKqjFw4gyZw7rkDmLB3Owe1rS5Li2I=;
        b=Jd1tmrstlP/hgi57i+mNVlxccV5Cj+yAwuaYivFeQ+n6DtuHz5sVHiPGH/mred3qF/
         BFhDPWAaEBvUOsTKYRLUgieFr098DEkfAKCtnElPqYnbyb/jjFDlbjJ+GSnoqaSjV0BV
         sKd1DFuXxZKaeXGkf4P0QF4k2ytHWr1njCoTjrccVJ3jop65RCFHpKTFXI7/3AtYlyQW
         PW87Smhf5I5tnn7MaBw3aod8HEkr3SmGWOgDhftHDDiIOtNBW8ROHMLaRSfdVxNlWZow
         caIB5Zy8fRSqucNpBZQgCRC0MOoWYAoQhpt9xLZowcEptKP9U9B7T/6TYd4Wr6y2bHCH
         zrHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780051974; x=1780656774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+pkLvwI8vTIWszKqjFw4gyZw7rkDmLB3Owe1rS5Li2I=;
        b=tFi97tf0WU1nDGGzp705nUmB/ymY8pWqjX6V4sMfJnwV+ZuIHlTulTgrsw9kq7V5sV
         rUz/g9VgMaVkjemssBQ4596KIkip09IzbtBuZ/c16tdroCGeZ+6q16ZCfFb5hZASKRs3
         d5HHycCvfPUNrZsXOtoHW4nJh19fz/TwFWJq9TVs9oPhgyoy3rsowxlteElWut9Z2W9X
         ag0v7UkOO9EcVKfP6CVikSaLs8LT4ScvtCVmfb+OhaCSP1Bs/zkssAO/I1r4s5iO0YDP
         lBhio4j4uSjoabLqgVuhec9GCMvIGgQMq0oOU07STOKaOPeTxWfRuo2+tuUgapwoecI3
         UgKQ==
X-Forwarded-Encrypted: i=1; AFNElJ85RgsQhOg0HsiKXbud60GkJfVoX7Hg9XubvREyghpVJhn+Rb7hVCfheDyORk1zhqgvWeg=@lists.linux.dev
X-Gm-Message-State: AOJu0YwZHOZ94fQPIQ5ICkMhM2TaYgsi6ndvEFLQD7rcAQLNCMdSovRY
	Pk2fiZ6uGwUEUgB9KHcRudN1m8iFuoxFo3sesrfq7gaInZcI+2Op1BJU
X-Gm-Gg: Acq92OFcwFyINKmeYoWPQC+NOcHYIyn+D25To0iFGUDySj1HTCygxu+ttp7+f0aIJd7
	vDy7jmACCALeMY83AarGuQnj7gjjVbwsd0jAxfVZ8uNU8AuSTsOm/77li4kUAmjv5BSEwdE0zE5
	8+lOjl9gZ6J+AZpo8TviFvvQI+dSCrDa7eJVb4eOrNDyX9u8MowlgW02pdIFtRUhoDiTJUC73wR
	ddhFGMyqg7z0wH/vDSisJnj8CU0kgxZoGS3DrPHRIkrXX61bzTiD9cDrRetacn2SoumMcM9s5ev
	//yX94tSJ5hUzvaFPRFQ6U/PZH5q7B3zXqvnrRq9Rv4caWA/m2nlKVui+D0SbwQPLPmo6m2rDsx
	DSxF0bXht1xKEAVAzc2y0V+FnZX3vS6OufQB4GZNf5ZLNTqY3K9R4SQ2viU64Un2flVhaKpdQzZ
	sAhVrWxtAbQn7/VQj9EHyhwovONoyoPCFS2R41XGbE2dgycACW7Ez5JTNTl4ZQOZ0R/bldQuY5h
	/tT+fVmS1lkgiuMBXpexLJk1wUZqACIv9uTocZ1352P8Rc=
X-Received: by 2002:a05:6000:ccb:b0:45d:4a00:b927 with SMTP id ffacd0b85a97d-45ef144d81amr3284071f8f.31.1780051973876;
        Fri, 29 May 2026 03:52:53 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ef34a090dsm2541596f8f.3.2026.05.29.03.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:52:53 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v2 3/4] arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
Date: Fri, 29 May 2026 12:52:46 +0200
Message-ID: <9eac3663982e4d0c81e3fc80fbbee3fbdcbe5090.1780051874.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780051874.git.stefano.r@variscite.com>
References: <cover.1780051874.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index f313f168cfb4..37bae4913bcf 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -222,6 +222,14 @@ tpm-enable-hog {
 			output-high;
 			line-name = "tpm_en";
 		};
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

