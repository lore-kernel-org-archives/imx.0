Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E2D7146593
	for <imx@lists.linux.dev>; Mon,  8 Jul 2024 16:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720455236; cv=none; b=YG2UKf3UoAPz2VqmfH9MQxNATM/golPJZx/C2bs7OToJp038Q+EeKjSHhbIMM70ES341uM8CkYghlr8V0EduCmAg51vC6mhInAbwfloFwI3DApyagQjrMhKW2xgHAUWRU2uhIgddFzJ9xO9zQHTsgg/mFbQ5deB/O0vJUzXefqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720455236; c=relaxed/simple;
	bh=Oy7Vf1A6WIZDmWgwE8xqjC8eexuXO8J+Ff76rIe+pMg=;
	h=MIME-Version:Message-Id:In-Reply-To:References:Date:From:To:Cc:
	 Subject:Content-Type; b=LNEH5Y/x2oYqBEglLvkXGOqmwbGyMoXGk5V8RCuvFNhiooZMPpAYC453XFmMnr5jGqU/PwkTiu1E1IbzMn4i3KKH1Ww73Adnz7nSv5MHO+52qcAat6ruF0WLy8s188bh82rK5a8gF2N5+6i31OXhVCyzus1jg8298AQjFoW4qaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de; spf=pass smtp.mailfrom=arndb.de; dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b=vC7pc1vs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=K7ZFPT6c; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arndb.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arndb.de header.i=@arndb.de header.b="vC7pc1vs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="K7ZFPT6c"
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id 5C2A2138019E;
	Mon,  8 Jul 2024 12:13:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 08 Jul 2024 12:13:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1720455233; x=1720541633; bh=Dm+j1g201r
	WzbPX565s9oKjpW3n6J7GSGb1eKskHe8U=; b=vC7pc1vsLCabenxleJ1LRKf+Gf
	4ZfdYn0I1pCCPZoFVFtFzEHZatN/a8vEtbbAeace8s4dzYLBW4+foQ8r5BzzVR9U
	mEnmtFm7w6OIn/EYHfSrB+OJjSkLKlQ2f9355xaOtyInGy374Deo5UsGdcuAkYhy
	84vgJvPxUl63Nujpl/NtW4MUZtlLo3injdasrfLRr0L2GyhfPBFtJtFrICED6bxN
	bZwkeqUmST3Mz6W4SlWjqILCaPNqDwx95LEUN91YjDsk8i32ZbByAzu48LMrmiHc
	MUgif+e1jgpn/PJk43DZyBTpMAKeufbSZ2yrIo/LYcf5zdYZ7P7pzdl6GpHg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1720455233; x=1720541633; bh=Dm+j1g201rWzbPX565s9oKjpW3n6
	J7GSGb1eKskHe8U=; b=K7ZFPT6cy7sJL9AJyBd/V7kLl0rOVn0bZSFV74Gpll1N
	LhvVWs2t+DtQo+2DiF09Jf3v2Mm7TBvv16epg2g62FQCUT+9Jx0RVVE/agbgSn6M
	dZuX35P5OaXog/OIx4OMZXqYePJHzCAix2UZzgIJt+rDNYM/3L4406VCTCZhM32T
	VF+4bFJ3zU62ja7FFaU9l7bVNKttgIxkax4zO+CuWGmvUn8EJfDRMJ3K2SmUgofO
	+gFo7sGDZIQJjwBYBXQqZt/aDYBv/Vg0qJ/rPlZkGPUZnwNyl6u42S0Y58txG/HM
	tlmIxhs4IBt7fs88LbuKpl48KjkiJxAsomSxKr+z5Q==
X-ME-Sender: <xms:QBCMZphSoNOYZZpLPL20nzS_3l1oZH5BroySH1wEW4KU85aqpNa5Eg>
    <xme:QBCMZuDWjWHnGCfkUlCjWlwzjEUUSj1iRGUUZCV5EgpUHQ3JVou5wSxWdi78yJXIO
    NvuB1Uss5Gn6Yw2yYc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejgdeljecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:QBCMZpEVUkZy-2MC17xW0WtxOYJbXAZpYbJ68GLgWuqgo44O14Rx7Q>
    <xmx:QBCMZuTg4pSOqgz4Yf-SG69-JrttcZEnLPdMPQZtsyf9axCBPQMFxw>
    <xmx:QBCMZmxdGoF3ryXgyg6ktnJ682VGL5iuCQnvFdMMGrm-gFRNV676rA>
    <xmx:QBCMZk5rn_DNXupzPq4eRe_bCohYb6DLgVDv52eTJYh7-hVjsPSgqQ>
    <xmx:QRCMZhzZmjDs3n-efWualp55dmmklYYu1XQPRMDqD7DIk_0qSr7A5nL1>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 0A657B6008D; Mon,  8 Jul 2024 12:13:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <37bdee4b-cde6-496d-8217-80575c3e55ce@app.fastmail.com>
In-Reply-To: <20240702142153.413061-5-shawnguo2@yeah.net>
References: <20240702142153.413061-1-shawnguo2@yeah.net>
 <20240702142153.413061-5-shawnguo2@yeah.net>
Date: Mon, 08 Jul 2024 18:13:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Shawn Guo" <shawnguo2@yeah.net>, soc@kernel.org, arm <arm@kernel.org>
Cc: "Shawn Guo" <shawnguo@kernel.org>, "Fabio Estevam" <festevam@gmail.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 5/5] i.MX defconfig change for 6.11
Content-Type: text/plain

On Tue, Jul 2, 2024, at 16:21, Shawn Guo wrote:
> ----------------------------------------------------------------
> i.MX defconfig change for 6.11:
>
> - Enable a few drivers needed by TQMa7x/MBa7x and i.MX53 QSB/QSRB in
>   imx_v6_v7_defconfig
> - Enable RAM block device and IWLWIFI driver support in arm64 defconfig
>
> Fabio Estevam (2):
>       arm64: defconfig: Enable RAM block device support

I don't really like this one change. This has pretty much been
deprecated for decades, and I don't see a reason to enable
it now without a really good explanation. 

Is there ever a reason for not using regular initramfs any more?

Shawn, can you resend the pull request without this one for
the moment?

    Arnd
