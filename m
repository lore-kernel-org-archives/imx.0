Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792570829;
	b=XILbdDIgt/YkbLBw6/27a8SH2+Wb181ggvmBcfPAeJLrx4m057a/if7K1po96Fyyr8Ha
	 TIZYi0jK0Sa3Tg0TZahSJEsPEHq16Bgv6o81o3jiqlu8qxvwxXMMS+U6w99BBCFxsdMqC
	 T5+/HDL7i2zUsSbq11i5y+bcN3yygdBmdtjlOusEwdv9nd7Z+01kV8kHHHb5eaMW3aGu3
	 f0ekJi49MM+Y7BlfJeFYw0Z5AUls9ZnxQUMhc6KY29fqnnBVqOuW8a0BRyVwV6UMqBE7d
	 GIWGsV8OqHlS6mZdf+UfK6gOTxUnz/+EnkaKpVpIO8PhOfdDF22Rtb/wvivPQQh0U7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792570829;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Reply-To:Message-ID:Subject:X-Mailer:MIME-Version:
	 x-aliyun-im-through:References:x-aliyun-mail-creator:In-Reply-To:
	 x-aliyun-mailtrack:Content-Type:Content-Transfer-Encoding;
	bh=k3jO90/t7rUAy5fHS/qr0qaeifRa4w8OL7YEIqBBnkY=;
	b=S6K3PRIrFGRgQlCGRiVJpuR9xhFTteBQcZFED343bX+oPwv3yiLEMwf75UxV9h6CLtiB
	 9MKgtPQpmn8l1W5AGgQ9WrVb9VYxsq6EEobOuR7MswqPk9p82IIvHV9Z+74duLKG1+KDb
	 Xjt4ACrEJmyb/v8lihsJYsEOdbBSGRIGWl7v/MNqLCVDVhS6MpkWmGTMm7WmEJcMk4d5j
	 jgm8/prjLPXLfd1ZG04iZxNGcq+exFJhvSdbqhTZzCdnnJ0ku6ofdHqLl6brR8A0mBlH2
	 fqNEUL5Qr5dla1fSvCV841n76sGwOo3hjMBsxpBtA6q6g8KJLMXYgdXAY+7ye1Dsw2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=P+dd+xpP;
	arc=none smtp.remote-ip=115.124.28.73
Received: from out28-73.mail.aliyun.com (out28-73.mail.aliyun.com [115.124.28.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 078BC606A319
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 08:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 078BC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=P+dd+xpP
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1792570819; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
	bh=k3jO90/t7rUAy5fHS/qr0qaeifRa4w8OL7YEIqBBnkY=;
	b=P+dd+xpPyo1GUr6fQFsTD3tQHHDX6DcLEp8FCUdhlmBrNBqfPDxcbW4IgurIwxHT8U4bq4fhqAB9HcxYvgeGH1t1I+9bjsICdfe55cXmvUBZKugQn83iPw7ySa47JLKhtR//KGFotZs8exx1QrWLix41CVaRE3TGMliFPj5xYueEE9Kn73nPyCg+CjjNMFpYuH+viYv+ZDFXsPcBSn7OMkso7DuYSZoafAar9LoieyLdJLMBTXEhpkl/b2mfLnRMo+Rbp9K9cyy9iIARaC1w83J8wS9ldLLlUYF0AjXoFjrPjX3+JxsVx+XwMofYPh0HIKe/IQ4nUgESO/EBrwKPSg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1733126|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.18831-0.0007866-0.810903;FP=4662212511220153746|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033023087102;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DW;RN=9;RT=9;SR=0;TI=W4_0.2.3_212D3FFB_1792570818570_o7001c959;
Received: from WS-web (chunyuzhiqiang@yinhe.ht[W4_0.2.3_212D3FFB_1792570818570_o7001c959] cluster:ay29) at Wed, 21 Oct 2026 16:20:18 +0800
Date: Wed, 21 Oct 2026 16:20:18 +0800
From: "=?UTF-8?B?5rez5LqO5pm65by6?=" <chunyuzhiqiang@yinhe.ht>
To: "Marc Kleine-Budde" <mkl@pengutronix.de>
Cc: "netdev-bot+sinfo" <netdev-bot+sinfo@kernel.org>,
  "netdev" <netdev@vger.kernel.org>,
  "linux-can" <linux-can@vger.kernel.org>,
  "kernel" <kernel@pengutronix.de>,
  "haibo.chen" <haibo.chen@oss.nxp.com>,
  "shawnguo" <shawnguo@kernel.org>,
  "imx" <imx@lists.linux.dev>,
  "stable" <stable@vger.kernel.org>
Reply-To: "=?UTF-8?B?5rez5LqO5pm65by6?=" <chunyuzhiqiang@yinhe.ht>
Message-ID: <b9c8e7d7-584e-43d0-88a6-ee0ee6e6c700.chunyuzhiqiang@yinhe.ht>
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
References: <20261021023334.11803-1-chunyuzhiqiang@yinhe.ht>,<20261021-romantic-jaybird-of-cookies-1ed8e1-mkl@pengutronix.de>
x-aliyun-mail-creator: W4_0.2.3_null_QuNTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYgZGluZ3RhbGstd2luLzEuMC4wIG53KDAuMTQuNykgRGluZ1RhbGsoOC4xLjAtUmVsZWFzZS42MDIxMTAxKSBNb2pvLzEuMC4wIE5hdGl2ZSBBcHBUeXBlKHJlbGVhc2UpIENoYW5uZWwvMjAyMTAwIChMaW51eDYuMTIuMTAwK2RlYjEzLWFtZDY0OC4xLjAtUmVsZWFzZS42MDIxMTAxKQ==uM
In-Reply-To: <20261021-romantic-jaybird-of-cookies-1ed8e1-mkl@pengutronix.de>
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgTWFyYywKCj4gVGhpcyBwYXRjaCBkb2Vzbid0IGFwcGx5IHRvIGN1cnJlbnQgbmV0LW5leHQv
bWFpbiBicmFuY2guIFBsZWFzZSByZWJhc2UsCj4gaW4gcGFydGljdWxhciB5b3UncmUgbWlzc2lu
ZyBjb21taXQgZTYzMjgxNjE0NzQ3ICgiY2FuOiBuZXRsaW5rOiBhZGQKPiBpbml0aWFsIENBTiBY
TCBzdXBwb3J0IikuCgpVbmRlcnN0b29kLCB2NiB3YXMgYmFzZWQgb24gYW4gTlhQIGxmLTYuMTgu
eSB0cmVlLiBJJ2xsIHJlYmFzZSBvbnRvCmN1cnJlbnQgbmV0LW5leHQvbWFpbiwgaW5jbHVkaW5n
IGU2MzI4MTYxNDc0NywgYW5kIHJld29yayB0aGUgcGF0Y2ggc28KdGhhdCBib3RoIElGTEFfQ0FO
X1REQyBhbmQgSUZMQV9DQU5fWExfVERDIG9ubHkgc2tpcCB0aGUgYXV0b21hdGljIFREQ1YKcmVh
ZGJhY2sgd2hlbiB0aGUgaW50ZXJmYWNlIGlzIGRvd24uIFRoZSBzaXplIGNhbGN1bGF0aW9uIHdp
bGwgYmUKYWRqdXN0ZWQgZm9yIGJvdGggcGF0aHMgYXMgd2VsbC4KCkknbGwgc2VuZCB2NyBhcyBh
IG5ldywgaW5kZXBlbmRlbnQgdGhyZWFkLgoKVGhhbmtzLApDaHVuWXVaaGlRaWFuZw==
