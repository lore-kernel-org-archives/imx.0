Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955DC1E50F
	for <imx@lists.linux.dev>; Wed, 24 Jul 2024 14:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721831662; cv=none; b=pnJ7CvO1gX++M/vsN1UENuxqly9ZM1HR0HSsXyEutIXh0KbDphcUF6aMFINN3GUcdFPzJsOpaYAiG5Lh9hNW62CUuIEEWxR1OsrgLqThVtA7QWHwbFHug64UxHXxRwUqskIizIYHZmMexPD9xr+aZXfhiSbrRV9yzYZOhG1hgTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721831662; c=relaxed/simple;
	bh=IBdLkd4nE14JaDKDbuPfvZt5Dg7g5QgrXGoQJabz39s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rgZdva1IrwARl3PFNi50V7bzrV7Scdyoa0OtiplIC1jYYcBi01Qd7C0/g0wKBweqoCuhxLEnl6Te5KTsI9g5Nahyu+YXJhM+FLe8tq+jpKDt0oxvDR326YvFexLokguoXPL2jA9rciYQZAsXZf4A9SV4ju6ii4wUXNUQtAh6uHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 50C42106F;
	Wed, 24 Jul 2024 07:34:45 -0700 (PDT)
Received: from bogus (e103737-lin.cambridge.arm.com [10.1.197.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 251543F5A1;
	Wed, 24 Jul 2024 07:34:18 -0700 (PDT)
Date: Wed, 24 Jul 2024 15:34:10 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Frank Li <Frank.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
	peng.fan@nxp.com, peng.fan@oss.nxp.com,
	Sudeep Holla <sudeep.holla@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, imx@lists.linux.dev,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: mx93: No cache hierachy definitions for ARM cores
Message-ID: <ZqEQ4vOVvMIazIKc@bogus>
References: <bffb5d44-4eca-49cb-8624-e7bcce525fbb@gmx.net>
 <CAOMZO5DDk6eX+Ad9zKZmaEVvRHwFDETwuA=J7366QCRqhq_ZLw@mail.gmail.com>
 <Zpp9kRkEMXkp3d3i@lizhi-Precision-Tower-5810>
 <a029009c-884e-4235-a384-76090e4ccb5f@gmx.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a029009c-884e-4235-a384-76090e4ccb5f@gmx.net>

On Wed, Jul 24, 2024 at 11:48:13AM +0200, Stefan Wahren wrote:
> Hi Frank,
> 
> Am 19.07.24 um 16:52 schrieb Frank Li:
> > On Thu, Jul 18, 2024 at 11:38:20PM -0300, Fabio Estevam wrote:
> > > On Wed, Jul 17, 2024 at 2:49 PM Stefan Wahren <wahrenst@gmx.net> wrote:
> > > > Hi,
> > > > today i noticed that imx93.dtsi lacks the cache definitions for the
> > > > Cortex-A55 cores:
> > > > 
> > > > cacheinfo: Unable to detect cache hierarchy for CPU 0
> > > > 
> > > > Maybe someone with more insight can add this to the imx93.dtsi file.
> > > Frank, can you help?
> > Peng:
> > 	Some informatin missed at public RM. Can you help this? I found
> > it also missed in internal tree.
> does the official ARM documentation [1] provide the missing information?
> 
> [1] - https://developer.arm.com/documentation/101051/0101

I assume you meant [2] instead of [1], as Cortex A55 and M55 are different.

--
Regards,
Sudeep

[2] https://developer.arm.com/documentation/100442/0200/
