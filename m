Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 699543ACA4E
	for <imx@lists.linux.dev>; Wed,  2 Sep 2026 10:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788345802; cv=none; b=Or60iBUgqhwwzrn4pangGxZN4Zfqa0JawcfE0vl6xhKCOfcspB7BbpbnGHGmu8Jap1tzFKDngo5Tk794I6KlFM+zdMY1LVO3iV030FIsoKxXRbuK3037NeHgo3Tfak2oi4mP1sCPTW+txrK+8LVGTepE2qMZvmEky3PAeAaHp6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788345802; c=relaxed/simple;
	bh=paqwGm0dbymLdp3ey6HqZ+s0ntRK88LByWFW3aJnKrY=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=BIEcN//uXn7X31/ohblRaBr+XPSOMRNQwgHxc/kDiBCzhyRfy58hPO+exwL6/tqjLeAWRXmq3r7L/piROKnhhMzjprORPv5MAw0yJ+w3MUtcNUWnF56PEtKuOeDgY36e4LcuilD5XHjVVb8auRB+qG5Ee+VSjOJ5W2kGPamc2RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ze5WpvIk; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ze5WpvIk"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so815503a91.0
        for <imx@lists.linux.dev>; Wed, 02 Sep 2026 03:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788345797; x=1788950597; darn=lists.linux.dev;
        h=subject:cc:to:from:content-transfer-encoding:mime-version
         :content-type:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=paqwGm0dbymLdp3ey6HqZ+s0ntRK88LByWFW3aJnKrY=;
        b=Ze5WpvIkhPLHksJ3GhNUmqUXFeo7zB+meMlLaRnbYTR4hxyIngqe+4HW23V3lFtJ34
         x5pV//EUYwamfc55EoM3IqWGLMp6VFfdTOKxzy14h7l0Y53ZWekcDtY+9Bj+5YHmU4PA
         c73G+EpGt7waW+yY2/EKKh4Tmv+geAxSdqU3cdCNEY1JF9bnkgiZ3XoNNkffuhCVkkzH
         EX50VMbA/9DVMxdpcwnvt2StRzFkxQ7xtxmdtn6FMBFKauXL50dbfwc37caHIdL10Kuj
         jN4gNCtEaMrY2Rd3Yoh2DrnJYdMGDH7VpccuyZNZhOjKvZUrHLpgaAI8xn+575KrhIIR
         9hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788345797; x=1788950597;
        h=subject:cc:to:from:content-transfer-encoding:mime-version
         :content-type:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=paqwGm0dbymLdp3ey6HqZ+s0ntRK88LByWFW3aJnKrY=;
        b=K+ZEmRp0XzdEc6hCrOyu9n6/woZAqVIusk92gAhyyaguWedp9meSyFNBxDxyav+M1d
         Sh85KXZqYrNx2ym14+QoMjtCpUmQKeKWz/5rizNJRnXclK+LvKAxqWi8Qy0plLtHHMH6
         VIW4/QJiAtsBCJSNRluuJOgT/v+LU4aHYAzwhTWYcHFRtyEke3ykhnWZM/aqqflQvxu+
         IG0TxRTbIG4+nHQtgZ2uOubmFHVek03eAOTJQ8n50L+YBNT1PmoTEybbYXEsfK64ogjv
         VK/pKMgwFWFr0iPjNc7qOWiGKmKhd/isS5ST7DgBbMEWjfcWqlggep3dYHY1lP0Oqtzt
         55TA==
X-Forwarded-Encrypted: i=1; AKwUvBwVdt1HxwW7PB3mkcnruynxrftXCMOHhpngEM7C79wGWyso9dyy6NQG564+g6DlaqqBT60=@lists.linux.dev
X-Gm-Message-State: AFuF++kbU+9r8OCg5rGTbMcFJe56mKnRXxYxJw+cclF/QiQ3IQagE49f
	JWBBT3NFuUKaSolNelCawWmKPBbFdEnQeoe6UaoVLT2yWnYcKXHT1BsR
X-Gm-Gg: AYBFou2OJN/PVJPMMXaRZzUr+cwnbtf1gufA99nuPQMondWgOBM0691995cK/3/nwCr
	pCgMHscLF0PjRk9QTF3HTmaxSFXRybszf9x/gXIV/VsfQLFoDsXJ2al1ysgPM8mcuhWYE07VLZB
	EfO5hG74D0wSggBn8fZw452OCWhiZIh5957T5QUE36vYxjpN3EG9Na2M+/EmHXCByKSGD2bbzWC
	YIIUSahSQ83U8P25k9tM5Ki9vHlmo72HU79YAnDfpLFX7yqG4FXYUDFf5CgLZZz8PJfchtubscq
	9YqCpUbysOLsPdFcLPRzJPRJH2Vv0nxdV3qWsbQ/cE5Da7rNLATmrsrLs0gRdFuKi3VLaWTWfXY
	zZ2NS+6ynZTR/mQKOArVPnT5oG+UkaMIkC7aD+IRpBWuCdWZbkX/x8euvvskaD5Z1J/Ethp2/tQ
	f9WSAkAXuoH7t47o308/xiyzUIvYum9bT7aPULxiAsB5acCBwgA8Ilhr2MijtzQpEqMdKDnSUZE
	E816SSE/UGQIyOzHYTX4miJ
