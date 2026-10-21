Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594721;
	b=jCIMJ16gjhcMT1dZzzy4lzl9z/atAfwXs8U9TY/eTkYyUvTxZyhu11GjmtMlire7cWF4
	 D4XJKScob2EvdG1ERk0Ib6wZg0Ai0eEg2gi8FrISGPhSZ9OOqC9XppAc0uyFiBAfrSOIm
	 a7W6bPwQsIPCe1jzLvce8DUDDpuxBTtEfy1I7jdfCTSC4dvJwmQQFcoG28mm8YWbVN+p8
	 R+nZlzBXSzaS6Q51pPk42bsgtWKqM265uZE/D86+23EbQLLlI2dAhm20Rh1iaCX3YogYg
	 bLfzaZQ8qgDmAFOFVWX5qlqcYLvVCNioKS0my3A9WZBIVrQS6OKv6GEjJd0EsEYklRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594721;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Reply-To:Message-ID:Subject:X-Mailer:MIME-Version:
	 x-aliyun-im-through:References:x-aliyun-mail-creator:In-Reply-To:
	 x-aliyun-mailtrack:Content-Type:Content-Transfer-Encoding;
	bh=C3dqHBo0uBLdePKBl5z0IlryPz8FCarlaELddSUrG/8=;
	b=sMwWABUEc0r7vpGWDdLX4G3TDJuNqcdjrzGUGKHmeWUuenJLcmDKEKx/4Z2Ls8qM5bK5
	 sZNZQBh9uLbvpLr7xyCxVcQ+zUfmbTKSCjv5p2Vg+V/pzJVgXHIkCwCcecWjizQwswJCv
	 oX944yEl00Povxbfven8tdXkgd8hKRcQp/IGqHDx7Pd/GxUcMduGr/uSlU/2gzRUHuxHR
	 AJHr6o+Ee8u5YJmgGo1Ji/us4cJX/XR+06lHYEQPYQOHFrGry5KTy+mBGZAFDKgTfXUaz
	 2gOUMXVa4CcCOb7idM5wMvJ6/v001DO9Ga2KYlPak2uDiPYh3HSKjIeG4FnmIvBBxuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=gRFSk3xP;
	arc=none smtp.remote-ip=115.124.28.1
Received: from out28-1.mail.aliyun.com (out28-1.mail.aliyun.com [115.124.28.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A2606A31B
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 14:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 336A2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=gRFSk3xP
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1792594713; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
	bh=C3dqHBo0uBLdePKBl5z0IlryPz8FCarlaELddSUrG/8=;
	b=gRFSk3xPdLSiRQ5K8fh/KdI412C+cR/41iwM+uVXiHrPShrebvb9uGrs8V5MOw9Pj5oPILraxWhzSARZadLgXRPMar28vF/GG+wDBDSJbWbngXvCaJ8mam1+LCvMZA1/yjpOnaVnu3iu1QoBxZnRPT5RYq5dUcUlFjT6yFGeoM1hlfhC8TkXlSH99dFTBd4U9PGJdRH0qJB+j+a1lCiiolsI/TLoF/XfyPLriKOmQAdzq6BCYbO91sdNjaY11a3HehuyznSUti1oYj1u6IQHBRRGrkmkEpsxk99097fYNNDoVyYtfHdFdbZWjsKVNW5zl8SG2K/1fR1mrKUhvVNy/g==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2023654|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0460745-0.0028953-0.95103;FP=6080588669665476379|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033025068124;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DW;RN=10;RT=10;SR=0;TI=W4_0.2.3_212DDFD4_1792594707797_o7001c76l;
Received: from WS-web (chunyuzhiqiang@yinhe.ht[W4_0.2.3_212DDFD4_1792594707797_o7001c76l] cluster:ay29) at Wed, 21 Oct 2026 22:58:28 +0800
Date: Wed, 21 Oct 2026 22:58:28 +0800
From: "=?UTF-8?B?5rez5LqO5pm65by6?=" <chunyuzhiqiang@yinhe.ht>
To: "Vincent Mailhol" <mailhol@kernel.org>
Cc: "netdev" <netdev@vger.kernel.org>,
  "linux-can" <linux-can@vger.kernel.org>,
  "mkl" <mkl@pengutronix.de>,
  "kernel" <kernel@pengutronix.de>,
  "haibo.chen" <haibo.chen@oss.nxp.com>,
  "shawnguo" <shawnguo@kernel.org>,
  "imx" <imx@lists.linux.dev>,
  "stable" <stable@vger.kernel.org>,
  "netdev-bot+sinfo" <netdev-bot+sinfo@kernel.org>
Reply-To: "=?UTF-8?B?5rez5LqO5pm65by6?=" <chunyuzhiqiang@yinhe.ht>
Message-ID: <bf1a39bf-f26a-47c0-8d52-5ceaf68adece.chunyuzhiqiang@yinhe.ht>
Subject: =?UTF-8?B?UkXvvJpbUEFUQ0ggdjZdIGNhbjogZGV2OiBjYW5fZmlsbF9pbmZvKCk6IGRvbid0IHdha2Ug?=
  =?UTF-8?B?dXAgY29udHJvbGxlciBpZiBpbnRlcmZhY2UgaXMgZG93bg==?=
X-Mailer: [Alimail-Mailagent revision 74][W4_0.2.3][null][Chrome]
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
x-aliyun-im-through: {"version":"v1.0"}
References: <20261021023334.11803-1-chunyuzhiqiang@yinhe.ht>,<4ef66cfe-9ff8-4d26-87de-48485e9d4fa3@kernel.org>
x-aliyun-mail-creator: W4_0.2.3_null_QuNTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYgZGluZ3RhbGstd2luLzEuMC4wIG53KDAuMTQuNykgRGluZ1RhbGsoOC4xLjAtUmVsZWFzZS42MDIxMTAxKSBNb2pvLzEuMC4wIE5hdGl2ZSBBcHBUeXBlKHJlbGVhc2UpIENoYW5uZWwvMjAyMTAwIChMaW51eDYuMTIuMTAwK2RlYjEzLWFtZDY0OC4xLjAtUmVsZWFzZS42MDIxMTAxKQ==uM
In-Reply-To: <4ef66cfe-9ff8-4d26-87de-48485e9d4fa3@kernel.org>
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgVmluY2VudCwKCj4gTml0cGljazogSSB0aGluayBpdCBpcyBzbGlnaHRseSBiZXR0ZXIgdG8g
cGFzcyBkZXYgcmF0aGVyIHRoYW4KPiBhdXRvX3RkY3ZfcnVubmluZzoKPiAuLi4KCnY3IGlzIG91
dCBhbmQgZm9sZHMgaW4geW91ciBzdWdnZXN0aW9uOiBjYW5fdGRjX2dldF9zaXplKCkgYW5kCmNh
bl9kYXRhX2JpdHRpbWluZ19nZXRfc2l6ZSgpIG5vdyB0YWtlIGRldiwgYW5kIHRoZSBURENWIHNp
emUgY29uZGl0aW9uCnVzZXMgbmV0aWZfcnVubmluZyhkZXYpIGRpcmVjdGx5LgoKTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtY2FuLzIwMjYxMDIxMTQ1MTE1LjE1MzEwNy0xLWNo
dW55dXpoaXFpYW5nQHlpbmhlLmh0LwoKU29ycnkgZm9yIG5vdCBDYydpbmcgeW91IG9uIHRoZSB2
NyBwb3N0aW5nLgoKVGhhbmtzLApDaHVuWXVaaGlRaWFuZw==
