Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792583441;
	b=p0/2pLQv2XgEfm+36If0FXsm4S4cbDgn7lZ5c2U5fzXWR11IlKd4Uzwd1EMsjWMmNvjC
	 iQ4dYYGBuG58tE/3PJZUBGSKFupXLKELbc+9d40muXQ6gTyhK2n5ENFcX4DV9mUYMcu3L
	 dzq0LXgLdfGPVeoC/id/E5FFBRLG5Ba1IQWZdafLcRx5MJIDXJGTVbfeLDiMABfgJi1PV
	 V+PzwLXdL8H3kwKFrwEK++gfrSeh83plbUS2pmyM428iTCWVrRq22q2F394hdc5zDKfos
	 HNVqk/RLeUuv1xtwSH/5xtDNDEp49A+tzIqmBiboFVjm4QGFCPzFmGT/hCnq7aRJcKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792583441;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Reply-To:Message-ID:Subject:X-Mailer:MIME-Version:
	 x-aliyun-im-through:References:x-aliyun-mail-creator:In-Reply-To:
	 x-aliyun-mailtrack:Content-Type:Content-Transfer-Encoding;
	bh=72FzsWQIjcY8v6oyt0wQCHWqJMzFBXUTwABFBwus7wg=;
	b=EtLZsHxNoMk9vU5D9YyXxMsatqVuEi2NJbn+XQK3B+qbazkiv5QhYVrWKD7LCxN7V52V
	 eECyH7FqXBlpt9U0oPASnVOd6j6tY/fS7QXJD/lVa7M7tP2W1VcuMPpqFMFnNFB1pVrQD
	 buubrV2/1JvXBla6ZiRmFj2YX0dPplRprdy9V/a9fejwLOuz3lNx1S6u5T/evhF1GZgrU
	 fjz+c4Owg8qNoPzzHpASt2xPuoa9bt2fBriTlHPG05IVD7YzYc5W8F9nGFAuZUB1qEfRc
	 Ja4U8dR9vPGC8hEKQzDx40CchAj5QH7PItaeYIiupwfD3wkiVmChlIrzBbBMjyYdW6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=bgMF+pv1;
	arc=none smtp.remote-ip=115.124.28.1
Received: from out28-1.mail.aliyun.com (out28-1.mail.aliyun.com [115.124.28.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88738606A322
	for <imx@lists.linux.dev>; Wed, 21 Oct 2026 11:50:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88738606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=bgMF+pv1
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1792583430; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
	bh=72FzsWQIjcY8v6oyt0wQCHWqJMzFBXUTwABFBwus7wg=;
	b=bgMF+pv1GPQkl57dOMNOU1b0VSwL7y9CH/rBzMKGrSHxkBGZwYxlinnM6ll+3RMILTphhZnY9W1xgD3ZejdNU71pmEr59SNzbMeMIAiSMBXIjKK87hnnTdEmh91TdDJ6JieHTXnkHhYbDN94hIcxGldWBgQ1JkJqWVNZONpYqfyTqhfROpFcWH+7+F5LvxI2RbLfj2OfbW9n/N+68XVwPfBQvbNEke4MjSg3rGxs5A25lxwyJxW7ecu+q5Aq3Ho/XOXBJ3DETM9QF9NVby7dNey2kDoSDtkO0KGokIuWvkrhMUN6wEvgG6OHkh5j2glfQLLDpU5/shgbfIO+dyxVfA==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.135073|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.0351905-0.00102775-0.963782;FP=2045342384072965914|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037034184;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DW;RN=10;RT=10;SR=0;TI=W4_0.2.3_21251643_1792583429724_o7001c188k;
Received: from WS-web (chunyuzhiqiang@yinhe.ht[W4_0.2.3_21251643_1792583429724_o7001c188k] cluster:ay29) at Wed, 21 Oct 2026 19:50:29 +0800
Date: Wed, 21 Oct 2026 19:50:29 +0800
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
Message-ID: <7860eacb-9b7f-41f9-9e60-d48fdee47d4f.chunyuzhiqiang@yinhe.ht>
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
cGFzcyBkZXYgcmF0aGVyIHRoYW4KPiBhdXRvX3RkY3ZfcnVubmluZzoKPgo+ICBzdGF0aWMgc2l6
ZV90IGNhbl90ZGNfZ2V0X3NpemUoY29uc3Qgc3RydWN0IG5ldF9kZXZpY2UgKmRldiwKPiAgICAg
ICAgICAgIHN0cnVjdCBkYXRhX2JpdHRpbWluZ19wYXJhbXMgKmRidF9wYXJhbXMsCj4gICAgICAg
ICAgICB1MzIgdGRjX2ZsYWdzKQo+Cj4gVGhlIHJlYXNvbiBpcyB0aGF0IGJ5IHBhc3NpbmcgZGV2
LCBpdCB3b3VsZCBiZSBlYXNpZXIgaW4gdGhlIGZ1dHVyZSBpZgo+IGZvciB3aGF0ZXZlciByZWFz
b24gd2UgbmVlZCB0byByZXRyaWV2ZSBvdGhlciB2YWx1ZXMuCgpBZ3JlZWQsIHRoYXQncyBjbGVh
bmVyIGFuZCBtb3JlIGNvbnNpc3RlbnQgd2l0aCB0aGUgcmVzdCBvZiB0aGUgZmlsZS4KSSdsbCBm
b2xkIHRoaXMgaW50byB2NzogY2FuX3RkY19nZXRfc2l6ZSgpIGFuZApjYW5fZGF0YV9iaXR0aW1p
bmdfZ2V0X3NpemUoKSB3aWxsIHRha2UgZGV2IGluc3RlYWQgb2YgYSBib29sLCBhbmQgdGhlClRE
Q1Ygc2l6ZSBjb25kaXRpb24gd2lsbCB1c2UgbmV0aWZfcnVubmluZyhkZXYpIGRpcmVjdGx5LgoK
VGhhbmtzLApDaHVuWXVaaGlRaWFuZw==
