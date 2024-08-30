Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E937018FDA9
	for <imx@lists.linux.dev>; Fri, 30 Aug 2024 10:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725013156; cv=none; b=heFEpUDmqjLFicQft83GryHbC83tRVUvIMG95wTgDp4DLNZpVWZInq8Xe3+FBosYtrwYNG8oFMnGelQmbSjae6wjssxuVI0bNRjsM/hSIykZD7gUk1lulLEPG4ZJMMVim/2brmr0cyhBKY650hpzKERg5/9yCcqr9OxqcjtSQFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725013156; c=relaxed/simple;
	bh=vzleYBf8VBpQAaH+oPojEUNbBndhfbTL2F8q37iES2g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eTN+nX+BQyNjQR7lqohs04yCyBBh372FzMzzxCHqQgW+qT9jzZAAUmsP335oThffD8PUVHa823sYRpBh3RawVY5oElDshitOZ057qZ9OfakmQm5vK7s1YUZQVFJ4rQpo/WDq9H9CpkyzZzTQS9VDNsjVEgqGmL4MBJYKG9U9Q+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AC2EF1063;
	Fri, 30 Aug 2024 03:19:40 -0700 (PDT)
Received: from bogus (e107155-lin.cambridge.arm.com [10.1.198.42])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3B5FC3F762;
	Fri, 30 Aug 2024 03:19:12 -0700 (PDT)
Date: Fri, 30 Aug 2024 11:19:09 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-rtc@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: [PATCH v8 6/7] rtc: support i.MX95 BBM RTC
Message-ID: <ZtGcnTYlGlZ8eC-6@bogus>
References: <20240823-imx95-bbm-misc-v2-v8-0-e600ed9e9271@nxp.com>
 <20240823-imx95-bbm-misc-v2-v8-6-e600ed9e9271@nxp.com>
 <Zs2rz1FT1UsKQBj6@bogus>
 <20240830091246fce62c34@mail.local>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830091246fce62c34@mail.local>

On Fri, Aug 30, 2024 at 11:12:46AM +0200, Alexandre Belloni wrote:
> On 27/08/2024 11:34:55+0100, Sudeep Holla wrote:
> > Hi Alexandre,
> > 
> > On Fri, Aug 23, 2024 at 05:05:22PM +0800, Peng Fan (OSS) wrote:
> > > From: Peng Fan <peng.fan@nxp.com>
> > > 
> > > The BBM module provides RTC feature. To i.MX95, this module is managed by
> > > System Manager and exported System Control Management Interface(SCMI).
> > > Linux could use i.MX SCMI BBM Extension protocol to use RTC feature.
> > > 
> > > This driver is to use SCMI interface to get/set RTC.
> > >
> > 
> > Are you fine if I take this along with dependent SCMI changes via SoC tree ?
> 
> Sure, please do.
> 

Thanks!

-- 
Regards,
Sudeep
