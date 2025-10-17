Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D614734321B
	for <imx@lists.linux.dev>; Fri, 17 Oct 2025 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760700109; cv=none; b=PpzADM/jQ1w4zLW3C5jBJIKwZKx15ugS8xaf8BqOXjpioPCp17l7KVhQVYu90GTzB0EvFFKo1zipyZJMkoUidRTMtybspc5B21z6dXYvYo2aqNQr1snWITL3jjCi8hP0cFWJF/Qbw7dt2GqUbrDrlOLgwot0M4JN9KoxuT4M+GA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760700109; c=relaxed/simple;
	bh=3PA3zZ+Ug3aOY46+y0Bpyk/iEy6BvKUkO02G5BbMuws=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XQi2SbjhsY9iqmGCYlDGqHh5Evx+Mt0+8Wsfg6AGyvRTg9r0aH7Wd+TI3kEcuyBqv1wId7rs8RSe/HF1eQGxrf+u1gKrW5m+g+YD2rbwGTEwr3vLYaBjc5OvY9EOrKcdkt9BRF+3rMr4tPbxPcXcBl8e9NAmE0LdAVPs31C2J8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKB+lxIL; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKB+lxIL"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b48d8deaef9so349398366b.2
        for <imx@lists.linux.dev>; Fri, 17 Oct 2025 04:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760700106; x=1761304906; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e4/f1Kl14CmgCOWKe9f3nn8ieC/PRwpFMREaWVG2sFY=;
        b=JKB+lxIL9+Rf88sH3qepp48FuSQ5xaG+HmiLDgnvZgLu4wQbVaSso178AlkZZL4MNq
         C8uBJ4C9MN3EqmTWhNX0r6iozHYd+trKkoa23KWFZ8af+0jYOsCdmLuxJx7GWPHJmlJX
         ROw7heETUP6EQ0e1eU6U81v45cNPLS401J50W7ph+PipEja0mbhh23YvhtHVDuGXzBfo
         JhGJUx4b/fqwJDr2huqSXCPlgeA+wUyYCbLmp57DwOFTmnKF6TWb7PhsF+hytj4kJvbq
         QKB4xy/zax6ZRaHwN92XP2v5Y+9zQpGP7nd6gL5XZRUXSDrNdbrSobSBqckTnJUKn99P
         h68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760700106; x=1761304906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e4/f1Kl14CmgCOWKe9f3nn8ieC/PRwpFMREaWVG2sFY=;
        b=FRBEgUt2lx9QwBF/pQWlZiyyFwRjUyMRI1RBrJVCPJSwn3lpjoGscIhN1tYmcTRPqZ
         3vV/uWz95QYRbocuN0SLYEUUsyuJUH9XpVxbWgtM3fRLVyWsWb7eNGYybxFW5k9xEwK8
         63ouaXUNePf6g3OUo0S43QT+tU1gi1jwr7+e91CWrpOPFic39RiygJ2ZDj75By/HfPHe
         kGTxG6XDeSlmYwuMtySz1KXAZ20U2WL0hOs64YMe7haxGMj7fH8/+DUOi1tcYNOrPFyI
         NC4naXpIWI07xc+xFTgnkf4jtUiGNpGtQXmPlJ2ZkchN/qpXeSKZO7iFfenwX+Ev7UWk
         IxKA==
X-Forwarded-Encrypted: i=1; AJvYcCX68OeKfJn1FG4IZTuWUYoEoDtjgAjYXu9SPKdfrA9MUFAJrUTjKnGJLJKoKanuJFeb+HQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzx+XcYtXDq06M9QplQ3iwp0a7+pwxeRnfWO/vV/SG6zPCt+Hyp
	+0trSAAhCTwLk8NXj6UGj0DVl8alCTmnDgQk/dPu+VyfC0c294BCdLJc
X-Gm-Gg: ASbGncsQUolLpC9ZS0EXRQ+n7so64nz3Dak0YcTU6mr0x+y3fP1snnEIMifmebuMHB3
	4k62tz6ib5L3663vuG0iZDdb2qiKtAMI5A5XCdq7XN65UjfIR1tdJNeOUeYuE5YUC+c3eTcocs4
	1+arWRK52yvTi19J/rTq4OHWV3SDcLW5BInfjEn7DzGjzzXG3/ZcRQxkxEMmbJMPRD0tZZZx3HN
	L7VdQwNUV37Uakyh/RgRpVrss8CLUM11mhSModnMNLFRBxRT3pSVIvEBm2/GHdLu7x/qXmyxJQs
	j8T0xl11G3Kqnc6yHQj46NhPwKGawNci4eAlj9AsA788DsynPVTY4IsUNepLH/XKtp2l6xq4vCt
	FpGWQFMUq56znrvy9VlCUe1qFh7Xh4Aaow0Jiwt/i6zNpdvgu5aTdUtuRn35Xrk5fi/2KGPXt1h
	iKCLqKphPSay9V8w4sIS8TNfUxjWDhLfLYtO+bag==
X-Google-Smtp-Source: AGHT+IHd6jblu2510v9bkHq/90oro00PKRRM0JXmjf8CbpRE4cA2knCufq3mdwx/AEKOqtQsu+8i5w==
X-Received: by 2002:a17:907:9691:b0:b64:6776:1ee2 with SMTP id a640c23a62f3a-b6473f42d78mr334179566b.52.1760700105898;
        Fri, 17 Oct 2025 04:21:45 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b5ccd1af35fsm788256166b.60.2025.10.17.04.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 04:21:45 -0700 (PDT)
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
Subject: [PATCH v2 1/8] reset: imx8mp-audiomix: Fix bad mask values
Date: Fri, 17 Oct 2025 04:20:18 -0700
Message-ID: <20251017112025.11997-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
References: <20251017112025.11997-1-laurentiumihalcea111@gmail.com>
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

