Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6684C27465C
	for <imx@lists.linux.dev>; Fri,  9 May 2025 09:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784645; cv=none; b=MjQAw8lBI8numa5EfyiXcTggbpgXhoHSv7GJj6LUB+k1CXPdWX7bNY15hOotLmUxFuWRISMe3ScSil70qN82CmLp/cAqjoSs3Q+pYrepcMSHhJ19lqnopjUuwCQ9L9+ofcCoRdktiZ3R9xytdJLZ88rpsKQwoXDB0CJ6tQUWtzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784645; c=relaxed/simple;
	bh=/1nUlecFxPkXb5UBTWdjvjhl+OV1lK0qu0WlzJbESDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YTK9cDOHATVZOWMKpl4azjdBg3xhso95ITN99abvrkIyBQ++OAfBREkwGRVCWV4M+x3onuzdqkm50IbkpAPuHqA5q3bu7a5MtD0515lvycszMlmH1mKmDnatZ/efLqK9a4H6fVTjspfwVuSW5wNQfwnc+zgomhpXqqsj4PAL/oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=AA6tle6T; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="AA6tle6T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=ztpen9DuNRABAlryqI4gdvEyhar1spaRR9YZP2KvAT4=;
	b=AA6tle6TmM7PdJ4gi8I9yRrcBcdwBcfjsw+8LLrbPNdMruSNojxEqqbLzyrZHS
	In63wY6UU9QQENgkE8pG+WDACIZiOUlg1EMVCfDSJUkGVcXafB4L/F1mwqi4Y7Ul
	0AAtRIzN4Eowa/wGUvyGf/Z4+2zsvNFYYpl7maGgPYNh4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgBHD_Fg0R1o046lAA--.20888S3;
	Fri, 09 May 2025 17:56:50 +0800 (CST)
Date: Fri, 9 May 2025 17:56:48 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: use 800MHz NoC OPP for nominal drive
 mode
Message-ID: <aB3RYMONiB4RQdjk@dragon>
References: <20250422-imx8m-nominal-noc-v1-1-889592ff65a5@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422-imx8m-nominal-noc-v1-1-889592ff65a5@pengutronix.de>
X-CM-TRANSID:M88vCgBHD_Fg0R1o046lAA--.20888S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrCF1fGr45uF4DZw1UXw4kCrg_yoWxXrc_ur
	W8WwnrAw1kWr17u34qk3y5Za4fWw4UCF1SgasxXan2qFyfXrZ3Z3s7X3s5XF1UGrWjqwsr
	AF1DXw48JFy2kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUbzVbPUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiARxIZWgduGdhEQAAsq

On Tue, Apr 22, 2025 at 09:12:35AM +0200, Ahmad Fatoum wrote:
> When running in nominal drive mode, the maximum allowed frequency for
> the NoC is 800MHz, but the OPP table for the i.MX8MP interconnect device
> listed the 1GHz operating point for the NoC, regardless of the active
> mode.
> 
> The newly introduced imx8mp-nominal.dtsi header reconfigures the clock
> controller to observe nominal drive mode limits, so have it modify the
> maximum NoC OPP as well.
> 
> Fixes: 255fbd9eabe7 ("arm64: dts: imx8mp: Add optional nominal drive mode DTSI")
> Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>

Applied, thanks!

