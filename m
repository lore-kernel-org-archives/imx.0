Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795093546;
	b=XFX6fXa2mwF25eja7bNMt7kPs2Wb+4EKGQ2aDATWm2yo8oX37DWOGn6BzxJds0+cVvw4
	 XMEgFEtF/Fmgl94y5srMJg8SRSfHtAyVsPcF0l/W7xmCv9HTqPo4suH35dTvRZHxw4XUE
	 nHdRRBFbxMss6HIUW8S2GItbNPJTGZcQKYTtnuD5okRu14OpkSsmGd3k9/ltkVU3G9GKm
	 2ZzwjknVyFF88frEKGBsQHMsTbJHcy342i7DW1h8bvQRFY/dA0cktQE8uzaziDmO9Y9Qz
	 m9XOn8HrkO5NI1lmIMT25b65VbZmRCB9PsnT6W1cl5Znyxf/FMbxUiSWizoTaXlft9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795093546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DUHaQOoN9eliMKXTBs8DaDAMBqFWvPB/4qsL3rM7sCY=;
	b=HYV9W40wbjuvzSGHRqEsXH1TGsjUqa0bdwsQACQSAxOSoDwA8UKsMovaOf0YC+0LmNaJ
	 cl7C0NyTf3wK/cU31EKpMVDfc0tiFpn5YzwF5Czsqg4/Cx19lBgQdpic7EFTkXrglDJXv
	 YAvs83GlNTQY0b5q9tEaD7sQdO5Msqq0cwFtmvL6CkBMLiOhbiQntWGc1HRMknp2se3eX
	 hJPeIpW6Twn32t5q7tsHCZoXjM2UIBSRSCnThIo+S8RzAFOyOrVpbjV81uy7V/p7Gi/Sj
	 o3sHdHI2g8m5lpagJCP3kWeN1JicHTrLJOUFqJ5VZaXUpaM+Earro9KiwpY0ywG7FKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qPMlgPwQ;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD33606A324
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 13:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AD33606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qPMlgPwQ
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so16947035e9.0
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 05:05:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795093544; x=1795698344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DUHaQOoN9eliMKXTBs8DaDAMBqFWvPB/4qsL3rM7sCY=;
        b=qPMlgPwQ8E0z0LINMdOlWebBAmy/IyHE/LaJMw975U045dbXFaEHiesiSgPLRwm/it
         bNvQtaDavau+BJ2uuPp9iDu7iunM9oG0QDVTWrGUd4+XwsGV1FNUXgIjEEhOuQif7LfP
         WVQ50g2wQSo7yql/iyj8pM4euisGJYwVr4+aZaPZYNqG2yVZwEFUKd5MCEjFgKUau8Z9
         6pzwu5KrVM68o8hPSh5Vpf7XJ90LSt5v7P6LS+h3dt4FuVT+gUKQxPheDiz31YeV3/KQ
         SjMgoqktGF1LtX3oUlylnxpQghmhwda6EQOJ4jI3nFZucxWFtyuIzId6/2F3dMcGcCvI
         2Qgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795093544; x=1795698344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DUHaQOoN9eliMKXTBs8DaDAMBqFWvPB/4qsL3rM7sCY=;
        b=iUb1jei1YoN2W41X909nWEqWMWCZcOsxuwSuW+W+MBgHQIA4oLgi+zhBPEu9g7gBva
         sJOKOg9s23E8RGhJsiSSFuzSFH8utWOj8m7QMompQfrnL7OaAFU8yS4cFKLt3WcQKSmx
         Q066O3PmwiTJUFMbks9Ask19uwN/56PDOH7x7+2PKKWdV4ec+rs2McoQPy2XxO6gc/eC
         RZXhYyrKQm68b2VC4w4n6BksjmvJsiv0Yc844a+GrDlwaBv/3wGS2jc+Wz3lFH3EFbPd
         GaJzvG4uz/7e5zxp3oyGKM/lPgAnEsI+Xe+OBZskYyS5jg9iZqaZhDSmJHtKi+JLIc4Q
         /TnQ==
X-Forwarded-Encrypted: i=1; AL+hErG87w05Ov6XxIeYSa6TONxi6exvWKMIXE7mZi3Vdo0SQ+X0JbhmyT+oSyQEpO1HKo/QRws=@lists.linux.dev
X-Gm-Message-State: APuU4Z81Arr1W4/bzQclj2q4IyX1AcQ6vuStX4xsovAVuH0Yl7t/U/Cc
	UHWSeTmlmRhveJeSeoYe03OY5DKGu3saFGGbXCenymbY3392GeKYzvNq
