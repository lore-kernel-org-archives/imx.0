Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F9332DE1FE
	for <imx@lists.linux.dev>; Wed, 10 Sep 2025 13:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757512764; cv=none; b=Hsx+iElo5BqUlp1CQrnPmb2Q9lJYmOm1Vp/JNIs3egWFuSv5XtEVD0qrWvfDa15w63CcJ9J2YfHYY+x6Tmxmjsj8bLugHFuT0gimDdkVlxX64yYwBC3dn3gs4E/u/6UBd//Pja26WQZ/n7fgji0o2dgoWJ7JawtEHHu2qKPOgeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757512764; c=relaxed/simple;
	bh=Uu0KyPQm4WIIkWykK1EPIZXCY66nvgOqnqJpxxXLb8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJR9YlVsnY2pm7GSCaL0gflmdYdTCosMGf/Coq+/1TWXvG0Bv+yqifMl+D/4P6masHPwYRtzNcAjmzHDmY1cbtXSm3KBUJKmmoh2klTbpCTny6+kdQadosF7snzldX9SDKTFdo//wk2ch4uowzOk1RxGEKklK6wcrgQYB20SgPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QAfMG7HR; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QAfMG7HR"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b042eb09948so1322428166b.3
        for <imx@lists.linux.dev>; Wed, 10 Sep 2025 06:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1757512760; x=1758117560; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=QAfMG7HRVnDngcbzgR7L1YW2VVP+7oSTm4NGd2Yt9r/0w8UhVMNKwpbTdc3jh1SMgs
         tsKxnbmm6lhZxGIfzVFrdRIdUPEPJqK3NUVxQEt6T5PPqGALXzbAFxrQ5Fsay+C6xTIb
         QyJUHrBv74tCUJOBL9tmA057N1GuEiQv0pgY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757512760; x=1758117560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOaQOy4NwCzyitlYEvpuiMsUEgnozIVGmGmKLfL9eXI=;
        b=HQtzz9QLIbGA1V5d0YXeiGVxtPUe0uOTc30fO9bXYlD/AvAex7syEdQo42LQuLGgjY
         doyGz7O7M5x75dd17MlvRX9R2bkgelGNG9APBVQDELbGw5hXHFM71E1KKY4POYqAm+ly
         UhXtZYj9cxDRXg/8HrSJQCeBc1j9Dwt6V/fgeqHmF6hxIWUH2YqYYWkfwtf98y/S429d
         zG02FzhdJKvoqKMpk1UxsVTWBT53GiGAHBN/59JpbME7CwUYA8UivSZ11Vinia7KIhuH
         TFyTdzhmF+7pZTw/jIUDWOoGicRRdBFuvhJV9PsPqLYnUkmFJDZKVoJOoMxgJYsz7LiT
         VMzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkOFF+sOxYyZFVwTHZEkkMw0I/k/XxzZZ4+kuyDiy2c5JwihJRnO8VpVrlMZErGNIIpRw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZBkQALSopuC+k+5ScNKniz66Ytc1tyF5riRQVs2pb1kIq5iS6
	AmM7YSVLu9YqyJaze+VpP+zkBFb5AZtcksRBnLtKSvc5zCRVSVCrpmear+PVHq684GM=
X-Gm-Gg: ASbGncsD2PNtnn0cMOyLwuLbMEehhOffLmJXyNY7t2wHLPB0KyQm8tYMHyJXUfItelK
	eZsHvHMuk5oLaIH/38pdv8ybt6AW0kAAo8FW5VjDguNV0kn5FSUsbqvFr3Y7KZ5w0LFsC5Pw3y7
	gwBiU8JDhJ7UOMt2idOXWQ9N64IeqZWH4YLplp0TSLpTZqcuW413/Q3/qQPlcud1wSrWQ9Qq0fI
	Bw04a2/Pht6EwbyIUFV4EMqGxuxdKKFA5Om1X/ieEhdfV7FkvVSHv4snn1Xt4NlsMdxuIFiL97h
	TvJe7IUfssK0pfMWvFTmLhsPDx+Fp2btzrSu9JLtqBlrbRk7VEW2ctVX4KQsv+XsLJhCuadOYdk
	TL/15u678xxHV7ealcwfRF2N2iF9IzwJxXDrnPJQWNQNG1oKNQof9TdsXErytpiFiEp4UpbIaB7
	SRyBu1mxdZT2LauxZoV694yETbhRNTeAaUi9nB9GKcAE2/T8Uber5FfP/0CMkFgRw0dtXfrNOJj
	pQ=
X-Google-Smtp-Source: AGHT+IFx4sggugwyl7NvTvxiC9DVo19Rr8B3xJJ7gt1HragPcAUN78syGn8W6pBdTcWy3/sRmc9Emw==
X-Received: by 2002:a17:907:25c4:b0:b03:fa9e:4b68 with SMTP id a640c23a62f3a-b04b1696b7cmr1544984566b.32.1757512760390;
        Wed, 10 Sep 2025 06:59:20 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-56-38-125.retail.telecomitalia.it. [82.56.38.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07833a4e37sm172523066b.76.2025.09.10.06.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 06:59:20 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-input@vger.kernel.org
Subject: [RESEND PATCH 1/4] Input: imx6ul_tsc - fix typo in register name
Date: Wed, 10 Sep 2025 15:58:35 +0200
Message-ID: <20250910135916.3939502-2-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
References: <20250910135916.3939502-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Michael Trimarchi <michael@amarulasolutions.com>

Replace 'SETING' with 'SETTING'.

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 drivers/input/touchscreen/imx6ul_tsc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/input/touchscreen/imx6ul_tsc.c b/drivers/input/touchscreen/imx6ul_tsc.c
index 6ac8fa84ed9f..c2c6e50efc54 100644
--- a/drivers/input/touchscreen/imx6ul_tsc.c
+++ b/drivers/input/touchscreen/imx6ul_tsc.c
@@ -55,7 +55,7 @@
 #define ADC_TIMEOUT		msecs_to_jiffies(100)
 
 /* TSC registers */
-#define REG_TSC_BASIC_SETING	0x00
+#define REG_TSC_BASIC_SETTING	0x00
 #define REG_TSC_PRE_CHARGE_TIME	0x10
 #define REG_TSC_FLOW_CONTROL	0x20
 #define REG_TSC_MEASURE_VALUE	0x30
@@ -192,7 +192,7 @@ static void imx6ul_tsc_set(struct imx6ul_tsc *tsc)
 
 	basic_setting |= tsc->measure_delay_time << 8;
 	basic_setting |= DETECT_4_WIRE_MODE | AUTO_MEASURE;
-	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETING);
+	writel(basic_setting, tsc->tsc_regs + REG_TSC_BASIC_SETTING);
 
 	writel(DE_GLITCH_2, tsc->tsc_regs + REG_TSC_DEBUG_MODE2);
 
-- 
2.43.0

