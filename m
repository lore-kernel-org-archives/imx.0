Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4006883CC7
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563016; cv=none; b=mAuZI5cUNCJhoK7V+1B3srHE+L1RYU51GbOcUzRMc0uLXipf70jquDATphKqKgUiY8+M3e/zLDiiLClUz3xCJnQVOssWp21DORDxmsxKMyUVG8giBT+oUderLsKYgGpzRnD+19W/d1VE+sklaH94QQdDKceAXqaulqjoDADfFPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563016; c=relaxed/simple;
	bh=2WGS4zDij+Ixhpcdfhz854o1PCDNzbO0tvum2hvSOgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJPhMTLx/wUJPz5AxsCvR3JBnUBVDKKtvqkanHCUlt/uvPpa3ZfcTwZGXb0YjG7d4myTKnSiotWIBcafsodBk44UrOv6tdvk5dQapQpDilgS6Vqvd/JO3zxG7x/6X+mShiHRUIT6kTtz2pE6X2oeFeNdyeHD6djnl1/LFFr6S6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m9fdC1+y; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m9fdC1+y"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7142e002aceso2659939b3a.2
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563014; x=1725167814; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TgrHzPeIHjCQToVGMM9JpdcPooP9HE7kqNjFtcQ3CT4=;
        b=m9fdC1+yabwzQmAZlgH2wwXDBCTNtkVwFR8gzVZ8i24wDKCpDGSE7h3EDZ3gFjWmaP
         VlWW903NbZDnEZTpqbGejghQLGh25PaDIB3M4Aba8ki2ov0ZPG+p9yxmpWJ/C4KhLJbQ
         0kiBVXpNfINfoQwoSYwzV+1LlwYSJ0qm/EOxq5Jg3te/X3m8uUdZvR/7w0jOLRNtiKA2
         4JUlAEoN4h9nsP6iWZvPNOqzMG2FW1lbV7nf2sVDLWz1ZPrZiDkT3opNeD+TJ4kicAzB
         oM1SlPJFfTdL19TvVc1MPtJrDendELemTbQ3RMxft2iPRJe3W+0920lXt8z51mcgiSL1
         +T4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563014; x=1725167814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TgrHzPeIHjCQToVGMM9JpdcPooP9HE7kqNjFtcQ3CT4=;
        b=TOjWlcRiEf52AF78P3iW7MlaG4sHNTD2ldbGInRYrMG0QcU7bQIJb38Wa8FJ76Hgpv
         I6GedLUoZ/Y+ZWQUWu01ZHNmSBJZjsVgNXXpXxz+/yDS+Yj2a5aZt3JnEP/DlnlaDRtr
         LAbsxk7VqzZlhU9WjFRbLUyVP/7Y1LaMj/Oaps08JXD3lPYWj1B6WdDbJKTlfjT3H5pi
         kaUVTRMPVKi0b4ekn4m1GmRvloNpMXxgWCJ7vkjJbY9llbqpPyC8xzIDgPz+np+pYEWW
         gRJNpS/j5xccfU+L7581/FntQJzXV98DMsj0JuuHm9lGJv0T3kR3JtCz5javQkIml/Tz
         M20A==
X-Forwarded-Encrypted: i=1; AJvYcCXAliuuu6d3FwYj3C2F6ZD1CzvvhHwHQ/7rnvPf88LAX/lzBHLyldtpfjnTy10FhhZyOu4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyICJr1Z0r8VxtBYArW1HJGlsEmFWs1GttNoHIaJ88Vsz4C+mIp
	LCiC4GjLrngGw8yNa86FGJOn9HzsN5CuAX6x6mn4G0eL3S22VA5q
X-Google-Smtp-Source: AGHT+IG9GzB5hV+R3jUFqV7C8FiDWaB5skbl01e83Rq6Yxznn6igCC+xVD3kT7dOcBsXXHvExd8ddg==
X-Received: by 2002:aa7:8895:0:b0:70d:1fbe:b96f with SMTP id d2e1a72fcca58-71445893b63mr6876250b3a.21.1724563014434;
        Sat, 24 Aug 2024 22:16:54 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:54 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: linux-input@vger.kernel.org
Cc: Michael Hennerich <michael.hennerich@analog.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tony Lindgren <tony@atomide.com>,
	Jeff LaBundy <jeff@labundy.com>,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH 12/17] Input: omap4-keypad - use guard notation when acquiring mutex
Date: Sat, 24 Aug 2024 22:16:16 -0700
Message-ID: <20240825051627.2848495-13-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.46.0.295.g3b9ea8a38a-goog
In-Reply-To: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
References: <20240825051627.2848495-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes the code more compact and error handling more robust
by ensuring that mutexes are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/omap4-keypad.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/input/keyboard/omap4-keypad.c b/drivers/input/keyboard/omap4-keypad.c
index 040b340995d8..935c2b27b81c 100644
--- a/drivers/input/keyboard/omap4-keypad.c
+++ b/drivers/input/keyboard/omap4-keypad.c
@@ -144,7 +144,7 @@ static void omap4_keypad_scan_keys(struct omap4_keypad *keypad_data, u64 keys)
 {
 	u64 changed;
 
-	mutex_lock(&keypad_data->lock);
+	guard(mutex)(&keypad_data->lock);
 
 	changed = keys ^ keypad_data->keys;
 
@@ -158,8 +158,6 @@ static void omap4_keypad_scan_keys(struct omap4_keypad *keypad_data, u64 keys)
 	omap4_keypad_report_keys(keypad_data, changed & keys, true);
 
 	keypad_data->keys = keys;
-
-	mutex_unlock(&keypad_data->lock);
 }
 
 /* Interrupt handlers */
-- 
2.46.0.295.g3b9ea8a38a-goog

