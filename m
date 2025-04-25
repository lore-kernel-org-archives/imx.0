Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.17])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610A37483
	for <imx@lists.linux.dev>; Fri, 25 Apr 2025 02:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745546873; cv=none; b=WPB9JN3UYtyX9j85ZMEQtvCpHXFcCdvnfDrOHJO9ZvXim0SOotspqIFDyoI7rDfYkaPlj1hzu6t1rhOr1UKekJqV+k70zAoKr4e8Hc+byCJMAfWUiUZ+uB+TJUdvg8Un4IjLidA20rH+3dWBo29zLWXlQOJD/ywPVmR1WclYEHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745546873; c=relaxed/simple;
	bh=C0Onkw7Z6WQzYCDMpWTTwUoVEoCIysD7bDzMBGbjA+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hR42gbXD+790EVIaBrfLwheOyIkJa4V/sJqohDyMDsU5l6eoNGyqV3Hq0vS36dhWuJ8+Bs8kJUocF1F4uFpRMr9bmmwkkVlBRWGtw5Gj+PQ8UBWoCAqXepJcZ5NStOQwJcaJeZnOo6nwEYz3s09fRAvlMuNukW12iugjDHC/8gE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cOjiR3hp; arc=none smtp.client-ip=220.197.32.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cOjiR3hp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=eHzuw+bc0eV8DSy5e54/eajHTpo5TtF3m3H+/km2+yw=;
	b=cOjiR3hpGSq5JZGnS9/s2OQIiPq+SRuNJ5amBAFBfyGNvxgSvcUAuOcCBxk9vn
	t/8q5N3mwg9ZWGocNMeM/sfyAtdcbW/JeUpFJAux9YqMcpdc3JPLGNGld12Vmgk5
	hg58WmynrXNlqV9Qm4nDOzTckLTpfNZEcMT8mM1by4Kjg=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgB3KU1Z7gpoJI3SAw--.37105S3;
	Fri, 25 Apr 2025 10:07:23 +0800 (CST)
Date: Fri, 25 Apr 2025 10:07:21 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Adam Ford <aford173@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, aford@beaconembedded.com,
	Frank.li@nxp.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 01/10] arm64: dts: imx8mm-beacon: Fix RTC capacitive
 load
Message-ID: <aAruWUaXtM1O5Js3@dragon>
References: <20250416010141.1785841-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416010141.1785841-1-aford173@gmail.com>
X-CM-TRANSID:M88vCgB3KU1Z7gpoJI3SAw--.37105S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBAo6ZWgK1S9vFAAAsy

On Tue, Apr 15, 2025 at 08:01:27PM -0500, Adam Ford wrote:
> Although not noticeable when used every day, the RTC appears to drift when
> left to sit over time.  This is due to the capacitive load not being
> properly set. Fix RTC drift by correcting the capacitive load setting
> from 7000 to 12500, which matches the actual hardware configuration.
> 
> Fixes: 593816fa2f35 ("arm64: dts: imx: Add Beacon i.MX8m-Mini development kit")
> Signed-off-by: Adam Ford <aford173@gmail.com>

Applied all, thanks!

