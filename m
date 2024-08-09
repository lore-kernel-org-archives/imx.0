Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D3E1957FC
	for <imx@lists.linux.dev>; Fri,  9 Aug 2024 14:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723214964; cv=none; b=SmBBFZYAsddq1/0nqJV+A1eiwVqzAKSdqMO2uVztpwhfL5HHXgWMN5XzWR0Qd/Zo4uTLYus5fk7r1b8foQGwYEvVPptJmDNwiAgTYb4Yi+JXvTt/fPML+3GCbWxrXLQOTqteBrU06bZrTURG0DWG7AMF5evmScNQTUviRNP2l+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723214964; c=relaxed/simple;
	bh=22tE3bcxOV4XQUyxYBM8SclBMeZRi8d9Ee40iy2gYwE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxsI+UZ9Z8bYrWEv3bcB6bbkCNd5X4q9UpbVSqBr0+knDonN2pqVy6OukRbICwbJZ4rAyEAaS+y7KIt+OOwfSYvnYuT/p2oR6QzqvGEYNlMIdJlHvevzGu8feSwKmbcpobf7N6r56zmFIMtWEWcoSsyuDVaqQgdV45V5uhpP9tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=Vld4p26j; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="Vld4p26j"
Received: from francesco-nb (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 2CD7C1F8BD;
	Fri,  9 Aug 2024 16:49:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1723214959;
	bh=vqTV2il+IVohltGgzCzW6B4mCGXHGDpJVmefQp88URU=; h=From:To:Subject;
	b=Vld4p26j0w6i6/Wg3NX21IYkJ+teBsKRvXvoXaYpJv5mTvAmKOIF4tIBvUx4Z10ec
	 N8NfuGQGrkHEuk4ajEUc7NYzOZ14RibmCjvj12eV6PjtDsublnI2cwO48jBYp10E3D
	 NMl/Gm5Ew1cfzu+hr7FPxRz+OrzrhxWoy+TnZLDSnwyjtR9dFi7+yt6mBENywxsh4+
	 lBQCpzo4rk7Gca84OthJp1GfoRLuWL3uqJFz/8vU3YUnur86x/UaLnyCZ1SXzj4REr
	 +D6+d42NChiQoEQSB1TLuxUFCzQsthr0uCJpUfjv8mGnwNeef/5kL6s5ozCh9CoEoL
	 FSI/NreBAG3gA==
Date: Fri, 9 Aug 2024 16:49:14 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Conor Dooley <conor@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Linux Team <linux-imx@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v3 1/3] dt-bindings: net: fec: add pps channel
 property
Message-ID: <20240809144914.GA418297@francesco-nb>
References: <20240809094804.391441-1-francesco@dolcini.it>
 <20240809094804.391441-2-francesco@dolcini.it>
 <20240809-bunt-undercook-3bb1b5da084f@spud>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809-bunt-undercook-3bb1b5da084f@spud>

On Fri, Aug 09, 2024 at 03:27:39PM +0100, Conor Dooley wrote:
> On Fri, Aug 09, 2024 at 11:48:02AM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > Add fsl,pps-channel property to specify to which timer instance the PPS
> > channel is connected to.
> 
> In the driver patch you say "depending on the soc ... might be routed to
> different timer instances", why is a soc-specific compatible
> insufficient to determine which timer instance is in use?
> I think I know what you mean, but I'm not 100%.
> 
> That said, the explanation in the driver patch is better than the one
> here, so a commit message improvement is required.

This was clarified by NXP during the discussion on this series [1] and the
commit messages were not amended to take this new information into
account, my fault.

I would propose something like this here:

```
Add fsl,pps-channel property to select where to connect the PPS
signal. This depends on the internal SoC routing and on the board, for
example on the i.MX8 SoC it can be connected to an external pin (using
channel 1) or to internal eDMA as DMA request (channel 0).
```

Francesco

[1] https://lore.kernel.org/all/ZrPYOWA3FESx197L@lizhi-Precision-Tower-5810/
