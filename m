Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B30E2DAFD7;
	Tue, 30 Dec 2025 02:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061187; cv=none; b=iwhFf4b6it0bFkNAz29Vuc/d4uuCN7Lb+UFLwctSrmx6I0X4QS1P8o/sZ94hfKGNoLLQF8IMCPYhaxJZc1lQVnhZU1+gTLSapnmfhBDl2bjQzZcT6ewLHvpRLdwArUBCWXU72HnGJQfR33aFSi98zQAxH9kvYkceD7MegD7bTGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061187; c=relaxed/simple;
	bh=WsPnlXAeGWWyvfoz7fE2YJBhrIMmZkk6VEdC/cu1WMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=is1eFuDL/Xwjf9W1EPG0j94/WP5JE8CpI6z066uvR8FiJxW/F9MNIRFJuWHioGger3s8xl+9Po5mp8VP8Xq77aSDp2gm0RYXa3bbYmAlJe20rAcKm43C4B2xaecM3VsbNhIeD/VXWRxdpi3GxJj25laBw9IxG438hii+f+NvVYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lGnKrIZJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lGnKrIZJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6C2C4CEF7;
	Tue, 30 Dec 2025 02:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767061186;
	bh=WsPnlXAeGWWyvfoz7fE2YJBhrIMmZkk6VEdC/cu1WMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lGnKrIZJQzFQCw241+iLQOodHcNvwIGaG9yN0ld0s/xBn79ZHrh8XHm6tLEOewFjq
	 MQSrgrrYGCnrZOO+zv3TchwuKQP7aSZa2kxHAAQDReFWs2AmP/w8aVJFeTlAhu57TM
	 DgrqZNJ6OEDoiso0OEF6ldRMOQfVC0zGHxQowc+4N788x6KqpX186efW6r+5wI2IE1
	 LzyLQcLDfF2OoiohoGYov3dDXy7oLgWOC7Sc5llJwnDLCT/tCYRfZM2AxcHQ6nIGri
	 OtSZ7QHwPcdybRAVPuIrXb9UNF6mJ9FvbwqKcPFz5tx0aiZVteWoJxQuArwSbtt/Rp
	 LYakBXwE4tEBQ==
Date: Tue, 30 Dec 2025 10:19:40 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Ian Ray <ian.ray@gehealthcare.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Justin Waters <justin.waters@timesys.com>,
	Akshay Bhat <akshay.bhat@timesys.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: imx6q-ba16: fix RTC interrupt level
Message-ID: <aVM2vJIPggFjHn2t@dragon>
References: <20251201095606.990-1-ian.ray@gehealthcare.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251201095606.990-1-ian.ray@gehealthcare.com>

On Mon, Dec 01, 2025 at 11:56:05AM +0200, Ian Ray wrote:
> RTC interrupt level should be set to "LOW". This was revealed by the
> introduction of commit:
> 
>   f181987ef477 ("rtc: m41t80: use IRQ flags obtained from fwnode")
> 
> which changed the way IRQ type is obtained.
> 
> Fixes: 56c27310c1b4 ("ARM: dts: imx: Add Advantech BA-16 Qseven module")
> Signed-off-by: Ian Ray <ian.ray@gehealthcare.com>

Applied, thanks!
