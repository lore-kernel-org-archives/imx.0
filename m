Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D141FFC45;
	Mon, 27 Jan 2025 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737982007; cv=none; b=K4et7i0Dh7JPFhDNTDZ7Vz2qT7ME0EcJgP0ZqcfSThc9R/5n2fRss50eoLZAUd4X+7l98BdclnIKBu2VGN2IhkPkNQlb7xJAJJ2GxYo2XbRTnTszQtwx91azFaG8+HeB/xTcg1NCOf45jNkU/4f268sNy6CBRNuQvjtOjT6X1+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737982007; c=relaxed/simple;
	bh=jtsYpUlRDrqFp7RoesBiE8F7bGnmxPqG1z9eHllOyN0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dNdSh7gB098cGdZeaVMnR2z9CtVQ47jC77+hIsLvXdOs1yqQj4Bygy7kTE3ysj7WWtYrcvJ0/lRJNIY0W6u/gtzIM66lV/p1uUGLeDS+AAtHZSsC1qtIg8PMtf7CWLBTQfHbNkrVLasQnD9n2tJKhMtFdHaltWc9IRzlOct1OXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KKmLTgmQ; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KKmLTgmQ"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so2174944f8f.2;
        Mon, 27 Jan 2025 04:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737982004; x=1738586804; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=99yQJvw7FpzRgdFhYow/5Nzmw1VclDAyJ3HG8KXeU6I=;
        b=KKmLTgmQk1I5i4gfoCcP0Jh1sdfD2LP7gbpcgUVcWeaQc1S2d4oiIotcCGppLOTdtH
         SUIOswcqTAAMdhhqCy3rpRja+NzJ5LswVWEGk4GYsoDuoKxzM1shM0nfSQyfz+4LM9DS
         ab7VaX5QPfa1iv7ZqPlgT6EE24gKhNGsBHPf6C7kvv2EZpkJdgA5zIydDfJ8kY8lLnnG
         O4MzeyqCR0Y2vnae5BcLeLaP9nvymxN1trl6yT/ot0rd+0ZmbM1Y4kz2sC5M0fUVhV1K
         04rBY1rCg3/FlLxU0pV+YEfZxSWQnN/Wi7Lv+sJemcQGxKL50wTFegnuRF0LjpgayR+D
         THSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737982004; x=1738586804;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=99yQJvw7FpzRgdFhYow/5Nzmw1VclDAyJ3HG8KXeU6I=;
        b=PHFk/nG4dG7OyENzVyMmGeOZ/+1waId9nAfuW7pwmVn9cHDv1GAE8PMm52JSv3ubUA
         TlJ7n2ITx3mBNzbe3bBn/8xuYqLGc0Hn+Ezr4OIHEhDxOuL7No0+U8CCyyWQxKJ04geD
         gM6p6KmYoGutzhP97clbCwroAx4B04iOsFjaukJs0wVORfHG0IASBAKkM9D2hdkUXBUz
         Rlzl3TYcBedL5LM28UTLF1HMdCr6BJG7BS+aIhbPjk3ey8HoKW49mYbh8JGranmW7ifq
         CgGDLGF8StdBlEZNao7TJ7iz0h3lvgajuURGw+HWvpi5SjmjRdj4vArrpnoPad11uAkp
         sE6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVxICQ/FXRjsfdJAaiLeulBZ4TvJmAXG3VSBStRFG0DAsiNrfmPm8+PGJMD4l2R+t5lO3r2W8148mpNvbk=@lists.linux.dev, AJvYcCXwKzHQUX6P7Fg39ln+ZV9PZpCmfGPqiKiwa9+6PeWSNCZSpiigBHtE1OUhFUGISw6O918=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2NNlwFi2utkJWRXt/0gx+OtfxNZVc5yoDnWhoB3ZXc5mVomUZ
	jSOPfAUccyP2IZOcQXcsj0s7o1HLWBHHjTsMECYkCWNJyGS4K5Bc
X-Gm-Gg: ASbGnctRiFJssYryflzcEBguuPgK/4fj4yah+6gmtBpl2zVpxmwF0UFIAtLBC+ORsOp
	FurgRs5meiLeK1PSkt8N+FEHPdaIL5oNrp/7P5IhBbFgk5kOs8obJ9YAdTuaDVVtPN/1EeYD7C9
	UomWfWZeBdAzZphBrDy8hkaw0jyHJbVa2I7Otvl3L1thL9M+XYjtYFizH2y6EqUiNL/X/+FUnIk
	fbFL5cSHzJY9oFou3Jl1rNoMyXb9Lfww7WTbpoYzui6NdPvz3rxDIVbeXqu+fpF1OmlDf6Xc9P7
	hcl/
