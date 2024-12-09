Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.17])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C6EC221D90
	for <imx@lists.linux.dev>; Mon,  9 Dec 2024 11:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733745256; cv=none; b=NmhUmCWzKOaztSwJO1tscttU4Ibycun1XxzyBrO+JJIzKm42AHfde9QmNY2KMAJ9fi2FQOIZ3hjxo8elSb1hSwP/QIDuJcZlcunEU2hlwV9tbhCh6AxP8UyNSX4AHHb2nGQNF8BwBvfKsN7N3Rr+LOQLlF2bokpMK7YLyseu9zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733745256; c=relaxed/simple;
	bh=JATDnXxIw4ps6VbfWy9O0/mdWb8P5+bessEHfg+7AXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdCXnxolEVlm5PqFbWJCpk2GuNEryVsUhdd6C9m6VhYy8/3EJqDjvI+guQarIvs9Nb081JRP9v0thisH6QhsLEpjFsixbC8rmRv31n3Sn10jXP3itFkBqnIsQR0AtsyMCdrdc/0+zSCZHYqiptnmctDjMJNsrdkWyOcSDgtJq+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=pPMT6acz; arc=none smtp.client-ip=1.95.21.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="pPMT6acz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=9YFBKvdle0l8WYYtUgX7JaCFYCO3nh7exjS+lwB+V18=;
	b=pPMT6aczMRxqEoN5iIcFKQZ2Rcche8mg9BHFtGM2py0ENvhf5/YI66MtzJWYhL
	hST/2Fz5B56swjXNtVHCH7Vf85j4ppB2zopIucpRaUrnM54v9ytADTRz07YKNPmt
	rqiIVl1h/WdqYgeDDw6kQdKRmghczxih3miBe8rZU8lV0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHbODn2VZnjriPBA--.47417S3;
	Mon, 09 Dec 2024 19:52:10 +0800 (CST)
Date: Mon, 9 Dec 2024 19:52:07 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Liu Ying <victor.liu@nxp.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
	abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org,
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
	simona@ffwll.ch, quic_bjorande@quicinc.com, geert+renesas@glider.be,
	dmitry.baryshkov@linaro.org, arnd@arndb.de, nfraprado@collabora.com,
	marex@denx.de
Subject: Re: [PATCH v6 7/7] arm64: defconfig: Enable ITE IT6263 driver
Message-ID: <Z1bZ57fn/upwHWQ5@dragon>
References: <20241112100547.2908497-1-victor.liu@nxp.com>
 <20241112100547.2908497-8-victor.liu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112100547.2908497-8-victor.liu@nxp.com>
X-CM-TRANSID:Ms8vCgDHbODn2VZnjriPBA--.47417S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUr2NtUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAGwZWdWx209gQABs2

On Tue, Nov 12, 2024 at 06:05:47PM +0800, Liu Ying wrote:
> ITE IT6263 LVDS to HDMI converter is populated on NXP IMX-LVDS-HDMI
> and IMX-DLVDS-HDMI adapter cards.  The adapter cards can connect to
> i.MX8MP EVK base board to support video output through HDMI connectors.
> Build the ITE IT6263 driver as a module.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>

Applied, thanks!

