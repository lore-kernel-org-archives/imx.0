Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.28.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793094645;
	b=eoyDZO3RLdYfgqLrthkinJDIi9W9Uu/5qeCO5TIG9APozY6z16Z4Mk+NknBbN5JFhTaP
	 wYMgdFRcdGyNlQaNRNJD9pY1ZZbjyrkqGmLMEBn3z/4NrhvL+AR5c/lJ2AOWwtkx2wfVF
	 znWz1iZWH0zOAkxBagdsIEtZhtirVTu6rnhmDQyRvYbT+XSuWGqJe7/Uf+AvYja4jBOzS
	 ioj9TZUWHOhA3UsdenM6SZfhPoz90+hK7qs+64MkiU5P8LhCIPfcEjx1ICHiJ4AkntykU
	 OVFROiG33SQBmGDI/PWTM8mPuOZFwRGrQUoparqEc/ZRhd/o366ywOYcLoFdeknzXtg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094645;
	h=DMARC-Filter:DKIM-Signature:X-Alimail-AntiSpam:Received:Date:From:To:
	 Cc:Reply-To:Message-ID:Subject:X-Mailer:MIME-Version:
	 x-aliyun-im-through:References:x-aliyun-mail-creator:In-Reply-To:
	 x-aliyun-mailtrack:Content-Type:Content-Transfer-Encoding;
	bh=ip1oIRlDB49atLslRiPykN8t9d8AzZSczSK8OspLXl0=;
	b=pdN33qYtSN76rQxRKAmKh1nxg2XByBd5m7qEZuEKFC/l5e3Vf/MniVAFMNRnQ6trEOhW
	 Lr9dkvwdRUP98lEuP27SQ4W80g03x9/I+1epej5yAwuSTpUgb9JtXPUx1+1M4cZVZI4Mo
	 eBaUkTtNcJvAMOBUtgFrVNLQN9EpTbcSFwsfYyVLOzKXzHNDn9IIAOId/vEJLqJBkyG21
	 Xb7AA7hVBlhO06k82wllLEUI7Ns/plftwEaYddb8LCvxMn3aWZHmMZGqFd7KER9BgELyr
	 5WGKX/f9iiDBI6mXY3f6r3ElM8RojqJjxiTBZwuxzNWHGHgOGgtHYf6s5yZQdLMKwMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=yinhe.ht;
	spf=pass smtp.mailfrom=yinhe.ht;
	dkim=pass header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=PNyM+xBG;
	arc=none smtp.remote-ip=115.124.28.3
