Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A67230D0A
	for <imx@lists.linux.dev>; Tue, 18 Feb 2025 10:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874302; cv=none; b=fplKvlAJdBdIVawAdzv0N6zTpUCM0hbBRQjFBiOUlAQ+VNCRqf7HZuf666h9rmG0N6nj1t7refOxueQ9NHdlpF7FrkbdjUf5mLGji5oG+UedLCPAfcAShdrGDnVdBiBaVzrLTxFE2UJhv+5qv7OP8NUvbogOTWb12xpjldG9Xs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874302; c=relaxed/simple;
	bh=m8OhKUntbc2SaOGNpmwf8cIjYThX9QnKGC7Wo5pVxvk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aaJPJkLqLnrgF6mSuJNPzsotnAFfF1TOJLc0Plt17ZN6p88TByuY4oEZb45Mx8ESXGmRgcu8yr1utZYJNd2Jsn1QLmtmXRzdjBdffiD8w12kdbf9FGmO15ruqNflo6fcLP+xJ5kZugavj0PSaoGrm4knAhQxLR3g44YYTdMp8UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8451D13D5;
	Tue, 18 Feb 2025 02:25:17 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 811B93F6A8;
	Tue, 18 Feb 2025 02:24:55 -0800 (PST)
Date: Tue, 18 Feb 2025 10:24:52 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Saravana Kannan <saravanak@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
	Jacky Bai <ping.bai@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
	<imx@lists.linux.dev>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/4] firmware: arm_scmi: bus: Bypass setting fwnode for
 scmi cpufreq
Message-ID: <Z7Rf9GPdO2atP89Z@bogus>
References: <20241225-scmi-fwdevlink-v1-0-e9a3a5341362@nxp.com>
 <20241225-scmi-fwdevlink-v1-1-e9a3a5341362@nxp.com>
 <Z6uFMW94QNpFxQLK@bogus>
 <20250212070120.GD15796@localhost.localdomain>
 <Z6x8cNyDt8rJ73_B@bogus>
 <CAGETcx87Stfkru9gJrc1sf=PtFGLY7=jrfFaCzK5Z4hq+2TCzg@mail.gmail.com>
 <Z65U2SMwSiOFYC0v@pluto>
 <20250218010949.GB22580@nxa18884-linux>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250218010949.GB22580@nxa18884-linux>

On Tue, Feb 18, 2025 at 09:09:49AM +0800, Peng Fan wrote:
> A potential solution is not using reg in the protocol nodes. Define nodes
> as below:
> devperf {
> 	compatible ="arm,scmi-devperf";
> }
> 
> cpuperf {
> 	compatible ="arm,scmi-cpuperf";
> }
> 
> pinctrl {
> 	compatible ="arm,scmi-pinctrl";
> }
> 
> The reg is coded in driver.
> 
> But the upper requires restruction of scmi framework.
> 
> Put the above away, could we first purse a simple way first to address
> the current bug in kernel? Just as I prototyped here:
> https://github.com/MrVan/linux/tree/b4/scmi-fwdevlink-v2
> 

Good luck getting these bindings merged. I don't like it as it is pushing
software policy or issues into to the devicetree. What we have as SCMI
binding is more than required for a firmware interface IMO. So, you are
on your own to get these bindings approved as I am not on board with
these but if you convince DT maintainers, I will have a look at it then
to see if we can make that work really.

-- 
Regards,
Sudeep
