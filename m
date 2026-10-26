Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792975401;
	b=qe0BkDG2grwWc2vfzpkcjzX+LOvLp/59lIVBYL7ejTwrL3vTBUUtElgSicGP/JGbkeF1
	 /ODqreO4SUfJQZ6YddAoPYncUFYQhF8ZTowBJ996+33Ffzpoxx3g/Q7Z3qjX8YDfNv0HG
	 RIvWxetokOhlx/vs64sj0MG27VdJbOMDNBDghSaYfccGb019LE2x3tF+GC8pCEnC12Gl0
	 z4dfEnAj/EN/XFXqWhNItL4KpKb1SE3+Cm7CI6t9ioIKLLxAZQEaHptWOLaUtluPt+Vw4
	 Tk934XMxbZT+b9i2L2FV24DNqRDA1dW4gdImyWd4PoBiNg/NYb6qupPtRpPUGIx9YCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792975401;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mdvyCnUTqtKZWJP8Qz2Rtn+aEZNUKTGAttllLV0iXqI=;
	b=GKe6AEgQrp22MR+3TeqMqGv4igWp1p5kthRb9vvxUToAFXmQ0u9R2p/wj//GQ4zURPCl
	 YYiAd5wPXsvZTo6/jbtccqVJtb+Fg1085w2s/GWkguGM2+ON5Nvt8RLrw21zEnTYDq7QF
	 deoYxpYaakY+giIKjs2EX04T59zqD6GvKpCwu7LjAH7hikvJgvpTag3pTGZeteCvVThIu
	 WgF3dX3qvLhI8YrGAje4uxNArbUO7BaTUxIhJr8CwT+wr97xaIAMlhQKkbwBeGt6lcx5W
	 K84aAC5OYHOiETotc1Ivt8FBCLLsBmvTQ6N5ceKyVq0oHX3oav7Ws5nELrut5dTKPCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oDil6bOb;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA39C606A324
	for <imx@lists.linux.dev>; Mon, 26 Oct 2026 00:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA39C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=oDil6bOb
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso9344535e9.2
        for <imx@lists.linux.dev>; Sun, 25 Oct 2026 17:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792975399; x=1793580199; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mdvyCnUTqtKZWJP8Qz2Rtn+aEZNUKTGAttllLV0iXqI=;
        b=oDil6bObMMzcGsxovZhLewdJpaP7wLipaGqdgAnZyThoW9FwyJjhYzE5rWLdoaVxKo
         zRNgXLTWQwty1+0EtpX9gfMV01btaOUzqiOvnpfz+WERhkkRcEWOhtKJA92dBY42022G
         fgrx2oQl5LxmjN5hcKK8C4appd7xgH7H8cUyUyD6nzZrA9UC+wKAsMomasOLd6tsosY1
         4NEP0JrqSn8tQOjYfWlCWbJZ0LXLggvQaz968HvAXwHIi8c7Ho+gCZiBs5cCimpvrlHt
         kM4CdW5e6sQ6ibmCQTcGwDIjbyT7IqXryKnCSA11HMHq5kA/alWR7sQ4RZLkLGJc+tKc
         XGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792975399; x=1793580199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mdvyCnUTqtKZWJP8Qz2Rtn+aEZNUKTGAttllLV0iXqI=;
        b=mfKXOAiQrfRTN1CmOMBNbGGkK/EbBj2rom4KYVj5HtWL12j222HQMk5v4nNDgNuqkm
         UtdxmKTE2O99/4LtrObf8jIbMASEUJqDec0nxRmeEs7GqK/iHYjCNhc6YaZ/AuCePLN6
         XszSpCQKhZsL6AsoRTk2rRbT1HIfxem53VjfQI62Y1oKVBDphw81dcqAyg/3jOaj6IUM
         Z9TXK03PgDVPLd1iHNevOHS27v8N2vvi3KOAHkm2+v1Fgpz9fZt/dE+A8HcpiivyPZ5B
         dkC+KQNShg+lvxW4rAw+7YgAxJY9ZYExPaDUgESuW0hgQKAUVJ4tpVGfCkLpDvBNcSTX
         snWA==