Received: from out28-3.mail.aliyun.com (out28-3.mail.aliyun.com [115.124.28.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A10606A31D
	for <imx@lists.linux.dev>; Tue, 27 Oct 2026 09:50:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A10606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yinhe.ht
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=yinhe.ht header.i=@yinhe.ht header.a=rsa-sha256 header.s=default header.b=PNyM+xBG
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=yinhe.ht; s=default;
	t=1793094635; h=Date:From:To:Message-ID:Subject:MIME-Version:Content-Type;
	bh=ip1oIRlDB49atLslRiPykN8t9d8AzZSczSK8OspLXl0=;
	b=PNyM+xBG1a7ta9IFTEyRkcOlGosNU15PM6jlE8qZQwRGLNUkaw1JVxedz8lmCBchz22ezNtqERqExsUDyFJ6ckkk5mfMqbykDWmd/DfNxVhvbxagqUy4aXnXbKQ7lj/gSVgwDx1ww7zQpJpg9fB5IIjmPPoMXCEUJx/Cy+uzuqben5CxL09+YEuRSrOMxRRWr7QMhxyxttHcKbEVyHzDC6i8aneGHehBxKs/eFRjc4kukX/CnqQydMu0fZ9xHgc0Gus9yMttfCiQor61rjEJMv2G+sVqDif2qYTsxJW4VyTckIeO9GQp0+UOkoDkOIFKv1BgjrOJYUzEn4jWQHAAiA==
X-Alimail-AntiSpam:AC=CONTINUE;BC=0.1443819|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.0868312-0.00029554-0.912873;FP=5617034440225324730|0|0|0|0|-1|-1|-1;HT=maildocker-contentspam033071099199;MF=chunyuzhiqiang@yinhe.ht;NM=1;PH=DW;RN=10;RT=10;SR=0;TI=W4_0.2.3_2147711B_1793094628713_o7001c170s;
Received: from WS-web (chunyuzhiqiang@yinhe.ht[W4_0.2.3_2147711B_1793094628713_o7001c170s] cluster:ay29) at Tue, 27 Oct 2026 17:50:35 +0800
Date: Tue, 27 Oct 2026 17:50:35 +0800
From: "=?UTF-8?B?5rez5LqO5pm65by6?=" <chunyuzhiqiang@yinhe.ht>
To: "Marc Kleine-Budde" <mkl@pengutronix.de>,
  "Vincent Mailhol" <mailhol@kernel.org>
Cc: "netdev-bot+sinfo" <netdev-bot+sinfo@kernel.org>,
  "netdev" <netdev@vger.kernel.org>,
  "linux-can" <linux-can@vger.kernel.org>,
  "mailhol" <mailhol@kernel.org>,
  "kernel" <kernel@pengutronix.de>,
  "haibo.chen" <haibo.chen@oss.nxp.com>,
  "shawnguo" <shawnguo@kernel.org>,
  "imx" <imx@lists.linux.dev>,
  "stable" <stable@vger.kernel.org>
Reply-To: "=?UTF-8?B?5rez5LqO5pm65by6?=" <chunyuzhiqiang@yinhe.ht>
Message-ID: <767699b6-86c4-425d-803b-9009dece8d63.chunyuzhiqiang@yinhe.ht>
Subject: =?UTF-8?B?UkXvvJpbUEFUQ0ggdjggMi8yXSBjYW46IGRldjogY2FuX3RkY19maWxsX2luZm8oKTogZG9u?=
  =?UTF-8?B?J3QgcmVhZCBhdXRvbWF0aWMgVERDViBpZiBpbnRlcmZhY2UgaXMgZG93bg==?=
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
References: <20261027065012.191348-1-chunyuzhiqiang@yinhe.ht> <20261027065012.191348-2-chunyuzhiqiang@yinhe.ht>,<20261027-capable-active-leech-1aae56-mkl@pengutronix.de>
x-aliyun-mail-creator: W4_0.2.3_null_QuNTW96aWxsYS81LjAgKFdpbmRvd3MgTlQgNi4xOyBXT1c2NCkgQXBwbGVXZWJLaXQvNTM3LjM2IChLSFRNTCwgbGlrZSBHZWNrbykgQ2hyb21lLzEwOS4wLjU0MTQuMTIwIFNhZmFyaS81MzcuMzYgZGluZ3RhbGstd2luLzEuMC4wIG53KDAuMTQuNykgRGluZ1RhbGsoOC4xLjAtUmVsZWFzZS42MDIxMTAxKSBNb2pvLzEuMC4wIE5hdGl2ZSBBcHBUeXBlKHJlbGVhc2UpIENoYW5uZWwvMjAyMTAwIChMaW51eDYuMTIuMTAwK2RlYjEzLWFtZDY0OC4xLjAtUmVsZWFzZS42MDIxMTAxKQ==uM
In-Reply-To: <20261027-capable-active-leech-1aae56-mkl@pengutronix.de>
x-aliyun-mailtrack: {"foreign-track":"0"}
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgTWFyYywgVmluY2VudCwKClRoYW5rcyBib3RoIGZvciB0aGUgcmV2aWV3IGFuZCBmb3IgYXBw
bHlpbmcgdGhlIHNlcmllcy4KClZpbmNlbnQ6IHRoYW5rcyBmb3IgdGhlIFJldmlld2VkLWJ5IGFu
ZCBmb3IgY2F0Y2hpbmcgdGhlIG1pc3NpbmcKRml4ZXM6IHRhZyBvbiB0aGUgVERDViBwYXRjaC4K
Ck1hcmM6IHRoYW5rcyBmb3IgZml4aW5nIHRoZSBpbmRlbnRhdGlvbiBhbmQgZm9sZGluZyBpbiB0
aGUgRml4ZXM6IHRhZwp3aGlsZSBhcHBseWluZy4KCkknbGwga2VlcCB0aGUgYjQvY2hlY2twYXRj
aCBsZXNzb25zIGluIG1pbmQgZm9yIGZ1dHVyZSBzdWJtaXNzaW9ucy4KClRoYW5rcywKQ2h1bll1
WmhpUWlhbmc=
