Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792551377;
	b=BIzxa/MdHBqfjNGwQ3pOVLbSaK9o51ZUiptCdJo+Nol4BMWVGxr1HZXHT3rl+tq7ebAa
	 e8yi87jQMjGwLqPew6d3Gx56kaIogweRrmCFMIxH9OZW2h19ShhWnejhomgf+musn9MoD
	 X/etzRLBNiv9P25ryeaVNcrVQKYDTKQ6waG9XsHwd1x9ocsfxsGSygPUbf7UskRyM61v+
	 +iOt8EK554jHFtZc5MRL1zeC36Q3TxcHMaVlUDQKngmfNHzhu+ZC3m+Qcalb3AlCQRnIN
	 lTq1ywo1ik/mWE2/5MPfDmz3jkDxyVkhX2lD5+9gaMK5Xe4xo0o6nGvm5RT8OvsR3Xg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792551377;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Reply-To:Message-ID:Subject:X-Mailer:MIME-Version:
	 x-aliyun-im-through:References:x-aliyun-mail-creator:In-Reply-To:
	 x-aliyun-mailtrack:Content-Type:Content-Transfer-Encoding;
	bh=n9IvG6ZNVoRM14WzDzU98rApiHDIq7Vd04j5qrcBvQQ=;
	b=rctVtMcV0A8v9XN3DLiqIutntkKiqkHJ8IfWSSKfkADy8gQHn0kwuk35Ft5QIDpGvv0U
	 a8MoNHN9vJKarKmqFjwsIIy9tYohVfqInjFpMzgfqEQ10h6TJsi320RsiBFzHRR1E+vpe
	 TYy4C07LEbJNNVgGkQJpIAM8kSQg29NKnpeSk3VnmAWotddNTPBvKAhTYGB+gbeTOWI2o
	 kFFS92zMxXIglN8flPJSHsEMhQiM8jxWbvCqUmR2Kqlj1koUqgyF0Ys0tXrojd/8g1ZU8
	 w83A87NhXWLdBPmuJ4dC2ZU+BIkubxo/lCKtVhY/UIDdJPxWZUgOyFLcycPGrj+6tQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=WQC1Kr08;
	arc=none smtp.remote-ip=115.124.28.124
