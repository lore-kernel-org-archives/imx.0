Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 354361F0E26
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 00:58:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761526691; cv=none; b=K2+r9piV63BnRMcxXa6gyx4oCrAVhR6b1umdZJb8st3hppsdyFUYMQ7QVNH827LP52qauTks+aLJEoAvqIbmJtfI6vt8TtT/RygbyaDvePhUdSjN//N8vrHjag6++ULBBO68Us7e74zzMtSoMDLD17lsDa+xDbOUnU+37COzrWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761526691; c=relaxed/simple;
	bh=45MZvrvbG9cWqZXZnHWd2/vcmor7XWyYgRbEkCLlEM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d5Ctx+LBZwu0i1cX/cRV8K7TjicxAcKfHJR0ji0cR/qi2tF5tWFOFkkT+andfbVkM7VEXkeKFtdpwC0cY578Bsas6aauE73VCSKuPS5z+qUK08s1kBkDduJH5aOb+2C4qeQ/AkE6XQIyPbuiwEpehPlFKUHsKGSZQtn9EWInOlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=NsIBY0WA; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="NsIBY0WA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=PpsDspoPGuFN+kp23Nw2bUNjubccczLt1s7VeJsKJOk=;
	b=NsIBY0WA+Au1ix8V6Sl8Z5MmPiwBy52G8n0Qe/AeNT7C3G/kQd8avI0eZY253p
	PIn35Kfwc4n8VZusktlXchPO5r4Yde1LqxFSHfyzcyEv9brPQmgAj1xiFcSK4c2z
	MUkTcily0JRut8Ib72/ddchydzz22+pB7stQ4u2MtlY18=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgD3H1lkw_5o1DK6AA--.23343S3;
	Mon, 27 Oct 2025 08:57:10 +0800 (CST)
Date: Mon, 27 Oct 2025 08:57:08 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	"Jiyu Yang (OSS)" <jiyu.yang@oss.nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
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
Subject: Re: [PATCH v3 2/2] arm64: dts: imx95: Describe Mali G310 GPU
Message-ID: <aP7DZCMk1pQ7wsFo@dragon>
References: <20250925203938.169880-1-marek.vasut@mailbox.org>
 <20250925203938.169880-2-marek.vasut@mailbox.org>
 <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba95487c-ada7-48a4-90b7-fd99a0278f51@mailbox.org>
X-CM-TRANSID:Ms8vCgD3H1lkw_5o1DK6AA--.23343S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU0NtxDUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiCwHzZWj+vk4QWwAAsx

On Sat, Oct 11, 2025 at 12:53:29PM +0200, Marek Vasut wrote:
> On 9/25/25 10:38 PM, Marek Vasut wrote:
> > The instance of the GPU populated in i.MX95 is the G310, describe this
> > GPU in the DT. Include dummy GPU voltage regulator and OPP tables.
> Is there still anything that should be changed with this patchset, or can it
> be applied ?

I'm waiting binding change to be applied first.  Or is it already done?

Shawn

