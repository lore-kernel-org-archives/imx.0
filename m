Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC487156C62
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 00:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246772; cv=none; b=QeChXZEwpql9sLw2hgpmXcbDV1ay1VavTgPVIbK7X9j9FM03M5JFmd72UXlIT8/H9fAb5rsXN5CDubVT/q3X/IBsRoxDJiwR3hj9VzzY44l+rc4IRbpZNzoGmsQ/ECV9Nn4nQ+BXAGFzfFSOU7hWXxe7Kxn96wU6x6rMux51fHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246772; c=relaxed/simple;
	bh=SWhM1Y9cbsDX3DmoQkxqoydODQzVCEIE8uwUZP2DfSQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wk4qHUy0rHImJQhJjmqMDP4RmANk7qw4u3tOnqgButOURVv+qCT/ZG58ooDXzpav5EVtBvQHTXKe270AxEmwdVrifTo3jZFR9PFkHvscVqz8E+3s6fVFqwKQKAKYB3zIfOBkc4RpFpm7ITYuVPfEIhsU5YQiJ9rNtFQLvBFpi2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XtDqkdhc; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XtDqkdhc"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-7c5e39d1e0eso27371185a.1
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 17:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246770; x=1744851570; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWzUEf6VPqNr8t6mjQWXtWJZNm2EpdCNeJxperBpJB8=;
        b=XtDqkdhcO4ninkQyTpxhXhfJCThKFbeepG5K78Wbr4cYV7iIX6d+riA+DrvrHqStqr
         fPU3JGWolQjnaMSrLxKbRVDa9eV2yKF3f140z2ho3w5096THReYjhs+56wJo2La033rt
         W+IRPkW6pGYQGKZx1DrGAaZZpofq2hqwcuaq7INGBseUsz/meqpmEqKtqoOUJhnV4MFi
         A3kk0+aJ1F2bxNSuj/u9hvlW0YhmKxhTZjssWfXTl52+ytCR3NaD5nWDxB0nujyo+/OC
         k8FomafYAlbWsr9ykBJDK7E5pI4kD4o6b2GQgG2x2UMz1S0khjfxkW5TcJ+6xYKFad+O
         AwzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246770; x=1744851570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DWzUEf6VPqNr8t6mjQWXtWJZNm2EpdCNeJxperBpJB8=;
        b=syR+e7YlYweTZ7L023fRO3jm+WMxDrp8KRRYjg06DG8ZQCFtegSFr6EbZhJ5wvLsLc
         LxV9yG3IzrkSyWpbpHVuKa/bNHhILZ+Xn4rjg/2po3642pvJUK4c8xIx4D7wQtyR0D0b
         IXJsIYaMbViyrVV6zTDlUFgxpVxv2jRydL1UGD6ObtbvV2cruEiaRB4wCc3ifNLxjvlV
         VZC6iQsbwdKF0gYqFE9zSgh/VT1O2HHdWnEWSwjqDPWqsvRMSoeQMoE+z1Ac1aCJApWj
         TlmHXIClcVBKpitXPADYRkCJ8jd3tYXPS1g9jS/Uo+zIakEiFkFtKHKpa12Vc7LVZ/lO
         HkpA==
X-Forwarded-Encrypted: i=1; AJvYcCWsbGu5biq76svNWGWQCuSojLZmAK0eVGQ5lJFjo/bIr5aRZ/Mm+O2OcXqPfj2Gw6nf8T4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbxNRA40aBXigCuzkXPMmsJGe4bC3AEdAoF35q5/BxJUpaArnA
	SFBv5GeMcKcd0hqjHc+H3tDHwvooxZi7O2xqw4PaAEhlbkUws5vC
X-Gm-Gg: ASbGncsEPjbynjgSA1G949wKsl0iDocVopJoExyVuJRYOG2tLNx18Cuk+oKT6oHb4Z+
	9nWlfJ8GxvDqYZ85ulvFf6Rb6TaRkKrkXJHZGhUqPxLN9o4UWODQywTiq/oo3SaXGgOMUL85a+U
	B5AYAZ+/9sC5I0uSCJi3/95R5fgE/7LFXkFae7yv7t5By3wc+iF4js7lJ4fYQCVW24WLyTx7psm
	jmRSD2czTXOhXvqnxs7L4wRhm19xEmj5egfJSfMZsY49EsP0iR6h+CHg8EXLfrAFjMVBNEKPlVl
	TG6Mbm6PW9Il4TUlbaqLqwJsZa59kOKFGRrslBOfLDsGAu4aOACqkTtcjKFFwVxqPHmxLirtkNk
	gCBzAzLq/m8/YOHs=
X-Google-Smtp-Source: AGHT+IEOUsk3UgJ2ZjGZnVGL3oNGyliUXyIV9Ti6Sx7NFXjHWz4LHaoRQc2J2+koxguq/sC09DyYdQ==
X-Received: by 2002:a05:620a:3944:b0:7c0:b523:e1b6 with SMTP id af79cd13be357-7c7a765becbmr144726185a.11.1744246769928;
        Wed, 09 Apr 2025 17:59:29 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:29 -0700 (PDT)
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
Subject: [PATCH 3/9] arm64: dts: imx8mp-beacon: Fix RTC capacitive load
Date: Wed,  9 Apr 2025 19:58:57 -0500
Message-ID: <20250410005912.118732-3-aford173@gmail.com>
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

Although not noticeable when used every day, the RTC appears to drift
when left to sit over time.  This is due to the capacitive load
default being 7000, when the hardware is really using 12500.
Fixing this setting to fix the drift.

Fixes: 25a5ccdce767 ("arm64: dts: freescale: Introduce imx8mp-beacon-kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
index 15f7ab58db36..88561df70d03 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-som.dtsi
@@ -257,6 +257,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1

