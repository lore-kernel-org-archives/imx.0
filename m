Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09BF81E832A
	for <imx@lists.linux.dev>; Thu, 14 May 2026 03:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778730013; cv=none; b=ctzW580qrOf/t1rS+CLSZ8mKF104t8D+Pdo2qsp9Nsfi9zOCLbpO4NfbmQrFhpuU0Wz/gPa+mv4n+j10LiYaPcV2ylLFJg/5MVk1Asc05Xqshz0QucsE2r6+9wHjT33QZ5Tb7OH6Vo8PIaquvhDzBqSoe+juyImOjIGll4+mTTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778730013; c=relaxed/simple;
	bh=xyQ/0rRk/jDSTYqzq7j2bwB5Mv80Bhxjd2ET8YJKKe4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=my4zs/DaV3D4/m5g8tI16TUft5IsQ1jreptiuHRtdrwnRe4w0LA7BOYdNigkUXlZHSthfuggz4ElAuHAlz6kgYvuOxFCFgQJp8K2r3rBYz/IbkpMCUHfc/ba92HDXUM8g/CiWMVWGJJBzrUVc7dVTtHg7xah8Q5PvdV7oRC+13U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TBRqA1Iz; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TBRqA1Iz"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8b7f937ef44so43296926d6.0
        for <imx@lists.linux.dev>; Wed, 13 May 2026 20:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778730011; x=1779334811; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ztl0NP5ADTctQZXKpyeHpvvektz2Ccm1tuu9zAHmuZI=;
        b=TBRqA1IzmcEVXVNJG8fG1ffSl3Qz4DY+2TIyeEQpm+pysNDJGbSkcmroom2QEV55p4
         ShvCyaGM0/urxxDv5GVdexDz0eVGRbDvkQsLIbfnHcW4vO1qYONFDqxgtK9dUuuR4Yzn
         2mhKJ50XJRDmApa1wi9au8q2U4ZsfmOxG27dyM06q+C4BFFxcDdzmF3GgTqT9RNS/J73
         ujiKIQFC9KVTynmvuxpUJi10+vI3iRHNuaj9mFYa5ehawSlfoc/wB6HnjH9WZdTHRWYI
         rjkKmyofTGBVH1j7DQTye946/tJshHFcYR5g+RMU1nS/bluxK5Mc/OOoBfHaP27Q1Rh5
         h7pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778730011; x=1779334811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ztl0NP5ADTctQZXKpyeHpvvektz2Ccm1tuu9zAHmuZI=;
        b=KubsUq3XiIjJMHkZxXDohfUyq371D3truhxPgpKZvf/9z4O6vkJF8KWoSRCUzsEY5s
         QCPZzMNR/Wm3AjD2HqNMkBrvxu977X9cYxZ5VXoJh/rewUwl1j1qE4Cho4MRxEBUS/sL
         EQeR9ouffgtXrAEvgWxT5kbQmlhcodqmTLmldPjKUPp3qhLsxmmq5Zlqg2oVCxwkkwdi
         zMbzT2kr0ANz4Tt0CSNTxcva+F7yUp0/02zOesdgrLU7wY5vMSepC6NSxAVOTBgeneLL
         Ow1jSNhgR+HV+x36HqkvHfcmccLJXwHeW8s0t3xGq96FWHYEYckNzlwOBt/TF92E8iMO
         g83w==
X-Forwarded-Encrypted: i=1; AFNElJ/NtaWGgl5lcZJmXHwSbI3tZKmMcfK51F86p2tAymqZ4yo8JN1y74ogsOkJvJISIGaGKF8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMpclUaDedpPfIWpFVTZdjZeUE+HZgtF+Cz99HBHQU5Bxa7oXV
	wq0lht4C66uxyB8HzoC31kUm2ViAXXjlbnrf7PPDaH75OxMEYKEml7Cp
X-Gm-Gg: Acq92OEsX8olXLNjD8xS1LI8YWSKa2uRN3Oq5WM8oPeP5MWO7zDKD4GVnsCaP5DZDh6
	578vuYq7D0gAZ3K3WVVgsAAiRmzy6C1oKFoGxfzV1vW14CWQBqHU4cS9rrGvNm5TX8+7ZGRMcke
	nMHR3ruzwqCoG5CPr6SxSr/nPXnD9TgyXXP6MNX4QhaIKC+BEJu6hHFIKUOymzmiFIsj9eJAHUe
	I7EitymHDeSWec5iKlSpV9lMOScdH9FThjTGc2WJdGOPJiNLHkhCi1K01pO6vPVyETcVzP5u1da
	Y/6WofTOyfR1wO8fRAQp2r3+LEKdk0vGifG4wMtJH/PVfoZcOFjshlhoCfllcB5RVnXQ99oR6AH
	5RVqViQ/vA6dfCod6XjlH14UkWi6Y6pVnX9ibOSYpqCzHgnhsVveYhzVYPHhXViuJLILcaUxASp
	p+3ST8wIfwZOfzD9CgoceDDL1IUGtY9eG5mmqhxzA7
X-Received: by 2002:a05:6214:4a8e:b0:8ac:a744:7789 with SMTP id 6a1803df08f44-8c7dc84847cmr106181756d6.5.1778730010655;
        Wed, 13 May 2026 20:40:10 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8c908d1bb46sm13200896d6.11.2026.05.13.20.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 20:40:10 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: Russell King <linux@armlinux.org.uk>,
	Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] ARM: imx3: Fix CCM node reference leak
Date: Wed, 13 May 2026 23:40:04 -0400
Message-ID: <20260514034004.689829-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

of_find_compatible_node() returns a referenced device node. The i.MX31
and i.MX35 early init paths use the node to map the CCM registers with
of_iomap(), but never drop the node reference.

Release the node after the mapping is created.

Fixes: 2cf98d12958c ("ARM: imx3: Retrieve the CCM base address from devicetree")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 arch/arm/mach-imx/mm-imx3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/mach-imx/mm-imx3.c b/arch/arm/mach-imx/mm-imx3.c
index 0788c5cc7f9e..9b0b014d7fe2 100644
--- a/arch/arm/mach-imx/mm-imx3.c
+++ b/arch/arm/mach-imx/mm-imx3.c
@@ -106,6 +106,7 @@ void __init imx31_init_early(void)
 	arm_pm_idle = imx31_idle;
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx31-ccm");
 	mx3_ccm_base = of_iomap(np, 0);
+	of_node_put(np);
 	BUG_ON(!mx3_ccm_base);
 }
 #endif /* ifdef CONFIG_SOC_IMX31 */
@@ -143,6 +144,7 @@ void __init imx35_init_early(void)
 	arch_ioremap_caller = imx3_ioremap_caller;
 	np = of_find_compatible_node(NULL, NULL, "fsl,imx35-ccm");
 	mx3_ccm_base = of_iomap(np, 0);
+	of_node_put(np);
 	BUG_ON(!mx3_ccm_base);
 }
 #endif /* ifdef CONFIG_SOC_IMX35 */
-- 
2.43.0

