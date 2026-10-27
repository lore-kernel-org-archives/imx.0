Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.146
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084460;
	b=U/1AIV3y55/DgJE8UXMAcKuDr13lHqDWc5MHEB5XI+WuUCJabTRZa1bdfk9uaj2Bf/5I
	 kZP51uBKubFMRvcqRoytyV24gOSL+sStqBWPERJkAbiYSVBQGRU0r4TEnr5sQvzRRFCGu
	 NCXFAEsZ/hLiKV+Tucdky2rFu3jAXIKZLc191kIDUNrfbpFAgNv+mwqAFUwtwHJlx+s2t
	 IYaQz5Dy4cpBPT9OIVzcptWSJfnF2EoozH7VQIGHzT69X/7dmePkzzA1YfJwEgkw+Nt/B
	 iLMBl1n8Uey5/HXGfX3RKgoTmzeeGL0AQDd/d7U15M6S05NLQiExPoZQfJr4NdY4r4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084460;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Reply-To:Message-ID:Subject:X-Mailer:MIME-Version:
	 x-aliyun-im-through:References:x-aliyun-mail-creator:In-Reply-To:
	 x-aliyun-mailtrack:Content-Type:Content-Transfer-Encoding;
	bh=G3CHyPHqSVPX/oIn+63k332RUvAemXvuZZ9tyeSwFOI=;
	b=z7G9Aq0MA+78TDlVdKGYPo7ULs6xaowfY7JHpYFxq7I9TRa2yO5QSxw8aphU3jRKr4yd
	 Z9nW5nbGOIEg1uHiJ9xciJrbcD8Yc9w3qU9sqlz9QPXeeLzCUfD/zWeyzuM7Z9LtaSdhN
	 oJuazB2+gUQCrStcgkoD5y8rGPs1b+FFV6v6wnSwHKJd8QSPcRcyyC557fOAk3tyV8ikI
	 huFD3uTWquciNqhsa57i70gxe55UWnuP2W/ZxcXGTDrmP0zV4hK7emn5/7RHilvxfyOqx
	 eFmkqXGE6o50Ahbyu4jihRrG3/Dq5+ff9TPpo5DRUZgrlE0EEog025GkKfyS8+iScxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=NkQ20jcM;
	arc=none smtp.remote-ip=115.124.28.146
