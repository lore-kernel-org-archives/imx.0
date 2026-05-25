Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010025B21A
	for <imx@lists.linux.dev>; Mon, 25 May 2026 04:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779681730; cv=none; b=Lwyhcjs+oxhh65C9S6YfEMoS/2li6IoyiHNaHlxaWm44YaDctw++7PJUqZaPp9Za8hmIHcdeaPsReBKdzESKUIRIFBdUSPt+88yBpd79emqYZAHXltJM2Sg6eJRKS3o1fqR/H3/1H9TbZEFK2wJmetswc/i9M3k7VZS4/HeH+6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779681730; c=relaxed/simple;
	bh=/D5NZ6KbFz6bFcRqmdFVflWEHxzCWb3xE5mBn3KXKsg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YaByalT10k9EGCXdzPvfHdt6EXuuN8CRGquxhBgkA/zgnFWBSvB8XHgs7ZgSd5q2J7dRoWbQu16oJ+ZuEiXR+fWOYbhwbo4vNHANhgPtZEjtk7UN8Qq1oaLQHyq0VxYhOc0OR4ZnOmO4g00Urmr34JEdRbQUJt5gCSwizGY9cIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ak4IqzAJ; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ak4IqzAJ"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-914bf8abeaeso201879185a.0
        for <imx@lists.linux.dev>; Sun, 24 May 2026 21:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779681727; x=1780286527; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8FWl0UxFX5GgB8gGa6HOaMa+f55DN13yqthzkeUsMYA=;
        b=Ak4IqzAJD8+gODxNHOyOH8X5YHeFFT+gqBmzMUb73EaTxMxRYby4VFvlepbNwLX1cD
         F8zUTlTcXAh1w62BCq+Lj/sUvQZMzvLCuqBwWaah5bUo3ywJ2mXPTq3pyyZR7dRto+PS
         my2RPGSyBSPqd23b+TyL4+xdgr2EYcz8MtbmNdOF4HdzWIy9AL9h3bxgLV2VZVTRI+0u
         btGhg6IYDhqiieg8PlDO/RM/1xIMwKbK08Uogh3Q0CGKaXd1Sxdv8faWTIbZ9Qxb+Di0
         pDHhNC4EgLX42/EOo8Rm8jpZn3vnrJNuv1pOtKeqJ/vrFCh7atPW+JtzHKZBzNf9syW3
         LDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779681727; x=1780286527;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FWl0UxFX5GgB8gGa6HOaMa+f55DN13yqthzkeUsMYA=;
        b=PAgdNLG8UEAGLr2pNGyx5qnOWPZueAhLFcGNuKDytnYx9WmUJyGFVIvQbTAz0jkBgD
         yjPbTXGpGq+LFZzLxd211CQME4hqLBoyjrpffrQ+YEY1Asi1IbJthY9ILBkRyRMcfrO7
         JErrebVdapWltup3LUCL73k9hu6rHRBzS+L1H0P28bbyx5nzoUFjvslVyVI8xzeLbhQT
         np1oLM3kt0tEhThHX8LgHWFWAq7qud3PEVTlHgEm76q734L2xWOhg4NdrNfKsfSmnXZQ
         sdMsoph9Qn7qgywxnqfQvcAbyQi2C+XzO0OlfDFWacrQJhe31LS88oJmSgjYWfEYWdzN
         ChlA==
X-Forwarded-Encrypted: i=1; AFNElJ/d8GPATqeDoqpb2frcU+HzOcJjzNByJHpyCstUOm1eNl+8I959XVZsjwsoeoWsNhQnHR0=@lists.linux.dev
X-Gm-Message-State: AOJu0YyeaafehA1YgPJIiHFVdZrgIj9P7m3itlisfxf7yF+SZsT2uZzb
	hjMDSijEAvvyYi9omdbwPW4KwyKuJbZkT0VfZCvLiwiFK8qnlQGyyY6Zt1H/DkOsk7Y=
X-Gm-Gg: Acq92OHDh25lVK1cLf33xQjgdSdpAUC0XDG7/WKM/BvUK07s2x6KLHWXNF5Tmg8v57Y
	W8cgopTsbkrlSYbxA/fi6gsS13fOE8l9TBnlfInm0ttM2afbI66injo/raRHLWD31iIqYpowymH
	YdXr8mQ6ChWAUKaZaOeNIT+IQGAasL2ffxXbE0onlaCVi74fncEPjqy1+T4uzJgdoxc31AyV1Ja
	E+yqOFcD7/d9qAJlzLAjIAePqDCF5n8TIFHX3E+8MNprxhwsxPH/ksF7CX5XvqbDlIeLDoLQXT7
	1HL9XPOsAef46FLa1AfltZIbRBTrsSGpIyYzLs+zuzJTzbu8o6IPcs7e7/HLfijtkmxvWDiPiIX
	HLtdWbwt46fnHS/9NmhOIX7ETaNwZJGCTX0ZWduRdTtLEjXBkc2+Dln2xdAU6loH7OyhVh7QjXk
	3MnH0PFLkzWyT1nMCLArlau11FarGyRMkpSbUwqjvdlU6xB5V41x8=
X-Received: by 2002:a05:620a:2718:b0:914:c0e8:224 with SMTP id af79cd13be357-914c0e80a72mr1628896885a.54.1779681726843;
        Sun, 24 May 2026 21:02:06 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-914bba0b6c8sm886659285a.41.2026.05.24.21.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 21:02:06 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Russell King <linux@armlinux.org.uk>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: imx31: Fix IIM mapping leak in revision check
Date: Mon, 25 May 2026 00:01:58 -0400
Message-ID: <20260525040158.1352069-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

mx31_read_cpu_rev() maps the IIM registers with of_iomap() to read the
silicon revision, but returns without unmapping the MMIO mapping.

Keep the normalized revision value in a local variable and route the
return path through iounmap() after the revision register has been read.

Fixes: 3172225d45bd ("ARM: imx31: Retrieve the IIM base address from devicetree")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-imx/cpu-imx31.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-imx/cpu-imx31.c b/arch/arm/mach-imx/cpu-imx31.c
index 35c544924e50..e81ef9e36a1f 100644
--- a/arch/arm/mach-imx/cpu-imx31.c
+++ b/arch/arm/mach-imx/cpu-imx31.c
@@ -36,6 +36,7 @@ static int mx31_read_cpu_rev(void)
 	void __iomem *iim_base;
 	struct device_node *np;
 	u32 i, srev;
+	int rev = IMX_CHIP_REVISION_UNKNOWN;
 
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx31-iim");
 	iim_base = of_iomap(np, 0);
@@ -48,13 +49,17 @@ static int mx31_read_cpu_rev(void)
 
 	for (i = 0; i < ARRAY_SIZE(mx31_cpu_type); i++)
 		if (srev == mx31_cpu_type[i].srev) {
+			rev = mx31_cpu_type[i].rev;
 			imx_print_silicon_rev(mx31_cpu_type[i].name,
 						mx31_cpu_type[i].rev);
-			return mx31_cpu_type[i].rev;
+			goto out;
 		}
 
 	imx_print_silicon_rev("i.MX31", IMX_CHIP_REVISION_UNKNOWN);
-	return IMX_CHIP_REVISION_UNKNOWN;
+
+out:
+	iounmap(iim_base);
+	return rev;
 }
 
 int mx31_revision(void)
-- 
2.43.0

