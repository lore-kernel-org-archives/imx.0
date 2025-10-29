Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA34026A0DB
	for <imx@lists.linux.dev>; Wed, 29 Oct 2025 13:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761746164; cv=none; b=IOFNGFKBEz00oHK3112K65nWm32UmrUKTEOs5WAodi3nEQ6o0KdcFGUlU94d6ANd93jppuzcbqZLav191jxv0C7HG3+NXK2yBRRW/DjATe63aOWv2KMkNivBjBf8S+TdOROn5t0DArPijQJyiY+nie8U/vpV8URG8j9CysZT3Vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761746164; c=relaxed/simple;
	bh=j0EXgrYnvVA59AWsBuPviuInGMrdX8MUdYFnXuN3nj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VnvwHvFI/iis75FD6vfwfWSLqYz4upw/uL0ECsVpHfHPI9jmZ5brc+725RhD3ppCzlyEbZLJP+UOuOtvlP4ivG5VF7wHJPHQXINxiWh7IL+EVc64hE3KoU0H6ms64XdlMz622bAy6qDYhCMM3wCVzt9dMftpec3fZwh+Gu22BoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j+MRrvPT; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j+MRrvPT"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b6d53684cfdso1612173066b.0
        for <imx@lists.linux.dev>; Wed, 29 Oct 2025 06:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761746161; x=1762350961; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=j+MRrvPT3mBfQu+ggrjNz4Pc26zV+IlDDh7NZJJMupBD4+3eqIC+WmzPBBeSZw19Jz
         w6RSLkbFeshqlCKz4Ohz5LzZiIAnHgPHZQyGWj+Dt9o9oS57O7Avt5lC+FoIf50M1ns4
         Gh7Y0YPgG5C6eQeesjgzVK+Yuf3cqeev+z4xRxbXISPxZBiSkKEE/ppGcfP7xK67kPkD
         jO9LhM2JmRAoNtFvlRhuisxjywhAGbYmw1JPAXIXsGCmrPvXSDyxLBYYvaWu9MfZ5lW6
         U32wjCcp+Az0M6z7RojXJ3QtbeJ/UQKdvkSYbR0dUp/lpsq5i4m84093946kFl7YcfRg
         4JGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761746161; x=1762350961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQ5uBVedfr9KMSyQo0sT0JGcllMUFdDYdUnW2PHKUXc=;
        b=Zii8WDTanIhPG9LcOH9CvbOdti1nuEGEIPNg7Admn4MS/tynIPsqJNyLxrKL9ZHd99
         owRfpTILH/UikfwRWiqoiFvwzFNCm9GInxehzqqPnu6IO+wSqBZWBDtV424XetMZnZax
         Jc3f63p2vj+dzU8Ng/9w/P9bAaWaHWiTqfFaDogls/ugB6VLdTFsW4KYx8O7Gm14JtgL
         PQM/D6zeKInPbOm5ENqbys1zgEaSQzbYbKQxwmHfdZo2/qvF+GBY2PaY/e1B8AkWYom4
         vFOLJ7XMcjrXVZJfDVAxI/bX1wokyJ9DRdsyAuon/mTJfVgnm+8iAcbxMmIm+wmRNSUQ
         dfoA==
X-Forwarded-Encrypted: i=1; AJvYcCXcIjqRbCMtM4hfK/zqtqTHQSqBevXvtFn5eeggSlebSTfpeXP134ou47tsZeWIYChn5WQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwMd77EJkvQR155k5qMsM/l2K5h9UeFoQEqG8yWzq6/IkYGHN+0
	urJf4dJPDgRyQIBrkR7FDu++CKsyDagBSlrKvlYlb+etQXAvb/coRqt0
X-Gm-Gg: ASbGnct8F+ria2Yiz7nFR4TT07QNfOqJLQxKu/IoAXlG/8pgw2qjkwNWmsgknbbDRXM
	Yr1R5uO/fapQgW8sF6exko5MB4kNYoIPVwB/Xc5vMhBlMcGKYVyz5AA/f49bTkokZkEHvLqShBT
	D1rYlUyTX0yPXaMuxocZprhk9yIjKeke14gzVdiTR5Ag5RsZm9bK2yiyOOGmW1H71lzdHId7oka
	LoJLyxrKYD8SK8n6Yr9vlCxhvAFWXD2LuarCnemAy6NIYuWXiBGPVfWYsPQlTbB/P5U2Hcrs2dV
	q4pC77ZlWqwgRUXbKI1HlQE74ZxwkhyjNT8zU5eVlib9shyF7BfUSFCN32xy/iqm/O+xpMBswHZ
	YCydYcB8HBp1RoJwSZKKD4hRdiz194sJMuSJ0bI3ThLnSLl7Zc/n388Z7JjviOUfyb9SVtspeQv
	1BbFvy0ECnM6afvWH7vBK9BkijZamKIA==
X-Google-Smtp-Source: AGHT+IHrghZaQi+o1U9HBM80X1LpTX8WL6sxC8J/8ai0EXsL/1XFPVew5l5qwKEGLRSKZrM0eDMeIw==
X-Received: by 2002:a17:907:96ab:b0:b6d:c44a:b698 with SMTP id a640c23a62f3a-b703d4aeeecmr296884866b.40.1761746161026;
        Wed, 29 Oct 2025 06:56:01 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8534d99dsm1444960766b.21.2025.10.29.06.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 06:56:00 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v3 1/8] reset: imx8mp-audiomix: Fix bad mask values
Date: Wed, 29 Oct 2025 06:52:22 -0700
Message-ID: <20251029135229.890-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
References: <20251029135229.890-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

As per the i.MX8MP TRM, section 14.2 "AUDIO_BLK_CTRL", table 14.2.3.1.1
"memory map", the definition of the EARC control register shows that the
EARC controller software reset is controlled via bit 0, while the EARC PHY
software reset is controlled via bit 1.

This means that the current definitions of IMX8MP_AUDIOMIX_EARC_RESET_MASK
and IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK are wrong since their values would
imply that the EARC controller software reset is controlled via bit 1 and
the EARC PHY software reset is controlled via bit 2. Fix them.

Fixes: a83bc87cd30a ("reset: imx8mp-audiomix: Prepare the code for more reset bits")
Cc: stable@vger.kernel.org
Reviewed-by: Shengjiu Wang <shengjiu.wang@gmail.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index 6b357adfe646..eceb37ff5dc5 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -14,8 +14,8 @@
 #include <linux/reset-controller.h>
 
 #define IMX8MP_AUDIOMIX_EARC_RESET_OFFSET	0x200
-#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(1)
-#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(2)
+#define IMX8MP_AUDIOMIX_EARC_RESET_MASK		BIT(0)
+#define IMX8MP_AUDIOMIX_EARC_PHY_RESET_MASK	BIT(1)
 
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET	0x108
 #define IMX8MP_AUDIOMIX_DSP_RUNSTALL_MASK	BIT(5)
-- 
2.43.0

