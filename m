Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.123
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795839971;
	b=t4O1HDFHnqDu4SNUcnXOu3+nL7IRk+1XlqkMRKVXDPNBiUcuobBlY4RwAqa0E/hk9oQh
	 BU+mSM2lDTz7hmBj4Y079/bsTFrg+wK/uelWgRunk8xfWvD6VZ26EJRpR9UfYCuBAyPxp
	 k2epPa9SmCn3MxRKhhkGrO9/ObsJiLR5QzUQu/iAGGmbh4GUj77ercdKcikbEY0sXGsa1
	 hXmXgbACYxPmlVv9yhcskhWzifEVGyxhJColU9CUD+zWpuh9oVhFYMRRg0rPsnmWpFZTC
	 od8Jtc5ziYE5JyfzpHNuisD+smYtlOGuqrlhpS8VTVJmv4yv8DyV9gh7wVQ635GuWyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795839971;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Reply-To:Message-ID:Subject:X-Mailer:MIME-Version:
	 x-aliyun-im-through:References:x-aliyun-mail-creator:In-Reply-To:
	 x-aliyun-mailtrack:Content-Type:Content-Transfer-Encoding;
	bh=seDpfiFwIkIrteeAPqLfNWT61SwXiBfS0CtbgMXECeQ=;
	b=QAWm+vLxZvREuzIIfROFaLcRmvoRltfc4OaofTlU0a6cqnQk9uO4XbKiphD/r/+N2lfi
	 XunHuzyWifctj12CT2jGBzkqJwSo+9WjMAGbiMYER2N8rrmHgJwOkegikPBOC/pKysERS
	 wkbxmykHSfSfma7vwAxeFE0UOTGBpVnMVm4TXoU/FZywUe6I04N8tWrx6FsnlcfmmmWTK
	 1bcihEMaf0u0VI0r4ACgYdhk/kxseuC17MBsbuOp37QUP4FDrQt0b9XM9q026GDMh4uSt
	 ZNk2VPBD0yeFYVDitjc2IQBA6t3d0jtDCPa3Yl2KK6/GB/UE38qFgYu2l+aRnSDkLYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=T5TvjbcW;
	arc=none smtp.remote-ip=115.124.28.123