Received: from out28-124.mail.aliyun.com (out28-124.mail.aliyun.com [115.124.28.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357DB606A31B
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 02:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 357DB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=WQC1Kr08
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1792551373; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
	bh=n9IvG6ZNVoRM14WzDzU98rApiHDIq7Vd04j5qrcBvQQ=;
	b=WQC1Kr08FPYLx5P6BPsn3E7bt9GY6qUXeE5DbwgEQxZIzGjIKN2opxFhA2MOPQxsxqNuBaDIGaPxVmCeU6kMpBj0HFjL3WhQ386WDlnHM/HzK3HzWDk1/me+gUMIKiYQ/K04Vz3gBbG+wqgTV6onVJ41nuXXzoKRIkJGiu3QV3//aglTe0piKNsQH+3xjMnTUlp1nsx2Z8GB5XmkpwDRBGW3pWdIIVv4LYIG/NUJ9bVAehEeFIApaFsgrZqaEubyBsEIg1FKAOT8l9tW6bKNusTC4A2y89yIdc0KQ1klQ1jFVZRaOx92iqnd3GoUuKcazphwahF42dIJUKHWnS/6mw==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07634366|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.0317878-0.00315602-0.965056;FP=14038809920320863036|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045099153;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DW;RN=9;RT=9;SR=0;TI=W4_0.2.3_2147711B_1792551347394_o7001c65d;
Received: from WS-web (chunyuzhiqiang@yinhe.ht[W4_0.2.3_2147711B_1792551347394_o7001c65d] cluster:ay29) at Wed, 21 Oct 2026 10:56:13 +0800
Date: Wed, 21 Oct 2026 10:56:13 +0800
From: "=?UTF-8?B?5rez5LqO5pm65by6?=" <chunyuzhiqiang@yinhe.ht>
To: "netdev-bot+sinfo" <netdev-bot+sinfo@kernel.org>
Cc: "netdev" <netdev@vger.kernel.org>,
  "linux-can" <linux-can@vger.kernel.org>,
  "mkl" <mkl@pengutronix.de>,
  "kernel" <kernel@pengutronix.de>,
  "haibo.chen" <haibo.chen@oss.nxp.com>,
  "shawnguo" <shawnguo@kernel.org>,
  "imx" <imx@lists.linux.dev>,
  "stable" <stable@vger.kernel.org>
Reply-To: "=?UTF-8?B?5rez5LqO5pm65by6?=" <chunyuzhiqiang@yinhe.ht>
Message-ID: <200e94e2-d3af-498f-8ff9-f35460ad3160.chunyuzhiqiang@yinhe.ht>
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
References: <20261021023334.11803-1-chunyuzhiqiang@yinhe.ht>,<179255037136.3290.7793994198845677922@kernel.org>
x-aliyun-mail-creator: W4_0.2.3_null_QuNTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYgZGluZ3RhbGstd2luLzEuMC4wIG53KDAuMTQuNykgRGluZ1RhbGsoOC4xLjAtUmVsZWFzZS42MDIxMTAxKSBNb2pvLzEuMC4wIE5hdGl2ZSBBcHBUeXBlKHJlbGVhc2UpIENoYW5uZWwvMjAyMTAwIChMaW51eDYuMTIuMTAwK2RlYjEzLWFtZDY0OC4xLjAtUmVsZWFzZS42MDIxMTAxKQ==uM
In-Reply-To: <179255037136.3290.7793994198845677922@kernel.org>
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGksCgo+IC0gSG93IHRoZSBpc3N1ZSB3YXMgZGlzY292ZXJlZCwgZS5nLiBoaXQgaW4gcHJvZHVj
dGlvbiwgaGl0IGR1cmluZwo+ICAgZGV2ZWxvcG1lbnQsIHN5emJvdCByZXBvcnQsIG1hbnVhbCBj
b2RlIGluc3BlY3Rpb24sIExMTSBvciBzdGF0aWMKPiAgIGFuYWx5c2lzIHRvb2wgc2Nhbi4KPgo+
IC0gV2hldGhlciB0aGUgaXNzdWUgd2FzIGFjdHVhbGx5IHRyaWdnZXJlZCwgb3IgaXMgb25seSB0
aGVvcmV0aWNhbAo+ICAgKGUuZy4gZm91bmQgYnkgY29kZSBpbnNwZWN0aW9uKS4gSWYgaXQgd2Fz
IHRyaWdnZXJlZCBwbGVhc2UgaW5jbHVkZQo+ICAgdGhlIHN5bXB0b21zLCBsaWtlIHRoZSBzdGFj
ayB0cmFjZSBvciBlcnJvciBtZXNzYWdlcy4KClRoZSBiZXJyLWNvdW50ZXIgaXNzdWUgd2FzIGFj
dHVhbGx5IHRyaWdnZXJlZCBvbiBhbiBpLk1YOFFYUCBib2FyZApkdXJpbmcgZGV2ZWxvcG1lbnQu
IEl0IHJlcHJvZHVjZXMgYnkgc2ltcGx5IHJ1bm5pbmcgImlwIGxpbmsgc2hvdyIKd2l0aG91dCBl
dmVyIGJyaW5naW5nIHRoZSBDQU4gaW50ZXJmYWNlIHVwOgoKICAgIEludGVybmFsIGVycm9yOiBz
eW5jaHJvbm91cyBleHRlcm5hbCBhYm9ydDogMDAwMDAwMDA5NjAwMDIxMCBbIzFdIFBSRUVNUFQg
U01QCiAgICBwYyA6IGZsZXhjYW5fcmVhZF9sZSsweDAvMHgxOAogICAgbHIgOiBmbGV4Y2FuX2dl
dF9iZXJyX2NvdW50ZXIrMHg0Yy8weDhjCiAgICBDYWxsIHRyYWNlOgogICAgIGZsZXhjYW5fcmVh
ZF9sZSsweDAvMHgxOAogICAgIGZsZXhjYW5fZ2V0X2JlcnJfY291bnRlcisweDRjLzB4OGMKICAg
ICBjYW5fZmlsbF9pbmZvKzB4MWY4LzB4NDM0CiAgICAgcnRubF9maWxsX2lmaW5mbysweDhmYy8w
eGJiNAogICAgIHJ0bmxfZHVtcF9pZmluZm8rMHgzNjQvMHg0NDgKClRoZSByb290IGNhdXNlIGlz
IHBsYXRmb3JtLXNwZWNpZmljOiBvbiBpLk1YOFFYUCB0aGUgQ0FOIGNsb2NrcyBhcmUKZ2F0ZWQg
dGhyb3VnaCB0aGUgU0NVIExQQ0cgYW5kIHRoZSBzdWJzeXN0ZW0gc2hhcmVzIHRoZSBJTVhfU0Nf
Ul9DQU5fMApwb3dlciBkb21haW4uIGZsZXhjYW5fcnVudGltZV9yZXN1bWUoKSBvbmx5IGNhbGxz
IGZsZXhjYW5fY2xrc19lbmFibGUoKTsKdGhlcmUgaXMgYSB3aW5kb3cgd2hlcmUgcG1fcnVudGlt
ZV9yZXN1bWVfYW5kX2dldCgpIGhhcyByZXR1cm5lZCBidXQgdGhlCmNsb2NrIGhhcyBub3QgYWN0
dWFsbHkgcmVhY2hlZCB0aGUgbW9kdWxlIHlldCwgYW5kIHRoZSBpbW1lZGlhdGUgRUNSCnJlYWQg
aW4gdGhhdCB3aW5kb3cgaGl0cyBhbiB1bi1jbG9ja2VkIHRhcmdldCBhbmQgcmFpc2VzIHRoZSBl
eHRlcm5hbAphYm9ydC4gVGhpcyBpcyB0aGUgc2FtZSBjbGFzcyBvZiBwcm9ibGVtIHRoYXQgd2Fz
IGFscmVhZHkgZml4ZWQgZm9yCm1fY2FuIGluIGNvbW1pdCA5MWE1NWM3MmE4MjFkICgiY2FuOiBt
X2NhbjogbV9jYW5fZ2V0X2JlcnJfY291bnRlcigpOgpkb24ndCB3YWtlIHVwIGNvbnRyb2xsZXIg
aWYgaW50ZXJmYWNlIGlzIGRvd24iKS4KClRoZSBUREMgYXV0byByZWFkYmFjayBwYXJ0IHdhcyBw
b2ludGVkIG91dCBieSB0aGUgU2FzaGlrbyBBSSByZXZpZXcgb2YKdGhpcyBzZXJpZXMuIEl0IGlz
IGJhc2VkIG9uIGNvZGUgaW5zcGVjdGlvbiBvZiBjYW5fdGRjX2ZpbGxfaW5mbygpIGFuZAp4Y2Fu
X2dldF9hdXRvX3RkY3YoKSwgd2hpY2ggcmVhZHMgWENBTl9TUiB3aXRob3V0IHRha2luZyBhIHJ1
bnRpbWUgUE0KcmVmZXJlbmNlLiBJIGhhdmUgbm90IHRyaWdnZXJlZCB0aGF0IHBhdGggb24gaGFy
ZHdhcmUsIHNvIG5vIHN0YWNrIHRyYWNlCmlzIGF2YWlsYWJsZSBmb3IgaXQ7IHRoZSBwYXRjaCBn
YXRlcyBpdCBhcyBhIHByZWNhdXRpb24uCgpUZXN0ZWQgb24gaS5NWDhRWFA6IGFmdGVyIHRoZSBw
YXRjaCwgImlwIGxpbmsgc2hvdyIgbm8gbG9uZ2VyIHRyaWdnZXJzCnRoZSBhYm9ydC4KClRoYW5r
cywKQ2h1bll1WmhpUWlhbmcK
