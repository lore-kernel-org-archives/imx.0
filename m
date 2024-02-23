Received: from mail-177131.yeah.net (mail-177131.yeah.net [123.58.177.131])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175B81401D
	for <imx@lists.linux.dev>; Fri, 23 Feb 2024 06:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.58.177.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708671141; cv=none; b=JuTE7o+/fyzzK9fu/WeWlPlOG4ZMqmoNa9YWoslWV59B3P7r4fb8IPnbsQLhH6BNFwJqgS4ysrYW0YWwCoMuAQUpKReJzYp2ZV1Os2+DWS0hpAS3z9nAnh5vowVJeBGedqmiJYGKqaoczeUg37x54K6JJhhwKDuhm/xoHZwKDWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708671141; c=relaxed/simple;
	bh=Nr5mBUrhlZi8frmFhmwVoOHy5yqzyTmbNfWtgDuSmYQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8SE4tn1NYDaxsQOrjWfrluUG0jj+WxYgSapFhyrbsP1EmTyxGfCs6IhoZ0gUFGwgku5r1W0r0Gxu+Qp7g2pXqO8ZzEBVaD2PTf/iQOH3hTAd4Ja3bgoLlYtncgMVYk/GDskETVL5HqZfV8VLKh7ZHD2d+tZTxPropZQXuNynQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=cN9nEoY+; arc=none smtp.client-ip=123.58.177.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="cN9nEoY+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=5/CIVx4nox7rRerqYVV+Dr3YOIRCBNThgrU8TFxsrAc=;
	b=cN9nEoY+i540gES0/H1DMGqL+w3eiRitW6Ny/sa8n2mSnPLdB0O+T1jwSUT2Ox
	6Cv+7ZTSPYkbanh6v+iS807mWKDu7NBMF7rgFicu3+1C8o7gFtpqO/aFwERaRTYx
	hnb8/3ljOQnSMYiXiBRBVqWj5o7oQT2+cITwUjdiFC3m4=
Received: from dragon (unknown [183.213.196.200])
	by smtp1 (Coremail) with SMTP id ClUQrAD39ueMQNhlhKYwBA--.5198S3;
	Fri, 23 Feb 2024 14:51:57 +0800 (CST)
Date: Fri, 23 Feb 2024 14:51:55 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"moderated list:ARM/FREESCALE LAYERSCAPE ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] arm64: dts: lx2160a: Fix DTS for full PL011 UART
Message-ID: <ZdhAiy3m/ytfEc1j@dragon>
References: <20240206231521.3600089-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240206231521.3600089-1-Frank.Li@nxp.com>
X-CM-TRANSID:ClUQrAD39ueMQNhlhKYwBA--.5198S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUsmFCUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiDg2NZVszYVzb6gAAsP

On Tue, Feb 06, 2024 at 06:15:21PM -0500, Frank Li wrote:
> From: Heinz Wrobel <Heinz.Wrobel@nxp.com>
> 
> The prior configuration was an SBSA UART that can't be configured or
> modified, or even enabled if it isn't the boot console. With properly
> defined clocks, the PL011 configuration can be used.
> 
> Signed-off-by: Heinz Wrobel <Heinz.Wrobel@nxp.com>
> Signed-off-by: Li Yang <leoyang.li@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

