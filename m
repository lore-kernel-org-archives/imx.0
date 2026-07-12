Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CFE3A75B1
	for <imx@lists.linux.dev>; Sun, 12 Jul 2026 11:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857466; cv=none; b=q9aOI+/vjoVqSt8e4xwlKVgmPggmJR6LbLV1ESADomgMo4f5/nJzVV0dZYxC9W6LuTmpF2te6g6wPmcSpRTJ8Vwucg8WcQ/TXtPo5x4eUsIE3HLNqZwmVHmxa6klaKHCkcBOGXNhgGrvZ1en/1eek9vRKU1VhL+SL83kNuUD44c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857466; c=relaxed/simple;
	bh=2Fbe+51I+NHaqoJEm/Ia1P/RkOrsQ8sOHQ84+D4jX5M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iF43rK9XObI1VdowPM3GCq1PirvIaCoWsCEB6GZGDk2LmyUBNbOG6CPBGlQOhglefrggYKY6B65r6PEiclvnMDLc05Jd16aKckfpiHibAf7ODIkLz50BiYVenLpCE0q6pE1/4HOsGk59F42/FrniEBfEAvgGVqBftac878dQans=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RysIg0nb; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RysIg0nb"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso338645a91.1
        for <imx@lists.linux.dev>; Sun, 12 Jul 2026 04:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857463; x=1784462263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=RysIg0nbs98WU/54v3G8+P15ZWWb9Z//A0gtZ7oQPxAgwCRfS+SZfHTKOawogimlKu
         hewGq5sBIB0MIXr/UasJIk0DujDTys45DIRoKaZ7iFUdAbRZogH9HKbURB6xitmh1jOb
         0uj02RkVHUlhxxISbXNJZbnrxj7+CYtQn1VaHCuEsOPI/p5KaMbqZOONEeIPaIeTgZ+o
         /xb2jTnjXLbZRYn0q2vFwpzTDgznkR743TaE5fnAzrhbgeUBXuh2MrHCEAosOmBoOTA3
         xo1e2i0hrusnoje2AIOxG9801Vf5Z9ERJuyJzaRbJT6Z3NMLmn3FzLvSSsWB9r/eVDAc
         zI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857463; x=1784462263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mrmu7Ax8Tjv7DXY7cz3wQn6QU0gYid8cSWvbdHALi/M=;
        b=iwXI183GpTyx8JbbEuaS483PRun7dKT4nCv4Mj66LRnzAfReBgoB8wik1YOfMmvoev
         DZ/r86oAnXOZWnNkIkmTAsj03uUJIsz6N+52D7i6uHASLObDGkjIvUqKcBEtA9E2g8EY
         h765nY6qLtC3Sz4FEC6rzO6xTEPYHVpsgjfSwMyxdfG2pueXeopX0zQAKZ6WZv2GYFxH
         yFuENjSa25K9zdlf9R7l4RR/lBSqY23YQg/9K2Ucw4jKXOM9dKRja6YPGu+RsEm8D5Mv
         ESD9RUgXVlpnbSTpgyvRwXk87F8M224ZTN2SileMp+HXuh/FStPpuzo0QP4Toam8MCbx
         amZA==
X-Forwarded-Encrypted: i=1; AHgh+RqZlLHFlV9pHjdq7CDLKtzLPe66KXyvX/FcQBt0f9S/BW6+BYD0heCfHPNo6m/c6eNwxBU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9fW859WOuUT7p5GjJZtK1UwAAiKF1AxQ8NL7gRekoLRS1F6OH
	0sV5WC0n3OGKLzXcP9/MCrDdKh2lDY5s53jP+HwmIGvWBO3hOpUAXqjv
X-Gm-Gg: AfdE7cnaHwOqEnL4CeaXLit0yQeg/c0KbPweKkgk7fqbbbU1KQz86rvyEg53JqlCUj4
	eVcAt7J5KYilM1Hi+rtMaOW7IVK/lTLxxPWpmbXaq+tL4QIfEGVvdSWN4P8qbbLDaYFNhItKF19
	cWV37jr9ZsCO0BNCvMDEsYYJA1kZRbzFEBBswIolKtbk1sWkF1VnWizAXdoGL+s6iNhEZxgWHPD
	0Uq7QLxC1/ddVXmFOK8/e6VlDiz2V4sKPXrokbNSyHoPCOU+G2pCtdSky0AbNazRtvFqwYOFIh9
	+1ZjBmvnehBZ93N05GXUjKdDvyuMymOTZbAd3ADFcdVI0TsIAmGGqJrTsAf8Lw7XtuZw+akrht9
	XKM1vkhUeivMcnd4B+xgUfDmeSgPCcbkN+WDg/MEt+wI/d1kv6nONuzo7KoJC4axWoV+rz15nXa
	Sqyur44IuTfIExq/1psnKqQmVXb6+KDJkewV+KBJkJMece5HvdxfPKszORRZOzgsDA
X-Received: by 2002:a17:90b:4f81:b0:38d:e397:9053 with SMTP id 98e67ed59e1d1-38de39790c8mr1551196a91.19.1783857457791;
        Sun, 12 Jul 2026 04:57:37 -0700 (PDT)
Received: from nuvole ([2408:8456:3a01:5d1c:f8f6:b057:1d4c:1d59])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a57dc5820sm4833781a91.10.2026.07.12.04.57.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:57:37 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: mitltlatltl@gmail.com,
	Frank.Li@nxp.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	festevam@gmail.com,
	hverkuil@kernel.org,
	imx@lists.linux.dev,
	kernel@pengutronix.de,
	krzk+dt@kernel.org,
	martink@posteo.de,
	mchehab@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	sakari.ailus@linux.intel.com,
	sebastian.krzyszkowiak@puri.sm
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v5 1/5] media: hi846: Fix hi846_write_reg_16 handling
Date: Sun, 12 Jul 2026 19:55:53 +0800
Message-ID: <20260712115553.92564-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hi846_write_reg_16() does not clear a positive *err value on success.
pm_runtime_get_if_in_use() returns a positive value when the device
is already in use. When hi846_set_ctrl() passes &ret holding this
positive value) to hi846_write_reg_16(), the function returns with ret
as is, the positive value propagates back as a return code, which
callers interpret as an error.

Fix this by resetting *err to 0 only when it is positive.

Fixes: 04fc06f6dc15 ("media: hi846: fix usage of pm_runtime_get_if_in_use()")
Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 drivers/media/i2c/hi846.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/i2c/hi846.c b/drivers/media/i2c/hi846.c
index a3f77b8434ca..7f069aca0fce 100644
--- a/drivers/media/i2c/hi846.c
+++ b/drivers/media/i2c/hi846.c
@@ -1271,6 +1271,8 @@ static void hi846_write_reg_16(struct hi846 *hi846, u16 reg, u16 val, int *err)
 	if (*err < 0)
 		return;
 
+	*err = 0;
+
 	put_unaligned_be16(reg, buf);
 	put_unaligned_be16(val, buf + 2);
 	ret = i2c_master_send(client, buf, sizeof(buf));
-- 
2.54.0

