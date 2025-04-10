Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4695918FDB1
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 00:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246774; cv=none; b=WRYWLdCBOXMw2jC8KHE66TIIgq6hghPQb2ecLu6TlTYi1RHHOWcZP9ftk9y07LeYB1DkHpePI0Gpxwp+sRaoqYy0yKGhGyaktuQ+oVhRL73EX8wtJS8oxJddiLsdAS7xFVlhb255EOPUGoqoDEPyEcSiKhjHmrqn+QWxIOUnXb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246774; c=relaxed/simple;
	bh=0zEIYJ6K6OsATit4gFPnVnv48BDsEo0hwTZWKBdqB00=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KhJdIgIyfV0ZQZCxq8USj/ywsIRYtultIuZmfw7fOQ2DUtyg5AwY1ohIdDCgYzdpl//+lGxnQCjvjPpqeQ0oWGso6g1mE8qvUqt4LrBruVU/Efwt5GhQP/djtJrm41DmkUMcnXXlKs8NUBxLLSLxNIM2uwyGod7LuVwbk3PN5QE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kkPoQlBu; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kkPoQlBu"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-7c081915cf3so40256985a.1
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 17:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246772; x=1744851572; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+DEC/Wm/x+1UpGftu70dJQzMWdvcnYAg9wxuhWZrzI=;
        b=kkPoQlBu+x3/ob8hcGadd25hcsVitWZ5w4FysWB891dEKu5TeFUs3tBZVdnk0cxb10
         S1PC8P3kuZVrFIOqGXiZqmm8g5hgKoYFLCNzF4SSpXoskTiDGIumup/gmWfTEA8cIKK1
         JD0JT/czyWOBIe7prPRQWxnQEGGI9j7ZtduY0Dh2Izg5YASF9C0ezUbPHdvdhPyD6QEP
         r8cSfYkt6Ol0smw1d6wJC9AMdWMb7O6otewws3ZLIzfazy6Rbx4JsoqCk162XkEuiEgm
         ERr22o73l/RKmva4h0esvY6zOlriODm3FwEegloNoG7s/RMa+RufXFV+L1/wRio0Sq1A
         sRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246772; x=1744851572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d+DEC/Wm/x+1UpGftu70dJQzMWdvcnYAg9wxuhWZrzI=;
        b=PST/7qJvJH0gWCj+DVQKkzITaKcO4bbpw6KuYCSNHzzHwKfctCSXE1sEKBEZbNw4bq
         L3g9el1w3GwS+BJfU0hn+oITP01Ph9PQyrxFBLL4js9YjO/DRdK8UICEyClvSxJdDoLX
         pYoiM0jqYQKHjHMwoRJcTcfdug2wHqFbKEEnbr1lCpoMTJbLeZ5IE8vnLPu7wDzp5qtZ
         DH6/grCb+w6w/BBD7Quvz/eUJV8yNeC/bcWEt70j4XahjpWnvz5zFO1C40l3p8HQYQML
         Uj0R/Bp6wL96KuuVoPtr/kzsykUl0ImoYfuRM7gVBTGnClchmBzveGtCqwmBV/gxvEr5
         SfFA==
X-Forwarded-Encrypted: i=1; AJvYcCUAMYQdN6xFGQ4XEstihLnIh6bdY9YwGKveeQcaKcnCzjlzWsMik9nV9SIN6OTfi/qPMhc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxYM6rGqhQaITWO6QUj9v//rhoFlTyB2cBeRhikNKGCum4XSrx4
	c5Qov4gJLXKytSEeHcLspV1Kyh4R2FLYCQXSipLevCN79qhqI1SH
X-Gm-Gg: ASbGncujsNV9z1RLJinwYQf3PuS4J0Tthk4ezlI3oOp+kjzx9Y8utBcYJ3hKjdDVmve
	GhxNePuTdv5NhKhDmSR4QAoSfFJWwiWhqbudD15WZfzMCYWsvacVxeU0A1jemKRXz78EOAa/JjD
	us8CMioKm1RlOLfVounDFpQp6bB56Z1GnLPfgDdMP5D/mXtAQDLGWpBJesYs6P6rvSIThiUKilx
	qlkrFXlg0RUvfojvm/VIhpVahSrENQjvrudkKpDOAmQgKVrfj4tRXFX4u5lzKhLh/9xY+dWaA8p
	NnlhP962m1dMUT+EyqwRjUt+8POWjjFjNSLmg3dPRX5SHC2FaJjiSCju3+ByPzic3MZkuJMWmeI
	UxhKdymcQHcZE1+4=
X-Google-Smtp-Source: AGHT+IFs5AeucnU/5qe1FBFgBALYzHV57xEbna05f87jL2wZRYoAR+pVlqKCzbG62FhrCzvkoYc8Xg==
X-Received: by 2002:a05:620a:1915:b0:7c0:c046:7c6b with SMTP id af79cd13be357-7c7a76d154dmr129648385a.53.1744246771975;
        Wed, 09 Apr 2025 17:59:31 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:31 -0700 (PDT)
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
Subject: [PATCH 4/9] arm64: dts: imx8mm-beacon: Fix HDMI sound output
Date: Wed,  9 Apr 2025 19:58:58 -0500
Message-ID: <20250410005912.118732-4-aford173@gmail.com>
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

Fixes: 8ad7d14d99f3 ("arm64: dts: imx8mm-beacon: Add HDMI video with sound")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
index 97ff1ddd6318..734a75198f06 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-kit.dts
@@ -124,6 +124,7 @@ &sai5 {
 	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
 	assigned-clock-rates = <24576000>;
 	#sound-dai-cells = <0>;
+	fsl,sai-mclk-direction-output;
 	status = "okay";
 };
 
-- 
2.48.1

