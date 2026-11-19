Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095750;
	b=qGBVMf5cDMi9qfxd6T7CJvbc1SfxtC9ZEjebIXrDsqisRraOwksx9xKFV+8O6eCyrzec
	 yS5ijPRJPsAyJlAb95mygNqzkpjdxLrM1UDacCzFMoaBUSCDboJRnN33YjX195Wz0TKdZ
	 AWYdgz+D3HzZuxcYF46kbowdNlH2nvEDV7Tb8p+GhqNWdBtbtbvz2wbnN8IUHTgIuGpWA
	 jHwQIESvPld5i73q0GMLo21CL5sfmYtgJnYx2amwa7RHy1K3EgOpwsOFDTWsI56kIoAH4
	 lrWphC71eKRJDglYbvAQJK7WviPza31RWtj5thzZI4RX0Xh9DVnjBYm3NQqOPu4jorA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095750;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=n0YIwd+6fF1gaH/fRdW2fKrVKfd8aWdILvAcZvt6cEU=;
	b=fDniENElVkdyFc4xFRZgpPwiYVh8z7fA/V62P9P22i5MBmoNQxySmF0opqSv0RH32JPX
	 R+vT28OwSrbAmkkGvDVS1TB4o6E6nNvc4q0wBy+bUkgx6A1AfGE6SgoahIcT1ZyA00Fls
	 SrtaeqLA4+gmpQka8HOk1Qhrpuw6FOkwJC0iUdDW+nKTQmNNoW1zDXuRKlF2soW0G1FI6
	 hDAYLMLoruDjxQ0Y7YRZ8XtuADBdRgQLgMMlvb5A7RkreyoRoggWhRexNLeiDIqmQHhQo
	 LuznkmmbxeBW6vJqV9Q+D2sz+5CxPrkeKr4IODMecfZx61DswMcxvRrrvXk+ZAXJ4Nw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B6AyNJMS;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94AC0606A33C
	for <imx@lists.linux.dev>; Thu, 19 Nov 2026 13:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94AC0606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=B6AyNJMS
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dee593f18so2223962f8f.3
        for <imx@lists.linux.dev>; Thu, 19 Nov 2026 05:42:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795095748; x=1795700548; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n0YIwd+6fF1gaH/fRdW2fKrVKfd8aWdILvAcZvt6cEU=;
        b=B6AyNJMSe77fjOVTbwTxiZWskYq6SGdArWvWBEyT/kAvONMNpzU0bmyLU+9lvaXwE4
         47dxYfvzYvo17l1zk85iA6tjOVwpA1eHkLMklAse2QUi0W3cy8RoVNAw7bxrEqZskQyw
         GfYvnrZttHAB7JFwp1adObp8fmviRYOceZf48EA0As4hQwTG5IVEWEtb2wmKAl8ybT5E
         W2Y16b/wd1mL361S9nlK2KYX4ri70K2wUl0zMLEke7kOA8y1BRKorghG8ehQUcbDHgqO
         yrEUbi5nwhOtJMtzj0CB3kamry656xf25We/6Jw2TGYdKPeVDEFEX+jtkKjrJKvt9sjH
         ekKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095748; x=1795700548;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n0YIwd+6fF1gaH/fRdW2fKrVKfd8aWdILvAcZvt6cEU=;
        b=xztGS5hM7paawaDTvoswfFAREgCevBabc/O5iuEU/66IIOe6+C96d69ftyR6LAA05Q
         Y7YGJZ4Eh42IylogyCBdC1kRbe5Su33PEe7ld/pHIKhrb8JRPY+HXDURNEutXEp4ZIuf
         dJlUx9Guo0pf2dvGZ6Vz5gRF3PxDgqWa2yQjxxjOagQCC+T6y2OfDQYassHUJ6XaIbvP
         UnRV+UVg8DxV5htofqbuo/z1rZWI0YSkPdrvseFxKYEqJA01c+/74YCrb+JDeR0KS2MZ
         BnVf6T0jUgafOqMi23AH7sroagRFsvmraj95d8ASCeUenX0UzWeKNKTlP8jqHbsqpTEv
         VArg==
X-Forwarded-Encrypted: i=1; AL+hErG8S/IkIqCWmT8mqWFyPwK09RzTxPcu5B3oNKEKxZgRUIwsd3eYyfp2kcIRwdce947ix+E=@lists.linux.dev
X-Gm-Message-State: APuU4Z+DA2nTXAnRf0DOrGux+ZdUovhaMB2gQIjGGMTqJ41v7hA773Wy
	X6Gtu8isbH043jE1E5c8wxVIZv+/Syu4tD4vOTAgezrM0oYHeycEw7mj
