Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822E81586FF
	for <imx@lists.linux.dev>; Tue, 27 Feb 2024 22:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709071514; cv=none; b=N6eKfIr1aDrAsx+0JJdYbMpX2iPE9kctvHjehZNJKgAgTuQO6ks2ysqdTla9vJudcW9vWZa0y+dr0lt5+rjQAEBBWjvmF1299lg54rCsgnvSp19nFjfpWfGxyiKLq2OQh8oobtVNS19gsBq7iY/R+rpwCtgZb0Gpa5luh908p5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709071514; c=relaxed/simple;
	bh=Daep0Slfrtw0Ds07RH4d7jSApXPXFCQGE2TgTpYU9Xo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I9NOsvRBuNvhfsTn+MJgeKUYM9soC8DfuN85H+TNYtQUZWlf9aVOZody9uwD5nX8O6vxPdsfTFypolsJZS/CgQK7kLNykok1H1epdncAmKx8T4MEW2COFppAs/yC+VTlQZcGXSMTmwa7oJKzMokemEu70z+6rGeZTpGsdqvxFjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NPOK/tQO; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NPOK/tQO"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-3bbc649c275so2438354b6e.0
        for <imx@lists.linux.dev>; Tue, 27 Feb 2024 14:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709071512; x=1709676312; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pg+umx5FUIJdMs3diOaBF+zl4OepmD7HnZ+prHeGKsA=;
        b=NPOK/tQO8Jq1EfnIHQJtE8LY40RuASN7pCQS8r+HxXqARnV/4UU5fTqVFrBbz0X+7Z
         ipNd7VJ2Kc4FcxoahHht307jD86CHu0y1DlAXDnEinkk71T58CzUqeZl+f+8RDTIS2o3
         ZXijfOI/XX81hPzr8pk+yHi/j+yo+jcAgj26vlcSt3S94xY8q3g1mCtjRQU/0YAI4/1W
         KDlPwGKIH6o+8FuauuzJ6xVhksRSSX+wqOYkgJK9JaSrurOEo0CYP1+ovvCSQc4/AM3C
         dAtuWdgHPUKmNp4EnqFGKIOQizBPKCvnoaaa9XDUQsR7Wxw4zpAKBPY1IE/OjXx+qHiv
         Jf/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709071512; x=1709676312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pg+umx5FUIJdMs3diOaBF+zl4OepmD7HnZ+prHeGKsA=;
        b=RxPnY2pnlNr8E4Vcl9xtA8zFUtdLwFe3N+K06SsvycgfxeZKKPdzD2xW1w/L7vY0Ts
         6xn0u8HRsgpS5FXW1+UhpRRJPA0q8xWOsmei2esMz3inBRCJ+LIY2LxQj8Ale7gi1ahZ
         5M+Jf7JAZBLU/bbuKGETzSz0Zy3yMruLV+sk02DIVrbb70eXwugp3RCTFePAJAnlDlN1
         2Ljm6uOKiTomt4HH2kHQw5kN6MBa1Jw7eGQxxpMGdDRmiJVhrJoN/SM97F4q8raDfbib
         q7wfZ3x4rfyaHq/phgKKQJL2kSlGLsa+r2iHTSXMdujXzZAa+y4ZfPqyOERtH8y+TzcJ
         v4LQ==
X-Forwarded-Encrypted: i=1; AJvYcCWVEjsj+LU3HKKUswXfNtrXjg+LdjfAQfBoIBgDp8hD3L2b1i85GU1EFSl4Yag26GgJsElqBTCMaKNC8bCUlXxJIaAt
X-Gm-Message-State: AOJu0YwmRzREYI8kwkJKOnmWc96sc6BD18JQVoZxyk10hVqLTRBYmvL4
	07Vul6E/a6yex19V8yWrPt0DuRvlqPWvgY5ql76rZx4D/kGPJdlf
X-Google-Smtp-Source: AGHT+IEmWreknrcyf09k6m1PvVcfqFMnpM75hkf6hTSSVFVvDaq/6FD0SFqz9UMfV4yL5nvUNAshIA==
X-Received: by 2002:a05:6358:9496:b0:17b:57c9:dddc with SMTP id i22-20020a056358949600b0017b57c9dddcmr8981848rwb.5.1709071512522;
        Tue, 27 Feb 2024 14:05:12 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:9ee3:b2ab:6ca:180d])
        by smtp.gmail.com with ESMTPSA id c12-20020a0ce14c000000b0068fc55bcf6asm4569556qvl.119.2024.02.27.14.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 14:05:12 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V7 6/6] arm64: defconfig: Enable DRM_IMX8MP_DW_HDMI_BRIDGE as module
Date: Tue, 27 Feb 2024 16:04:40 -0600
Message-ID: <20240227220444.77566-7-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227220444.77566-1-aford173@gmail.com>
References: <20240227220444.77566-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The i.MX8M Plus has support for an HDMI transmitter.  The
video is genereated by lcdif3, routed to the hdmi parallel
video interface, then fed to a DW HDMI bridge to support
up to 4K video output.

Signed-off-by: Adam Ford <aford173@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
V7:  No Change

V6:  No Change

V5:  Added Review and tested-by from Luca
     No functional change since V1
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 34681284043f..ee644d27652b 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -887,6 +887,7 @@ CONFIG_DRM_ANALOGIX_ANX7625=m
 CONFIG_DRM_I2C_ADV7511=m
 CONFIG_DRM_I2C_ADV7511_AUDIO=y
 CONFIG_DRM_CDNS_MHDP8546=m
+CONFIG_DRM_IMX8MP_DW_HDMI_BRIDGE=m
 CONFIG_DRM_DW_HDMI_AHB_AUDIO=m
 CONFIG_DRM_DW_HDMI_CEC=m
 CONFIG_DRM_IMX_DCSS=m
-- 
2.43.0

