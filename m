Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B12318EDA
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068387; cv=none; b=QDotORPA9uQLthZZdDlqqnfxZEi4HEbxZGLVYchfeHUz1ur4qtBMDG43H4nK6gi5UpibhoAEEUpYtqT/hxvH/p9UJT2pUiWiihQxSW+OVKYCp0U2LWfSYuEfOV3tZaV7UuYzsU5NJ5mpi19OLWGURk8UKQAJeorMXxI4xJ8BAj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068387; c=relaxed/simple;
	bh=xAsE4BKzmNkSHJQwJA0mpLBNj278efleZCG33iR50lg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tR6XOekwmm2qVOqGxHhFQcbF/3ZWmCpqOGVUr+Bws8V66CxAsMAzfGRit6hxJMIQEMk/09tYWnd/QeID+Cd5CSDX3LTpZwdZmeCIfG94gQR9o31hUGKuXKV7twGOQaK3/15MKn1H4/2TXUCXPwA/R7wqHVIz0TKZ0xxyL73BIMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J7NyE8uc; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J7NyE8uc"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c7902f47so1785415e9.1
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068384; x=1783673184; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+UNia9moTKDJ9co1FJK0IMviLV0v2Ow9qfVtGCiwwk=;
        b=J7NyE8uczymowEq0sx1dYE0UKdBLcnntuAXD5L1mN8u/31OPSSzO2HPh4qo8O0pSxQ
         8c32vtZaFq9IFtT0Ks+1Osz8Pfi0d72cTafc5xijm2CAhMOParIjw5aazqZFebnP+4Bx
         n7P/tFlcFSRJAw0sEoJUo2dh9noncffrHWmsY/e4n2JObT0I+ePYH2sY1OddGcM1qpg1
         ziy8ws7y1L2juWITFwFFHGGDfdVHil+7nKGbg+u2KEyn9SmdKttdkRmVUJz4Dhn2VEDO
         IqLmjX30DKlJl/TR+jaaKqmEcNmM6FkK/Z0o8w9jdC6qBl1JWYC68uhHf6ooQRzscmyV
         dexQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068384; x=1783673184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+UNia9moTKDJ9co1FJK0IMviLV0v2Ow9qfVtGCiwwk=;
        b=gjMo41eLTU5NqmnW6AW7YpZLz8d6mtmqBltVAda+KdggKZ0UrTfaoX6W1YBxbmZcYK
         DTyUvDh0/o8EV5anC1xx3MyvZxlxTVEfjRnOKpwB/On6g4hGodU6LTno/0iwe8OUWL7W
         X1D6IoLlfPwLi4G22gILx0Y7hkcUNXaDCTtBO58bVA+zZ333HX1ocRwQoG3l61TpT6YB
         Uqfp+lvtOFwmqmyFd2pNvPVupU9SwcIpFv+sW9w17A+wVIlG5IKN4F7EB5HiF+MoNhL/
         4b5W0gxTLKwEXz9snbfMaBrhbFqs9g2L9JWgkvmhvzEd+yDy7pLXmO7vFH8DBTP3pT26
         RCIg==
X-Forwarded-Encrypted: i=1; AFNElJ+jwxh+R9wPAixIWpsbLZ30HQt1LIyiWAoWz0dLc1JnIa49tP7KYkG2cUbfadGeGtv99Ys=@lists.linux.dev
X-Gm-Message-State: AOJu0YxPSOfjpWQExx4zMe+IFXlw/twXsqCl3o3063O4MLdCm/bhavkl
	nJ/pMqsj1AU0rtT8uEVoWB4hCia+U1Yprsv4czAri3J1B8YTPg2mAvC4
X-Gm-Gg: AfdE7cmofOE8sh1jLM1wCVjXw7p15eoc19yC7MGij15knZ2QR/Tuy6VDmi3VTmiw9AS
	fQC1hNHc83n9xHC9/nkeKn/GRV+bYEbnMGR688bTusXQfeT7TqgyOJ6tJ5vHDbwsLbiUql7N91z
	hrbpLTeK8dw1LdD5sC4+Up+0RL70MRke/sNywiEGXA1LKPBRgfBXvyWuUZmNBKw8CQzlR7pCySI
	WiLIwLqVj6Tt2D6RSxboNxknVYcGMrtTmE5TSUAvE7lRmxaYD6CtfnDX+2zUBBYaYEHJ8u5YzP1
	Pbwr9azOc6OOiLEdJHYqz7kroT2paUjrdOW1hV8drmUr49lVJ4pMAw9ObJpmbz4GjlJ3LfUarQH
	imXd3U3zh4cm8KSwcR+6mds5Bj7O8b1HmRx+FgE6BsyRTdfqjyWpbja8Tn7UqRAtSzWxCsQl9LK
	/KqvWqi1cqWBJtv8A3W5ujBs7+KrdMnNVA7/f6CyDE+txC7nGVNviNy+0jhNe8yVWv/NB3y4/c0
	DJuPswWFX7q4FPgmh783EiT2A==
X-Received: by 2002:a05:600c:34d4:b0:493:b8cf:cc8a with SMTP id 5b1f17b1804b1-493c2b3ccd2mr119335125e9.4.1783068384366;
        Fri, 03 Jul 2026 01:46:24 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:24 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 15/15] arm64: dts: imx8mn-var-som-symphony: Disable internal RTC
Date: Fri,  3 Jul 2026 10:46:02 +0200
Message-ID: <1581109f79e902429e291b0e7760a81ecc4bd0e0.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Disable the internal SNVS RTC on the Symphony carrier board and use the
external DS1337 RTC instead.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 2afb5b438b68..364127257309 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -223,6 +223,10 @@ &pwm1 {
 	status = "okay";
 };
 
+&snvs_rtc {
+	status = "disabled";
+};
+
 /* Header */
 &uart1 {
 	pinctrl-names = "default";
-- 
2.47.3

