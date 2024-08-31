Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC1061D131B
	for <imx@lists.linux.dev>; Sat, 31 Aug 2024 13:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725110150; cv=none; b=O+ZMCi8V2lcfnRJGU3K0O9ScNJUZ0bDcsABWI/7/ty/aXZTfhma/EGJYs++MNMLJZhn3DNJ2A4ZPbkRVsJoQdRW9ljtG6Nkph9Ew2oDgNP+BqwcvIfkGB8YG9QTYNWt0Yj+zqsj56W9qW2ELe483o1hp8eGb9A69XPYncesDVWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725110150; c=relaxed/simple;
	bh=tLcADBlUpicJI7YwEir5KwcWT1YA0FCaATHsP3sCmXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9MIldxSM535Xl8Vb/OemXCBaPBUk7XeDrFgTmVS6KShcqsBm6K3jXTBtHUCgFHbhqlNXbiE1oO40hw4cjOhQ+v7Q33IG8B+lJSS1oQLyy0VnAISAoQ7GbYgzfx0Rs6RgQXYvssnb6mXJT0bBOTFH4xGQHTQiYH2deOesrFbiW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=F48ETAZ5; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="F48ETAZ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=EuKozmDV8mePyOV+B4UXYcEUDBeI4bY+pV28D9Slulo=;
	b=F48ETAZ5kO1ZMjlO3CUi2tRVnvEyZjbVCxnB93pjLZYT0QiBPRgQVhtx4MWaHr
	Rd2/azDlXKsaM+A2X5doMP5F8YJUsFLEZ7E0t3I1wrjq2aFWMtIwQL5IgeBwc1Qk
	3jYAE8FmWyHV13W0MPlUHPZNuYoa3mjg9Y6GiEuJvbZMY=
Received: from dragon (unknown [114.216.210.89])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3VwAZF9Nmsz06AA--.20596S3;
	Sat, 31 Aug 2024 21:14:03 +0800 (CST)
Date: Sat, 31 Aug 2024 21:14:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Marek Vasut <marex@denx.de>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Peng Fan <peng.fan@nxp.com>, Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp: Clarify csis clock frequency
Message-ID: <ZtMXGbpyv/1loJZM@dragon>
References: <20240813234010.17852-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240813234010.17852-1-laurent.pinchart@ideasonboard.com>
X-CM-TRANSID:M88vCgD3VwAZF9Nmsz06AA--.20596S3
X-Coremail-Antispam: 1Uf129KBjvdXoWruFyxJF18CF47WrW8XF1DZFb_yoWDGwc_ua
	9xKFnrAw1UAF1fXw4DG34rW342k3W5CF48Zw1Iqr43tryUXrWku3W2v34jvw40gay2qwsI
	k34kK3W7C3s7WjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0eT5JUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCQ5MZWbS+P46mQAAs-

On Wed, Aug 14, 2024 at 02:40:10AM +0300, Laurent Pinchart wrote:
> The DT nodes for the MIPI CSI-2 receivers (MIPI_CSI) configure the
> CAM1_PIX and CAM2_PIX clocks to 266 MHz through the assigned-clock-rates
> property, and report that frequency in the clock-frequency property. The
> i.MX8MP reference manual and datasheet list 266 MHz as a nominal
> frequency when using both CSI-2 receivers, so all looks normal.
> 
> In reality, the clock is actually set to 250 MHz, as the selected
> parent, IMX8MP_SYS_PLL2_1000M, has a 1/4 output that is selected as the
> closest frequency to 266 MHz. This doesn't break operation of the
> device, but is clearly misleading.
> 
> Clarify the clock configuration by selecting the IMX8MP_SYS_PLL2_250M
> parent, dropping the redundant assigned-clock-rates, and setting
> clock-frequency to 250 MHz. This doesn't cause any functional change.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Applied, thanks!

