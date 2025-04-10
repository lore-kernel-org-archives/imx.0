Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD881C8639
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 00:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246784; cv=none; b=O4+q96X92C9bGGGJhEXvpkFwgccTBrmPga+f1TuwERU2ue35AxRnnqr1e47ZCFl6wk3vo7gydSfKFeqL0REd6KcMrHwc9AYgvNEnf2lvgaDEHvpardbLzH4Z9QhuJ4VoC2ZvaC0vVWIM1N2VJe8dfUzxdZjqeRg5KOq7xkfGs+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246784; c=relaxed/simple;
	bh=DlUEQEr6eNEM37F6TrBK8XujA790jUwUvRA0/st/S2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ceq+ZUmEGsn9husZgOA0tfety9qByItBpzLoZcw1A/ZFRrtkDaK1r3YCmGvE5pK6t04ylLQT+C62uscA/rZ0LsTz/1cprJOk4YnoH/prmLrnpWXal9xaGhGNYpqESgQes63xr2T0VHFGLKylUufaafVpMCEs5JYr1AjfZt6uFSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VGvAaMyH; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VGvAaMyH"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c07cd527e4so27846585a.3
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 17:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246780; x=1744851580; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6qLNu/KtHI93/guQuNVzwPF3GfmNF+H57zE0YS1pFGc=;
        b=VGvAaMyHkPahj/xbU77mBgVaeLMrI6eOrtOa2QX3YsrJag2E2Vsjrmjdsg9x9x2UXN
         vhbX6TyslVsvaCS6u5gFjYCkG6fQJZP/Ou2o279CPn7jjyMVaoYO+Ltlhibj0gyZ+BXb
         t0Hn++3MfHK5OWAlHKS+v4GZNX68vGd6anApziKR1QlkzUzcc1zxnntEeh+gNAXVoNnF
         WR2ftQNJZud9ts3d/1Ww7fzWU9B9no74Gie3WfugAzFsn0ikoqOKtiUYnqkbAC1mqWCT
         8yTJlegF3MP+tE4IZyXWqp6EF8J0e/xLjG3EjUSFSO97yf25CrqcxcdsQ0ywJfQTCzio
         Hp5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246780; x=1744851580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6qLNu/KtHI93/guQuNVzwPF3GfmNF+H57zE0YS1pFGc=;
        b=nP8OOpG5rBUQCkyxE8vTtUWkamXO+446l8gg9tcjUtsDDTPF9Ge3fThvICEI9k/UsU
         cIvocb3J493KXIJmN1fHWOYnqzFoJKxlwgiBeKIRLNByKX6NQMXBmkcWK9qpU0/sx/kG
         zcIud/gzHlh7Hh+VhPWpIswB5PCz56QjWKV5cDC48B+QbghWwMQLzblXyWxfUHNM5z7d
         00fKu22K5pzDYr/wIP+M1DwLtleK63Jr/EFpj8QbyxianMIWHQnKiAt9iCx/JRXZ8Ss3
         xq2CCvVItBzBTn6N7XOhad/EONPjwDpL5G9WXKc4yUXSjNVzCpPXhPj/0/ysOGiy3+sD
         Juaw==
X-Forwarded-Encrypted: i=1; AJvYcCWukmVt7m+3xbdSaWVeTpxfm6joHgzRoPVyJHN4vlMVML7BH7eOtsUtCDzFUnNhDSj9sBA=@lists.linux.dev
X-Gm-Message-State: AOJu0YzqrKmHe+bG82IABrwOsbvm5dkgz2yLJ5tyBoQbhiTZ7+4RJnGm
	8HGkqZA2rc+rVqJGr3kP1S6BtVapCau5xUQmzlQLiicvlnmxSGZJ
X-Gm-Gg: ASbGncuHp/9m9B2C8T3GGJDocA2t9gJYIgOHHg21fylLCvvcj77UrNZpEei/XS5ZwZk
	No6uMsaXJzVdva2cufBbByup7wV/uLiFw9gE3+1eZK1vQ56B5ZY4dqcqKq8AaDblnz92dvjdDvS
	xOhYfrg3zGheZmXpRf1guWWF/jaktvLhA1jongMbnrEYuTROvwbjtA1Wl0FWKQ4bUcEVMSLXRvL
	zsA9imYAeadCmJHUIxFA0YqvCvLpadgJ2adn3l2/MpdBcMCcHyy7sfaGKSKLJAjHefMJqCL7ouI
	jsWzMni3faUwvzR5itRgL1LeWUpMOKWdjTtPNBNIMnlbT4erXeqqTPmnUd/VjihXUrpp+jn0tIt
	JLnJ1PuLscymuLY8=
X-Google-Smtp-Source: AGHT+IHMaFesdbwBQ/9S3gzd2hrnklop5LrX3XvIYEQehAtXNRnm2BUKFiblv/IXgjxmg3TAsEYK4g==
X-Received: by 2002:a05:620a:3903:b0:7c7:694e:1ba0 with SMTP id af79cd13be357-7c7a76bf77emr153611685a.44.1744246780532;
        Wed, 09 Apr 2025 17:59:40 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:40 -0700 (PDT)
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
Subject: [PATCH 8/9] arm64: dts: imx8mm-beacon: Enable RTC interrupt and wakeup-source
Date: Wed,  9 Apr 2025 19:59:02 -0500
Message-ID: <20250410005912.118732-8-aford173@gmail.com>
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

The external RTC has the ability to be used as an alarm when
interrupts are enabled and configured as a wakeup-source.

Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index ed7a1be4a1a6..8d4d1c86ad71 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -235,8 +235,13 @@ eeprom@50 {
 
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_rtc>;
 		reg = <0x51>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
 		quartz-load-femtofarads = <12500>;
+		wakeup-source;
 	};
 };
 
@@ -354,6 +359,12 @@ MX8MM_IOMUXC_GPIO1_IO03_GPIO1_IO3	0x141
 		>;
 	};
 
+	pinctrl_rtc: rtcgrp {
+		fsl,pins = <
+			MX8MM_IOMUXC_GPIO1_IO13_GPIO1_IO13	0x146
+		>;
+	};
+
 	pinctrl_uart1: uart1grp {
 		fsl,pins = <
 			MX8MM_IOMUXC_UART1_RXD_UART1_DCE_RX	0x140
-- 
2.48.1

