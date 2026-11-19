Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095750;
	b=2UYxO30lQMblFd1riEWKjt4tNpoHr1A8/cikqAuAqvpklsh1L9+4tfQozslICiSM3sEE
	 e2jBzkYJrv1BjEysMS/LcWZJZK5rcuqp+0r9DYyBs1RaCUSHxCA2DfcSg+NAEJMmyR4jo
	 Dsir9cgASc82WVS/HxQDo/sktHvpk+rC+MSoOib8Jyo68bSUNDn6p+B5y2hZexrXPEB5O
	 uQACBZHq1JxZh5q/RA4ba8ZvKneJz7aNPmWiNJTf6z4gkepX+W6Pmc0edLBhgqaS7kC2I
	 8UcULvQZDTKmNFzNeZmNjVdIiv+oIQ1nN/WPsmKt+8ORT8ReXXWsip09SppKbICvXDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=03N+1oTleZgKa9Qt+3r1LOaqyq+wwqvkfR03GB3AqD8=;
	b=tCgAw5po/U30+LnQoJvXFiT+tn55+6V29nTbx+twQUG1RsYRaOmqZawj09IcPmtRPUk2
	 qlOTawWAm0nTyu81plEkC0dBfCqm+aLyTwMxSDtAoeeOfIH1+gJ/WckUmsYx5MuV7JLVe
	 GQabdIoVbBSk0V1mERWoCrp24mP8oNWF7MIdvMn3jDARslqS1qANp+7Jg2258IcRwX0Mx
	 2VWQDbpWvhARevVZtYcRsAIvvhkIxtfBNqa/NcN16rUFS2+oBsh9UhbxafZLp2e1+wNyA
	 LcKywAk2L2jf7+b1UQSfSMZGLEUmO3PH34pFalo9PRJxGLVc0NVMhItmRXmJp7z3SPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="jK/fhJay";
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA7360A2623
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 13:42:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BA7360A2623
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jK/fhJay
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-498f5fa5103so1331827f8f.2
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 05:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095749; x=1795700549; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=03N+1oTleZgKa9Qt+3r1LOaqyq+wwqvkfR03GB3AqD8=;
        b=jK/fhJay1r+YPR+9LnRgqKv/g7SHkZXJHrpWOWVtTaVbLfjwBOFYBXtvbAvKLKUwaa
         gkXxc77lK8uVcUPoCG4LelbZcbekXtZlGSZl4bAeyuQDhBnX60K7HQUwH4tbcyMI+yKr
         +9Pzoe0m6PZmShdu+53d6DxTMW/RGwYNok6zS97F/GywC2myhg0xF/1mHLeDIVV09jmT
         B1KT6CriV94nSI90hd5kJpTrqaeHqBVzAJFxG1Xagy68hgJTJlyG5ED3PzO6LX5ZyC7c
         5LB+DL5e6AiTtFB3mQmRTn1F4Ke+Qx7ZZrUnfrsDP3oCTOywbL4e1WtP/EdIJ7aXjVky
         2WPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095749; x=1795700549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=03N+1oTleZgKa9Qt+3r1LOaqyq+wwqvkfR03GB3AqD8=;
        b=KWb+JXjIChxxOIWD2j7pig5TWdxRZW10rp3lDESUM8VbWIP1iG4rZY1eLCZWgVbGy1
         OYIY7dt4683rzTgSntC3oM00QuHp+iwGeqsUNz2qzMqKclWvbCVPp/bM8MCnZ82m+lo9
         jRB+xsnuU5kx6KPwN2LY2uZnE/oXRZUzh+hUHtL7VQ8F5NLgtHWwStuV0Lsp3HxwPP3c
         atFGkklUlMuZjG79JrH6WRtfGHF50UlH7AQ+oSJhNT6LDsQEqexMYsckTS/bFPRUGam0
         N3qlYayPskbr6DqW15dgo/m0GbfM+ly0DvlaAODcG+Vc1QqPzECnnchTEZkef9+vo6Bk
         2R5Q==
X-Forwarded-Encrypted: i=1; AL+hErGEircyQO1yKXNywY7NfZMEG3nU0BFMsiUFwC/4XlqGlE0fhCTZPeAP6EmAejRlod6PuTU=@lists.linux.dev
X-Gm-Message-State: APuU4Z+wUYCDUVzcM+LeHc5IP1gDBuZKsOHD/+ERK8LzQ+d3QJDMacyt
	jVY29oy0r78pVQhY8SkGyBKl5apgBETtZhnCfQJAz9IJqqicoJyzAFCv
X-Gm-Gg: AZFdTZePoLG8Bh5+2PNjFCHvRxMyxVnpaab+rOorCDBqShxIlVwzKsbn+llaWz8Fr1W
	hahxOFv5Nu+kuJ6rct9b2igpHpfOIvAiOtvDpjA2SepU2SrX/0186cC205/x0YoqxJnZj6SFHQ9
	M1Rdcnm+7Oxh1DKYBgOM0FaBZ7t3x5H6iB13EcxFj3ZpL2phLD/XS4oS5zd7HRNVOJX4zy2tweL
	L4CPm0XG6NFnS62DtY/i0LRXzS2jrOXOCjmXCT/ye3Uor2+VJmwcDWft+AX6k8+13uE9YZUEY0v
	T8KBlA5J/THwf/ZFz9TkO5ZhPIJHlWpKVo29HIgrqWqsKHGtwzDJ9aTr1FQMPCzV/KyqeLPqqel
	VGEcHAnFflw8DIWJ88GlPA7KJjG5C2DDwZ5XV5NKXGutJh9zOUKw4ykDw2UUJotZ5p+r/SAVb9w
	VA+iGdTTPhDJmKchmcBDBU/8/qclbQWbgujjoHUr+WfmyIa6HTEz7X8/PkvbO3Ty+QRhgeYJr50
	icOeQkSlqdIotelrSP6GX3M+PicnIY35QSxvjBsME1uap29602MlL7g9eJsNX87NPfU0gVb1YI6
	zTN0lV6D2HBYDy4j5CaOifTgMrBam+T4jms=
X-Received: by 2002:a05:6000:4815:b0:4a6:bc53:247f with SMTP id ffacd0b85a97d-4a6bc6269c3mr11252717f8f.48.1795095748613;
        Thu, 19 Nov 2026 05:42:28 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:28 -0800 (PST)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	Yao Yuan <yao.yuan@freescale.com>,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: [PATCH v2 1/3] i2c: imx: do not carry the interrupt status over to the next transfer
Date: Thu, 19 Nov 2026 14:42:23 +0100
Message-ID: <20261119134225.265242-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261119134225.265242-1-mehmet.fide@gmail.com>
References: <20261119134225.265242-1-mehmet.fide@gmail.com>
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
index 89f2b764bbc4..f20727ffb5ce 100644
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

