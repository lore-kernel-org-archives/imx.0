Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F90B3BFE3E
	for <imx@lists.linux.dev>; Fri,  1 May 2026 14:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777644007; cv=none; b=hBU1uTtlnH0o3GAGOt1J3/hMkM9V1yWt4LtymT7anIODucCnjfa4/85QfVlUjOfo8MICJbE+NrvdQAEe6Nxt6ivpa3BpmePZMm5iXJsZQ8cyOrIVjoHIWuBsUk3GZ0Hxa0Mv699K2wvooMtvK/4Tgg1oHqFNJoYQWxCb0bDcw80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777644007; c=relaxed/simple;
	bh=wr1OnFxz/Ai5i4NfAvoS0ChTxZI8nshMYVtsLOtw7bM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kJQfEYxQi3yyHf8rfxERyMjq4oXmw9E2bcTO1+utkIo9MXcGXriPm1Of9q6hh57aZ9GrhSy04EBzPu93FJlK+zxz0YZwWMa2LVP5wugAoBuJ0Zr9iQCyqfhPhcPB2O36K4mmzRh2q6KQPBB25IKypS3Dma0bQz8fbej0Nww0ueY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJtp84QN; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJtp84QN"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891f625344so20802015e9.0
        for <imx@lists.linux.dev>; Fri, 01 May 2026 07:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777644004; x=1778248804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/yRGhlBCY/TW5XKeeufbyghz250gEgHu0HIRBXKkoYQ=;
        b=iJtp84QNsy0NC+mJaaGzEgT87Gbt/baGWYS/vEADjgOL+cLhjOqncSPu7/mNLEKh9R
         KNOS7Qfwvx0GlzNQUFzWcRgK2MC6mLNw0kqczqzNoictC4TdeHTLyDsfyka6FJle6CiW
         rH90BRlVMTM+PjuTx/Em7Mg7TbBWuX5Y2Ry6vg5V6Z917IWiQOUQFz6JhpDmgSaxXnMR
         C9tnCAI1lIx+BYSlFBs8TRTzgIi6vkUAlxUTF8CEzqGwZSwfSzVGEvbBkwj66BVvySlV
         nhH+ofSr8CzbifGClM8Tc2zhgTRbX8jym/7QZsqfBYLUGI7lpEuA+RHa8oqJEUloYDpp
         bmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777644004; x=1778248804;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/yRGhlBCY/TW5XKeeufbyghz250gEgHu0HIRBXKkoYQ=;
        b=n3z8SwnXgvS8gRE6jsz9SlOSbeAwtqBpKO978TxMis/8l12uJ6rTQY3GRz4/QqRG68
         OZecit+4+cKAOd4IOiA5jWqUwVk5gRymQ0vjCSkYDO+f57LbWGTZQB6Iae+Dyw/cYhl2
         dcJSQbjydxx8/fY8Au+KXgTKuEPBlO2gCJ6rEhEKBZjii3zOAwUfHZPlOsxIVzc577aU
         tqp1Jv7gNdNoPPgQFHd5YVdTX7ukrvrfzHOgQ5ei5T+4gfDhWaycHTUYBgSaoMjXHT8o
         vEnd4ofQaSMadT9g38hBQ303EoItGWDkMmwYhgkTHOeSYmB8PthIJIt79nAMmVmmRP98
         geNA==
X-Forwarded-Encrypted: i=1; AFNElJ/fpkXFdCshj53U3Tk0jpS+iX/73LkfFNDRLuHHpfOIqyN593Ib0ueIPeirZsf0M2y1gFk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx9m2vb5hWQOvKSBM/Xl9PpLGPYJtlvS+cbtrMSszGuxZHtsWgV
	cXKBnbBLuMZy1NhhVHGoeFgQa2X7at/6xkVK8tzbp2MEDw/n9gOsuCHz
X-Gm-Gg: AeBDietSwEhJdnvm7QhxoQABhF9zueNQx33g9DySX9PiigbzUOiZM46vn3WqZOqz5ND
	Six2Qji3vEsMcpPdt3uvzZXerhdsCHDEJ/CzzKf1PGwOKhOgJTjpkXKvRAJq9tF/0K96KN73CEU
	r8z+FnQWe5rF4DkTg+30+DguyCpSmY27duq7Yxv7UJIdq4har80ZWs+fmt+VmJ2SxT3nA4HMZqW
	NMbvmzE9u85RZFhW0yCrZliBr0YCw+60MgtI0KUlJDklb/QV0zrtgGoY6PESIa2Woa0JuYGYb60
	aK+EL3/SsPWeJ8ea7STu7aKdzRlzAEPIAjjDjhwYPJVYtBO5ymdH9ewrLGqjYT7ouPoQOpnZ6+L
	taf5BknepHuXLzfmEif1M0Q6zVp9NBXj6oTfWBDfq23KMHvKHT4192tmktQEfFcT+mm2xlUcyRJ
	yLExNpB+F5ZM1lcmNV+U5Gp+dm9cw8LtwRrfYAbk7TFZjKHZEoDHCBShWUmS7uQa2xnl8NzxZru
	hfp
X-Received: by 2002:a05:600c:34c6:b0:48a:761:5816 with SMTP id 5b1f17b1804b1-48a85e7c80amr105322175e9.8.1777644003492;
        Fri, 01 May 2026 07:00:03 -0700 (PDT)
Received: from localhost.localdomain (ns31537009.ip-141-94-163.eu. [141.94.163.193])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-44a98b768fdsm4823539f8f.33.2026.05.01.07.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:00:02 -0700 (PDT)
From: John Madieu <john.madieu@gmail.com>
To: broonie@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de
Cc: kernel@pengutronix.de,
	festevam@gmail.com,
	carlos.song@nxp.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Madieu <john.madieu@gmail.com>
Subject: [PATCH 3/3] spi: imx: Propagate prepare_transfer() error from spi_imx_setupxfer()
Date: Fri,  1 May 2026 13:59:51 +0000
Message-Id: <20260501135951.2416527-4-john.madieu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260501135951.2416527-1-john.madieu@gmail.com>
References: <20260501135951.2416527-1-john.madieu@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

spi_imx_setupxfer() calls the per-variant prepare_transfer()
callback and returns 0 unconditionally:

	spi_imx->devtype_data->prepare_transfer(spi_imx, spi, t);

	return 0;

mx51_ecspi_prepare_transfer() can return -EINVAL when the requested
word_delay does not fit in MX51_ECSPI_PERIOD_MASK. The error is
detected after a partial set of register writes (CTRL: BL, clkdiv,
SMC), so the controller is left in a partially-configured state and
the transfer is then submitted as if setup succeeded.

Propagate the return value. The other variants' prepare_transfer
callbacks all return 0, so this is a no-op for them.

Signed-off-by: John Madieu <john.madieu@gmail.com>
---
 drivers/spi/spi-imx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 4e3dbd01d619..480d1e8b281f 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1382,9 +1382,7 @@ static int spi_imx_setupxfer(struct spi_device *spi,
 		spi_imx->target_burst = t->len;
 	}
 
-	spi_imx->devtype_data->prepare_transfer(spi_imx, spi, t);
-
-	return 0;
+	return spi_imx->devtype_data->prepare_transfer(spi_imx, spi, t);
 }
 
 static void spi_imx_sdma_exit(struct spi_imx_data *spi_imx)
-- 
2.25.1

