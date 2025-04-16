Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CAA207E11
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 01:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765319; cv=none; b=ZuoDZCOBfH4JnfVlYX3Cq5tpPCIDda7F0FhVdmPjjy0pD8ZcRtnp03GYo6zpcHzxFHC57CunRpKhlrCKECQdlI7xrMYqNfEukBw/XiZ+p1D46KExCPcN5u+sneWP7DMqG2XhmfDWKfMDh1rhAyA7N35cS+VmxkzpNgPv08OPb/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765319; c=relaxed/simple;
	bh=dJdnvoq92krnkPDc4GwTU2yY/XG/8yYrqwYJO2Nqfxs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hmQlTAIIXGTazPcIgR+SQy56irY1RbOxIC8RVgJf1x0XczoEs6mTur/wMgk2RFiC/dVlz9XLiwAW7RvmtfRMO384XoBBanA4syR+fHs9pEZODfr0gIvA95kr/I8xVJMEfL6g1c48DM2hLDNSKfqv3E7doyQmme5JOA9fnD6L/Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lLD6Tpi7; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lLD6Tpi7"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-477296dce76so52409771cf.3
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 18:01:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765315; x=1745370115; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hkcqt7j20Cq9gXaZ++SLKIGkgWo6g4XTTxRtlvgsjns=;
        b=lLD6Tpi7SVRdAMdJNGQzr5wgWzfcLE33rRAESCFsTrXMCqVXKQbMrVDB/za0CLHAOa
         KC1qJQSDb8Z6/891sBzqorAjD2IP18iKMiLz4wQhdVjJ2oHX9uZE9p1N2rMGpVixEDLf
         S9Kunp4z5aUI6ISGyXcgISw8KTeUAflLYNEuX51SaR5UZMZzqp3P2KAMLmmAx80P9LhM
         7mh1ztO+PJg9BEMNW82HaqxKzMteWNvichdxhtU9N4b/4ncyZI41lmHSWEq4lLnX8N+s
         0pHn2Y2tmnK9ETHsw60Fk9K4OjzXLeFUANyeSmQrGMTZWikJs8WAa9kofGpg09+x9FJX
         moYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765315; x=1745370115;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hkcqt7j20Cq9gXaZ++SLKIGkgWo6g4XTTxRtlvgsjns=;
        b=lqsiD/YW/wQbNXAY7zhISgUGt8/PrQuoaZ/NJ8RMQvnCm5aH32uOVo1J94pULsH6Uo
         ZzphsodkHUdeWHvdcb//ei29suYQgK4dUl5PAtJv8f4PCeFZSE65/JqvvGGN55e0RrIa
         93K1UVvFv7iOwIODpoJqg47KGiOuhsrj9s804VNGjGqZFgjTjmB8/T5DTefToEHXVtyb
         +pLoszjJq6QOniz+En0jRnMtPW02Wjeo6xs/+X6+VRnUG3b1zF/zhjMxkaYEmo4MF/xR
         AT6mxa1qVSldLQp6M1bQf+sGBeJmKtQg9Ae8BiyoLhJfvk7puM6TivQz7zKEjgucnGpe
         MiOw==
X-Forwarded-Encrypted: i=1; AJvYcCULe6qIKwHhUcO+GBD07FAj8SNM8vRe7ei8+1VvuZv1V/2hMpqa4yK7DG3CfIduqkbjkro=@lists.linux.dev
X-Gm-Message-State: AOJu0YxH2kuWYCLX7aVPB/pru+5rdPtHqpeVmoCX6GPfP8uhQQtTMf8Q
	qMdRJ0iZlo8/6xgIf+2WQhO7DSUH40XKLEOFsyWwUXID8MTDM2BB
X-Gm-Gg: ASbGnctrsgRmxh2XE3yYIHyxJNG7OYCbfQOqEiuEWFnMxHjKQ2sJdRN0bLtq/LHB1+R
	mmFjScxTT27iZlebCDSQmF9vf6D6OiRNcRObcNng7AndbxFN5dMKMr8JstWbTs8kJmB2ztQDXX/
	qOMXIfzjsoPsonNR+kqa43xL3m3uJ72lqKcHZoRwXhXt1H0JsgqUxpibbDITUOwQAjX6Djan7Dn
	Tr/qNnl86TrH/zWM7Vk863BisDSgtV4r9oF27KurHI33ZJGlQNA8SLgocWcf0EwkZmlVbMKUNjZ
	aInax/gNIzzE6rXqTXRw7WUXKfDiAfo92NyTJkgsJ7p5N1TsOe2DO9ud1HEZ9sQakOeVLOobYRJ
	i1XRpmNJQGDTM4E0=
X-Google-Smtp-Source: AGHT+IGL61nVIyHlwCc5yIDgO8Ggv3BrMCi7sfU9sNUu6VGxyESewGpo9fushCvrmYo/ZJTSEOUl7Q==
X-Received: by 2002:ac8:5a10:0:b0:477:6e8d:6081 with SMTP id d75a77b69052e-47ad3a04fe5mr25016551cf.3.1744765315409;
        Tue, 15 Apr 2025 18:01:55 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:54 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Frank.li@nxp.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 05/10] arm64: dts: imx8mn-beacon: Set SAI5 MCLK direction to output for HDMI audio
Date: Tue, 15 Apr 2025 20:01:31 -0500
Message-ID: <20250416010141.1785841-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI bridge chip fails to generate an audio source due to the SAI5
master clock (MCLK) direction not being set to output. This prevents proper
clocking of the HDMI audio interface.

Add the `fsl,sai-mclk-direction-output` property to the SAI5 node to ensure
the MCLK is driven by the SoC, resolving the HDMI sound issue.

Fixes: 1d6880ceef43 ("arm64: dts: imx8mn-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
index 1df5ceb11387..37fc5ed98d7f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-kit.dts
@@ -124,6 +124,7 @@ &sai5 {
 	assigned-clock-parents = <&clk IMX8MN_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-- 
2.48.1

