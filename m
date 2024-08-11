Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.16])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80209EEBA
	for <imx@lists.linux.dev>; Sun, 11 Aug 2024 12:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723379438; cv=none; b=CKTby5z7tCuwu7VDtHWnGmfmH0pLYvpr5APJjjGQsiNcw74ppKe9tlg1AScIRtXkdMfpahUHg7P2BgdvtWbgBjupfwtTYDykzWRucvK2SNZBFEi7wYKGmskZ/0y8XfSTiUaEksQdQYJPAKZK5G1XGzFjsYjKdISf4vzl7V7dUZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723379438; c=relaxed/simple;
	bh=bAifYTB4RwqD8R//HvQVD9qR48TBcyRj3dq5UT6jxpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lZLmk5/l6rYttOF38Z43B4mGujOfe15vPqQ3xyEIaZNc4ld7y+wcWgp0RVTAw472kCmRaplAErCS/jXT6xjuGtmp7djrmiRvF+1Fmi9WHXIoAXZbV5mQp7a4uw+ODA4LX9q/5NCCyRE0jcCYVQU8YsVt1I9BxXtavAIVoPUDbJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=jl6YcRt1; arc=none smtp.client-ip=1.95.21.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="jl6YcRt1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=BnN4wx3GxIvl/QqscWZIne594Cyo0eoq/KaOBJyLsB8=;
	b=jl6YcRt18Z2m7WfWV8RnCKuCTKQ7QubMldZRAoGXjTCLEKiVZK4OGelFHZ7qjl
	Lw0uGc6XycinDIvYXHGRREfEJvACowd8krcphpsT64p6oafaEZdZ7GMP+DjJ0ifn
	3H3nFSemxVCOgf8JZLYPnaTN86aVYn9bOhZ3BM7sKHqck=
Received: from dragon (unknown [117.62.10.86])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDX35TKrrhmCYFKAg--.36296S3;
	Sun, 11 Aug 2024 20:30:03 +0800 (CST)
Date: Sun, 11 Aug 2024 20:30:01 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	s32@nxp.com
Subject: Re: [PATCH v2] arm64: dts: s32g: Disable usdhc write-protect
Message-ID: <ZriuyYqhOQiA0dhe@dragon>
References: <20240704135653.2969532-1-ciprianmarian.costea@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704135653.2969532-1-ciprianmarian.costea@oss.nxp.com>
X-CM-TRANSID:Ms8vCgDX35TKrrhmCYFKAg--.36296S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxWrWDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAgM4ZWa4nhcbtAAAsk

On Thu, Jul 04, 2024 at 04:56:53PM +0300, Ciprian Costea wrote:
> NXP S32G2/S32G3 SoC based platforms do not
> use a pin for SD-Card write protection used by
> the uSDHC controller.
> 
> Hence, adding 'disable-wp' usdhc device-tree property in order to fix
> observed warnings on SD boot as the following:
> "host does not support reading read-only switch, assuming write-enable"
> 
> Signed-off-by: Ciprian Costea <ciprianmarian.costea@oss.nxp.com>

Applied, thanks!