X-Gm-Gg: AYBFou1feF2jL55lblkXSTK1ZkhLLRZWw9I1FN4iFOPpH/JBoDr7TiGETKbsuDK0hyt
	I88IjyqLDV/WCItVpSSvqV/gLxfekKT6+0nwK7QJivB7rBfpt7HhatXyL+C+fSJIyej9x9VUzZt
	Pf1H+gYGMPouV0jHMQx8b99HapLG9lyPOB9DQi0bpD9lY1emFl0rqDpSAQWawuXJSmnlwsbghtU
	hf3FjSLe4IuvZMP0y5pk+/iwC+f5y+bpIbuaESZ0u8ACqcigKBQzYAcvNRz9I9Z4gQLO0Z9kOdI
	RZeSgiSfCufuvP/MnbIzrvZ1J7lBZYhvaxgQ8ZgFGvFiqbuBiP9yYk+7p9QZOOeD9z1QfoEUoQ7
	Oi0pTiaQqeBl1UprNaED3C+R95p4QtfvFa7PbuT8nK7BOmad/7NkRGh67HBmXyny4EUOjnB9Wtv
	F1nOKu/bt/VAo0EeU3bK0Np77OfWaHoBtf1AGWN3mFquyEr51DfNUPThlrn7UvYma5L2mTgL9Uj
	P7NVCJFNMZNNFEGtZk+GK59pEbpe0hn+FCyzjDYZoXveNrgM3ZfjxdVojKoeR26FZnhfRGUkUY8
	KZqhLFE4wrsY7lNozfn+HZOJ42aXqxseeho=
X-Received: by 2002:a05:600c:4e44:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4bb7da12957mr112752995e9.9.1795093543797;
        Thu, 19 Nov 2026 05:05:43 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm42546305e9.3.2026.11.19.05.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:05:43 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2] i2c: imx: do not acknowledge the last byte of a block read of one byte
Date: Thu, 19 Nov 2026 14:05:42 +0100
Message-ID: <20261119130542.180192-1-mehmet.fide@gmail.com>
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

In the interrupt driven read, the read of I2DR that takes the count byte
of an SMBus block read starts the reception of the next byte. With a
count of 1 and no PEC that byte is the last one, but I2CR_TXAK is only
set in i2c_imx_isr_read_continue() for the byte after it, so the last
byte is acknowledged and the target goes on sending. The read fails with
-ETIMEDOUT, the bus stays busy and the following transfers on it fail
too.

Set I2CR_TXAK after taking the count when the message is then two bytes
long, as the read before the interrupt driven state machine did and the
atomic read still does.

Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
Cc: stable@vger.kernel.org # v6.13+
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---

Notes:
    Changes in v2:
    - Test the length of the message instead of the count, so that with PEC
      the data byte is acknowledged and the PEC byte is not (Sashiko).
    v1: https://lore.kernel.org/r/20261116124430.1358948-1-mehmet.fide@gmail.com/
    
    Tested on a Colibri VF50 on the Iris carrier, kernel at this base plus
    "i2c: imx: acknowledge the count byte of an atomic block read" and
    "i2c: imx: keep the error of a failed read", with the M41T0 RTC at 0x68.
    A test-only hook passed the messages that i2c_smbus_xfer_emulated()
    builds for a block read to the adapter, alone and followed by a one byte
    read, with the read message starting at a length of 1 or, as with PEC,
    2. Register 0x05 (0x01) as count byte on the interrupt driven read: v1
    read 0xff in the PEC position (40 of 40); v2 reads 01 01, and 01 01 00
    with the PEC length (250 of 250). Count bytes of 0, 0x13 and 0xae read
    as before.

 drivers/i2c/busses/i2c-imx.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
index ccf08cd63151..eabadeb47e2e 100644
--- a/drivers/i2c/busses/i2c-imx.c
+++ b/drivers/i2c/busses/i2c-imx.c
@@ -1095,6 +1095,12 @@ static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_im
 	}
 	i2c_imx->msg->len += len;
 	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
+
+	if (i2c_imx->msg->len == 2) {
+		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
+		temp |= I2CR_TXAK;
+		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
+	}
 }
 
 static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)

base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
-- 
2.56.0

