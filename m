Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567905;
	b=FA89tM1cuFUPkP4xkC6U4PAEE67k8U/2HKZ7i0ggPsKdh+LgO9L2Q7SNps9v5vTCaWty
	 n4YN86jSvVVfmoJBlrZcAJm8Akvh2ZNX8Vt0KjBedKoqm+Jq3QLS2b4YgNZuSyhiWUh6Q
	 Wcd0F6t4IfSuOVx0qMUsn7GLPlCxyHzf0acDOowScVQ9i4vJ0x975gmqgl8sByrkzCjx7
	 iYI7gNVdTj/OPFmmA1CCbJq24w1GWiPBhErOMbzEFEDVZfci+1soBOUFamnlnI4harjb3
	 eY+B3P666P2d4sRYIi+1ufBz57QkSrniLwMkJk7qOuwkWMB4iyTagWICtGQXLr83ECg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567905;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=k5kTzIC/xwbiOBwUmgidJlrRFiWrIZutr9d7t0kBwUc=;
	b=EMFKtDz8v+eZuIo1qCQ+DrKABio4akkdjwwuhc+DFV7TmTC9pU+H5bU/ljqZF3aFPxwo
	 etbatW0Pm01QLdkO2zjzmJYGm9KxMtdAWscA3iVvAHCxsYWmkOJgeBGw0y5WJVaKL1vsQ
	 UX0el21Js+6fAL0orbWp4jAqZzCBY1m9HDdPtyXU14OASTx9E9hZERkiufid+T4arx1zh
	 QicrRgKauBR9iTJWqHTApl/fkC2YgJs0UMQQduFc48N6g8NH4NUxvGDJ44fzJR67H1LeY
	 Fv7oWfIItyqgu58ChIUEUAZWVlNrtfEyNkCObGq1X2ttGW+ey0rcvzHPzBWR9FyCr3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sVAVYsoR;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C6AA606A339
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 11:05:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3C6AA606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=sVAVYsoR
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so11403435e9.2
        for <imx@lists.linux.dev>; Fri, 13 Nov 2026 03:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567903; x=1795172703; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5kTzIC/xwbiOBwUmgidJlrRFiWrIZutr9d7t0kBwUc=;
        b=sVAVYsoRaHX1OYAiye1Eu6v9E8jpLcVEB45m7MadimyLLKhb1aNzr2EUa6EIk/eaaq
         0aUPxzCAaKineUZJMq5iU+6bjvORoSsiOTnQG0X3v5bxR0We9KS19AwdnPAC3rZkKbUb
         0QODluw1qmFqa+G0q2Woy447LBmMf+qs59MR29Wc3xJH6wZ4evanOw6jtanWDliiq8zs
         0zigTk7uM6p29y9K562KLiYd0wWp9Kv5z1yKK4dVFpxrSMz4xnLDEu/0X97JD1MsD3EL
         RMFU0PkLsF2ToNRPRFCdq6sh/tC03nIxG/4xheYXnF7u+k9TMJAtdt39RHeC+pJ9IwQZ
         1N7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567903; x=1795172703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5kTzIC/xwbiOBwUmgidJlrRFiWrIZutr9d7t0kBwUc=;
        b=kEOvfZJWtYyZZBjG+3PEpsyB2G2kjtZRj/9h+C6JIavS2H1W321EFeNTT1Jal/ZIMX
         IfyjzAr0MG1NDqeksPA0+FZOiTGHp32U+62wSGg2zlX7BUXDlSQQ5phzo3pKh0AlNj2u
         JPJZ8wHGF95c5+UyLeguRr76IEw/XSBIGEdkUREJExEJTOc+wM8oC47/9wjL8ibBwBEz
         F3g1mfzS49dVtE2zHfbnVyEtSqLpucB9MVVkEaomZSYu/djyQUOzs78T5YWAaMqjKzDl
         vBPd0bM0WC1khj/A9aaVdJUqbJmthgE+v6DYj4jzgVN+Wc9BDas1FXbv1n8BpCAlTtY9
         lrDQ==
