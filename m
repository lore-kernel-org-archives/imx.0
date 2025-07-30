Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D001A0BF3
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 19:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905187; cv=none; b=VAGBcW+ryJMS5s70CbrRbEB+rpI0FL+jpj2EX6qLOWLVyJBWbEBf/spGHxyJIk0Ws8m9h/uXdcVtILHHCCqTqwb62EzLJIYv9v9YYEtep0F6bGcYevkzq9CsHmbK/ieqZZ96s/IuCjigJyzEPCJuDUKMPb85wnTgMvPgZjl+34o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905187; c=relaxed/simple;
	bh=zXzxHIWyJeKJO/mkAbjOqDhTJEb6z28ihri+K7bnSjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P8/G8EYRNkENv0W/bMKM8MfBf8Qt3NJKZuK2Kv7/8sm+C1WV24EGQUqMnPe1AVPKrZB1TAbzkUrUNPErEdlv9BY9Co4N2xEKSu8xop9OvbtLe9TgFwrXXdY4SMmtblafddtsf3jhXIWR/le3pFgSRrxd/dCYxtwppB/f4hQTl5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ga7qgj/1; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ga7qgj/1"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b78127c5d1so110759f8f.3
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:53:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905184; x=1754509984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jXme2m9WwXUPYkqUyJg8c9Omz6UIdvrbWwmPeVySRw=;
        b=ga7qgj/1jHfsNAlSBl9S3BaIgLSgtKPRtENRyTJV3h1ihNncFJpyyO1k1frOy5mHmu
         RDGPZy+jZd2TV0R4tp3mZGsof8ovPgrXzgRm50NiHo7oSd9DZZwrKkOgfhtTqYybKBi9
         wn6PcMA+Cqn+RFXpf0m3ueeb2bAzyS7u7vn3YOt5M+emzcgOt7DTZ+wujgeA2/NuetHt
         t05586zQjg6UD7le+6uDdzqQKyQBY5W0zdXc62IN4L2ex/Pi2UPUu1JowcSqzEG1QdcU
         TZPq99+xhTQ++WSlrTQxyXSmh3zwGfV43bZOYxDvoOe1oeaxd0o/ok1niqT5T1Wo3zYF
         +jlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905184; x=1754509984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jXme2m9WwXUPYkqUyJg8c9Omz6UIdvrbWwmPeVySRw=;
        b=ummQEsJo8dmZ2+3M7cWPwZMaMT5XhMZ7wjsBCnIoVuLZT9SJOAHUiqFrR3xAPM1bQ8
         qQfDG4Bf/+mAVBotwmvp7xzZ+IGPHIXfcsx62ZbbJhfwuE8q5GL74lygwfY6L38lD+Mn
         jVbWlhNKKZGD48IPOyZEekfTyc1hoM/ExKIWlGKdIRykHsxVDuXRWw6pPPslrk9Y+7rD
         nvazW+mdGPXo8Sw2eOrf/IOmVs5nONMs3BAu1wmRIaD9U9u9tlgakCCMS8PLjTG3kf4v
         TuK5i8yHyFWOOChRdbpwKkfKBxJB8UhXoz8w3FEOMbfu42rmtdyHARXNQGAQQ3vyV409
         8ddQ==
X-Forwarded-Encrypted: i=1; AJvYcCVB7TftNzqraSZGU7z0gRkFWSMAYf2/sgyYJuFkPC1ScaXON4F9aY5jobKYMrtNDEZfsWk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5hUpsfx05Xac/Fnr8l+He0uw9ZbSPG8/EeVdDA5Que1C9BT7H
	4EzONc2Eifqjp8ADO9jBhjh4TBHY4Qojf4WzCxlehcxpWC13BvJWC9uLuKOA8EtkXgk=
X-Gm-Gg: ASbGncu+MKYFtfHKqQr5adv2hOfogkpxnl7ZjVdEGlIWKwHM9PvHTNiKXf7EagAL+fY
	9iqPvB/RGFI2TGI756QBo5S+EJ55ghZYoTdIrMX6WRyjHhhPhmX+AwrkawyVXvAdRMg/L+kzf74
	faj7Z6RANs7phUx1WvWrYfBKA0YrIaC1shrBISt8CGrHgTF9hlwFyzlGEM1quImNaG2ZrkGJ47p
	1xlYVUWs+nIdFECCkcB9jmt74LvvoImTy9/P4bnsZSEb/Pzu/NiG3Q4czcjBTiO3wwf6Z5IL+Os
	C96WhLTyJBSmYpa8TxPxQLhk2ydyYVBfKPk73XmPAXlqCZZYOFkAKeK03nJzkTNp79vHzZUHnWd
	qGi5uXBHukKSxkljtOIX9Gf2Ldla9MQpH4hOanZ546SNHjh4j
X-Google-Smtp-Source: AGHT+IFtSLxvTO7Zv8ZiaAd380UqEdsX3oGvM4YuKiKowd0BLbRk/TMTPqH8Tyy/IqqXhQ9v3ow3cw==
X-Received: by 2002:a05:6000:144c:b0:3b7:9a5f:103f with SMTP id ffacd0b85a97d-3b79a5f10b2mr1077841f8f.4.1753905183837;
        Wed, 30 Jul 2025 12:53:03 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:03 -0700 (PDT)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: mbrugger@suse.com,
	chester62515@gmail.com,
	ghennadi.procopciuc@oss.nxp.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de
Cc: s32@nxp.com,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>,
	Thomas Fossati <thomas.fossati@linaro.org>
Subject: [PATCH 2/8] arm64: dts: s32g274-rd2: Enable the STM timers
Date: Wed, 30 Jul 2025 21:50:15 +0200
Message-ID: <20250730195022.449894-3-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250730195022.449894-1-daniel.lezcano@linaro.org>
References: <20250730195022.449894-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Enable the timers STM0 -> STM3 on the s32g274-rd2

The platform has 4 CPUs and the Linux STM timer driver is per
CPU. Enable 4 timers which will be used, other timers are useless for
the Linux kernel and there is no benefit to enable them.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
index b5ba51696f43..505776d19151 100644
--- a/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
+++ b/arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts
@@ -40,6 +40,22 @@ &uart1 {
 	status = "okay";
 };
 
+&stm0 {
+	status = "okay";
+};
+
+&stm1 {
+	status = "okay";
+};
+
+&stm2 {
+	status = "okay";
+};
+
+&stm3 {
+	status = "okay";
+};
+
 &usdhc0 {
 	pinctrl-names = "default", "state_100mhz", "state_200mhz";
 	pinctrl-0 = <&pinctrl_usdhc0>;
-- 
2.43.0

