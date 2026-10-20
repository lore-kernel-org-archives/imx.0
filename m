Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792487659;
	b=QeOw7BvHW8PaJ/jJLwQx5xgmbsFZSr5Mu52DkJ6f1fsejdYagRxzFCLPWx1DeiIcjYEE
	 g6NcNesPgZKoREAS3Awt1wPze0fxzGl7GaO9fZ8+qZPjsP2KazcjCXRK21ySEnDyO9559
	 gSaftbJ+wjHHbLZAZd0sjlQKb5S/TnzHeVDUo5ZMASWKkJY862mYjcpRl1TXSWp2/er9x
	 aka8o03Nz//gZQS05l7jrKQrhNrTEDIXeOX1KQwhhGvafptXTejDVV9anEB7VGO3gVKHs
	 L7by2lluMRvYdpG+0Q5jrS4C8y1sni0YD8aC+Xa3KBRivN1q1GMGDLzpxuDcm6ZBw/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792487659;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Reply-To:Message-ID:Subject:X-Mailer:MIME-Version:
	 x-aliyun-im-through:References:x-aliyun-mail-creator:In-Reply-To:
	 x-aliyun-mailtrack:Content-Type:Content-Transfer-Encoding;
	bh=fJssb/JemlsZHxSdI31pU9LtOV8CRFz+KtmHHMh8J48=;
	b=T9WdZ0BAAbf5dVvQmvQgtPXMQ33mqB9UA5JzSZUg1Hagh2y4S/wTB8vSkLnLynOYa6Xa
	 8M3A9H1lZcUopm58xU0VtWb0DHJ/xdm5Y8127dnBDWZKsanvxXuLmujcDJAaqZmqveWGG
	 qxf1+nxFCkwH4K6aHqiSNV29dzMGlbi0/eTya1hdtoCfFRPCiYAZc1nuPA1tSfkXDRirI
	 g+GpmuBt2jtDCVgXVKNFRCetwWu6CVxarJ2eYI2+kpFCaW8nCIwS6GT2znFhQZBjWGgSB
	 GJYDmUmdAUvmhiHmi0qNx9UlhUidc2gXk0CSGIX31PU6boqvCuRG3uVFk5Q5depICaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=W5dI1uEQ;
	arc=none smtp.remote-ip=115.124.28.124
Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F033606A326
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 09:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F033606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=W5dI1uEQ
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1792487647; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
	bh=fJssb/JemlsZHxSdI31pU9LtOV8CRFz+KtmHHMh8J48=;
	b=W5dI1uEQRRJzNXa5pj7JA2jznVHEXyF/txbFizA/f/VLY940yNdAr+sNj0wDxIi14V3bDhZU4Ta/fiMoB8nC40wuYJK0WrWM+mCIKUdeKMO47R2okHYHDm9sQiKBWbtRdGAH8WXUP+Htj197nUcdhc8U50iNpldFAzW7aQJObzzGe20zfTf9DeVB3zBtIUPg5H9UXzgr1CzVbMf0MWxUtOwUKgLHYL7yd56Al/b0l2iGOJnSmGnQstH+gzSHmAG7tCM6qTk2Nje3DrQEqhB9z5kcFPwSO2GNa5+C1KrK5bPO5/UGJRfUjnnpN4XyDypSCiMPfukbiHhfv47qgqjzQg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.3885555|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.261227-0.00109014-0.737683;FP=2599619405778432795|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam011083032240;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DW;RN=9;RT=9;SR=0;TI=W4_0.2.3_2125168E_1792487647042_o7001c537;
Received: from WS-web (chunyuzhiqiang@yinhe.ht[W4_0.2.3_2125168E_1792487647042_o7001c537] cluster:ay29) at Tue, 20 Oct 2026 17:14:07 +0800
Date: Tue, 20 Oct 2026 17:14:07 +0800
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
Message-ID: <ac8ad731-c77d-4088-aeb7-b7e472cdbf0d.chunyuzhiqiang@yinhe.ht>
Subject: =?UTF-8?B?UkXvvJpbUEFUQ0ggdjVdIGNhbjogZGV2OiBjYW5fZmlsbF9pbmZvKCk6IGRvbid0IHdha2Ug?=
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
References: <20261018101744.93657-1-chunyuzhiqiang@yinhe.ht> <20261020075340.417899-1-chunyuzhiqiang@yinhe.ht>,<20261020-purring-cute-ocelot-54ef8b-mkl@pengutronix.de>
x-aliyun-mail-creator: W4_0.2.3_null_QuNTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYgZGluZ3RhbGstd2luLzEuMC4wIG53KDAuMTQuNykgRGluZ1RhbGsoOC4xLjAtUmVsZWFzZS42MDIxMTAxKSBNb2pvLzEuMC4wIE5hdGl2ZSBBcHBUeXBlKHJlbGVhc2UpIENoYW5uZWwvMjAyMTAwIChMaW51eDYuMTIuMTAwK2RlYjEzLWFtZDY0OC4xLjAtUmVsZWFzZS42MDIxMTAxKQ==uM
In-Reply-To: <20261020-purring-cute-ocelot-54ef8b-mkl@pengutronix.de>
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgTWFyYyw+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiBJbiB0aGUgZnV0dXJlLCBwbGVhc2UgZG9u
J3Qgc2VuZCB2TisxIGFzIGEgcmVwbHkKPiB0byB2Ti4KVW5kZXJzdG9vZCwgdGhhbmtzIGZvciB0
aGUgcmVtaW5kZXIuIEknbGwgcG9zdCBmdXR1cmUgdmVyc2lvbnMgYXMgYSBuZXcsCmluZGVwZW5k
ZW50IHRocmVhZC4KVGhhbmtzLApDaHVuWXVaaGlRaWFuZwo=
