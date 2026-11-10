Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794321801;
	b=MKKL+klHT8WO4nHszhEseJ+/hhL4n95kRSYyMitjBmyJw+tbUn6sLVvbXoEtmCLweove
	 +VKjia7MvhkPub0b+dCLUI7cc/yeqnb7XAndXn7YpV87KRe8aUgu/6rRcsOMcatwnExcH
	 hHaniYMTIkkwUB4XmNJhlKgIT/8yn2iIHqrV57p3Jffm53YKlkFKFR8IFwOAaL07hrpHZ
	 c0+qjX2A7mzTi0E/ufJRFG9/cMDMKr59zbCMN0Qt45EniNFPYnUDmAgTkkbsjJg5rlWrq
	 xxBb2JYDShvtoNH4xe4+ZDfgusuepWtmBZSWlpFk9okH2JvmXCj89rsEleOKDLCuWiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794321801;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=xy3xjpeII+ISxdGXftLppTbqcukaKKLwMFzsxm43o7w=;
	b=T91VTfC4CLeP75YwPVgtD8FcYUNL/zjJw9mIJkJm4/kIzyv0xalrEnZFZK0ZmohM0Qbv
	 7eleOzsoWXwGywYcwn4eMNAul/uQlwuFK5d1VcelAwrT/8/zq0NV99d40KQCjHEqMbYNz
	 xNgqntsyiUunQKKCc6TgNsGKyBlMSB1GM3NK6h/gpkVqa7ez8ta4yo5D+pd5WFmPg9FpN
	 RFj2COSeFRbj6d3/kKVq2iDVXpZar+KNiEahh9xP04/itq96C3W97ts8BDys4GuwwM06J
	 k+K7P5JeBkdAfcmLr+sDC1inK/ykuna4D4SpF3FzAgfwzJ2khNueuC15UnSjlt1SO9w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FnppE1Qb;
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53EB60A2639
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 14:43:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D53EB60A2639
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FnppE1Qb
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 440DA1477;
	Tue, 10 Nov 2026 06:43:17 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4E8AA3F632;
	Tue, 10 Nov 2026 06:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794321800; bh=vd5r4VdqjOBRM0Vqs8yo1BB1AiJgxUtyT/L7aP/x6IQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FnppE1QbxEEUZLESdF1mATcmg3WUDOHbfMl1F3vRGImPAYpG4d57tCF5oZeuXZD2i
	 MRyW0CUoTQ+gkYoDYJhVc6IgDD/4QRIwH7EUqb0QNLUnrKkAWZ+Xmoeae3UF/C9f7V
	 qrs/WE8u86pOF8n5ikhqhiQJiKJB2FxpRQs7Ds6Y=
Date: Tue, 10 Nov 2026 14:43:15 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>, linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org, michael@amarulasolutions.com,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 2/2] clk: scmi: reject SSC configuration out of the
 OEM field range
Message-ID: <avMtgxmGXTbTKG1t@pluto>
References: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
 <20261104103620.4054694-3-dario.binacchi@amarulasolutions.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104103620.4054694-3-dario.binacchi@amarulasolutions.com>

On Wed, Nov 04, 2026 at 11:36:03AM +0100, Dario Binacchi wrote:
> The i.MX SCMI OEM extension stores the spread in an 8-bit field, in
> tenths of a percent, and the modulation frequency in a 16-bit field.
> 
> FIELD_PREP() silently truncates values that do not fit in the target
> field. Moreover, the conversion from permyriad to tenths of a percent
> turns values below 10 permyriad into zero, which is then passed to the
> firmware as no spread at all.
> 
> Reject these cases with a warning instead of silently programming a
> configuration different from the requested one.
> 
> A request with no spread method disables SSC, so send a zeroed
> configuration to the firmware in that case, without checking the
> spread and the modulation frequency, which are meaningless then.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 

LGTM.
From: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
