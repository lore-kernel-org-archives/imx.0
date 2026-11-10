Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320529;
	b=IeylE9MYopbU0p92Pj/b5KhDvAtprk4jp1XGMBJL0yauaW3Q6HimFdaAKFU1Ylwj52/G
	 qxVcjHqN2z4OX9lX860YMrQFeUItZUNq9oJOB2s1OMLsdUgE22VTQuAV9v9H+RiPj9E5X
	 qSC2y4U6ikoEUSEN5I7rdtoHcmkw3j3OXCUvScT1EiUoQ8MSLUqfBmAy42Ohm1dLCoynK
	 /HUrmCigmgKB70olvrdPJsSYTub9NYyKYAUi5eN4oTQbUF332e4IcPaZz6xUDBfVvWfbd
	 AoYMm8FmMXsTOPJULjPIXyKr/E3kvQSBGX/27eXOg0k6HYSXeGgTycTLMlP7dsNctpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320529;
	h=DMARC-Filter:Received:Received:DKIM-Signature:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=MZmdFrQsotgCT0wSbD7pFt39rO/eJb/iqITxSt+oBTY=;
	b=YPUoZiHvbaumxqf3onFT5GUc+0/iq2Fl7gm+KmuToBKKXMdlSxnaCmgb3X+ICA+w2wbA
	 lBn1dVYSsx5/ih8cBPKdUhm/QUl4PD5Jh6W23Wp58JbaY+XBIWhM7KD10o81d1f/MuNMG
	 EjbMq9eKHe19VNVD/QrH+Bk+n2dQ4Fkzw2fsdZDHQh9yI53wKawZnVOsWmMkEybD4c6Xz
	 6Q4KvLMGsvLoXKxmDcNj476NcIsCBrnfzvz+4aRohgdzbG6pIgonfYfiFBRUJHFcGnOeU
	 imF/rrDV6A5Mm+dEbJRy0bN+m4tPYyKqJFXKmT6NCvM/l65k+7A6tviM8l/ymkcS2UQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=arm.com;
	spf=pass smtp.mailfrom=arm.com;
	dkim=pass header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b="r/QOaL1i";
	arc=none smtp.remote-ip=217.140.110.172
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9297E606A332
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 14:22:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9297E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=r/QOaL1i
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8F071477;
	Tue, 10 Nov 2026 06:22:04 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D605A3F632;
	Tue, 10 Nov 2026 06:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1794320527; bh=qqmX+RQD8lVwnDNULp8bZFK/Y+sCe6EIbhF7PutAMtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r/QOaL1i1N1G96BwQV4CtnQOUTUJaFS/2qu7/VQtLdLOjD0oCPtyV7uELp66l/22v
	 AjcibYeVw5kXy/30pgy9puKV8sa1YfJqWh1fkQVXLVU6MwlKXceVyhuGhWRVA1c3w6
	 wMIg23XbPsmXeXiTNzBFY/8rPTX92M5EAhKtwLWU=
Date: Tue, 10 Nov 2026 14:21:55 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>, linux-amarula@amarulasolutions.com,
	arm-scmi@vger.kernel.org, michael@amarulasolutions.com,
	stable@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v15 1/2] clk: scmi: fix SSC spread conversion
Message-ID: <avMog5kzJpsiUhXn@pluto>
References: <20261104103620.4054694-1-dario.binacchi@amarulasolutions.com>
 <20261104103620.4054694-2-dario.binacchi@amarulasolutions.com>
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
In-Reply-To: <20261104103620.4054694-2-dario.binacchi@amarulasolutions.com>

On Wed, Nov 04, 2026 at 11:36:02AM +0100, Dario Binacchi wrote:
> The spread_bp field of struct clk_spread_spectrum holds the modulation
> depth in permyriad (1/100 of a percent), as documented in
> clk-provider.h and in the assigned-clock-sscs binding, while the i.MX
> SCMI OEM extension expects a value in tenths of a percent, as pointed
> out by Peng Fan.
> 
> The conversion divides spread_bp by 10000 instead of 10, as reported by
> Sashiko, so any valid configuration is truncated to 0 and the hardware
> is silently programmed with no spread at all.
> 
> Divide by 10 and fix the comment accordingly.
> 

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian
