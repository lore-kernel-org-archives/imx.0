Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E8ED137923
	for <imx@lists.linux.dev>; Thu, 10 Apr 2025 00:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246770; cv=none; b=Mjb8ccYXJgh7By9EIkddoH1YEFNB+KiP+4rMSdydc2XJdrG+1qWQ3PqyTwBQizZtqglL3/goAMKsjx7GsUkts7R+/WiL3EjNh18Q0QeaGL1EBhhhuemHmE4rWjFYOV1LckMTdIxgnEjvyoa0msSwCNGJpOwPzM3IGqF6gOOP4xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246770; c=relaxed/simple;
	bh=LIsVjG80noSF0/+UYFzuTPI2eRaKHkJYrTzw0CaDVPo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LB8fiOZcmQilLlXLO51OCRTTpfHv2A5z34QeRwKkJTzXpILfSi8sEUD3GUB7PPJLGFkZiUpSNEVmgot4cBBW81qLHcrrJP1dBTTCP0ydmj71jCfZBt6rjWgvW1ZHQBHLGtapCRIEus8IJndE0GETtYRVwyxnjUp4bsTjlzw344U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCj/MpP8; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCj/MpP8"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c55500d08cso28447685a.0
        for <imx@lists.linux.dev>; Wed, 09 Apr 2025 17:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744246767; x=1744851567; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeG5k7eeG5nrvh8Eq49sU4B3j2ymx/30X9ZLGBFGRWk=;
        b=FCj/MpP8crptuGCHNrvahA1RLn2FGO8SOYAALNmtB3q5Vp8TuVHMevTDgKfmeNeor6
         vHSWDJFo7Nq2vmeh8xQHkEVaAeC7kBGfzkTfC51Mbu8Ggk1t0MPheHLZnHHzZdINSVOH
         a7b4SnQzZe925hEFk3BYozNErNQu2dimcgpH31SjQR4FoZd0e7aknfYziFJa4w8aGzSA
         UaKozA5a2GuItRr+9r2/pKHuIrEfcmpkZyXQrZBGUpW28Y2i17TYcCCZpgYpcD5G+fOp
         KvReLH1vjVIcPtgNWjo44DianZfFYtZMZ0J8Kbwso9wynZheHT/44MnOxKQHYICK9sEO
         9tXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744246767; x=1744851567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CeG5k7eeG5nrvh8Eq49sU4B3j2ymx/30X9ZLGBFGRWk=;
        b=BolAt1AD7rd/jre8eAOqhs/zuu11UBWVPoiQwsLhjc4LK+6TAnRJFLWvaFE0RaBs7z
         6DbF7qwxhvTaj7hEbGa0uGo27ts0/XaDEmC2I9tR/WhU/bk6BN/6PMjqsnzX4/N5nAm3
         RVB4LflSZhMqW8UNohElBj8bwZpWf0OL5IU2xA8kSh8aCn28MHh/TJnw7lFDGiUrG5vA
         lyGCUtRD3lXouxsj9LGdq546C0OFaHKrGZPLZacQ5iWbgmRnxlLEHUnUfKF+bei5Mrvq
         fXjz345waFR9qeUEW8TuJY2rRDV51N6cT3PxP/9VHm1cYYNXwD1/it7xSWUPXeBPjURr
         n74A==
X-Forwarded-Encrypted: i=1; AJvYcCXto4MPRqBpKxaftkoFDqeDMWC0+NIOv0CpxvXyU6NslzbrU8/fjfzZVS88ZbVQmVXgm28=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRIDJjziMd5hBaHHlrtFztfldHVwaIsY4OEArD+aA9VIVOTzP/
	QFuubdmqCNVf5TQecna1SkpEdvznWHfu6pJEU79lPOwyNa72nj3B
X-Gm-Gg: ASbGncslNTN8dmXNJcrovQqq9RakWmrjrY4YYKsCNvTg4Ff46+qtk4NIR+g+1Q0lTFf
	LCGrucgHnCyiEAXk8y0eoz4u9iSs2qhUuMZf5ODSwYPs5oFv5uExlxU+asJ0MVl1hyZ+WHmLj+v
	2Fsqk6nOsX9Y2g2+UmRxFePv4lFhXYzffFVCrSbzSI9Dq0VPn/WB2KDrqHnQCZXpX867Ajm0iPi
	mVdq9XRMYE3InkgJRiosmPNgc6DibWyYKbmWsmUVAtUqagEXBU/ie0q95fTsHMYNzzzqvQpO5jc
	wLplLuPYNOY0ZA2536/kyXzaMx8HKjMsC9sehMkIcyXyU8qrqP9OtcwPuD96JQeyBxu958WWKkV
	S8HkgYE+/VZ4K8Pk=
X-Google-Smtp-Source: AGHT+IHDQDEm510Zep6ehXFGr0QIvBVvOcXxaZ4hhWGvwNKkFEXwQS8kRk2/D5K9n/qyNnT7NjYeFQ==
X-Received: by 2002:a05:620a:468a:b0:7c5:5d4b:e62f with SMTP id af79cd13be357-7c7a76bfdebmr138512985a.43.1744246767488;
        Wed, 09 Apr 2025 17:59:27 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a895180esm9590685a.46.2025.04.09.17.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 17:59:27 -0700 (PDT)
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
Subject: [PATCH 2/9] arm64: dts: imx8mn-beacon: Fix RTC capacitive load
Date: Wed,  9 Apr 2025 19:58:56 -0500
Message-ID: <20250410005912.118732-2-aford173@gmail.com>
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

Fixes: 36ca3c8ccb53 ("arm64: dts: imx: Add Beacon i.MX8M Nano development kit")
Signed-off-by: Adam Ford <aford173@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
index 2a64115eebf1..bb11590473a4 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-beacon-som.dtsi
@@ -242,6 +242,7 @@ eeprom@50 {
 	rtc: rtc@51 {
 		compatible = "nxp,pcf85263";
 		reg = <0x51>;
+		quartz-load-femtofarads = <12500>;
 	};
 };
 
-- 
2.48.1