X-Received: by 2002:a17:90b:3c04:b0:398:d6e8:f84e with SMTP id 98e67ed59e1d1-39aedf5571fmr6465373a91.9.1788345797082;
        Wed, 02 Sep 2026 03:43:17 -0700 (PDT)
Received: from [127.0.1.1] ([115.110.137.22])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bd1b395sm12531509a91.1.2026.09.02.03.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 03:43:16 -0700 (PDT)
Message-ID: <6a97fdc4.d9789fc0.362adc.c4f2@mx.google.com>
Date: Wed, 02 Sep 2026 03:43:16 -0700 (PDT)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: base64
From: Bratiranjan Acharya <bratiranjan11@gmail.com>
To: aisheng.dong@nxp.com, peng.fan@nxp.com
Cc: pankaj.gupta@nxp.com, ping.bai@nxp.com, imx@lists.linux.dev
Subject: [PATCH v2] soc: imx: imx93_lpm: return -EPROBE_DEFER when SE firmware not ready

aW14X2dldF9zZV9kYXRhX2luZm8oKSByZXR1cm5zIE5VTEwgZHVyaW5nIGVhcmx5IGJvb3QgYmVj
YXVzZSB0aGUKRWRnZUxvY2sgRW5jbGF2ZSBmaXJtd2FyZSB0YWtlcyB+OTAwbXMgdG8gcmVnaXN0
ZXIgaXRzIHNlcnZpY2VzLgpSZXR1cm5pbmcgLUVOT0RFViBoZXJlIHBlcm1hbmVudGx5IGRyb3Bz
IHRoZSBkcml2ZXIgd2l0aCBubyByZXRyeSwKbGVhdmluZyBERFIgRFZGUyBhbmQgbHBtLWNvb2xp
bmcgbm9uLWZ1bmN0aW9uYWwuCgpSZXR1cm4gLUVQUk9CRV9ERUZFUiBzbyB0aGUgZHJpdmVyIHJl
dHJpZXMgb25jZSBTRSBmaXJtd2FyZSBpcyB1cC4KClRlc3RlZCBvbiBpLk1YOTM6IHByb2JlIGRl
ZmVycyBvbmNlLCBzdWNjZWVkcyBvbiByZXRyeSwgbHBtLWNvb2xpbmcKYW5kIEREUiBmcmVxdWVu
Y3kgc2NhbGluZyBib3RoIG9wZXJhdGlvbmFsLgoKRml4ZXM6IDcxMTk5MGUzNTNiYiAoIkxGLTEz
OTEwOiBzb2M6IGlteDkzOiBscG0gY2hhbmdlcyB0byB1cGRhdGUgZXhwb3J0ZWQgYXBpcyIpClNp
Z25lZC1vZmYtYnk6IEJyYXRpcmFuamFuIEFjaGFyeWEgPGJhY2hhcnlhQGVucGhhc2VlbmVyZ3ku
Y29tPgpSZXZpZXdlZC1ieTogUGVuZyBGYW4gPHBlbmcuZmFuQG54cC5jb20+Ci0tLQp2MjogQWRk
IFJldmlld2VkLWJ5IGZyb20gUGVuZyBGYW4KIGRyaXZlcnMvc29jL2lteC9pbXg5M19scG0uYyB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc29jL2lteC9pbXg5M19scG0uYyBiL2RyaXZlcnMvc29jL2lteC9p
bXg5M19scG0uYwppbmRleCBiZmE1MmZmOGYuLjI2ZDcyZTNlMiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9zb2MvaW14L2lteDkzX2xwbS5jCisrKyBiL2RyaXZlcnMvc29jL2lteC9pbXg5M19scG0uYwpA
QCAtNjIxLDcgKzYyMSw3IEBAIHN0YXRpYyBpbnQgaW14OTNfbHBtX3Byb2JlKHN0cnVjdCBwbGF0
Zm9ybV9kZXZpY2UgKnBkZXYpCiAJc2VfZGF0YSA9IGlteF9nZXRfc2VfZGF0YV9pbmZvKFNPQ19J
RF9PRl9JTVg5MywgMCk7CiAJaWYgKCFzZV9kYXRhKSB7CiAJCWRldl9lcnIoJnBkZXYtPmRldiwg
ImdldCBzZS1mdzIgZmFpbGVkXG4iKTsKLQkJcmV0dXJuIC1FTk9ERVY7CisJCXJldHVybiAtRVBS
T0JFX0RFRkVSOwogCX0KIAogCS8qCi0tIAoyLjM0LjE=