X-Forwarded-Encrypted: i=1; AKwUvBwz1RTes7cku4dTdpiLPIn+tPgXHcYYWMioQ1gsslPNHEMTTMqPIYMQfln3uX4Cpy6Wmpo=@lists.linux.dev
X-Gm-Message-State: AFq9FYLT5ujngHOy8OvdC40xyGPyENwLNjPIEOOm3ncba+9j362Now1n
	TZ+2ZC4x8NzNb/2SWMdKa9JERQytPd70/KBKl9EJ5MT2sdz4d12WZqit
X-Gm-Gg: AYBFou1dZQ99iuDiiQdEtxFN4NNGnmyVvO64MUHk/V961j2zyUEsT3qYwAfXdcuRZaq
	WniBxDTynBjpr/0fsUAnw148VV9PyUP0wIjvvQbqQ799sOvoB5ur8ph/WFZiXTaFvjMZ0MiwPyk
	WsU5rWKKSZrDnHj6ecdgsXsALGNjAntZbqZGcl5aKrY5JqFAQvbnGr3bM66QNuI0IojDryYFcwH
	AlFo+C6u5eWCfm4H0w1XLzaHZ3YZzD63J6nKVenJjkdkGN8K2hHh05BetCyMFM+NX5CkXB0S3rJ
	MiWFKFjy6RXwGyKF9H3I2J46+IalHim2M0/gCcFmwrzcn1InQstlTYQQn0WYms1tN2GlwaAd6ho
	N2Zjglw/OPleEqtbC1ztYHvg9vSkEqLhAtiWBisO1UPYAQ7dH3J61hkelO1QpR7qggKgnUss3wa
	3u12O/yP6WCt08zZE2+E62MjSA6aZkgh4q82Th+ILlDUaG7Dek5PLECBvN8hTM4dULkGM/oNlw8
	flOJ5pGiGgUg7K5vxX5GAa1dDbHmkxbynslE5gus7nS9FRTVNGi7J6SJwxjUxV+NiyUw7uUrpdL
	pWFqa6jEYv0LoQ==
X-Received: by 2002:a05:600c:3b2a:b0:4a1:71e5:9420 with SMTP id 5b1f17b1804b1-4a35aca4e4emr92594645e9.13.1792975399138;
        Sun, 25 Oct 2026 17:43:19 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a07ebc0sm74574555e9.3.2026.10.25.17.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:43:18 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Andreas Kemnade <andreas@kemnade.info>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] ARM: imx_v6_v7_defconfig: drop the SY7636A MFD and hwmon options
Date: Mon, 26 Oct 2026 00:39:18 +0000
Message-ID: <20261026003918.155321-8-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026003918.155321-1-pmazzini@gmail.com>
References: <20261026003918.155321-1-pmazzini@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SY7636A regulator driver now covers the whole chip.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm/configs/imx_v6_v7_defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/configs/imx_v6_v7_defconfig b/arch/arm/configs/imx_v6_v7_defconfig
index 6ac42c06c1e9..bd1f692dd7b2 100644
--- a/arch/arm/configs/imx_v6_v7_defconfig
+++ b/arch/arm/configs/imx_v6_v7_defconfig
@@ -223,7 +223,6 @@ CONFIG_SENSORS_IIO_HWMON=y
 CONFIG_SENSORS_JC42=m
 CONFIG_SENSORS_LM75=m
 CONFIG_SENSORS_PWM_FAN=y
-CONFIG_SENSORS_SY7636A=y
 CONFIG_THERMAL_STATISTICS=y
 CONFIG_CPU_THERMAL=y
 CONFIG_IMX_THERMAL=y
@@ -238,7 +237,6 @@ CONFIG_MFD_DA9062=y
 CONFIG_MFD_DA9063=y
 CONFIG_MFD_MC13XXX_SPI=y
 CONFIG_MFD_MC13XXX_I2C=y
-CONFIG_MFD_SY7636A=y
 CONFIG_MFD_RN5T618=y
 CONFIG_MFD_STMPE=y
 CONFIG_MFD_ROHM_BD71828=y
-- 
2.52.0

