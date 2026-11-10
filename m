Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.227.17.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794310379;
	b=WP0rnpgMWpErZ4q9QnJzo1KZ0jiCbRYyoowvBi5JOSuSqffe/m7xC+r2dbe11h3Y2cdE
	 cSoy70VaSTPAsT1TRKMZbu10KClQSI4RGhhsCiPeBoaWpu5DzuWjQ4AQ9ZlDqCy2tQOKQ
	 zPX6psz1jxAlcSAVnve+iCo4ggqCL5pfVZwirPQv4cG7ZGt5HsHRfHz3xfhev09pXpgfB
	 3gxJDx641y/MkupO8++1Tv9J3/y6QWArL0mMiJEyTMUjPDnZKLO7ko8n+9crLP8ZEN177
	 zd0OqGuZZIYco3D9MINnURzNN/6x13hVNm3pRszWNSh8rBKk2cbtNMKuPDveMrAibcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794310379;
	h=DMARC-Filter:DKIM-Signature:X-UI-Sender-Class:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
	bh=BrQDFJiFpCVebk8ZCd0YutKlhOj46ZDSdePy9SVQvMI=;
	b=C1F5lKWjsyzbO9HfWuwWIYQhBVu0RhzXV5x+YhAgkjPC82Yqb1RlcQDDwFif/ZDTlr32
	 V2bj/aTXki6HyCZ2uGINHDK1fUlskVm+jlN0nRscpmM3/X7G3ttkDKP6o+fPvIEwwOFk2
	 1PeeOuyNz6+LKCKcUDCMgk2VLsJEievPOvCx1c3LqEwzfrVFzlxZQ4dGWBizSHYJVjZOO
	 xo2tR5BVS4qHZhSqB8II5GlmRbIG3VYWJM8ZkoLDf94sGqPyrjIQzmP/6JhYIk5pSyqWX
	 SDZxhLkNhN6vJaae4qRA7b9iDCTmp7jNKyqjLZuGLf011Wtk0mnPYSRK0BHr9nd+8NA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmx.net;
	spf=pass smtp.mailfrom=gmx.net;
	dkim=pass header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=on755yiy;
	arc=none smtp.remote-ip=212.227.17.20
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B280606A321
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 11:32:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B280606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.net header.i=wahrenst@gmx.net header.a=rsa-sha256 header.s=s31663417 header.b=on755yiy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1794310376; x=1794915176; i=wahrenst@gmx.net;
	bh=BrQDFJiFpCVebk8ZCd0YutKlhOj46ZDSdePy9SVQvMI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=on755yiyaANPYwQhK1P0BeElUHoE2tqHXRcjMO3wEkpxsSNK40MouyX3MtlwFpVW
	 ki0SQeoJ7PTQkBl9KbeL3zEIPufbHis+OFPMOcA5vOa7pFqjRI6LvlKJzGMtlk/07
	 UfW2MIagWTTbms2ZBxvEjgXgS64rN0TfMWC/ZCKrqViW8G/mpINOajCgi5uMd5Yji
	 uW2uDoTWum/8JnE07EImWmSlkkxJXy5H2mPQf4KA9+BQ8uU4FSCZMJPlC2tXcAsDj
	 GuNELF7X55Eo9YhWHAg8xb5icqmYyfZMPA+CkZvaq+plgu7ewh4czqP5O+BZ7CY3B
	 JvsCzCnOD5I2EhfXCA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M4s51-1xR1bk3H7f-006ist; Tue, 10
 Nov 2026 12:32:55 +0100
Message-ID: <1b80fa9b-5af4-4ab8-b0fd-eb53eddd35a7@gmx.net>
Date: Tue, 10 Nov 2026 12:32:52 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] ARM: dts: imx6ull-tarragon-common: Fix Ethernet
 regression
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
 Manuel Traut <manuel.traut@mt.com>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20261004140123.46461-1-wahrenst@gmx.net>
 <20261004140123.46461-2-wahrenst@gmx.net>
 <atpvdWuwnYeQ03Rm@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <atpvdWuwnYeQ03Rm@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:bM+Q6nOjOcAIn2CFN5rsSIriN0zYh7gcWUBAanjP2/zWPQ221mw
 JAY+0ZzcDZT8QPpSn0eObq5Vt/SNCbX4LKXc+xr5t6Wn6cw0c/IZaIz1rXTo4wLuEiNAurV
 UMVo2c/qlGir/CSOvk6dNE0LOoe87cK9L4GpN3xFnRPOmk+UrkUfnCRD39qiVI1qKkDPgfk
 7fHsh8JPkNFKonjFEKz0w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ERy4PKCR4LA=;kv2/qEoBOR/kOLfWRFZjw4HfRlH
 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
 r5Mib4OXTLQAQ8jMJXof3hc

Hi Frank,

Am 22.10.26 um 22:17 schrieb Frank Li:
> On Sun, Oct 04, 2026 at 04:01:19PM +0200, Stefan Wahren wrote:
>> The commit e2ba87c745ca ("ARM: dts: imx6ul: Set macaddress location in ocotp")
>> introduced a OTP to MAC address mapping on DT level. But the Tarragon
>> platform relies on a different MAC address mapping, which is provided by
>> U-Boot.
> Is it possible update uboot to adapter OTP possition?

I cannot speak for the U-Boot maintainer, but we will try.

Best regards

>
> Frank
