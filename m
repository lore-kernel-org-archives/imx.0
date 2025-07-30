Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FAD8223302
	for <imx@lists.linux.dev>; Wed, 30 Jul 2025 19:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753905196; cv=none; b=U/h2miUa1TZ585WMkhR4FFODjTeGoAkEFLPpQwh5lpCQttxYCyUUvESHNve+eCreaN3n7ro+7ijDyuLEwp9PxgAQzqNXaf+TbPYUBtwC+xRA4znUdDpXgPXMSvZDau/LjxlP/Acf1ywjcIeY5dn6E/LTYFnstRaO+GGj4I1Uw4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753905196; c=relaxed/simple;
	bh=Q6gqUDKWSByswweoa4MByrpih4dPJFAYYxh1yHsXWcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bx0myCzT+SFUOcN+ADKdzrnzH5Lb1clxH95XiFN6XX4GGUljpKAeKHXAeCmmn5Tz5Sn8wFs4VdEgogEnCsGOm0c7jZHZPSx1XMVwzmlDYJwG0O17K66VMWUP7/uMbQrmMLt8ghLZ8dSezpgCjIvgFKWbUCCtfw8iFFLOV0FhFyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oNrMgP3U; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oNrMgP3U"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b7746135acso109213f8f.2
        for <imx@lists.linux.dev>; Wed, 30 Jul 2025 12:53:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753905192; x=1754509992; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+UbYDXw5XC5hpPAAcjH/Cyq+ROm5RlEeQDd+B8eN0DU=;
        b=oNrMgP3UsaeiOg8LU9qR5Dg/SHdC5uiMDO0eHiu2URumFta/5/zb4m3Wr7A3rATQrl
         fi0kFr4G37j53vm0Dip4fAiT731G3MkQ9wF6wEqwAhq+T7nDlN5SDXkWIZgFCbg7ShAt
         fS26ncoVAROWYRFgwFj++UHIw5gxLiqdU1hHlMPUKUq3HmfB8ejZG/bufGoPY7A/1P28
         7586eM7+IYrO6xWVd0hd5MQSQ0/j/3AEgsuI4XGTdAlmCNRodyGcH/CfP5uJXq7wGGet
         2b/woaLyErtxRtGoa1H1kJSg/n1hDBKX5r7KPAP0yIIeng2Vksq08Abtq2q8jlow+D5u
         dtdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753905192; x=1754509992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+UbYDXw5XC5hpPAAcjH/Cyq+ROm5RlEeQDd+B8eN0DU=;
        b=PLdkLyv60rec8TIiJ5ph3xZ6ORwMf/nUHXm3rgH8bss0YD9AY+SWxxVt3S4vslMt7w
         3bkLVwhZx4PmhdlViVezhS3zlLYBIMTPt1YyCJyhlPIfszsRMSIVqau9rDzWjr5/zs4w
         uHgqdUJWCnC2D/O5xj+EbIb0uSeGqb0tv0t44CiamNKbGk0eewtqw1cLEq9xEZ9FlVXR
         7XPfsKmQlCq4rs+kNNgc6V/jH4mbyNANsWGxcrQawrs9g/ZV3ICRhZK43lZ8qBokZVBv
         9fBG03pC3/oGpOb4EqUdE2Qq6gBWE/fAyaA3s4/6lFmziMKXAhrOa4pmG0vaZK1xu85H
         0pkg==
X-Forwarded-Encrypted: i=1; AJvYcCX4HqFf/8wGUamGWLD3JVqhZYQvdcLoTlNiPcUfwyN3jWrWFyWeFJXSUExZxSLSYjBkSyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxx6GVytFF76WWWaxhYHhhMC4vFKEqm+6DjCfx8E2gVjKK3bLA0
	FTdvXrkiqs+hor8kPIJKMwniP4OsA0yl4ocqzlLtLrT8HpeFpAndE5MYQfFLXPXU36s=
X-Gm-Gg: ASbGncvQEbVxt+L0sapODmFICiXGF/dbniOfy+xZsxx0sviSqPxbQXDBWaFlyhpbQUp
	Pe0dACQSkj1dmVaKKAVPtRv8y2NfypkMrl6lmc0k43VgLPy/Ohcbtepc8y2Wpn52nyntOIahgJc
	4x9fEUAGCGmc//GNbIHC8CrsEcaE02CRrrtw3kTRYqsK9+gpJmnWEqHzJEPz2ygS7l/uAjXiZtM
	z+pmj0QMgMD2wPINlGVTj3atXXqsxuGn0EMm5ZP06hmcaD+YK677ohu4NBAorO0MOR61dToTHFk
	55ACJhNhj1DEJ/++PnuvcErTWsTaqpkQaYcKQBxnf6jx6Abv258d7n+1gz/NfO7K9w7UNyceD2U
	EF2WvQFDQPN0IKAh+ZJtg7kOi/3jgmkOAOJyDovRHOzsviTUB
X-Google-Smtp-Source: AGHT+IE2LPTXnX8h2UuSalEhXHbjsRWmwclLkvmu+DxN2Fzf9KDzutosLelRCaCEJoECy/CePHIhyw==
X-Received: by 2002:a05:6000:2212:b0:3b7:944d:e5e6 with SMTP id ffacd0b85a97d-3b794ff1593mr3557546f8f.36.1753905191682;
        Wed, 30 Jul 2025 12:53:11 -0700 (PDT)
Received: from mai.. (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b78b26a4dcsm9556193f8f.32.2025.07.30.12.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 12:53:11 -0700 (PDT)
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
Subject: [PATCH 8/8] arm64: dts: s32g399a-rdb3: Enable the SWT watchdog
Date: Wed, 30 Jul 2025 21:50:21 +0200
Message-ID: <20250730195022.449894-9-daniel.lezcano@linaro.org>
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

The SWT0 is directly connected to the reset line and only one instance
is useful for its purpose. Let's enable it on the s32g399a-rdb3.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Cc: Thomas Fossati <thomas.fossati@linaro.org>
---
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
index 467e0c105c3f..e94f70ad82d9 100644
--- a/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
+++ b/arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts
@@ -72,6 +72,10 @@ &stm8 {
 	status = "okay";
 };
 
+&swt0 {
+	status = "okay";
+};
+
 &i2c4 {
 	current-sensor@40 {
 		compatible = "ti,ina231";
-- 
2.43.0

