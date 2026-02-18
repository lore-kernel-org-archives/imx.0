Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A47CF32B9A6
	for <imx@lists.linux.dev>; Wed, 18 Feb 2026 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771427397; cv=none; b=bljLAsGTloIANfcUdT/06q60doIB/K1m/bnZ+E1FzGADw5ye+KBtnqu69mvQDnjVtM9a1KZetd9SM4A++C6DyF3FAUwyKhmXrf8D9t4khvAJVf8UOXLk666H7QVYch8tIh9wyNMLWvHd1y9Z03gvj/IDsQFkdlRG+7VDISPd8vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771427397; c=relaxed/simple;
	bh=d0C2EuuXownzQl6U6rFAHJMKSwZtCyEBVouZSQ+2XTI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sspYNDst6MbgMiPnj6At1r0D4Q3Vh3JG4XCb1h3UWs2CfX17/8pHjU/iMJhPluw+zwXjdhzfcxBdsHYitTM2cCLpTO6gHyVaugB5Cry0erdK+qo/m0UXyDnNIKFxn9X6JYJQHJprKcNTD7yEoHPehPxCmHN2pLP/fO1bvkjoJxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZxQG7zh5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZxQG7zh5"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-436356740e6so6370472f8f.2
        for <imx@lists.linux.dev>; Wed, 18 Feb 2026 07:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771427393; x=1772032193; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DiGM3saLexQq7QJjFVEPfTJjnwZ/SSpdBYTl//BH56U=;
        b=ZxQG7zh5Vx8cog7cjPoRn+WgbDHousOxf27cJGssImxkabwStpzbplbxdR4X2igmxa
         n/VNA3HDYE8Tff16FsCHaj/NHzE8BCNgpKHVPpooFcbMMBXbeuZGhZExIoIREMn7sLae
         k2Sh/ZyvnIn9ZUCj0KVcbKD/q+4CfoZDx6Z4NkiZsZfSLkmZg7Lh8e2HIQDCTmYHV4wO
         PRYzJMQihM84zEJ6/gQtN8u2DwDKOSd3cVkH5ICNY6WsE3Wr9+0pX5ShXtrMqUKtC4+E
         4OzCAYTtkQk5SCW58CludMB8jLCNl2cyjMIitcpI0oZ/sVc8I95ODzmQag7Se1ZgvLbR
         vzWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771427393; x=1772032193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DiGM3saLexQq7QJjFVEPfTJjnwZ/SSpdBYTl//BH56U=;
        b=qVUPUDh4LGICmvRNRsSYFvjzHYC6gQdgUN5tYxmnBh6QZiQJWVpv6jOlL6TFBtyEbG
         Vc4Qu/4kwVym2LM/1+o0EHJSTKxq9acqOlGKj2px0smznpwFWuwojx9HMLtEtUfXuB9g
         YsQ6ViGOjmfWu6WKDkxsw6jeHkE464yRmh4qhe+8kjEFwV+XUO2dBd553ZvcPX4238mM
         8uu7pwFMKtwIMgg1w85dh1ZMS1Pz6EniKtHbmrfCAJFXX3yj/UiqwASBOSmQf1pIA8sT
         apVp4vpQ090XZxUAyBhCi3hMGVi3v3SFcfm8LPSSxhWS4AgyrHoWgGd4ZQbpl36Bfy4H
         +N5A==
X-Forwarded-Encrypted: i=1; AJvYcCX7Y3jQ+tlbNyJSe8BAoVE358LI4FjDc2wPXlzXI+lXaSLuujLPeF9lvrhsep/AjGb0s9g=@lists.linux.dev
X-Gm-Message-State: AOJu0YxWGVgfyZiMtI2wtMpHeVlxHRi2wUJISq11qswNqBBnfneM549A
	KCbkodCf95LYCedkn9ByTMrH/alKxBfwbyP9ZSfu9OVKWoLnlOGs5Vud
X-Gm-Gg: AZuq6aIEUPSEfMe6dxRnTm3o5Pav2pWKRuI2Bl2bH12NdbHZCyEgFVEkEh/hdeH8qxz
	I8Jiz151J/qoCzY6qrA1hcdVZpgPp92RbbaRN56z7U7pJ0ANNeMLIhLBKXEJeAEKn9x5mQIwnEI
	uiR52K5yN2XiectT7HppyliiEWPBzAweLNDZC8RVd8CD5hu6eDwOUkLUyMXTAIspmWAOMk+/Nxf
	1r8CYcU9L56mpDwhHLpulpo2XezNNQzPfjEpWvw3X/hmA3FV6+nqcdUoMzZ9/v4JQXi+SLDj4oA
	MG7rc6KC7BnovV7f00hTue4DAjxGZIw5DD2MCLzZuaF4SDhnhWObzbvK4ECKwICqE2DR9z51SkH
	fyiYuTXbgcO79hMdVM18iWX3sP/xBpxYl0DIqH0E9HUoL5q7BNoaXq7vaRi33JdLDut81Iv1vxM
	FR2TaXbmo0DJ7rhabNEBhkB7+HqdI/LvEUvP/YflhKLOxh58rw4eqLqJ901Q+2ybfkBLAdhaeBs
	FXRi0JQbFCITk8/tQ13UBpn4oirYO1x8DsB
X-Received: by 2002:a5d:5f93:0:b0:435:e060:8071 with SMTP id ffacd0b85a97d-4379db61767mr23486335f8f.16.1771427392709;
        Wed, 18 Feb 2026 07:09:52 -0800 (PST)
Received: from eichest-laptop.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ac7d91sm44333116f8f.26.2026.02.18.07.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 07:09:52 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: o.rempel@pengutronix.de,
	kernel@pengutronix.de,
	andi.shyti@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	stefan.eichenberger@toradex.com,
	francesco.dolcini@toradex.com
Cc: linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v1 1/2] i2c: imx: fix i2c issue when reading multiple messages
Date: Wed, 18 Feb 2026 16:08:49 +0100
Message-ID: <20260218150940.131354-2-eichest@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260218150940.131354-1-eichest@gmail.com>
References: <20260218150940.131354-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

When reading multiple messages, meaning a repeated start is required,
polling the bus busy bit must be avoided. This must only be done for
the last message. Otherwise, the driver will timeout.

Here an example of such a sequence that fails with an error:
i2ctransfer -y -a 0 w1@0x00 0x02 r1 w1@0x00 0x02 r1
Error: Sending messages failed: Connection timed out

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc: <stable@vger.kernel.org> # v6.13+
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index 85f554044cf1e..56e2a14495a9a 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1522,7 +1522,7 @@ static int i2c_imx_read(struct imx_i2c_struct *i2c_imx, struct i2c_msg *msgs,
 		dev_err(&i2c_imx->adapter.dev, "<%s> read timedout\n", __func__);
 		return -ETIMEDOUT;
 	}
-	if (!i2c_imx->stopped)
+	if (i2c_imx->is_lastmsg && !i2c_imx->stopped)
 		return i2c_imx_bus_busy(i2c_imx, 0, false);
 
 	return 0;
-- 
2.51.0

