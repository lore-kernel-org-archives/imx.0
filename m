Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52E0121CC5A
	for <imx@lists.linux.dev>; Tue,  6 Jan 2026 15:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767714395; cv=none; b=ItG5lxG3hhvNBs3+0O//KNaqFnXxgHYhoJHV+V/FlDLmvtG+C/ytgBb9Z+v4wvGVyXwl0eNdRv2cZmzZ6J0EfZmPUugloi0cPtbXOo7TWvYPe7YvtMA+dr1j7wGsm8nJpSBSCVR57UQ87qz2GNUgIjlK3Jw1oJ9ODsjuUESzz/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767714395; c=relaxed/simple;
	bh=qS77OFJriMY1TRGtlPJ2Hx3nMQCsLUkzdLn6c68ofYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsLbhZ2oV6Tyhv71T23P7fMrvTWgN7YUzUd65DxOFgVR9OfQORb75ey+lxSyl5vt6uV1UBDqgwi0WlNHg4JeQBQrQdefg3vF+3nJ20ihBQ0sp779c+JXlegvHnnsimwQfxpw/JRcuoibtoyNj4tOimpPlqxYQrvcC3i4efRc5k0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D2D88497;
	Tue,  6 Jan 2026 07:46:26 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12D743F5A1;
	Tue,  6 Jan 2026 07:46:31 -0800 (PST)
Date: Tue, 6 Jan 2026 15:46:29 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] firmware: arm_scmi/imx: Support dump syslog
Message-ID: <aV0uVXXbxKQ5qzLD@bogus>
References: <20251029-sm-syslog-v3-v3-0-64e14a6e3f87@nxp.com>
 <aUCy5+vAPzDGeux3@shlinux89>
 <aVuzVNmG2l-igiEB@nxa18884-linux.ap.freescale.net>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVuzVNmG2l-igiEB@nxa18884-linux.ap.freescale.net>

On Mon, Jan 05, 2026 at 08:49:24PM +0800, Peng Fan wrote:
> Hi Sudeep,
> 
> Hope you're doing well. Apologies for following up again, but this v3 patchset
> has been pending for quite some time. I wanted to check if everything looks
> good on your end.
> 

Yes overall it looks good to me.

> Could you please confirm whether you plan to pick both patches?

As I had asked once in previous version, I need i.MX maintainer ACK to pick
it up myself.

> Or do you need an A-b from the i.MX maintainer for patch 2?

Yes as mentioned above.

> Alternatively, I can ask Shawn to pick patch 2 if you only intend to take patch 1.

I think that would break build or need to wait for another cycle.
I can ack if it can be routed via i.MX tree or need ACK to pick it up myself.

-- 
Regards,
Sudeep
