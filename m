Received: from mail-m16.yeah.net (mail-m16.yeah.net [220.197.32.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25362224220
	for <imx@lists.linux.dev>; Thu, 20 Nov 2025 01:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.32.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763603659; cv=none; b=P8NOKVJqRdBFJ+qPznzw6Jhb+i9wY5Dl8tN8QF+iUtA0CW8F250DjcCdLb98QU7Tui6n9jbH7NsatZSStRAdqBY/Z1KwMksipiijjfR5jrgpeYyaUT1MjFZL9Wy+KUq4RbbAoEcJQ1Bp5w3zBDzlkXxBqsfqLVX4EMTFwR94P8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763603659; c=relaxed/simple;
	bh=sAdiuolNXE/24WrsaGL6jXBYWZ6ex3v68gkeEXIOatA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IJhdCdbEmfHu1oMoNmlllC3i5t74K8Z9OoHTHMHEt9cuaUV8wMRTQ9fMkVbZPGNDCajCoUeAmUvb6Zjh+Fh5Fw5kNyh9GwHgoKlZiHSyBF701F03sTEzhntBS461ien4uxbKie071/8zwAdWU8/xIkA9F2eWP1rhNFQF17hWsfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=FsX4dyzI; arc=none smtp.client-ip=220.197.32.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="FsX4dyzI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=B13YSSVdzv+A9HSJEV6haxN1uEpuGwZCWegPWDkjWo0=;
	b=FsX4dyzILs5Mz6P4OxTN0CZ6a8W+QrZGfT4i9E3mD9Dv8c2Wr9s1GER+09vuSz
	Dpxgn8PQ5E00Q20Pwiw2acWxvlUkmrX6TRLNIYoPBDhFIob5/fYH1Bbh6yxBhp5B
	1fnjOh6XPpG1UEzIw76l7HjPslGkMFtm4wD6UPJer8H7w=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgCnHTeLdB5pzrRhAg--.10170S3;
	Thu, 20 Nov 2025 09:53:18 +0800 (CST)
Date: Thu, 20 Nov 2025 09:53:15 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>,
	Liviu Dudau <liviu.dudau@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Xianzhong Li <xianzhong.li@nxp.com>, devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev
Subject: Re: [PATCH v4 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aR50iy_FWk6PqAUg@dragon>
References: <20251102160927.45157-1-marek.vasut@mailbox.org>
 <20251102160927.45157-2-marek.vasut@mailbox.org>
 <aRnBqgzeotfrdNmy@dragon>
 <c85e39b6-4e5b-4bbc-b1b6-7f910c8f06d8@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c85e39b6-4e5b-4bbc-b1b6-7f910c8f06d8@mailbox.org>
X-CM-TRANSID:Ms8vCgCnHTeLdB5pzrRhAg--.10170S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUnzV1UUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNg4ih2kedI5lUAAA3l

On Wed, Nov 19, 2025 at 06:00:55PM +0100, Marek Vasut wrote:
> On 11/16/25 1:20 PM, Shawn Guo wrote:
> > On Sun, Nov 02, 2025 at 05:09:07PM +0100, Marek Vasut wrote:
> > > The instance of the GPU populated in i.MX95 is the G310, describe this
> > > GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
> > 
> > The commit log seems need an update for the regulator part?
> The patch seems to be already in next, but if it can be somehow respun, I
> can do that ?

Hmm, okay, just take it as a protest that DTS shouldn't have been
applied by GPU subsystem, @Liviu ;)

Shawn