Received: from out28-146.mail.aliyun.com (out28-146.mail.aliyun.com [115.124.28.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16304606A32D
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 07:00:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16304606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=NkQ20jcM
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1793084450; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
	bh=G3CHyPHqSVPX/oIn+63k332RUvAemXvuZZ9tyeSwFOI=;
	b=NkQ20jcM1/Ei9BCq/FzJ0ywgGso6Ku2J0gcqvPqc2OaPxUHI5PXRWc58Y26aVPS6PcIzGrFyvf2vmcVi0DZci2UCsmW2aIRYBmLya4cKpIcvfx7w2w41TYT9vMA8Yq0YtpjSOjSuQheYc0ap5lO6+gDMQ5IsFIdR3w5A2Z6maESCpgKzUfy9P2kmhIf0ZVybbPmdndKV6GkqTFWSVrRlRGrTc+rqjxyFEyEZ7MdM8CybM2Xx4tcjqRfjDo/0mCR+X+4qqkfQ/pfbnFf9//4i8pRvxwtlKKDVe3k2PN0kgP3n+65B4IACPQ81DQQO4ERiBC/pWaxhLibJ4E32/qxn4w==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.2858976|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_system_inform|0.357271-0.0037877-0.638942;FP=86025002816831325|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033045166233;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DW;RN=10;RT=10;SR=0;TI=W4_0.2.3_21251BF5_1793084445172_o7001c92n;
Received: from WS-web (chunyuzhiqiang@yinhe.ht[W4_0.2.3_21251BF5_1793084445172_o7001c92n] cluster:ay29) at Tue, 27 Oct 2026 15:00:45 +0800
Date: Tue, 27 Oct 2026 15:00:45 +0800
From: "=?UTF-8?B?5rez5LqO5pm65by6?=" <chunyuzhiqiang@yinhe.ht>
To: "Vincent Mailhol" <mailhol@kernel.org>,
  "netdev-bot+sinfo" <netdev-bot+sinfo@kernel.org>
Cc: "netdev" <netdev@vger.kernel.org>,
  "linux-can" <linux-can@vger.kernel.org>,
  "mkl" <mkl@pengutronix.de>,
  "kernel" <kernel@pengutronix.de>,
  "haibo.chen" <haibo.chen@oss.nxp.com>,
  "shawnguo" <shawnguo@kernel.org>,
  "imx" <imx@lists.linux.dev>,
  "stable" <stable@vger.kernel.org>
Reply-To: "=?UTF-8?B?5rez5LqO5pm65by6?=" <chunyuzhiqiang@yinhe.ht>
Message-ID: <e3fe3acb-cb2b-4d91-94bd-1f6df474792c.chunyuzhiqiang@yinhe.ht>
Subject: =?UTF-8?B?UkXvvJpbUEFUQ0ggdjddIGNhbjogZGV2OiBjYW5fZmlsbF9pbmZvKCk6IGRvbid0IHdha2Ug?=
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
References: <20261021145115.153107-1-chunyuzhiqiang@yinhe.ht>,<b0d3e7bf-ddd3-4eaa-8ebc-fbe5e7d8443f@kernel.org>,<635d5817-f715-40c4-94e1-306204ca5521.chunyuzhiqiang@yinhe.ht>
x-aliyun-mail-creator: W4_0.2.3_null_QuNTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYgZGluZ3RhbGstd2luLzEuMC4wIG53KDAuMTQuNykgRGluZ1RhbGsoOC4xLjAtUmVsZWFzZS42MDIxMTAxKSBNb2pvLzEuMC4wIE5hdGl2ZSBBcHBUeXBlKHJlbGVhc2UpIENoYW5uZWwvMjAyMTAwIChMaW51eDYuMTIuMTAwK2RlYjEzLWFtZDY0OC4xLjAtUmVsZWFzZS42MDIxMTAxKQ==uM
In-Reply-To: <635d5817-f715-40c4-94e1-306204ca5521.chunyuzhiqiang@yinhe.ht>
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgVmluY2VudCwKClNvcnJ5LCBteSBwcmV2aW91cyByZXBseSB3YXMgd3Jvbmcgb24gdHdvIGNv
dW50cy4KCjEuIHY4IGFscmVhZHkgaGFzIGJvdGggY29uZGl0aW9ucyBvbiBhIHNpbmdsZSBsaW5l
OgoKCWlmIChwcml2LT5kb19nZXRfYmVycl9jb3VudGVyICYmIG5ldGlmX3J1bm5pbmcoZGV2KSkJ
LyogSUZMQV9DQU5fQkVSUl9DT1VOVEVSICovCgogICB9IGVsc2UgaWYgKGRidF9wYXJhbXMtPmRv
X2dldF9hdXRvX3RkY3YgJiYgbmV0aWZfcnVubmluZyhkZXYpKSB7CgogICBTbyBubyB2OSBpcyBu
ZWVkZWQgZm9yIHRoZXNlIG5pdHBpY2tzLgoKMi4gVGhlIGxpbmsgaW4gbXkgcHJldmlvdXMgbWFp
bCB3YXMgYSBwbGFjZWhvbGRlci4gVGhlIGFjdHVhbCB2OAogICBzZXJpZXMgaXMgaGVyZToKCmh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LWNhbi8yMDI2MTAyNzA2NTAxMi4xOTEzNDgtMS1j
aHVueXV6aGlxaWFuZ0B5aW5oZS5odC9ULyN0CgpQbGVhc2UgaWdub3JlIHRoZSAic3RpbGwgc3Bs
aXQgYWNyb3NzIHR3byBsaW5lcyIgcGFydC4KClRoYW5rcywKQ2h1bll1WmhpUWlhbmc=
