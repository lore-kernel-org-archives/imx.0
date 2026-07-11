Received: from mail-244107.protonmail.ch (mail-244107.protonmail.ch [109.224.244.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AC73353A61
	for <imx@lists.linux.dev>; Sat, 11 Jul 2026 10:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.107
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783765904; cv=none; b=s+Vyk5Lc2iBT8/I0vo2FbnMjdJXnEriullRHujnzFdYBDhi1G8BLPHqu0MkTBG/ayWDEMOOAmtsjGgimbfbpUFsM9vgy0mrQsRrTmN4EUc7YRJQ6qbW6iah4nJD9R/ugn2z6Ff5U+b31qSkprGZNRO5L/QfZ0kvad9by/ODSGOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783765904; c=relaxed/simple;
	bh=UcrPwjleYOJgTRCrEQFOiFPMRIAmirHboh5hjApdo34=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=d8sEF7mru3/LOP5IxgYIJudJp57zkogIhNCEDYGIpEGuaSu09tBnRlc+1ha6IqNXh7gqzggc4DEsiKoo1HtTBYRprkDasJ1Y2JAo6o2CJcujUB/sNMUIuni2Gsc+ADxFny6sWiDQJVN78zrKaDm0Me0s7SeaC4tlGZnmOlt9FoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com; spf=pass smtp.mailfrom=geanix.com; dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b=j53sk1Z8; arc=none smtp.client-ip=109.224.244.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=geanix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=geanix.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=geanix.com header.i=@geanix.com header.b="j53sk1Z8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=geanix.com;
	s=protonmail3; t=1783765898; x=1784025098;
	bh=CAr/fKi5/LA7pN+4fry0IljwDp0zJrV9bzcJxHbBrak=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=j53sk1Z8BCBT0JaWNBmDkBmhVzVt2scS0S9lTygAWUmdjhHAnQumSoe8wGzqvvlyh
	 3DK6hh3zAI5KLFaeVratreLsORFP9IDSO3nOD47C6N59f9LVhKDjzvq+HPSSl0vneE
	 oaboup5OMxwtTOQqq0KRxsptDXYOvr92afH/eRHiSKWBmJgX7rIkQ/bv0Aw69Zf2rC
	 tXQ43ycYnZqHNm1oxMLA9g2cxj6LGSCpwGRy1Cia4UJjQmnNgmfJ4v6MYgVoNVRM5O
	 QzXhdr6OUb5ukqtYdmlL/lm2NJr0Wqk+URBd6Yo1ldJdSZnq5cLhZRrZ0YwKoH7nvf
	 cBb+hZry7cmCw==
X-Pm-Submission-Id: 4gy4kK6mcgz1DDLC
From: Esben Haabendal <esben@geanix.com>
To: <sashiko-bot@kernel.org>
Cc: <sashiko-reviews@lists.linux.dev>,  <conor+dt@kernel.org>,
  <Frank.Li@kernel.org>,  <devicetree@vger.kernel.org>,  <robh@kernel.org>,
  <imx@lists.linux.dev>
Subject: Re: [PATCH] arm64: dts: imx8mq: Add dcss node
In-Reply-To: <20260710095211.6BE9D1F000E9@smtp.kernel.org>
	(sashiko-bot@kernel.org's message of "Fri, 10 Jul 2026 09:52:10
	+0000")
References: <20260710-imx8mq-dcss-device-tree-node-v1-1-fc724dfd574e@geanix.com>
	<eQdptVZkkupu8jyArfhLV_zAdXoQ3HJb0IsarA60euM68FAWXbTrtljsPnGROjwCVAirW-eB13e6B7vNsN5g-g==@protonmail.internalid>
	<20260710095211.6BE9D1F000E9@smtp.kernel.org>
Date: Sat, 11 Jul 2026 12:31:37 +0200
Message-ID: <87o6gdes1i.fsf@geanix.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

<sashiko-bot@kernel.org> writes:

>> +			compatible = "nxp,imx8mq-dcss";
>> +			reg = <0x32e00000 0x2d000>, <0x32e2f000 0x1000>;
>> +			interrupts = <6>, <8>, <9>;
>
> [Severity: High]
> If power-domains = <&pgc_disp>; is omitted, the generic PM domain framework
> won't track the dependency between this device and the DISP domain.
>
> If no other active devices claim pgc_disp, the PM core may disable the
> domain during late_initcall.
>
> If a board enables this node and the driver subsequently tries to access the
> memory-mapped registers of the unpowered peripheral, it will trigger a
> synchronous external abort and panic the kernel.
>
> Is this node missing the power-domains property?

As the bindings for it does not include a power-domains property, I
don't think it is missing.

/Esben
