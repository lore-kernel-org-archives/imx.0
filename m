Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.19])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99457139D
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 03:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729567394; cv=none; b=sVm4tATfTHQz+/G9y2NhTJ9JlQmS8z1DN38m84aoTL3GxuoT6cHadFJS1K4luG3Boqj0VcKKtd2rydXF0FPItW2jCa6XOaxfGvisZgBsD6xX768167/bNXjUDUmWkPTBQPB5B+ae8lhlgBbVHqORBhnMNt90Si6JXS+TlK3DHlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729567394; c=relaxed/simple;
	bh=304yaoaCARna+FcF24l7FxM/Dgl17c7QokKKCoRlgGA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QS3yQPN2eCfAh2HuY8rvjkiV5aDvk3e/vs4S//Tss0Ja750wsQGVDE+5uRKbRSIq+8lTq+vNyEf/E9OjBB/UkwaSYqdN9DtbdfP9toZrSwjwBA9+/XEQ+8xQ/ALUhHSHex3P4xDm/0+ZYauaizom1NSQVfIycFGGZaBWIFIz3Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=nVYp5Heq; arc=none smtp.client-ip=220.197.32.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="nVYp5Heq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=AmUReFKhicS3m0ObmDL8efshVJq3oQSu+lPrt4djDi4=;
	b=nVYp5HeqTZhDi4moSQB0yQLG02Kt7hakD7BwYxPin3OZUPF3IAXeNJ2KoGKaCI
	/dqoOMX1Rh+eX/9mMVM8EL37pHjU/vfXWntc+dTOP8m87BwGsdnv2vsSmft/XJ2R
	tdpNPWiJSS0sUqYJwaD7WrESDq3bIFdj9KVqP8NKGEnBU=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgBXPrh_Ghdnp9yWAA--.5441S3;
	Tue, 22 Oct 2024 11:22:40 +0800 (CST)
Date: Tue, 22 Oct 2024 11:22:38 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marex@denx.de>
Cc: linux-arm-kernel@lists.infradead.org, kernel@dh-electronics.com,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liu Ying <victor.liu@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Yannic Moog <y.moog@phytec.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
 frequency to 506.8 MHz
Message-ID: <ZxcafhdxyIwI0Sq2@dragon>
References: <20241017031146.157996-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241017031146.157996-1-marex@denx.de>
X-CM-TRANSID:Ms8vCgBXPrh_Ghdnp9yWAA--.5441S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrur1DJrWxCF4kKF4kGFyDJrb_yoW3CwcE9F
	1kuws7CrnxW34rJwnxtr15t3y2kw4UX3ykZr1xXw47XFyrGFWUJ3W09ryF9w15ZasIqasr
	Ja45Xay5Kwn8ujkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8kb1UUUUUU==
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgqAZWcW3ka23AAAsu

On Thu, Oct 17, 2024 at 05:11:20AM +0200, Marek Vasut wrote:
> The LVDS panel on this device uses 72.4 MHz pixel clock, set IMX8MP_VIDEO_PLL1
> to 72.4 * 7 = 506.8 MHz so the LDB serializer and LCDIFv3 scanout engine can
> reach accurate pixel clock of exactly 72.4 MHz.
> 
> Without this patch, the Video PLL1 frequency is the default set in imx8mp.dtsi
> which is 1039.5 MHz, which divides down to inaccurate pixel clock of 74.25 MHz
> which works for this particular panel by sheer chance.
> 
> Stop taking that chance and set correct accurate pixel clock frequency instead.
> 
> Fixes: 326d86e197fc ("arm64: dts: imx8mp-phyboard-pollux-rdk: add etml panel support")
> Reported-by: Isaac Scott <isaac.scott@ideasonboard.com>
> Signed-off-by: Marek Vasut <marex@denx.de>

Applied, thanks!

