Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555175;
	b=n7LiKbQQxNXDWLzJaoqTU8uqQz3u0iwfStsKa1I4aPlhNpc/IWqu2T6SN3fVrEZ5UBb4
	 QBXmVbIOyaUTVb+tcw+/OAeo/BauhRSgz+iObrz4MHHHOsUeAsp1/qd25gz5HJiJTs+mp
	 1+2Cv5S1XvXT9qAxvtZ7TBlFpJqMXrSJvNK3/wrATyUEGoXXxAbe4Rk9TQd+C4yvyoGcq
	 FQwRxIVT2jxPRIjfmZn6L8Ex87Fu9TyoD9LntowdoVx0jl4EPF2QrC373JdULgxMRflDK
	 i94OoB4LpG31ek4LeeCnSoLORK1U0i6+6lKkt59hKk604ORetBaK2jQ3QGcsg2RDMSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555175;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+S0kn7e/e8eb1jZgh+ha8xm/Lm8wUpKn755lAIdoRTY=;
	b=CKhxFTdjpO6jtrC/1s5m1UlDyBH8NQvYmiN6vHYLGqC7JvzAOqkBRz3sNrv/8SyJH70n
	 K/YmjYFZxskD05ETpAIBVBrAuF6Hof5vv1L7B8Ru95QF5PP+5plqF5VfXpyBE/U9FiOmJ
	 AW8F2p6C3KJ7uYtXnG4ezj2i64Fol2nroJgw1GauUgKTs0IR3v7BWpI33vqXVDIT0GTMW
	 Ji0hfvQMAdZ0NMGRxer9qs7gHmSbr0WEAmzf8phaldjlJVoOmiNOiv/IIpO0pDIt3zoUc
	 0Gtnp67SuthVPWBOql7bbtzNIhTvPzV8EjzZ/t3L6oK/Fz3bphDOprXypvV0AckBfBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJLV6p2M;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C664C606A333
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 07:32:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C664C606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJLV6p2M
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e09aa5264so230358f8f.2
        for <imx@lists.linux.dev>; Thu, 12 Nov 2026 23:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794555173; x=1795159973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+S0kn7e/e8eb1jZgh+ha8xm/Lm8wUpKn755lAIdoRTY=;
        b=RJLV6p2MfyDlVE4CkOd0zkSy2jdbTH4QRvNmQs5vQREyUYlwkLRP5mjAUq7KOoRsz9
         kxw6N6o+v4ElqoTdBh+agvF3px6nThDWc9XxDM4NmfiitJoa+VSCka3mx0ZQ19MFgZzG
         NC8zxZoXDB8KjDjIoPDiXIycIbiI51bIDf1/Gz5KZM9BtCvCokW+I3QyEkoa9/80eAfG
         pusHWhIphNUEpIgiZqKUfmUKe4gys9Y9mK7hA48IIEXcBQJb2EdZu2PcePOqRTsVb2AM
         zMahZQB3+ogqjtjzqjcyfOzk845mzrsurox/89TpFugnQupclXr2tWneZesE5D0H+7l0
         Kh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794555173; x=1795159973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+S0kn7e/e8eb1jZgh+ha8xm/Lm8wUpKn755lAIdoRTY=;
        b=JteP2Zd8wZ7dRgCat7H22hHscdpWifwjpvqzJc+DGfQijKYY8q45Na7OsccFcPlh9N
         FTSdKyeg4QnM8GM3nRsC+Ar1O4L//E00NFbKuQpVElEckRkUE/f0UR197lRAcsZFvfR4
         4jV0iSz2Y+16ON+YyFDikG2kMS/4UwlpBzBn8cr5ULFgi2O0UV91gV+yHukBH5jkVaCA
         YQ0wUWcMwT5nB6lqx79k8u08aooXmxbs/1APY9T6vokusDg0O5zEKMBgi4ujUSkEFo/A
         3U4p/Ue0sGtsit6pbSXEX2HNo6WXV/+oBemH3rTwNb7ciWdMS3P9yeQ6emrPvL5uNUf2
         SYhg==
