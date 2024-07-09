Received: from fhigh5-smtp.messagingengine.com (fhigh5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C4EE17C203
	for <imx@lists.linux.dev>; Tue,  9 Jul 2024 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720533956; cv=none; b=CVsK+zbREs4C5Z0RAhaaMO+6ZM1yP8LGMmQKIWb2RqP2cggISCoRS9K5ZPdx1IEPZGqv1EKLPjca74BG7ZH0v/qzrXMerOc9uHbyKlQ699d8BVkA4R9EL9L3+txafI0J+TjAZhzP0YkC10XCVJJP2H5sPwA2t1p6lsDNkWhkcAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720533956; c=relaxed/simple;
	bh=AFKAuDaA1+nRwYw9VJREBeMq9OmdelkMzuszZBuC0ec=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=nJiR1YRaMPLSgiwhmEABCn0wlS0WYTKtB7scPMLyZ6nUP1acd28akUrnmHgV1MtEykVFA0u5u+dQE0XvVZS7jik+QZxGQVFJbY/7ug2sLiNKQiwaN7YXIrdkalJTsvNfeRGHdOCQl5wX2lxBccNJP2jBDQ7KHgMMxKuZMQVGDJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=nuMtTVWa; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=iiFbwqSc; arc=none smtp.client-ip=103.168.172.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="nuMtTVWa";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="iiFbwqSc"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 93096114157F;
	Tue,  9 Jul 2024 10:05:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 09 Jul 2024 10:05:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720533953; x=1720620353; bh=uSokVZ/jYb
	izoOUPkyP4m8kYy5Z4b5K1kNS5Gc+/qJk=; b=nuMtTVWavWFH5jrC5EoKmPom99
	xGlVEc296AgMigy95QkDxOsnqMejw8kjsgkbBSjDZLFGuFLoNk74KW9xhTN2p3w0
	jbxX0Nwtjwq4VejKLg7rFoQ/akCTUwkXholSwHJYrqJqPDBEvcIs73F8jQQT+f0u
	qnvixpAY69W+udOboWWdhx3abMTk9ZbIP7bADAtM469Kz+dDtDo8Hs10mLR+sQl5
	LmtMmqxScDVVc2JFrtywqMo3GPIL7qY9yiEADVjQ6VMiQhwp8PJWWtl2U+OtWRLA
	iuZBAojAvJpbKHnl/WitbNvF8czf25l+3JdXh0tilJEVGlfJTi9ZKLX59ujw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720533953; x=1720620353; bh=uSokVZ/jYbizoOUPkyP4m8kYy5Z4
	b5K1kNS5Gc+/qJk=; b=iiFbwqScyWKcoCnuvRKstwg0UKxo+GvxqlpOLy8pRO9y
	ACzk93ULFBTpWaYjTcSMydb5hNGlnGFNA2QgJsyA67BRJnwVHU6ybFTWCiLKQaKx
	ClgFfFRVh0XwrcJOQq7nHN3cd5BmNdPxgxjo2ri6qfL6ZKfm6RMDDDAHdZwJGEGQ
	g736P+jHiL3R01naxMi2ONelas340gNzQykZsDO2qqmmgFP47jZWhK/oRwzARc9H
	xUGsj6+upUYWlnqCKxWSEJW1T/AFxdijB1+QeBwwBaIACnlTNdyboaeJ4pCDxfzz
	sqb3HVAAKWINxbD9DoJRc1GtDVsSCXmRxNaKdZeT0w==
X-ME-Sender: <xms:wEONZt3jfORzQnefClkMpPlBEAyJ517cQcoowh9D1YsFvsmlPdSw6Q>
    <xme:wEONZkGvl3sTleVujoLsowjgVDn95UWH0ZyEOVZFgn7-KmmYSijHS5q2UF7ovL4lK
    VDogNdp1AcCYYGXSOc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelgdejvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:wEONZt5cVsxhaXDuCyqqeueb5pnPXCdqfg5mC-WAk4uzvAJVBDWmGg>
    <xmx:wEONZq1qwP3XNPxUYL-hK00WbTyU90uxSuD-BYjBdj0S7JFh576cTA>
    <xmx:wEONZgGehIRx1aYpo9yRbuTybdRbLLIeSurcLRdooZuMwJ15r1N38w>
    <xmx:wEONZr_IPpqoYTrASJN_IyZRoENXrPk--Mjhe666yccK3jpa_Tz8BA>
    <xmx:wUONZr2Lv0xly3QtVL67pOK6PJA0WOpNFm7F8L-w3UgzURQn27rlwjIV>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EE86BB6008F; Tue,  9 Jul 2024 10:05:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <3d480ce9-863a-4d2b-ab31-294207a0a924@app.fastmail.com>
In-Reply-To: <20240709012534.3106441-1-shawnguo2@yeah.net>
References: <20240709012534.3106441-1-shawnguo2@yeah.net>
Date: Tue, 09 Jul 2024 16:05:29 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Shawn Guo" <shawnguo2@yeah.net>, soc@kernel.org, arm <arm@kernel.org>
Cc: "Shawn Guo" <shawnguo@kernel.org>, "Fabio Estevam" <festevam@gmail.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL v2 5/5] i.MX defconfig change for 6.11
Content-Type: text/plain

On Tue, Jul 9, 2024, at 03:25, Shawn Guo wrote:
> ----------------------------------------------------------------
> i.MX defconfig change for 6.11:
>
> - Enable a few drivers needed by TQMa7x/MBa7x and i.MX53 QSB/QSRB in
>   imx_v6_v7_defconfig
> - Enable IWLWIFI driver support in arm64 defconfig

Hi Shawn,

I have queued all five pull requests now. I think patchwork
got confused by the v2, so you did not get an automated email
for them.

      Arnd