X-Google-Smtp-Source: AGHT+IEzXfi1CJNqlEJYIv0M8GW1g0R+EoqB1v8834fNOrIJA2KY3Jm1vR64nhkSLO1a4e6G7kWiBw==
X-Received: by 2002:a5d:508d:0:b0:38a:673b:3738 with SMTP id ffacd0b85a97d-38bf5688e01mr32366544f8f.33.1737982004137;
        Mon, 27 Jan 2025 04:46:44 -0800 (PST)
Received: from localhost ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1764c8sm10813557f8f.3.2025.01.27.04.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 04:46:43 -0800 (PST)
From: Raphael Gallais-Pou <rgallaispou@gmail.com>
Date: Mon, 27 Jan 2025 13:46:02 +0100
Subject: [PATCH RFC 07/14] ahci: platform: Switch from CONFIG_PM_SLEEP
 guards to pm_sleep_ptr()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-pm_ata-v1-7-f8f50c821a2a@gmail.com>
References: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
In-Reply-To: <20250127-pm_ata-v1-0-f8f50c821a2a@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>, Niklas Cassel <cassel@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Patrice Chotard <patrice.chotard@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Viresh Kumar <vireshk@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-renesas-soc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1273; i=rgallaispou@gmail.com;
 h=from:subject:message-id; bh=jtsYpUlRDrqFp7RoesBiE8F7bGnmxPqG1z9eHllOyN0=;
 b=owEBbQKS/ZANAwAIAechimjUEsK1AcsmYgBnl4ArnbhTeHcXctkkP5+YTLsGuNIu3latgSJOo
 K96meEhDp2JAjMEAAEIAB0WIQQgmXv2E+fvbV/9ui/nIYpo1BLCtQUCZ5eAKwAKCRDnIYpo1BLC
 tSKXEACZC2yDU102fcE/qoyz6wlJRCDZkBrZO7Mia21i5SUuNDjLaYr3DTEd5Rl6C5JUr6CWRK4
 AOyqi417PD/PwNi6a4MhVe27GmYTqJ1ZFgG/vUOWhrKzokMjs1PMH0E8jvWjseeqgWw31ngGDcD
 wb+QFUPZs7tJ6IB6f6hVeUox7rUiVvjuyZDtR08VND5UhRXXG57I+ZkkvniQUJLQt9ZzbPNo4x8
 gGglXMk635txYfzMQ+A0s5LF3u4U6hVkmzYZ8+sPQDi2PvmdpdnJkwMX2FTgHwr0XnB72bsHazE
 Qd+BFCSx8dBGTmad30NQCFwTPomf0/SCW67dfkeQDBesTZxl9xumd7bxs8M1put1RHaJMM+G7cO
 WAjaN3Mm3kuJDjWHs+jEaA06rndfPYhgqewwkWucfergWLuo2MD/J8y5xwqmmQ9wfe6aeZ4rxsg
 Zu2TQUs4WpQ17vauPW4myryEl2D4bV0ZCUhldINKLd5e3vJ6kuOhkUVON/uUJu3VgVconknh/kk
 KsoizoWzHcJfOE89+flaHckKCLpzNxUTGXoFOL05g09d9C/oojU8/Epzm+r4MoLRNlpPvkxElGv
 WkvElsJaG2eXzFOeddLVygkSh8gUC0xX2PzdYQMAnBBqW0LKNgkKvm1o3wS3/tpBJNq1p7TaTGs
 0E3puBPEoanayMA==
X-Developer-Key: i=rgallaispou@gmail.com; a=openpgp;
 fpr=20997BF613E7EF6D5FFDBA2FE7218A68D412C2B5

Letting the compiler remove these functions when the kernel is built
without CONFIG_PM_SLEEP support is simpler and less error prone than the
use of #ifdef based kernel configuration guards.

Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
---
 drivers/ata/ahci_platform.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/ata/ahci_platform.c b/drivers/ata/ahci_platform.c
index c18054333f7c968cc4e131545fc3127f03ac27e4..cd5d89c1902fab6c936aa04eefb461c968726185 100644
--- a/drivers/ata/ahci_platform.c
+++ b/drivers/ata/ahci_platform.c
@@ -74,8 +74,9 @@ static int ahci_probe(struct platform_device *pdev)
 	return rc;
 }
 
-static SIMPLE_DEV_PM_OPS(ahci_pm_ops, ahci_platform_suspend,
-			 ahci_platform_resume);
+static DEFINE_SIMPLE_DEV_PM_OPS(ahci_pm_ops,
+				ahci_platform_suspend,
+				ahci_platform_resume);
 
 static const struct of_device_id ahci_of_match[] = {
 	{ .compatible = "generic-ahci", },
@@ -102,7 +103,7 @@ static struct platform_driver ahci_driver = {
 		.name = DRV_NAME,
 		.of_match_table = ahci_of_match,
 		.acpi_match_table = ahci_acpi_match,
-		.pm = &ahci_pm_ops,
+		.pm = pm_sleep_ptr(&ahci_pm_ops),
 	},
 };
 module_platform_driver(ahci_driver);

-- 
2.48.0

