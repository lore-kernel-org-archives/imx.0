Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111E4199E89
	for <imx@lists.linux.dev>; Sun, 27 Sep 2026 14:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790520941; cv=none; b=Q8k6g0EcIIIbCsLac2iaUA9YP+jMjxc2QOKvUvTL+CpfPj9OECqAyyxIVdtHyRHExk48wL8D7MWU6dVkritpDnynVVoIG/kRULFxJ1/jdN6m4XdQd5g1s/igB5snwFHUukfNjUDRw+p4yLGQjCpjVjdIX58WBVR+tvTekVxIkUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790520941; c=relaxed/simple;
	bh=ZcU40FFHJvRddSme+YyOAgkWxq0a822Pw8UlCWr9AeM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:Content-Type:
	 MIME-Version:Message-ID; b=Ie6mPx1HGG62MolAqN3+XbMfH2T+TUthra11FL5Y9cyFM4ePln8aeTxwVZmix+EO65lywfffhNN9+nxv5R7I7fQ2yUaLU9/NvXsh/ZEZLT9aSh37jZlZmVdL0OvfTeXZKWd0VgE+e8gusMWSMsco3Gowg6wCTFqnW+wAnW+BvBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=L8oNUjq+; arc=none smtp.client-ip=117.135.210.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="L8oNUjq+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=Date:From:To:Subject:Content-Type:MIME-Version:
	Message-ID; bh=ZcU40FFHJvRddSme+YyOAgkWxq0a822Pw8UlCWr9AeM=; b=L
	8oNUjq+tcdWjz7jjBOUBgDNCfP9iWtCFyIENykLxe9fdUnujyw6t7EwpEOPt5foT
	uYMSOYNz+QXrNKcP0YGhayd9ZVdfl7ljWdXwp52XTkHPPnrBKdzIEac6ni/WDuTv
	3PRmcTUeqS6m1KiOSydqI1GU9KcySA+xeXnCESRBxE=
Date: Sun, 27 Sep 2026 22:53:53 +0800 (CST)
From: "jiale yao" <19888972804@163.com>
To: "Francesco Dolcini" <francesco@dolcini.it>
Cc: "Wei Fang" <wei.fang@nxp.com>, "Frank Li" <frank.li@nxp.com>,
	"Shenwei Wang" <shenwei.wang@nxp.com>,
	"Andrew Lunn" <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	"Eric Dumazet" <edumazet@google.com>,
	"Jakub Kicinski" <kuba@kernel.org>,
	"Paolo Abeni" <pabeni@redhat.com>,
	"Fabio Estevam" <fabio.estevam@freescale.com>, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re:Re: [PATCH 2/7] net: fec: manage the netdev lifetime with devres
X-Priority: 3
X-Mailer: Coremail Webmail Server Version 2023.4-cmXT build
 20260511(2e539873) Copyright (c) 2002-2026 www.mailtech.cn 163com
In-Reply-To: <20260927143745.GA54546@francesco-nb>
References: <20260927111005.1035089-1-yaojiale02@163.com>
 <20260927111005.1035089-3-yaojiale02@163.com>
 <20260927143745.GA54546@francesco-nb>
X-NTES-SC: AL_Qu2SAvmZv0Ao5SeaY+kcn08ShO49XMOyvfoi2YFTc+wEtDDx5D0YcXZsLHvo+tO2Bwe2uhyyaypowcFTQZNHZW/RWTL+AessDjTw6V0abg==
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=GBK
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-ID: <6db17bb3.2840.1a0e35bb6ca.Coremail.19888972804@163.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID:ZygvCgD312ABLrlq4EVPAA--.48920W
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzQGUzmq5LgHgLwAA3l
X-Coremail-Antispam: 1U5529EdanIXcx71UUUUU7vcSsGvfC2KfnxnUU==

SGkgRnJhbmNlc2NvLAoKVGhhbmtzIGZvciB0aGUgcmV2aWV3LiBTb3JyeSBJIG1pc3NlZCB0aGF0
IKGqIEkndmUgZml4ZWQgdGhlIGVtcHR5CmxpbmVzIGJldHdlZW4gdGhlIHRhZ3MsIGFuZCBhcHBs
aWVkIHRoZSBzYW1lIHRvIHRoZSBvdGhlciBjb21taXRzLgppbiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNjA5MjcxNDQ3NDEuMTMyMDU1OC0xLXlhb2ppYWxlMDJAMTYzLmNvbS8KCkF0
IDIwMjYtMDktMjcgMjI6Mzc6NDUsICJGcmFuY2VzY28gRG9sY2luaSIgPGZyYW5jZXNjb0Bkb2xj
aW5pLml0PiB3cm90ZToKPk9uIFN1biwgU2VwIDI3LCAyMDI2IGF0IDA3OjA5OjU5UE0gKzA4MDAs
IEppYWxlIFlhbyB3cm90ZToKPj4gZmVjX2Rydl9yZW1vdmUoKSBmcmVlcyB0aGUgbmV0ZGV2IGJl
Zm9yZSBkZXZyZXMgcmVsZWFzZXMgdGhlIG1hbmFnZWQKPj4gSVJRcyB3aG9zZSBoYW5kbGVycyB1
c2UgaXQgYXMgdGhlaXIgZGF0YSBwb2ludGVyLiBBIGxhdGUgaW50ZXJydXB0IGNhbgo+PiB0aGVy
ZWZvcmUgYWNjZXNzIHRoZSBmcmVlZCBuZXRkZXYuCj4+IAo+PiBBbGxvY2F0ZSB0aGUgbmV0ZGV2
IHdpdGggZGV2cmVzIHNvIHRoYXQgdGhlIGxhdGVyIElSUSByZWdpc3RyYXRpb25zIGFyZQo+PiBy
ZWxlYXNlZCBmaXJzdCBkdXJpbmcgdGVhcmRvd24uCj4+IAo+PiBGaXhlczogMGQ5YjJhYjFjMzc2
ICgiZmVjOiBVc2UgZGV2bV9yZXF1ZXN0X2lycSgpIikKPj4gCj5yZW1vdmUgdGhlIGVtcHR5IGxp
bmUsIHRhZ3Mgc2hvdWxkIGJlIGFsbCB0b2dldGhlciB3aXRob3V0IGFueSBlbXB0eQo+bGluZSBp
bi1iZXR3ZWVuLiBzYW1lIGFwcGxpZXMgdG8gdGhlIG90aGVyIGNvbW1pdHMuCj4+IENjOiBzdGFi
bGVAdmdlci5rZXJuZWwub3JnCj4+IFNpZ25lZC1vZmYtYnk6IEppYWxlIFlhbyA8eWFvamlhbGUw
MkAxNjMuY29tPgo+Cj5GcmFuY2VzY28KCkppYWxl
