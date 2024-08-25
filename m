Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2660D77104
	for <imx@lists.linux.dev>; Sun, 25 Aug 2024 05:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724563010; cv=none; b=pZqly4Wndm6JkS3ghf+ytLnVyacFdxAyXxZUxLg3Z9AQm6xeig+2MPGH7/oLywR1s7hvWOIwS66oaceUMSuLJDLrl+vRF347qRvktsI3eAKekulBAqAYx6GksldpS9VXqZ7ZYHQXPHhZsQB1YHUQNOPuar+B1XbfcM99w2YRziY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724563010; c=relaxed/simple;
	bh=HRlUPdt8MUpsxTDaTLTMeZFznZxtpdiNcTlI0W/hXq4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iJPA4w022Tsi7nuHSQWhp7KvamV4W15kzw2Dq7AAb3FTnS2OcEARfceNJnizfWsr5jxYOR5nvqmGlR5CRYJKshDWDZbmGuEsIzE5sNCpI3GaeScfHcv2D5zJGpynjF9oGu4mKsXqCP/YBYMaq9FTOTeQ6iC35hVgYcYkaUKNqLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WCo12S+V; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WCo12S+V"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7093997dffdso1856189a34.2
        for <imx@lists.linux.dev>; Sat, 24 Aug 2024 22:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724563008; x=1725167808; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1eSvY1Wrp9wBfC4UTCsKK6UuziOLVmjJl+zbNYuZ+vM=;
        b=WCo12S+VatCAKAAZ4qUuP+i2vH2ZCpRa1AAC300klNEvSQLSrHIUj07QrS9X7O31mP
         Kqjb9SzfB2ozxljsXv8vQL1FJvA/vjzHeZ6e7YHJIwhGRCA5uZYtyw6hb1u5LzSxgOQP
         8C8XqZQ0CAVkECOxSYFpQc5UeMjDe2fDbM9IMBitJLQYRSsywXwJ4SO1/ZiOwutsVK+l
         aSMWJxL2kyLNFLP1zMidY/TekLyrproPdrjftkca4GDzF7soR3+rd3TkTH7b+KQAZeVL
         vY/DaX0CBrVCGEneHiAwot8bpxcSLWnZSp9LbXYvJ+to/CTAvYydZVyW7ssWvyHH0i5p
         xkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724563008; x=1725167808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1eSvY1Wrp9wBfC4UTCsKK6UuziOLVmjJl+zbNYuZ+vM=;
        b=h0ZPQd+ZKbBjhloCFq5N+DZC2CpTf2vyOEZgMOi9Dx7Z30VGK7f/qHc2oQaUCSgdE2
         RA9TPStoXsHY4RlDHgU4eOMl37AUdd2gL8WXpSCkKrph5yrHYrlqyphnNTofl6PrR0PE
         N1MUp59A2rq0Z4dr8VAhXRUDma1cPBZKIfr7zSVhxJYM+JYk1rTFW/oUk4E4lLzkeYAr
         XmpK/Jj7Dxh7GNPzLabiTodwbX17vlL5sOsabboemx6UkS1MfPLPhSGyx9O0R/vRn+a7
         JWsXYV/BkwRYTnhzFca6zJUXznPMtErGwvvA4eT+VdBkzttsmmQpIVTpTJU4s3nSsitI
         +LMA==
X-Forwarded-Encrypted: i=1; AJvYcCV/4x9s6GF7Ch5vL3rAt8G+QTykRvKsT9rASapKS92th/FnUmhWbjrpFTnut3dEENUK9CQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRnwAJbvormWuZGNGd/jbE2adlWgcUM/IdEpnFv21aA/AFnAq8
	/hPTkGzOm5RYMBBiNujcSII8z5AOM8cl+qEnwbvGuRD8gQ7ktvv2
X-Google-Smtp-Source: AGHT+IFPvL2EwU0HTmfQ3cZEpHTEWkZdGY6KDfx96n7lf7JVGqj+9oNVagIFdpcxgTMQQpdCDsaEdQ==
X-Received: by 2002:a05:6808:302a:b0:3d9:2aa5:4077 with SMTP id 5614622812f47-3de2a8735e4mr7831127b6e.5.1724563007948;
        Sat, 24 Aug 2024 22:16:47 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2620:15c:9d:2:66dc:ce07:b7cc:51ea])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7cd9ad55a94sm5622442a12.57.2024.08.24.22.16.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Aug 2024 22:16:47 -0700 (PDT)
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
Subject: [PATCH 07/17] Input: ipaq-micro-keys - use guard notation when acquiring mutex and spinlock
Date: Sat, 24 Aug 2024 22:16:11 -0700
Message-ID: <20240825051627.2848495-8-dmitry.torokhov@gmail.com>
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
by ensuring that locks are released in all code paths when control
leaves critical section.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/input/keyboard/ipaq-micro-keys.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/input/keyboard/ipaq-micro-keys.c b/drivers/input/keyboard/ipaq-micro-keys.c
index 1d71dd79ffd2..58631bf7ce55 100644
--- a/drivers/input/keyboard/ipaq-micro-keys.c
+++ b/drivers/input/keyboard/ipaq-micro-keys.c
@@ -54,18 +54,18 @@ static void micro_key_receive(void *data, int len, unsigned char *msg)
 
 static void micro_key_start(struct ipaq_micro_keys *keys)
 {
-	spin_lock(&keys->micro->lock);
+	guard(spinlock)(&keys->micro->lock);
+
 	keys->micro->key = micro_key_receive;
 	keys->micro->key_data = keys;
-	spin_unlock(&keys->micro->lock);
 }
 
 static void micro_key_stop(struct ipaq_micro_keys *keys)
 {
-	spin_lock(&keys->micro->lock);
+	guard(spinlock)(&keys->micro->lock);
+
 	keys->micro->key = NULL;
 	keys->micro->key_data = NULL;
-	spin_unlock(&keys->micro->lock);
 }
 
 static int micro_key_open(struct input_dev *input)
@@ -141,13 +141,11 @@ static int micro_key_resume(struct device *dev)
 	struct ipaq_micro_keys *keys = dev_get_drvdata(dev);
 	struct input_dev *input = keys->input;
 
-	mutex_lock(&input->mutex);
+	guard(mutex)(&input->mutex);
 
 	if (input_device_enabled(input))
 		micro_key_start(keys);
 
-	mutex_unlock(&input->mutex);
-
 	return 0;
 }
 
-- 
2.46.0.295.g3b9ea8a38a-goog

