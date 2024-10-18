Received: from mail-m16.yeah.net (mail-m16.yeah.net [1.95.21.15])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A7415442D
	for <imx@lists.linux.dev>; Fri, 18 Oct 2024 03:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=1.95.21.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729220681; cv=none; b=ZV8nlgvoyz+rY88M4kMqYfNnyBPoS4X/CYgZXPk1PPjHZq6tRYRnHAg3FOG2u1xLJkziQPmpgIcp7euSxgb4SlFteMVyFl9pZ3Blsi0K+dLAs4tu1Xuu1SFN3g6GvurEo0uepYvF8Mt7FiXW0s48grHJ7Ikn6xkcD6Roti46jpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729220681; c=relaxed/simple;
	bh=sKd9P8jTOJeM166Iz7PoYor7fm4C5ermi2U42p2utes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JrlAgLsuK33v5PjhLwQ7p4NDsZuBpjhrIOeLJnwSLoGKZvZEveCZYXgrYjFDVZCYeVHQxQU0judvnPpIjNjaZaSptmhVDo4pcLB0Re3Nsghid+Du73wtl9GLtfoCABBn6z54YxJ6zjBSK45MJ+XpfxcSnTtLozn3KK5u8cZpdX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net; spf=pass smtp.mailfrom=yeah.net; dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b=bRvIxH+m; arc=none smtp.client-ip=1.95.21.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yeah.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yeah.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yeah.net header.i=@yeah.net header.b="bRvIxH+m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=i3Cg69Q0bahCHm6u4HeVjWPJfCKMx1F2c/XVlhq5uNQ=;
	b=bRvIxH+mLDVYL+lFOOPYI652Tpor7Q6ii9g9/HVe7Z6JFdf1o2t89u/siQnNCg
	pa5j7dfXWOJRwjnaE7yxwBNRsxeqMZKMQDsHFebUraBdbD3qMji8iz4GsHCaqMA0
	zYV/BmhMCR7BLJPGZjBfRAp8nJ+DMHD90YD6Ki7+wCHF4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgCnjwr1zxFn0dU_AA--.1978S3;
	Fri, 18 Oct 2024 11:03:19 +0800 (CST)
Date: Fri, 18 Oct 2024 11:03:17 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH 2/3] arm64: dts: fsl-lx2160a: add rev2 support
Message-ID: <ZxHP9XEiIMHuv1TB@dragon>
References: <20240826-2160r2-v1-0-106340d538d6@nxp.com>
 <20240826-2160r2-v1-2-106340d538d6@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240826-2160r2-v1-2-106340d538d6@nxp.com>
X-CM-TRANSID:M88vCgCnjwr1zxFn0dU_AA--.1978S3
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUxCJmUUUUU
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiAhh8ZWcRl-6bMQAAs2

On Mon, Aug 26, 2024 at 05:38:33PM -0400, Frank Li wrote:
> Add rev2 dtsi. Although uboot fixup can change compatible string
> fsl,lx2160a-pcie to fsl,ls2088a-pcie since 2019, it is quite confused and
> should correctly reflect hardware status. So add fsl-lx2160a-rev2.dtsi to
> overwrite pcie's compatible string.
> 
> Add PCIe EP nodes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Applied, thanks!

