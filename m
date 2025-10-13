Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC492F5327
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 20:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760388747; cv=none; b=dVjhI6Lh9ZnixNwinQsvi3gw8vrJflv8oYOLAXVvi2zdn1ggM9qP2Fd9MMD177P/YRkMH1/FAJppAqiz0eqxl/OdLEmczPPZbukBY1EnRCdVEYTkEqXdk1d/5K+XHGce27q26gktV23I9vdfm7ej2d5MR5AaiXiD+d50RDLnjfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760388747; c=relaxed/simple;
	bh=xDInXmxrDtG5u5Nw6FmUJ4lbWM39+ecdSdVKA/N4PpU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=gCIbTtM5CkroPcryRR1NAps8q/ql77ZU9BoRO+LtNOFvuTfAR1cE32UCLdiWulmepXFrmr6MK1uGg1oM4BUqGX6jtt0O6F55Y9BbUSexokZZuekvAS6v+CTQge2LBUkYEDxpRH4oUGMcvJv+UZVdzV5oPpHyg6rIUCLmVO5Mq4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VSNP/4is; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VSNP/4is"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-780fc3b181aso2690208b3a.2
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 13:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760388745; x=1760993545; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRJbkM4wepO56t2Jx9Mj/0XBiWzZWPdz2VVmdtIvIJA=;
        b=VSNP/4isnfdGxo4157zER837cc9EOIgux6SRuo7tx/ZuhgKmglUKI8RZM57UjhIXs8
         1AJwZLgewvlKrox/MwwhKIk/pPcbxedkoj/JqI2KSf3N/niLIBwp24lRnchKIFArzmOV
         THOkrO+qdb1O5PN052xIz8hboo0d0AiANFVY6Vcwtn55d3f2S2N4CHfK4aTGPqGQ6ord
         0K4UD3WnXXkUj2s1lr9t+sreeTOYigbLCzTvCYSQqhgl2NSRr0cUZJxRoQizgENj+kuf
         mIkeW7vxL/eXEsVPH+Dx2+xEG/jzeqXj0twpVUCFF9OFTX1hzpecyPUh/pNLWYZkWHns
         vghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760388745; x=1760993545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRJbkM4wepO56t2Jx9Mj/0XBiWzZWPdz2VVmdtIvIJA=;
        b=KDPF4NX1AsfiOJY8Qgb3qyopEqk0G3hF5+7G2RfWNChLKPSGUZfBD8IRpPndDjG5aT
         8SegtMH2Umt6lh9LA7552wf4xQIsjCFjv6+MO4S9weg71NJoaHexrpOU0tXehwI8qvJu
         ihPZbSRRh0ng5/VAX1oU48J0cezAhxlPmK7E4bCQTv6YakH3qsyDC4BYrgj0U+F7G5QC
         FRr0E6KiyQm+0HJfLO/bWiKnRuyTWTKf8rBj7ZAk0+ygrotilmtGTUP5GQ9HLPFIAMOq
         HdmCsVPefzCOebYxZkHoj8saVJSK/TrU1tV4ow99xJIZqqn/22znZpt7ok09sTpp6Aux
         NcMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGiibP/L4J3LfPCyJdI6zEX7p2pML+JNUMHR0bcQFjrNKa6SXbrdIcthvw2kUbjuXBXL4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzvrDz0Lc4FUirMh+6WaYnLXeoiOfsmAX3bQT4q09dDrYZnViIj
	vvsN7vUMKRf/4hCVoIdR48aEjE5WFN2lHlKmX5RyX7pBUUS7wXSLNUKN
X-Gm-Gg: ASbGncu7tLn5vpXOxvOkX5U25ZzbnRwaQoPk1oDO8LovynVmpEY0uwKI70ObvjSQ5TD
	jRh0BdXxjEkevIWG7QYWYwotzzprjzN4MiRHXeMpzPXDJGpEFcX+Q3bECUDeqaW8pv+b5Lvhuxr
	/qns7NfHQyv8u4GfRq9+TRAENmkm7wEQHIdl5eNVv6EmnZLpCw7FAA0PiQ8bS2BxnlYkOjQzm8a
	GJIZBEHbXCD4GTJW7PyQoQUWxbWDMq5rYo+whqXu82VF3JcKbdKyubV7BlCJ21tn4DGSC+BBF5b
	hyKTOZbfV1MBiKp5FfSuUkCyuQPPGlSLwlC81Fmvm3Xp6kHI/LVBsiPQUe2ahkmF63ashp5lktE
	eFFoYOk5M4/61+Jo9vew2NJ+BEvTQX8oBUhFSBDmu9I0MrT8mEB+bUEI=
X-Google-Smtp-Source: AGHT+IEbc0HqY8CLIHs2k8aq/yJ+qGsFrnOrDj32getTUXol/oijADm5b/7xs/AL3ljfJbDbndG3kw==
X-Received: by 2002:a17:90b:4b04:b0:32e:8c14:5d09 with SMTP id 98e67ed59e1d1-33b51105bbfmr33280515a91.7.1760388745433;
        Mon, 13 Oct 2025 13:52:25 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:cc82:37a1:ecfc:e51c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b61acc413sm13445147a91.20.2025.10.13.13.52.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 13:52:25 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: victor.liu@nxp.com
Cc: marex@denx.de,
	stefan@agner.ch,
	airlied@gmail.com,
	simona@ffwll.ch,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	shawnguo@kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH RESEND v4 3/3] ARM: dts: imx6sl: Provide a more specific lcdif compatible
Date: Mon, 13 Oct 2025 17:51:55 -0300
Message-Id: <20251013205155.1187947-3-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013205155.1187947-1-festevam@gmail.com>
References: <20251013205155.1187947-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LCDIF IP on i.MX6SL and i.MX6SLL is compatible with i.MX6SX.

Provide a more specific "fsl,imx6sx-lcdif" compatible and still keep
"fsl,imx28-lcdif" for DT compatibility.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Frank Li <Frank.Li@nxp.com
---
 arch/arm/boot/dts/nxp/imx/imx6sl.dtsi  | 3 ++-
 arch/arm/boot/dts/nxp/imx/imx6sll.dtsi | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
index 7381fb7f8912..074c48b04519 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sl.dtsi
@@ -776,7 +776,8 @@ epdc: epdc@20f4000 {
 			};
 
 			lcdif: lcdif@20f8000 {
-				compatible = "fsl,imx6sl-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sl-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <0 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SL_CLK_LCDIF_PIX>,
diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
index 8c5ca4f9b87f..745f3640e114 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6sll.dtsi
@@ -657,7 +657,8 @@ pxp: pxp@20f0000 {
 			};
 
 			lcdif: lcd-controller@20f8000 {
-				compatible = "fsl,imx6sll-lcdif", "fsl,imx28-lcdif";
+				compatible = "fsl,imx6sll-lcdif", "fsl,imx6sx-lcdif",
+					     "fsl,imx28-lcdif";
 				reg = <0x020f8000 0x4000>;
 				interrupts = <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>;
 				clocks = <&clks IMX6SLL_CLK_LCDIF_PIX>,
-- 
2.34.1

