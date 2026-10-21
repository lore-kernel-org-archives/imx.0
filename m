Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571748;
	b=3con96yWjF8yW9JEQjhm6U3pYnlHQ+4BjBU6utEZDJfQj1OYOzK7AmvZ9+2rcZkNk0Oi
	 o1armQ7jX+saYF7zfJO2iEJYkCpoYAT6baao7gKsaALiA92fWEHn8d7pGbs2bZw4V1ON1
	 hlRo8jAv7F+wc7QzoK8p1cBJTBt9fAi3J/WPY1gZtkZjpwEG52tZ+cFRq8IwM8TA01t3s
	 tNsrkOGrlOjsaK46vMIDWlR6mLyt7zxOAblDPU472PJ/ijGk7QnPAUXtEF4HeBGtSRSRD
	 8XZ5KDX1s2kOWjj8MNzzePnIfrtsWxa9YjnZfhwDasqH07sn+utLhJDMDnx18NqHEqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571748;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Reply-To:Message-ID:Subject:X-Mailer:MIME-Version:
	 x-aliyun-im-through:References:x-aliyun-mail-creator:In-Reply-To:
	 x-aliyun-mailtrack:Content-Type:Content-Transfer-Encoding;
	bh=ZfD+QNSEHOqBJMRc5WwYyDAHY1RXmea/f6ETko4qoEg=;
	b=jKAtokTzYpICBUnHfHFC3zFFyFE3P6csrZQx8oX6o/yHssJQYamj6M81bDqOGXmQiCrm
	 HvcugltrK9qkzYXgDwoiDDflAaNFPCam2tP3hd1CIMrJ3Pl0A0YINBWocpC9TGNOK8avj
	 xQOpFcNRiBEg6J4Wx64rvRo3Y30Sg8/sldLS5CbmSPb3mTcBw7WX0es3Ukk+9YnkboYtX
	 +LAcDgcTq/jzklW8SgnaOlDO1jRBoorHaYWsNWhz8kRBrnZlSfUhZz+iEf7xZ038d1ESH
	 6fzoVXjf4rKlbI6quptw+rzzNms2b6NxtaQy2ArTjfytFp7GrFcd/W1NfIWBIgn6+4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=Hi0urQWf;
	arc=none smtp.remote-ip=115.124.28.52
Received: from out28-52.mail.aliyun.com (out28-52.mail.aliyun.com [115.124.28.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C953606A31E
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 08:35:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C953606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=Hi0urQWf
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1792571743; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
	bh=ZfD+QNSEHOqBJMRc5WwYyDAHY1RXmea/f6ETko4qoEg=;
	b=Hi0urQWfC2OLDP6rsNz+h73DjOd9ztZRvPWdT2mWSi5diwo/GbH2OR+5thRVdWQD3HHLoh7wFlwvYF/pqd2bkJj9t6qVyMdSC1D3akHuDFnBuiplAQPI3ICvlcL4oNAVVBGFJ4CFRVByxbH58Cky3qBOcJbZJxDUFE3Bb8AhBMe7+xXQ0mLHls8fMZrZ6Nx2M3y0LZ9iqpgbCd259flsCWq0yapqOngkupbQqdH/5nv7y2wlqmJ3N67pvIqM+pGJWAqcVSd3m3cPJg6PXL8lbp9Is/faAdd77yC4nPkCtRksb7eezRR3uuwERzO79DnFPL6Df7pb9uVPIt9HO5IOyg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.4604281|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.356285-0.00274064-0.640975;FP=8427287706681930363|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045038069;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DW;RN=9;RT=9;SR=0;TI=W4_0.2.3_21448169_1792571743001_o7001c67e;
Received: from WS-web (chunyuzhiqiang@yinhe.ht[W4_0.2.3_21448169_1792571743001_o7001c67e] cluster:ay29) at Wed, 21 Oct 2026 16:35:43 +0800
Date: Wed, 21 Oct 2026 16:35:43 +0800
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
Message-ID: <b85d4cbb-8197-4b0c-a547-a2630a68b271.chunyuzhiqiang@yinhe.ht>
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
References: <20261021023334.11803-1-chunyuzhiqiang@yinhe.ht> <20261021-romantic-jaybird-of-cookies-1ed8e1-mkl@pengutronix.de> <b9c8e7d7-584e-43d0-88a6-ee0ee6e6c700.chunyuzhiqiang@yinhe.ht>,<20261021-robust-electric-beaver-796542-mkl@pengutronix.de>
x-aliyun-mail-creator: W4_0.2.3_null_QuNTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYgZGluZ3RhbGstd2luLzEuMC4wIG53KDAuMTQuNykgRGluZ1RhbGsoOC4xLjAtUmVsZWFzZS42MDIxMTAxKSBNb2pvLzEuMC4wIE5hdGl2ZSBBcHBUeXBlKHJlbGVhc2UpIENoYW5uZWwvMjAyMTAwIChMaW51eDYuMTIuMTAwK2RlYjEzLWFtZDY0OC4xLjAtUmVsZWFzZS42MDIxMTAxKQ==uM
In-Reply-To: <20261021-robust-electric-beaver-796542-mkl@pengutronix.de>
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgTWFyYywKCj4gVGhhbmtzLCBBcyB5b3UncmUgY29udHJpYnV0aW5nIHJlZ3VsYXJseSwgdXNp
bmcgYjQgWzFdIGNhbiBzYWZlIHlvdSBhbmQgdGhlCj4gbWFpbnRhaW5lcnMgYSBsb3Qgb2YgdGlt
ZS4KPgo+IFsxXSBodHRwczovL2I0LmRvY3Mua2VybmVsLm9yZy9lbi9sYXRlc3QvaW5kZXguaHRt
bAoKVGhhbmtzIGZvciB0aGUgcG9pbnRlci4gSSdsbCBzdGFydCB1c2luZyBiNCBmb3IgdGhlIHY3
IHJlc3BpbiBhbmQgZnV0dXJlCnNlcmllcy4KCkNodW5ZdVpoaVFpYW5n