X-Forwarded-Encrypted: i=1; AL+hErFWOoEhxylG6vWGPVbdEk5/Yo/oClSbLQAVCQ4ksiKQ51yyBLJ782OO++0HPH/3KKWDGZs=@lists.linux.dev
X-Gm-Message-State: APuU4Z/H5gze7Et83yaYwvJxoY6z5z6hqgb1oHBN5ZG3ED9aUC4JvPF0
	xEs2j8E9mRXdY3a/fZR90sS7sqC7+UGu8jmbVo6qd0rx93CeBy4bT8ec
X-Gm-Gg: AYBFou3mnqZIGf/B3ERvJYB5oJkbDwHb6u2W+2ahQAnhpxaJ/55J41tYwb3p3H0TY8O
	3UCRF53fIkLbNMJaFF6xiWNLpuVkiiCDs/jpbiaJ9k8l8yIEbKgIE3TAPiGFXUcuLXN1jFb1ZvW
	bY+RMy4Gw368JAcx2+duNx3rV4Mu2JzmSpa6rnq10XCH+Gy5YjXB90pLadnT14VFJUDAM2vMlMJ
	dR/4yXqUdVAIPqovYbzzxlHiZVcHteySQGeE52CdEt+c8NkNz7N5HBKttSZEIXNtLMlk2daUa+L
	Yqim8hvYC6HtfEcsvdOqqGAU2AgQsiC5k0EYnI3jCMLbSNLYHDTG4QOHuQ5nT4p2H/dSYfxbGGg
	hOy7QwbKgpiyOxGqetsXGscbXwPz5bDz5gUoD2FpA59Y0WsH1Yol1sCsnyWYDl4jdpCADT2vqgb
	MUxOqxi76LEOw8ok7z0vwNw71d11Sp4FifIcHy5m3DqklkKRUFy9BWX0temfW/1reO8z+MTpnzS
	dUfKtvfvRx0MTbO1WyfjIG/ilLWuWQaZ4EX8aIZHYGJhYjfdmTrF98tMbCVF7McWffG8aUnNU9b
	rtE8lytgJGp0fY3nVjW57sO1klwbgXjIhcY=
X-Received: by 2002:a05:600c:c4a3:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4bb55a02932mr43197405e9.1.1794567903271;
        Fri, 13 Nov 2026 03:05:03 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55afb6absm57515955e9.15.2026.11.13.03.05.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:02 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] i2c: imx: test the block read flag of the message that is read
Date: Fri, 13 Nov 2026 12:05:01 +0100
Message-ID: <20261113110501.1142036-1-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
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

i2c_imx_xfer_common() decides between the DMA and the interrupt driven
read with I2C_M_RECV_LEN of the first message of the transfer instead of
the message at hand. A block read of DMA_THRESHOLD bytes or more that
follows another message is therefore done with DMA, which reads the
initial length and does not look at the count byte.

Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
Cc: stable@vger.kernel.org
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
Reported by the Sashiko review of another i2c-imx patch:
https://sashiko.dev/#/bug/linux-f62df5ed-ad96-43f2-872a-ae2c0100b73f

Tested on a Colibri VF50 (i2c0 with DMA) with a v6.12.117 kernel that
carries the i2c-imx changes of v6.13 and later as backports; on this
base compile tested only. An I2C_RDWR transfer of a one byte write
followed by a read with I2C_M_RECV_LEN and an initial length of 16:
without the patch 16 bytes are read and the count byte is taken as data,
with it the count byte is evaluated (here -EPROTO, the device answers
with 0x25).

The line is from v6.13, the patch applies to 6.18.y and 7.3.y.

 drivers/i2c/busses/i2c-imx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..9abe0a26c877 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1713,7 +1713,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
 			msgs[i].flags & I2C_M_DMA_SAFE &&
 			!(msgs[i].flags & I2C_M_NOSTART);
 		if (msgs[i].flags & I2C_M_RD) {
-			int block_data = msgs->flags & I2C_M_RECV_LEN;
+			int block_data = msgs[i].flags & I2C_M_RECV_LEN;
 
 			if (atomic)
 				result = i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0

