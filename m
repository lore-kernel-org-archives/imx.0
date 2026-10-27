Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084174;
	b=Waz82CpkrovaX7J62jTjGtRixBiaulb/RFxqU7BizrSd4KFffDMZdxDod+ox4Ba1A8zX
	 bAfaY0pT9CSxFX1B2qMNiws8dzXWvTa0h8+LZqxXfpguMnanJS0FI+qFX/DHmrt33BTwg
	 qAQSAQpPSh8bawFME/pJFTg4VI3Sf9453aQgBT161OzQeoUv0kt0G9LR2newvRhtrvdmz
	 ZTWJmA9qVdceR2QJ+Xow8/RENQKCBfB3/vG7uMjmTP8HP6uBprDFaCLGqOuyv4zvuo7vB
	 peltpJj+galJfnw7bdXA5gJobMLB0uYqoqbuzKY+5+IxAmathMtev1CD0HVoEQWHMLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084174;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Reply-To:Message-ID:Subject:X-Mailer:MIME-Version:
	 x-aliyun-im-through:References:x-aliyun-mail-creator:In-Reply-To:
	 x-aliyun-mailtrack:Content-Type:Content-Transfer-Encoding;
	bh=GxCHiLYhIq7p2zI3/Y+9yVNjrpMmu1YiPNARHI/SAvg=;
	b=jo9zjSQJoiD6ZCaNXpMfWG1dAly0mRuM0LejCNaEFckS4HnO2bkwLPeEFNcCe0O2uW0c
	 aQVLiPknEm/a3SCGw8HHctYVVTuPZr3EamRBqx//wFAukUlTJOJblxkJEOoaRVdTwPjWP
	 Se8hz8mgtW+YYalRu3Vma23bxPaeZdOEv0Q6pQ/uZQaMT/YPafXjulptc4aWDF7ADFpeA
	 4RUpCy2ozUDZVRkeKAyqU+xrCB+U1Wlc06wvKVrCpbieTEizldu0w5Uqht1ZEpS8idQ4J
	 UDlcdh1Gty1a4u2TXbJNzbhwrUsMYgqqCkwtj/o6qKtBE8ZMDIz0C77kRzXZG49sSog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=SY8dgKZm;
	arc=none smtp.remote-ip=115.124.28.1
Received: from out28-1.mail.aliyun.com (out28-1.mail.aliyun.com [115.124.28.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFACE606A31B
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 06:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFACE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=SY8dgKZm
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1793084171; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
	bh=GxCHiLYhIq7p2zI3/Y+9yVNjrpMmu1YiPNARHI/SAvg=;
	b=SY8dgKZm6uLdqQHniXj6PJE20nkRLK1Y/TSRpRRYHN/I/aKm0Eshfi87/8HuGcUnaDi02+Z4sgovZbX4acaAKFmJXcrRzpiKayuvvQRf+MoM/cvEG9af7UXTb20UkGn3o8TaWUFP26TcwsPgukyXXUDqVSiiQ0JESlKHGA0fviz/Vmj8JqvEhbyNhLF4SgWo6TXj47qLw7+SEu/eLi8G65J4linC5CrYvtGPgm/XjCpoJSknwYxsqNC2aClwZDbn7BskhMphIP8WO7uVSSwe7MjkgnwAAzi4fvZWSiz/pP7XyVEfRg6KHiWWaF7NmicOzsOcyc9+sLi/3WMZgvglEg==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.3520985|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_news_journal|0.324253-0.00504887-0.670698;FP=662468230579382141|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033071099199;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DW;RN=10;RT=10;SR=0;TI=W4_0.2.3_2125170E_1793084166474_o7001c76i;
Received: from WS-web (chunyuzhiqiang@yinhe.ht[W4_0.2.3_2125170E_1793084166474_o7001c76i] cluster:ay29) at Tue, 27 Oct 2026 14:56:06 +0800
Date: Tue, 27 Oct 2026 14:56:06 +0800
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
Message-ID: <635d5817-f715-40c4-94e1-306204ca5521.chunyuzhiqiang@yinhe.ht>
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
References: <20261021145115.153107-1-chunyuzhiqiang@yinhe.ht>,<b0d3e7bf-ddd3-4eaa-8ebc-fbe5e7d8443f@kernel.org>
x-aliyun-mail-creator: W4_0.2.3_null_QuNTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYgZGluZ3RhbGstd2luLzEuMC4wIG53KDAuMTQuNykgRGluZ1RhbGsoOC4xLjAtUmVsZWFzZS42MDIxMTAxKSBNb2pvLzEuMC4wIE5hdGl2ZSBBcHBUeXBlKHJlbGVhc2UpIENoYW5uZWwvMjAyMTAwIChMaW51eDYuMTIuMTAwK2RlYjEzLWFtZDY0OC4xLjAtUmVsZWFzZS42MDIxMTAxKQ==uM
In-Reply-To: <b0d3e7bf-ddd3-4eaa-8ebc-fbe5e7d8443f@kernel.org>
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgVmluY2VudCwKCj4gUHV0IHRoaXMgb24gYSBzaW5nbGUgbGluZToKPgo+ICBpZiAocHJpdi0+
ZG9fZ2V0X2JlcnJfY291bnRlciAmJiBuZXRpZl9ydW5uaW5nKGRldikpIC8qIElGTEFfQ0FOX0JF
UlJfQ09VTlRFUiAqLwo+Cj4gU2FtZSwgdGhpcyBmaXQgaW4gb25lIGxpbmU6Cj4KPiAgIH0gZWxz
ZSBpZiAoZGJ0X3BhcmFtcy0+ZG9fZ2V0X2F1dG9fdGRjdiAmJiBuZXRpZl9ydW5uaW5nKGRldikp
IHsKClRoYW5rcyBmb3IgdGhlIG5pdHBpY2tzLiBVbmZvcnR1bmF0ZWx5IHY4IHdlbnQgb3V0IGJl
Zm9yZSBJIHNhdyB0aGlzCm1haWw6CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1jYW4v
MjAyNjEwMjcuLi4KClRoZSB0d28gY29uZGl0aW9ucyBhcmUgc3RpbGwgc3BsaXQgYWNyb3NzIHR3
byBsaW5lcyBpbiB2OC4gV291bGQgeW91CnByZWZlciB0aGF0IEkgc2VuZCBhIHY5IHdpdGggdGhl
c2UgZm9sZGVkIGluLCBvciBpcyB0aGlzIHNvbWV0aGluZyB5b3UKY2FuIGFkanVzdCB3aGVuIGFw
cGx5aW5nPwoKSSdtIGhhcHB5IHRvIHJlc3BpbiBpZiB0aGVyZSBhcmUgb3RoZXIgY2hhbmdlcyBu
ZWVkZWQgYW55d2F5LgoKVGhhbmtzLApDaHVuWXVaaGlRaWFuZw==