X-Gm-Gg: AZFdTZf+De+GSLwDcprqCHZExH7oSnNcA4V/A8f/QhQnPCFQ0R1MZ5pqAA9pgokF0tl
	Wjaa452zS1uFbmMtLjuUz/GFbv01M7G+BESBbB5EN3aiVO1tM43FQuid8R/g5xOe57oh0iJlh6A
	Uqv+1fNQDyYChSgTrUKQMCrXorgtcdsbPSvKkVMVcmN6MfGCS1GXR+KugPnltEMpkNuS3495QcT
	0dFgmr/8swQNTDjvG0LLCVFwgDlTl1k0XmMkrpTZdlUII8/HIrAhQjf/FR59lml72RU6i9T8tyj
	Y8mjK5xGyK7buEZu7TLlDlUpbUN6B8aSSHhIlyOjH5RO4k52zDLVrpXuWoxVbaQsAoNsNXvKv5i
	NyclG37f6AbuJLiMDMd8MYCE0udmOmTJ1LTgpsFeom0/kogGI/oEmKxU/ACagtX6BMySx+piDzK
	v6KNz31P7fxqO4s2Z91IyLELRPWbfmEaqhB676VmgfjO/JBy9w8W39MiHYsNw6O6EDVaGXuj+zQ
	mBz3DAPnVUSLT1f6SXeGcuUU2zdTA0LT/ticKw63ZLn6MUWuuTT8tx+TCgOpTdPXzuQGQc5MYUB
	2ZM/REEocp4fkk0U1MxagLjEd74ovQMFemA=
X-Received: by 2002:a05:6000:26c7:b0:48c:67d6:a87a with SMTP id ffacd0b85a97d-4a639ff6138mr14542869f8f.32.1795095747665;
        Thu, 19 Nov 2026 05:42:27 -0800 (PST)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656095e98sm9437971f8f.42.2026.11.19.05.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 05:42:26 -0800 (PST)
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
Subject: [PATCH v2 0/3] i2c: imx: fixes for a DMA write that is not acknowledged
Date: Thu, 19 Nov 2026 14:42:22 +0100
Message-ID: <20261119134225.265242-1-mehmet.fide@gmail.com>
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

A write of DMA_THRESHOLD bytes or more to an address that does not
answer leaves the interrupt status behind, so that the next DMA read
returns 0xff for every byte without an error (patch 1). It also leaves
its DMA buffer mapped, as every terminated DMA transfer does (patch 2),
and it blocks for DMA_TIMEOUT before it fails with -ETIMEDOUT instead
of -ENXIO (patch 3). Patch 3 needs patches 1 and 2.

Tested on a Colibri VF50 on the Iris carrier (i2c0 with DMA, M41T0 RTC
at 0x68) with this base, the other i2c-imx fixes on the list [1-4],
PROVE_LOCKING and DMA_API_DEBUG. Each round wrote 20 bytes to an unused
address and read 16 bytes of the RTC:

  without the series, 200 rounds: 124 writes failed with -ETIMEDOUT
    after up to 1.08 s, none with -ENXIO, 163 reads failed, 128 more
    DMA mappings in use afterwards
  with the series, 200 + 300 rounds: every write failed with -ENXIO
    within 10 ms, every read was right, 4 more DMA mappings in use
    after the first 200 rounds and none more after the next 300

On a v6.12 product kernel with the series backported, 200 rounds that
also wrote 18 bytes to a device that acknowledges them: every NACKed
write failed with -ENXIO at once and every acknowledged write went
through. A NACK of the last byte the DMA writes could not be provoked
on either board, so that path is not tested.

For stable: 6.12.y and older need backports, as noted on v1; I can
send them once the patches are in mainline.

Changes in v2:
- 2/3: new. Sashiko on v1 2/2: the new -ENXIO path left the DMA buffer
  mapped, as the timeout path already did
- 3/3 (v1 2/2): a NACK of the last byte the DMA writes was missed
  (Sashiko). Its acknowledge is now checked once the byte is out,
  before the final byte is sent
- 1/3: no change
- rebased on v7.4-rc3+ (4405c18c95d2) and tested on that base; v1
  was compile tested on its base only

v1: https://lore.kernel.org/linux-i2c/20261113073250.1037215-1-mehmet.fide@gmail.com/

[1] https://lore.kernel.org/linux-i2c/20261113110501.1142036-1-mehmet.fide@gmail.com/
[2] https://lore.kernel.org/linux-i2c/20261116122707.1349139-1-mehmet.fide@gmail.com/
[3] https://lore.kernel.org/linux-i2c/20261116125940.1368194-1-mehmet.fide@gmail.com/
[4] https://lore.kernel.org/linux-i2c/20261119130542.180192-1-mehmet.fide@gmail.com/

Mehmet Fide (3):
  i2c: imx: do not carry the interrupt status over to the next transfer
  i2c: imx: unmap the DMA buffer when a transfer is terminated
  i2c: imx: return -ENXIO at once when a DMA write is not acknowledged

 drivers/i2c/busses/i2c-imx.c | 52 +++++++++++++++++++++++-------------
 1 file changed, 34 insertions(+), 18 deletions(-)


base-commit: 4405c18c95d2d0f99f6c581ef0ee8591a1aa6ccd
-- 
2.56.0

