Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E7401DFF0
	for <imx@lists.linux.dev>; Wed, 16 Apr 2025 01:01:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744765309; cv=none; b=XK+jVQjMX0Ei/CZMtCCSRuMOGgt8ps70TM9LZgX3Df32AfPF+AG5qkDnou8Wxx0TmzMfs8cmoW8YGEb1eTc2l9LbYnjU+ABsbwDMCdPtgkUO9gymTD+Fp2qL8TH0JVYQWwZZ90JV8Be/shosfwKPxsjx7L3LAyYUBBtSqlx5ABE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744765309; c=relaxed/simple;
	bh=tzltEhfr+lbIBdYk+cHbqE+zLPaTA6Ce7yB9nx22yG0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KVzaA5IWd4TSh6+pyYGxCdI/EZgY4DtdYuaGqNjQTN67dDb6YPqLWSNzCj/DBdg4PSpv5bU+gEeBX2kvFyIGceqQQMy3jtYA6ZHICVLrkO4Wrnjmxy8MHyawowXYInA2jw52cgE8StlnKTuBMz8VGd87jFB4Jc1rYovFC/0AFDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdIS5XKY; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdIS5XKY"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-477296dce76so52409031cf.3
        for <imx@lists.linux.dev>; Tue, 15 Apr 2025 18:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744765307; x=1745370107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hqSJEtRGvHAaCnRJ3OyhuBvW3qmYyS2JqTii9bOfg5w=;
        b=UdIS5XKYW15LhMVWHErYeUkmypO7W95CgK6Ugr1PlU315ktphkVcHeIyl3ffdWUrVi
         Xy/bbisXcZi3r+kJpO2v+5AGZkcojo/p3QMMPI4PqwQ3zT3yPctrHAQPSUb3BeXpiTL2
         MPWvsZn28JHzfrTahcKfn/whc25PyzzXcJ9wccl56kdbTsk86jKCQB9pCA/qKj5YijeU
         lpqLYzXyun742+i4BiqazsFHD6Xl86rhb9D+AfhZYROXCBKQYyce6ENScjaBUP+t/8DY
         Z2SRigx2spq4gJGbek0O/hEm6vXuSXWum8k0T3ogr/33Ag+dtlJzRfxTZxfxt7gg6uz6
         BE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744765307; x=1745370107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hqSJEtRGvHAaCnRJ3OyhuBvW3qmYyS2JqTii9bOfg5w=;
        b=aK2K5ZKLXOigETDloZIcKmIvqo9g9w2qzrE5CEFBjDBKsNVFUXtN7wU9LewDGtvmz0
         iuGsqAUtgAwCFzxOyHTqjtMTcjw2w7MPhnDF1GOrbrObNYYC5gT2NXFvl3KmFM9Iiaqu
         7YNlQrhYAfjuy5noWWt/6MrIbyzddvoYbwXaj1JeLbSGFUtGRA6k7Xs6VxIXbpX+rmDD
         LNvfnaWVafEvUjdm4uGTxCu48P5+XbMYNd2rvOnonHLNe2FZHb4q2ERpA5A27qROFdQx
         n3te1xfjyS9F+bTm6qmHnruRAvAWo2zVZ65jSd0iEkbnGRjqoUQQ6g3PNegqzgOES5G1
         spKA==
X-Forwarded-Encrypted: i=1; AJvYcCUezOFxkrsIqs7uojOf2Q5qrACYNNFaQZDqBekbMrzkD+6pwUwQ6ng3P59V3tXYN5H0IdE=@lists.linux.dev
X-Gm-Message-State: AOJu0YwAmaGDMj9UnWnMy1vsN0rJ20mZ1PH9pRhyJyBMa+gd5DVOTj1/
	YQXZAkMiQvsisTTxkdQEIFnChErKBS0PGmlCbnV7G4XFxPN8FKFR
X-Gm-Gg: ASbGncvdhx3yFco9DadPz3Da729eK703Zr3RLjkiiX47ej7/F+Kd+nrTXMtK3awN4W0
	dn330U1fVmJxra82fjpFIbH+zZ7Q6E1XD8rSrXsTsd+VV46qzybAEiOVS65aZjEhzLZvwlc0X25
	9ZlIHk7V7/X88sRLH5K0ScW9oNRc4yTh4XjJUruT5FTq5rA5Q7Ddal1eMnudaWaHbZDUxcg1OGT
	AQTY2PqhYsfRX26ViB/JPt2fCVi3xnJemjxaqBKBufP16du8mTOuuDbG/dQ8pI6RZQ63YYfTQqq
	l0E9dxoNvlMHPvdd2TfZCliG++03CYELIxXytG2U3fRS2kM/+OYbFd2ZqlfiYJcLQeEgLLbCbcN
	ouQ6J2EJvK+w7Y0g=
X-Google-Smtp-Source: AGHT+IGokAkNgrA7P1lwPNLJsRHKFiTO0KpKLq4KAvL5j+NC4vnn7iCmOI5qeGOrYu0Jab+XyJo8DA==
X-Received: by 2002:a05:622a:770d:b0:47a:d51b:c7f2 with SMTP id d75a77b69052e-47ad51bccc4mr10217771cf.28.1744765306843;
        Tue, 15 Apr 2025 18:01:46 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796edc29ccsm99746291cf.77.2025.04.15.18.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 18:01:46 -0700 (PDT)
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
Subject: [PATCH V2 01/10] arm64: dts: imx8mm-beacon: Fix RTC capacitive load
Date: Tue, 15 Apr 2025 20:01:27 -0500
Message-ID: <20250416010141.1785841-1-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Although not noticeable when used every day, the RTC appears to drift when
left to sit over time.  This is due to the capacitive load not being
properly set. Fix RTC drift by correcting the capacitive load setting
from 7000 to 12500, which matches the actual hardware configuration.

Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
V2:  Change commit message, no active changes.

 arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
index 62ed64663f49..9ba0cb89fa24 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-som.dtsi
@@ -233,6 +233,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1

