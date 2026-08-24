Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423103EFD21
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 09:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787564214; cv=none; b=SF9fcPTiAfWAJZYz91nVVFbrV0Ci2AStxZ/HNg6m1zn4h0lTHeBZKN5Ilpq55zyaSTAtvNuiwczA+FToVJNZX31+R3V+otbQ5Tw0BELr5QI62fRCiHg03mqzTyTVgUGn+5dvZYU772MlNaMEUru79LL89/3r7ldQYVpG2mKgVvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787564214; c=relaxed/simple;
	bh=266O6m6eJxsQvGjnmo10s8GQM4uX90RxFsT1KZ4LNUg=;
	h=Message-ID:Date:Content-Type:MIME-Version:From:To:Cc:Subject; b=cxuK8FCuNWR9HsZIzI5ApmbjIwkeIMtgwKS2DDZ15Y8PCdAo3n7i0LVZ9DAI1+qIrmKZf+fqzAcI/Zc5LZzuCxIdxPty3UBQEeWR5jsCVF+kTHo5LkXkfjHUuU4wqPxsAJmTgh16QSkaAr4jAzuDeTXR7f9cER24sLTMN3EgO1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6bjs0kK; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6bjs0kK"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8485b358552so916529b3a.2
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 02:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787564212; x=1788169012; darn=lists.linux.dev;
        h=subject:cc:to:from:content-transfer-encoding:mime-version
         :content-type:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=266O6m6eJxsQvGjnmo10s8GQM4uX90RxFsT1KZ4LNUg=;
        b=k6bjs0kKuYDeeloSr8zq94K23hNDKgHMMxNKIVrU/F0ikFaj57KVKR5dmztGFfzn6u
         xZuAERJmq8WuvmiN11AOJ5DYY64wZfB93DioMt4W79oeXEiHFomEzN3z5qvctw75KhFa
         4CEtjp+nXNJdrnG/ax3OFyvIOEJIvTQWRLou+UlF/Whon/0NpcgBMAJgzE2PfrB6Murw
         TLWKwhEE2hkdJWy20KXUIpFDA29Qda5At2zJnGQyXvEX+ZEMqQDCvIQ2+6QxZ/FJGbUy
         WKBsBAZ9DMYaT0mlOVfY5MxKE6xNRgXx6YOmsQBt0ky4qXN3FVBtMMJg+/bJDOHbRSLH
         NEXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787564212; x=1788169012;
        h=subject:cc:to:from:content-transfer-encoding:mime-version
         :content-type:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=266O6m6eJxsQvGjnmo10s8GQM4uX90RxFsT1KZ4LNUg=;
        b=VaCyKpbfTlFTmt5FEfIuk2QPSUVdGlBTREzquCyfxkmFHi3mL7CzBbXKxv+TVmwBlk
         jMeNF5a1vXqIjEBqspC2CKtk9scnugTz90OmjPaZ/TiqeAE2a7Regl+w0jjG/IOQBGLt
         zXmhnyXB4RKIc2YcxRiX01IFwJKeDBxWnab4qfapoPteoCiP0eQ1lQdsOE09ijiuJShy
         izFq1I12KJIEktp7FwBpwW7s6S6Xp6sS7m9Cd2WKkxRmOUNYPDj1Fw0eGfLGYI/rcgEl
         W3fl8O2WXF8Ndu1oT6dnJAVnOVWpn/FFxHt6SDz2+OSx0oeY23SI8lUJyUHM6Us9GOMC
         zdYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrc+IwjqPQL4k781/q+96nNM/EOSP7UJZ0L0ops8pxKki+YagFXVtjOjc1wgfRm2LbQaW4=@lists.linux.dev
X-Gm-Message-State: AFuF++nxADFTe8CaNFSSLCBWmAOP8g0mh359RI/sUAxk6IvVr8Z2qA4r
	vZyhQO3vC+podwWF+EsfHxNu9OEhTFSoQpp/L9K3qiSp1Ur+EvnzKzEt
X-Gm-Gg: AR+sD12rIRenq+KeUtLKWrSlddBas+fxEUBK5NLzJxOqqBwXCpexO1JAdMjAppleSYj
	nqMYqPmD5wxOgMYO+yagDGqfY17FT8MhqoXdOpgZcPEZNU+sMAJiWy14O+IyNFdVPNPHPhggoKr
	/hTrd5+XWbCgGiSamMTK/P2qfslJA+n6YPyf6dGhsGq/qIDcTQ7bzQBpks+DJkOd//W0K9oRAq4
	802w40aBV4v5Jfpjf9T0DY/kq6LoBQ7ROUosOHp7JS5wuHO/cJ3fU+0dBz944NyJ7CvIwmhUHmM
	sF7f8WN1q7JcYxAqrnM321shChQ6UEzGy33594n5feycSM14CtUsRJHo4lMscpp+9gggzLNYN7v
	DqV6a3kkO5injvhbfbSly8qJNpKqTtf+YTDzxsd5cY3zoD0wgzBz8rmMYr6Qpq9WvMsXlLF2u/b
	IvP6nYoF+8gPF3anoox3JPR2F4s9QwFeJUc0Cm7yd2H2ZQ6k3iMCIdylzdDb6t3gUj+Mtca7kMJ
	ekq9/dZN0YLG3hfQ72Jygp3
X-Received: by 2002:a05:6a00:7598:b0:852:355b:2430 with SMTP id d2e1a72fcca58-852355b5f02mr1599452b3a.10.1787564212359;
        Mon, 24 Aug 2026 02:36:52 -0700 (PDT)
Received: from [127.0.1.1] ([115.110.137.22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520ef2ffdcsm1793806b3a.25.2026.08.24.02.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 02:36:51 -0700 (PDT)
Message-ID: <6a8c10b3.c4e4d4f0.1baf6a.6667@mx.google.com>
Date: Mon, 24 Aug 2026 02:36:51 -0700 (PDT)
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
Cc: pengfei.li_1@nxp.com, ping.bai@nxp.com, imx@lists.linux.dev
Subject: [PATCH] soc: imx: imx93_lpm: return -EPROBE_DEFER when SE firmware

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
Y29tPgotLS0KIGRyaXZlcnMvc29jL2lteC9pbXg5M19scG0uYyB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c29jL2lteC9pbXg5M19scG0uYyBiL2RyaXZlcnMvc29jL2lteC9pbXg5M19scG0uYwppbmRleCBi
ZmE1MmZmOGYuLjI2ZDcyZTNlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zb2MvaW14L2lteDkzX2xw
bS5jCisrKyBiL2RyaXZlcnMvc29jL2lteC9pbXg5M19scG0uYwpAQCAtNjIxLDcgKzYyMSw3IEBA
IHN0YXRpYyBpbnQgaW14OTNfbHBtX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYp
CiAJc2VfZGF0YSA9IGlteF9nZXRfc2VfZGF0YV9pbmZvKFNPQ19JRF9PRl9JTVg5MywgMCk7CiAJ
aWYgKCFzZV9kYXRhKSB7CiAJCWRldl9lcnIoJnBkZXYtPmRldiwgImdldCBzZS1mdzIgZmFpbGVk
XG4iKTsKLQkJcmV0dXJuIC1FTk9ERVY7CisJCXJldHVybiAtRVBST0JFX0RFRkVSOwogCX0KIAog
CS8qCi0tIAoyLjM0LjE=