X-Forwarded-Encrypted: i=1; AL+hErEUvLwZIbG/sfJqbaqngCfy4Apu2n/Z6Si4mkyBjh9ltxbI5gGiVbji/D8ZCJPx36ipeSQ=@lists.linux.dev
X-Gm-Message-State: APuU4Z91qoYqkUqHfS3eJKhcuHbgNl8S2pVkTW3CHVspN+wXp2SO1edh
	llqpXIeSFWo5fMdif/ySfJh+uIilIubGgYhByCYvnhm9ta2z4kueEUMA
X-Gm-Gg: AYBFou2Tgj6bRSm8BkZCGxIsi519oMT4GDk74oa7EMLucxsg55TrS+KFMqM0E9SXm4N
	UGjTomzjR2IJhnAxNa9Dj/G9pvZOU5bOtjFETh7Dp5KiJbKpUCAjqYYG2KYwMw9dT4PvaRgtsIb
	espQiA2a3lS0WWy7rmjfmr8f3HEjpfxb6Whbqp22EHMWVrJs+MHS20uS/cj9Q4fEYkzYPEVvS5n
	/PU0XoBs6ZVdYIZecYKK2lJFXEbI5RATde6YnBS5nc1kAmVgGBr2c5zfGHLTLxlHraIVnBpr9Pa
	B+x554CMaA+UXjNZJrNwDYNR88rxbEUuZcK3+l+H+Twcp0pXU/oXnngESiQ9F4W1r6JQUgkZ+d2
	Z+bWmzADW3tNkyMIRI6WLzrCNXvgUZjD7e5e/UC51roYT8wY6sh+3B1DOmMCESR69oAfimmqCCf
	3Ck9Ljxc5j8hHxbGm5a+g7q4WiBf7L9mIvihynFfogt6Kn47GAAHKRLLzLXBQoEUM//ZBwGwpX4
	xWC/C0FZGzroE7QIpi2mDtDbrDXa4mjXFoRBTiR+7DgsCebM2rAgMAJYmoyLjfDQJPSOl77mufc
	A3dkXKROqe0sUUwvdZgK0kK5TnRLK63R/xM=
X-Received: by 2002:a05:6000:29d3:b0:48e:7e1f:8cee with SMTP id ffacd0b85a97d-49c73259d1fmr2428976f8f.12.1794555173288;
        Thu, 12 Nov 2026 23:32:53 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d223a29sm3799903f8f.8.2026.11.12.23.32.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 23:32:52 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] i2c: imx: do not carry the interrupt status over to the next transfer
Date: Fri, 13 Nov 2026 08:32:49 +0100
Message-ID: <20261113073250.1037215-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113073250.1037215-1-mehmet.fide@gmail.com>
References: <20261113073250.1037215-1-mehmet.fide@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

In DMA mode the interrupt handler stores I2SR in i2c_imx->i2csr and only
i2c_imx_trx_complete() clears it. A DMA transfer that fails returns
without doing so, for example a DMA write whose address is not
acknowledged.

The stale status stays until the next DMA read. There
i2c_imx_prepare_read() calls i2c_imx_trx_complete(), which finds IIF set
and returns before the address byte has been sent, so the read returns
0xff for every byte without an error:

  i2ctransfer -a -y 0 w20@0x03 0x00-     # unused address, -ETIMEDOUT
  i2ctransfer -y 0 w1@0x54 0x00 r32      # 32 times 0xff
  i2ctransfer -y 0 w1@0x54 0x00 r32      # correct data

Clear the status when a transfer starts.

Fixes: ce1a78840ff7 ("i2c: imx: add DMA support for freescale i2c driver")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 drivers/i2c/busses/i2c-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..1987a0fd8132 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1657,6 +1657,8 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 	if (result)
 		return result;
 
+	i2c_imx->i2csr = 0;
+
 	/* Start I2C transfer */
 	result = i2c_imx_start(i2c_imx, atomic);
 	if (result) {
-- 
2.56.0

