Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36FFA1714B7
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 00:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246776; cv=none; b=pNnST8Cq9eQVu98q7+Lzd9NsvB6R0PR/cv2ZNgWEL7xkkV00QKLtPLizl/p+QUiQw2j75ervoapSbkAIu8I4G/Jdmc22X+9G5wvpDc7+D1fIsxDitMlzCYo8XYLQFDSqCxvkg3DWsLBzT9wr6lsGTcJGW9x3pT5DHyFQdkNOLNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246776; c=relaxed/simple;
	bh=UEZYxJlRW14QjAti+3oPkm9GRt7N6qkSO09zD5qhw5U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eELgqKOag5XDnmSwhmwb+Erh8g7gx2+vGQ+q1YyCAnSA7LPPYHoHc1mwN+9sNIBFeLEfXoA8HoolY45MP6AS+tUCAfLr+ryZnoaIWn6kXyqY9tgUADkKM8mTBcVAqalh7oPST1OMWTo+Er0WE2R4IDy0JK/kFln7pEcvkIQvM8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QNuHQYs/; arc=none smtp.client-ip=209.85.222.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QNuHQYs/"
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-7c5a88b34a6so31089085a.3
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 17:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246774; x=1744851574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R7lDTk+D2aN9K2o2aETqca5tZlWTc8yezMYzKKwzeFM=;
        b=QNuHQYs/c3wcWyfEpP0f+PAhL8uYzp1YGb9wrIWCZB5kGkCdU0OvNptuZDM6xTk4A1
         yT9dOGR4InoPHajXoIkZm3qgUlWoUc6vRBZcLXhJj+UkT8DB37gvlKYPgDfz45Bvs5e4
         Uad65emfnVLKv+80KjuxVEZAsrnDftgLiCI5ap8QaULpppfbGEhBbqF/cmzX5bwbTncF
         2KZ1E6Js/RU9pK+2FWYsI1kWrCb4G6UgMSb100KCZ4XKyyxPzeKZ4eKK6em1lLMfbu7f
         Zaj1gIKfWFzfCL+FjDSX5UQre+TkyLUTnA93x/fzD5cL/BdRFyWa+RANNcTuYMHpLR0r
         KLfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246774; x=1744851574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R7lDTk+D2aN9K2o2aETqca5tZlWTc8yezMYzKKwzeFM=;
        b=qqn0esabe5cX/tpEaYXFzcd6RvCOeum1y6qAGn1jaHqmuZfGmvp1NMVlc1yns3FIH+
         1DG4vj3JSVjFK7dWBVf8Gu7mF6mCE1XA80NlKVwVlRkq9GRG4WFSY68nx7Ns8OCTJOqn
         qLKHHwgmbqw+9Vnwuyb9M41vCknp3enJBwNPam1ckSRKSnFpHuYBH9beBcepmUjvslrv
         x0tacWayNH3K3clXnxGvyD0vfhs/YFxqD3WO441exgWn3R2VPHp+cRmqh5WzDtXYezFQ
         /A2ujKRcZzWXjD21bUmfJxXQtLSq4tv/GZTwXV47GkmSTUlFdiBSDRAnylAgB9+fmHcD
         pH4Q==
X-Forwarded-Encrypted: i=1; AJvYcCX867l+0ohnW/BzI/qmf+niaEXZnkVPnw0xbfbC2lGRar77JXZi0ZEhte8tKrN8YBbXBBk=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrsC8TQqgPm0vamULKXwEw2Nmf5mWDgWKvzN5zKujCK+UlaRFW
	z7VD06Ey4jrz3RBFMxEu81e5YEQ0JGgp5mGOoTqvMieW775pRfAE
X-Gm-Gg: ASbGnctbrfFLNfdBLkshJ5wGAJw9V0jfgfg2/C1rcIEC3jYOpVg4sLUAU1vAbNnTDfU
	0lqFTMppeqNrIXTrdaYiMQT+VjQbh/owt7edqwHRikqCyFi2P3Jy36TWCi6jqadodJKyu1ajFY0
	g0VaWPDdP35T+0onmgN/DrTGcKmAyNxwNCJhYWEU6Du1QWUSEBvgo44ZB5GbSyCZ+qugY2vQ78b
	B7J/H7NyXX/jXiZx9BG/wQY3PbzFbVZLwL7qVF7u0Ta8pDwwUKfB2EzLvhbDdE1zHyiNxLApV/e
	bJFe1PJJNzV9tIlSfl0zCfvqGaWiV2wQTI6i8DvB/3USI1PAHZQhli2ym8Ec1WKeMIa0FC8t8D6
	RwcE7ORH/cYKAo5M=
X-Google-Smtp-Source: AGHT+IHwE4DM0JUskEgUnwY5l5TziwQzQmMz//45AfxohgItU6xab/F9UoiQdWp4h++rosDEZifOkQ==
X-Received: by 2002:a05:620a:2549:b0:7c5:56c0:a8 with SMTP id af79cd13be357-7c7a7659969mr135047485a.1.1744246774043;
        Wed, 09 Apr 2025 17:59:34 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:33 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
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
Subject: [PATCH 5/9] arm64: dts: imx8mn-beacon: Fix HDMI sound output
Date: Wed,  9 Apr 2025 19:58:59 -0500
Message-ID: <20250410005912.118732-5-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410005912.118732-1-aford173@gmail.com>
References: <20250410005912.118732-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The HDMI bridge chip's sound card enumerates, but it does not generate
sound. This is because the sai5 node is missing the flag telling it
to set the mclk as output.

Fixes: 1d6880ceef43 ("arm64: dts: imx8mn-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
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