Received: from out28-123.mail.aliyun.com (out28-123.mail.aliyun.com [115.124.28.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67091606A31E
	for <imx@lists.linux.dev>; Sat, 28 Nov 2026 04:26:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67091606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=T5TvjbcW
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1795839960; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
	bh=seDpfiFwIkIrteeAPqLfNWT61SwXiBfS0CtbgMXECeQ=;
	b=T5TvjbcWjqlphFDPksjz/MED2lPmJaqB8ZV2zGD+j3eKvIDukLQugoq01iSHeiCRnWw/roPd9y/5cTY8fKPt6IhuaAnxqR1m/99b6LIIwinh0qtPai3YgHJRbqymxLWYI3oDtWMo4WyDwVfT/yztZ5zolNB47U9ETeWYCtqFWSPV/hJ4GnnHaO1206UfdZaEVf0F5R3EPYtYszze2ccWJE7RnxbjAsszoVtjnZPdeNP/b55KSoOZbsnBBOoToVelclwKt3gSfcO+7qB7SbdzQnceTPj/0Js7rxDHQ5wvYnJpIm3J7LdGJGVq9UqKqmrDol9f0QqywcmYfTvSiNUbgw==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.07701244|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_enroll_verification|0.0130895-0.00187816-0.985032;FP=5547059909602362799|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033037071049;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DW;RN=6;RT=6;SR=0;TI=W4_0.2.3_21251695_1795839959175_o7001c134t;
Received: from WS-web (chunyuzhiqiang@yinhe.ht[W4_0.2.3_21251695_1795839959175_o7001c134t] cluster:ay29) at Sat, 28 Nov 2026 12:25:59 +0800
Date: Sat, 28 Nov 2026 12:25:59 +0800
From: "chunyuzhiqiang" <chunyuzhiqiang@yinhe.ht>
To: "=?UTF-8?B?SGVpa28gU3TDvGJuZXI=?=" <heiko@sntech.de>,
  "Mark Brown" <broonie@kernel.org>
Cc: "Frank Li" <Frank.Li@nxp.com>,
  "linux-spi" <linux-spi@vger.kernel.org>,
  "imx" <imx@lists.linux.dev>,
  "linux-kernel" <linux-kernel@vger.kernel.org>
Reply-To: "chunyuzhiqiang" <chunyuzhiqiang@yinhe.ht>
Message-ID: <6f4ba2f7-1a1e-412a-a469-7001d5508039.chunyuzhiqiang@yinhe.ht>
Subject: =?UTF-8?B?UkXvvJpbUkZDIFBBVENIIHYyIDEvMV0gc3BpOiBmc2wtbHBzcGk6IGFkZCBhdG9taWMgdHJh?=
  =?UTF-8?B?bnNmZXIgc3VwcG9ydA==?=
X-Mailer: [Alimail-Mailagent revision 6][W4_0.2.3][null][Chrome]
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
References: <20261127073454.351296-1-chunyuzhiqiang@yinhe.ht> <20261127073454.351296-2-chunyuzhiqiang@yinhe.ht>,<r1SUq7cwQAKEFTBObqhYYA@sntech.de>
x-aliyun-mail-creator: W4_0.2.3_null_QuNTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYgZGluZ3RhbGstd2luLzEuMC4wIG53KDAuMTQuNykgRGluZ1RhbGsoOC4xLjAtUmVsZWFzZS42MDIxMTAxKSBNb2pvLzEuMC4wIE5hdGl2ZSBBcHBUeXBlKHJlbGVhc2UpIENoYW5uZWwvMjAyMTAwIChMaW51eDYuMTIuMTAwK2RlYjEzLWFtZDY0OC4xLjAtUmVsZWFzZS42MDIxMTAxKQ==uM
In-Reply-To: <r1SUq7cwQAKEFTBObqhYYA@sntech.de>
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

CgpIaSBIZWlrbywKCgpZb3UncmUgcmlnaHQsIHRoYXQgc2VudGVuY2Ugd2FzIGEgbGVmdG92ZXIg
ZHJhZnRpbmcgYXJ0aWZhY3QgYW5kIHNob3VsZCBub3QKaGF2ZSBiZWVuIGluIHRoZSBjb21taXQg
bWVzc2FnZS4gSSd2ZSByZW1vdmVkIGl0OyB0aGUgY3VycmVudCBwYXRjaCBpcyB2NS4KCgpJIGRp
ZCByZXZpZXcgdGhlIGNvZGUgYW5kIHRoZSBmaW5hbCBwYXRjaC4gSXQgY29tcGlsZXMgb24geDg2
IGFuZCBhcm02NCwKYXBwbGllcyB0byBmb3ItbmV4dCwgYW5kIHRoZSBUQ1IvVERSIG9yZGVyaW5n
IG5vdyBtYXRjaGVzCmZzbF9scHNwaV93cml0ZV90eF9maWZvKCkuIEhhcmR3YXJlIHZhbGlkYXRp
b24gb24gaS5NWDhRWFAgaXMgc3RpbGwgcGVuZGluZy4KCgpUaGFua3MsCkNodW5ZdVpoaVFpYW5n
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLQrlj5Hku7bkurrvvJpIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPgrl
j5HpgIHml7bpl7TvvJoyMDI25bm0MTHmnIgyOOaXpSjlkajlha0pIDA0OjQ5CuaUtuS7tuS6uu+8
mk1hcmsgQnJvd248YnJvb25pZUBrZXJuZWwub3JnPjsgIua3s+S6juaZuuW8uiI8Y2h1bnl1emhp
cWlhbmdAeWluaGUuaHQ+CuaKhOOAgOmAge+8mkZyYW5rIExpPEZyYW5rLkxpQG54cC5jb20+OyAi
bGludXgtc3BpIjxsaW51eC1zcGlAdmdlci5rZXJuZWwub3JnPjsgaW14PGlteEBsaXN0cy5saW51
eC5kZXY+OyAibGludXgta2VybmVsIjxsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnPgrkuLvj
gIDpopjvvJpSZTogW1JGQyBQQVRDSCB2MiAxLzFdIHNwaTogZnNsLWxwc3BpOiBhZGQgYXRvbWlj
IHRyYW5zZmVyIHN1cHBvcnQKCgpBbSBGcmVpdGFnLCAyNy4gTm92ZW1iZXIgMjAyNiwgMDg6MzQ6
NTQgTWl0dGVsZXVyb3DDpGlzY2hlIE5vcm1hbHplaXQgc2NocmllYiBDaHVuWXVaaGlRaWFuZzoK
Cj4gVGhpcyBwYXRjaCB3YXMgcHJlcGFyZWQgd2l0aCBBSSBhc3Npc3RhbmNlOyB0aGUgc3VibWl0
dGVyIG11c3QgcmV2aWV3IGl0Cj4gYmVmb3JlIHN1Ym1pc3Npb24uCgpUaGlzIHNlbnRlbmNlIGlz
IHZlcnkgY29uZnVzaW5nLgoKU28gYW4gTExNIGdlbmVyYXRlZCB0aGlzLiBEaWQgeW91IGFjdHVh
bGx5IHJldmlldyB3aGF0IHdhcyBnZW5lcmF0ZWQ/CgpCZWNhdXNlIHRoaXMgbG9va3MgbW9yZSBh
cyBhbiBpbnN0cnVjdGlvbiBmb3IgeW91IGFzIHRoZSBzdWJtaXR0ZXIsIHNvCkkgd291bGQgYXNz
dW1lIHRoaXMgbGluZSBub3QgInN1cnZpdmluZyIgdGhlIHJldmlldyBzdGVwLCBpZiBpdCBoYXBw
ZW5zLgoKCkhlaWtvCgoK
